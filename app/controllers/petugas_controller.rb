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

  def edit_barang
    @item = Barang.find(params[:id])
  end

  def update_barang
    @item = Barang.find(params[:id])
    if @item.update(barang_edit_params)
      redirect_to detail_barang_item_path(@item), notice: 'Berhasil update barang!'
    else
      render :edit_barang
    end
  end

  def destroy_barang
    @find = Barang.find(params[:id])
    if @find.destroy
      redirect_to data_barang_p_path, notice: 'Berhasil menghapus barang'
    else
      redirect_to detail_barang_item_path(@find), alert: 'Gagal menghapus barang'
    end
  end

  def barang_lelang
    @barang = Barang.all.where(nil)
    @barang = Barang.all.where('nama_barang like ?', "%#{params[:nama_barang]}%") if params[:nama_barang].present?
  end

  def barang_lelang_detail
    @item = Barang.find(params[:id])
  end

  def buka_lelang
    @item = Barang.find(params[:id])
    buka = Lelang.create(barang_id: @item.id, tgl_lelang: DateTime.current.to_date, petugas_id: current_user_p.id, status: 'dibuka')
    if buka
      redirect_to barang_lelang_detail_path(barang_id: @item.id), notice: "Lelang #{@item.nama_barang} telah dibuka!"
    else
      redirect_to barang_lelang_detail_path, alert: 'Gagal buka lelang!'
    end
  end

  def tutup_lelang
    item = Barang.find(params[:id])
    user_win = item.lelang.histories.max.masyarakat.id
    penawaran = item.lelang.histories.max.penawaran_harga
    tutup = Lelang.where(id: item.lelang.id).update(harga_akhir: penawaran, masyarakat_id: user_win, status: 'ditutup')
    if tutup
      redirect_to barang_lelang_detail_path(barang_id: item.id), notice: "Lelang #{item.nama_barang} telah ditutup!"
    else
      redirect_to barang_lelang_detail_path, alert: 'Gagal tutup lelang!'
    end
  end

  def manage_petugas
    if current_user_p.level_id == 2
      redirect_to petugas_index_path, alert: 'Tidak mempunyai akses untuk daftar petugas!'
    end
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
    b_awal = Date.parse("1/#{params[:month]}/#{params[:year]}") if params[:month].present? && params[:year].present?
    b_akhir = b_awal.end_of_month if params[:month].present? && params[:year].present?
    @cari = Lelang.where(status: 'ditutup').where(nil)
    @cari = Lelang.where(status: 'ditutup').where(created_at: b_awal..b_akhir) if params[:month].present? && params[:year].present?
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

  def barang_edit_params
    params.require(:barang).permit(:nama_barang, :img_barang, :deskripsi_barang)
  end
end
