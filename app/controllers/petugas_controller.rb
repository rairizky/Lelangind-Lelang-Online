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
end
