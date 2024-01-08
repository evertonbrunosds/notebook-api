class ApplicationController < ActionController::API
        include DeviseTokenAuth::Concerns::SetUserByToken
    before_action :ensure_json_request
    before_action :set_json_api_content_type

    def ensure_json_request
        unless request.headers['Accept'] =~ /application\/vnd\.api\+json/
            render :nothing => true, :status => 406
        else
            unless request.get?
                return if request.headers['Content-Type'] =~ /application\/vnd\.api\+json/
                render :nothing => true, :status => 415
            end
        end
    end

    private

    def set_json_api_content_type
        response.headers['Content-Type'] = 'application/vnd.api+json'
    end

end
