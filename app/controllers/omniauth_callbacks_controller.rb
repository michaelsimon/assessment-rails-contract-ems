class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def self.provides_callback_for(provider)
    class_eval %Q{
      def #{provider}
        @user = User.find_for_oauth(env["omniauth.auth"], current_user)
        if @user
          if @user.persisted?
            sign_in_and_redirect @user, event: :authentication
          else
            session["devise.#{provider}_data"] = env["omniauth.auth"]
            redirect_to new_user_registration_url
          end
        else
          redirect_to new_user_registration_url
        end
      end
    }
  end

  [:google, :linkedin].each do |provider|
    provides_callback_for provider
  end
end
