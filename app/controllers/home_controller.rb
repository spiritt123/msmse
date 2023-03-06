class HomeController < ApplicationController

  protect_from_forgery except: :scan

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

  def set_user_ipmi
    @commit = params[:commit]
    @str = ""
    if @commit == "Set Name"
      str = "ipmitool user set name #{params[:id_user]} #{params[:data]}"
    elsif @commit == "Set Pass"
      str = "ipmitool user set password #{params[:id_user]} #{params[:data]}"
    else
      str = "ipmitool user set enable #{params[:id_user]}"
    end

    #%x[#{@str}]
    respond_to do |format|
      if @u
        format.html { redirect_to home_user_url, notice: "User was successfully updated." }
        format.json { render :admin, status: :ok, location: @u }
      end
    end
  end

  def set_lan_ipmi
    if params[:status] == "static"
      %x[#{"ipmitool lan set 1 ipsrc static"}]
      %x[#{"ipmitool lan set 1 ipaddr #{params[:ip]}"}]
      %x[#{"ipmitool lan set 1 netmask #{params[:mask]}"}]
      %x[#{"ipmitool lan set 1 defgw ipaddr #{params[:gateway]}"}]
    else
      %x[#{"ipmitool lan set 1 ipsrc dhcp"}]
    end

    respond_to do |format|
      if @u
        format.html { redirect_to home_user_url, notice: "User was successfully updated." }
        format.json { render :admin, status: :ok, location: @u }
      end
    end
  end

  def set_power_ipmi
    
    %x[#{"ipmitool power #{params[:commit]}"}]

    respond_to do |format|
      if @u
        format.html { redirect_to home_user_url, notice: "User was successfully updated." }
        format.json { render :admin, status: :ok, location: @u }
      end
    end
  end

  def download
    send_data open("it_sel.txt").read,
              filename: "1.txt",
              type: "application/txt"
  end

  @nmap_data
  def scan
    if params[:port] != ""
      @nmap_data = %x[#{"nmap -p #{params[:port]} #{params[:ip]}"}]
    else
      @nmap_data = %x[#{"nmap #{params[:ip]}"}]
    end

    if @nmap_data != ""
      File.open("scan_data.txt", 'w') { |file| file.write("#{@nmap_data}") }
    end

    respond_to do |format|
        format.html { redirect_to home_user_url, notice: "User was successfully updated."  }
        format.js {}
    end
    p @nmap_data
    puts "\n\n\n\nsdf\n\n\n\n"
    
  end   

end
