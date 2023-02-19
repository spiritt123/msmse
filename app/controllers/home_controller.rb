class HomeController < ApplicationController

  def index
  end


  def add_user
    @u = User.create(:name => params[:name],
                :password => params[:password],
                :rank => params[:rank],
                :father => params[:father])
    respond_to do |format|
      if @u
        format.html { redirect_to home_admin_url, notice: "User was successfully updated." }
        format.json { render :admin, status: :ok, location: @u }
      end
    end
  end

  def add_admin
    @u = User.create(:name => params[:name],
                :password => params[:password],
                :rank => params[:rank],
                :father => params[:father])
    respond_to do |format|
      if @u
        format.html { redirect_to home_root_url, notice: "User was successfully updated." }
        format.json { render :root, status: :ok, location: @u }
      end
    end
  end

  def change_user
    @u = User.update(params[:user_id],
                :name => params[:name],
                :rank => params[:rank])
    respond_to do |format|
      if @u
        format.html { redirect_to home_admin_url, notice: "User was successfully updated." }
        format.json { render :root, status: :ok, location: @u }
      end
    end
  end

  def change_admin
    @u = User.update(params[:user_id],
                :name => params[:name],
                :rank => params[:rank])
    respond_to do |format|
      if @u
        format.html { redirect_to home_root_url, notice: "User was successfully updated." }
        format.json { render :admin, status: :ok, location: @u }
      end
    end
  end



end
