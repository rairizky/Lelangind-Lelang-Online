class AuthController < ApplicationController

  def new
    @masyarakat = Masyarakat.new
  end

  def create_m_user
    @masyarakat = Masyarakat.new(masyarakat_params)
    if @masyarakat.save
      redirect_to auth_new_path, notice: "Berhasil membuat akun!"
    else
      render :new
    end
  end
  
  def create_m_auth
    username = params[:username]
    password = params[:password]
    # render plain: params.inspect
    user = Masyarakat.find_by(username: username)
    if user
      if user.authenticate(password)
        session[:m_id] =  user.id
        redirect_to lelangind_index_path, notice: "Selamat datang #{username}!"
      else
        redirect_to auth_new_path, alert: "Password tidak sesuai!"
      end
    else
      redirect_to auth_new_path, alert: "Username #{username} tidak ditemukan!"
    end
  end
  
  def new_p

  end

  def create_p_auth
    username = params[:username]
    password = params[:password]
    # render plain: params.inspect

    user = Petugas.find_by(username: username)
    if user
      if user.authenticate(password)
        session[:p_id] = user.id
        redirect_to petugas_index_path, notice: "Selamat datang #{username}!"
      else
        redirect_to auth_p_new_path, alert: "Password tidak sesuai!"
      end
    else
      redirect_to auth_p_new_path, alert: "Username #{username} tidak ditemukan!"
    end
  end

  def destroy_session_m
    session[:m_id] = nil
    redirect_to auth_new_path, alert: 'Kamu telah logout.'
  end

  def destroy_session_p
    session[:p_id] = nil
    redirect_to auth_p_new_path, alert: 'Kamu telah logout.'
  end

  private
  def masyarakat_params
    params.require(:masyarakat).permit(:nama_lengkap, :username, :password, :telp)
  end
end
