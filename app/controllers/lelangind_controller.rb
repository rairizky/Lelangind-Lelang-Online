class LelangindController < ApplicationController

  helper_method :current_user_m

  layout 'lelangind'

  def index
    @lelang = Lelang.all.where(status: 'dibuka').order(created_at: :desc)
  end
end
