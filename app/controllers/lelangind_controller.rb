class LelangindController < ApplicationController

  helper_method :current_user_m

  layout 'lelangind'

  def index
    @lelang = Lelang.all.where(status: 'dibuka').order(created_at: :desc)
  end

  def ikut_lelang
    @item = Lelang.find(params[:id])
  end
end
