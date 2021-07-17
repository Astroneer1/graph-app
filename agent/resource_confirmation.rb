require 'net/http'
require 'json'
require 'open3'

module Resource_confirmation
    @uri = URI.parse("http://localhost:3000/resouece/post")
    @http = Net::HTTP.new(@uri.host, @uri.port)
    @headers = { "Content-Type" => "application/json" }
    @command = %Q[vmstat | awk '{print strftime("%Y/%m/%d_%H:%M:%S"), $0}']
    
    def main
        begin
            command_result, err, status = Open3.capture3(@command)
            result_hash = Resource_confirmation.result_edit(command_result)
            Resource_confirmation.sent_request(result_hash)
        rescue => exception
            puts exception.class
            puts exception.message
            puts exception.backtrace
            puts "vmstatコマンドの実行に失敗しました。vmstatコマンドをインストールしてください。"
        end
    end

    def result_edit(command_result)
        result_ary = command_result.split("\n")
        result_ary.delete_at(0)
        result_key = result_ary[0].split
        result_ary.delete_at(0)
        result_key[0] = "get_resource_timestamp"

        result_hash = {}
        result_ary.each do |value|
            resault_value = value.split
            resault_value[0].sub!("_", " ")
            result_shaping = [result_key, resault_value].transpose
            result_hash = Hash[*result_shaping.flatten]
        end

        return result_hash
    end

    def sent_request(result_hash)

        request = Net::HTTP::Post.new(@uri.path)
        request.set_form_data(result_hash)
        request.initialize_http_header(@headers)

        response = @http.request(request)

        return response
    end

    module_function :main, :result_edit, :sent_request
end

Resource_confirmation.main