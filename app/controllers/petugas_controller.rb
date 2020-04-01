class PetugasController < ApplicationController

  before_action :p_signed_in?
  helper_method :current_user_p

  layout 'petugas'

  def index

  end

  def pendataan_barang
    @new_barang = Barang.new
    @list_barang = Barang.paginate(page: params[:page], per_page: 7)
  end

  def create_new_barang
    @list_barang = Barang.paginate(page: params[:page], per_page: 7)
    @new_barang = Barang.new(new_barang_params)
    if @new_barang.save
      redirect_to data_barang_p_path, notice: 'Barang berhasil ditambahkan!'
    else
      render :pendataan_barang
    end
  end

  def detail_barang_item
    @item = Barang.find(params[:id])
  end

  def barang_lelang

  end

  def manage_petugas
    @new_petugas = Petugas.new
    @list_petugas = Petugas.paginate(page: params[:page], per_page: 7)
  end

  def create_new_petugas
    @list_petugas = Petugas.paginate(page: params[:page], per_page: 7)
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
    params.require(:petugas).permit(:nama_petugas, :username, :password, :level_id)
  end

  def new_barang_params
    params.require(:barang).permit(:nama_barang, :img_barang, :tgl, :harga_awal, :deskripsi_barang)
  end
end
