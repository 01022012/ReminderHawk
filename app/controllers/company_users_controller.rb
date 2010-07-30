class CompanyUsersController < ApplicationController

  before_filter :login_required 
  before_filter :admin_required  

  def initialize
    @main_tab = 2
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    @user.password = @user.password_confirmation = random_password 
    if @user.save
      @user.companies << current_user.companies[0]
      flash[:success] = "User Added"
      redirect_to :action => 'new'
    else
      flash[:notice] = "Please fix the errors first"
      render :action => 'new'
    end
  end

  private

  def random_password(len=8)
    chars = ("a".."z").to_a + ("A".."Z").to_a + ("0".."9").to_a
    newpass = ""
    1.upto(len) { |i| newpass << chars[rand(chars.size-1)] }
    return newpass
  end

end
