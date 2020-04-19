class UsersController < ApplicationController
    before_action :authenticate_user!

    def quit

    end

    def user_quit
        @user = current_user
        if @user.update(status: false)
        #ログアウトさせる
        reset_session
        flash[:notice] = "ありがとうございました。またのご利用を心よりお待ちしております。"
        end
        redirect_to root_path
    end



    def update
        @user = current_user
        if @user.update(user_params)
            redirect_to user_path(current_user.id)
        else
            render "edit"
        end
    end
    
    def edit
        @user = current_user
    end

    def show
        @user = current_user
    end

    private
        def user_params
            params.require(:user).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :post_code, :address, :phone_number, :email, :status)
        end

end
