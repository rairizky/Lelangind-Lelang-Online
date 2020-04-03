class PetugasController < ApplicationController

  before_action :p_signed_in?
  helper_method :current_user_p

  layout 'petugas'

  def index

  end

  def pendataan_barang
    @new_barang = Barang.new
    @list_barang = Barang.paginate(page: params[:page], per_page: 6).order(created_at: :desc)
  end

  def create_new_barang
    @list_barang = Barang.paginate(page: params[:page], per_page: 6).order(created_at: :desc)
    @new_barang = Barang.new(new_barang_params)
    if @new_barang.save
      redirect_to detail_barang_item_path(@new_barang), notice: 'Barang berhasil ditambahkan!'
    else
      render :pendataan_barang
    end
  end

  def detail_barang_item
    @item = Barang.find(params[:id])
  end

  def buka_lelang
    @item = Barang.find(params[:id])
    buka = Lelang.create(barang_id: @item.id, tgl_lelang: DateTime.current.to_date, petugas_id: current_user_p.id, status: 'dibuka')
    if buka
      redirect_to barang_lelang_p_path, notice: "Lelang #{@item.nama_barang} telah dibuka!"
    else
      redirect_to detail_barang_item_path, alert: 'Gagal buka lelang!'
    end
  end

  def barang_lelang
    @barang = Barang.paginate(page: params[:page], per_page: 6).where(nil)
    @barang = Barang.paginate(page: params[:page], per_page: 6).where('nama_barang like ?', "%#{params[:nama_barang]}%") if params[:nama_barang].present?
  end

  def barang_lelang_detail
    @item = Barang.find(params[:id])
  end

  def manage_petugas
    @new_petugas = Petugas.new
    @list_petugas = Petugas.paginate(page: params[:page], per_page: 6).order(created_at: :desc).where(level_id: 2)
  end

  def create_new_petugas
    @list_petugas = Petugas.paginate(page: params[:page], per_page: 6).order(created_at: :desc)
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
