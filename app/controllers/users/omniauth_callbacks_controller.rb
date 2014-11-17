class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    fb_data = request.env['omniauth.auth']
    puts "+===++>>>>>>>>>>> Data for facebook"
    puts "Provider #{fb_data.provider}"
    puts "Provider #{fb_data.credentials.token}"
    puts "Provider #{fb_data.provider}"
    puts "Provider #{fb_data.provider}"


    @user = User.from_omniauth(fb_data)
    puts "User is  #{@user.inspect}"
    puts "Omniauth is #{fb_data}"

    if @user
      sign_in_and_redirect @user, :event => :authentication
      set_flash_message(:notice, :success, :kind => "Facebook")
    else
      session['devise.facebook_data'] = request.env['omniauth.auth']
      redirect_to new_user_registration_url
    end
  end

  def failure
    puts ""
    redirect_to root_url
  end
end
