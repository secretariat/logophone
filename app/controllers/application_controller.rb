class ApplicationController < ActionController::Base
    protect_from_forgery

    before_filter :set_user_theme
    before_filter :set_user_language
    after_filter :flash_to_headers

    def after_sign_in_path_for(resource)
        cabinet_index_path
    end

    def flash_to_headers
        return unless request.xhr?
        response.headers['X-Message'] = flash_message
        response.headers["X-Message-Type"] = flash_type.to_s

        flash.discard # don't want the flash to appear when you reload page
    end

    private

    def flash_message
        [:error, :warning, :success, :notice].each do |type|
            return flash[type] unless flash[type].blank?
        end
    end

    def flash_type
        [:error, :warning, :success, :notice].each do |type|
            return type unless flash[type].blank?
        end
    end

    def set_user_theme
        @theme = session[:theme].present? ? session[:theme] : "dark"
    end

    def set_user_language
        I18n.locale = session[:lang]
    end
end
