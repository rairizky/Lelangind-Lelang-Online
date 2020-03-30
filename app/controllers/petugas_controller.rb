class PetugasController < ApplicationController

  before_action :p_signed_in?
  helper_method :current_user_p

  layout 'petugas'

  def index

  end

  def pendataan_barang
    
  end

  def barang_lelang

  end

  def manage_petugas
    @new_petugas = Petugas.new
    @list_petugas = Petugas.all
  end

  def create_new_petugas
    @new_petugas = Petugas.new(new_petugas_params)
    if @new_petugas.save
      redirect_to manage_petugas_path, notice: 'Akun Petugas berhasil dibuat!'
    else
      render :manage_petugas
    end
  end

  def generate_laporan

  end

  def profile_petugas
    @petugas_id = Petugas.find(params[:id])
  end

  def update_profile_p
    @petugas_id = Petugas.find(params[:id])
    if @petugas_id.update(profile_edit_params)
      redirect_to profile_p_path, notice: 'Update profile berhasil!'
    else
      render :profile_petugas
    end
  end

  private
  def profile_edit_params
    params.require(:petugas).permit(:nama_petugas, :username)
  end

  def new_petugas_params
    params.require(:petugas).permit(:nama_petugas, :username, :password, :password_confirmation, :level_id)
  end
end
