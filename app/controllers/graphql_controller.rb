class GraphqlController < ApplicationController
  # If accessing from outside this domain, nullify the session
  # This allows for outside API access while preventing CSRF attacks,
  # but you'll have to authenticate your user separately
  # protect_from_forgery with: :null_session

  AUTH_FREE_OPERATION_NAMES = %w[
    signIn
    signUp
  ]

  def execute
    variables = prepare_variables(params[:variables])
    query = params[:query]
    operation_name = params[:operationName]
    context = {}

    unless AUTH_FREE_OPERATION_NAMES.include?(operation_name) || operation_name.nil?
      api_token = request.headers[:HTTP_API_TOKEN]
      current_user = auth_check(api_token)
      context = { current_user: current_user }
    end

    result = GraphAppSchema.execute(query, variables: variables, context: context, operation_name: operation_name)
    render json: result
  rescue StandardError => e
    raise e unless Rails.env.development?

    handle_error_in_development(e)
  end

  private

  # Handle variables in form data, JSON body, or a blank value
  def prepare_variables(variables_param)
    case variables_param
    when String
      if variables_param.present?
        JSON.parse(variables_param) || {}
      else
        {}
      end
    when Hash
      variables_param
    when ActionController::Parameters
      variables_param.to_unsafe_hash # GraphQL-Ruby will validate name and type of incoming variables.
    when nil
      {}
    else
      raise ArgumentError, "Unexpected parameter: #{variables_param}"
    end
  end

  def handle_error_in_development(e)
    logger.error e.message
    logger.error e.backtrace.join("\n")

    case e.class
    when GraphQL::ExecutionError
      render json: { errors: [{ message: 'permission denied' }], data: {} }, status: 401
    else
      render json: { errors: [{ message: e.message, backtrace: e.backtrace }], data: {} }, status: 500
    end
  end

  private def auth_check(api_token)
    api_token = ApiToken.find_by(token: api_token)
    unless api_token
      raise GraphQL::ExecutionError.new('permission denied',
                                        extensions: { code: 'AUTHENTICATION_ERROR' })
    end
    api_token
  end
end
