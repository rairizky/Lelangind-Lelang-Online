class LelangindController < ApplicationController

  before_action :m_signed_in?, only: [:penawaran, :history]
  helper_method :current_user_m

  layout 'lelangind'

  def index
    
  end

  def lelang
    @lelang = Lelang.all.where(status: 'dibuka').order(created_at: :desc)
  end

  def ikut_lelang
    @item = Lelang.find(params[:id])
  end

  def penawaran
    item = Lelang.find(params[:id])
    penawaran_pertama = item.histories
    if penawaran_pertama.blank?
      pengajuan = params[:penawaran_harga]
      harga_awal = item.barang.harga_awal
      if (pengajuan.to_i <= harga_awal.to_i)
        redirect_to lelangind_ikut_lelang_path(item), alert: 'Penawaran pertama tidak boleh kurang dari harga awal barang!'
      else
        History.create(lelang_id: item.id, barang_id: item.barang.id, masyarakat_id: current_user_m.id, penawaran_harga: pengajuan)
        redirect_to lelangind_ikut_lelang_path(item), notice: 'Berhasil mengajukan barang!'
      end
    else
      harga_max = item.histories.max.penawaran_harga
      pengajuan = params[:penawaran_harga]
      if (pengajuan.to_i <= harga_max.to_i)
        redirect_to lelangind_ikut_lelang_path(item), alert: 'Pengajuan harga harus melebihi harga tertinggi lelang!'
      else
        History.create(lelang_id: item.id, barang_id: item.barang.id, masyarakat_id: current_user_m.id, penawaran_harga: pengajuan)
        redirect_to lelangind_ikut_lelang_path(item), notice: 'Berhasil mengajukan barang!'
      end
    end
  end

  def history
    @history = History.all.where(masyarakat_id: current_user_m.id).order(created_at: :desc).where(nil)
    @history = History.all.where(masyarakat_id: current_user_m.id).order(created_at: :desc).where('created_at BETWEEN ? AND ?', params[:dari].to_date.beginning_of_day, params[:hingga].to_date.end_of_day) if params[:dari].present? && params[:hingga].present?
  end
end
