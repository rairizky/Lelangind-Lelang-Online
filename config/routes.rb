Rails.application.routes.draw do
  # lelangind
  root 'lelangind#index', as: 'lelangind_index'
  get 'lelang', to: 'lelangind#lelang', as: 'lelangind_lelang_barang'
  get 'lelang/:id/', to: 'lelangind#ikut_lelang', as: 'lelangind_ikut_lelang'
  post 'lelang/:id/', to: 'lelangind#penawaran', as: 'lelangind_ajukan_penawaran'
  get '/history/', to: 'lelangind#history', as: 'lelangind_history'
  get '/:id/profile', to: 'lelangind#profile', as: 'lelangind_profile'
  patch '/:id/profile/', to: 'lelangind#update_profile', as: 'lelangind_update_profile'

  # auth
  get '/auth/', to: 'auth#new',  as: 'auth_new'
  post '/create_m_auth', to: 'auth#create_m_auth', as: 'create_m_auth'
  post '/auth/', to: 'auth#create_m_user', as: 'create_m_user'
  get '/petugas/auth/', to: 'auth#new_p', as: 'auth_p_new'
  post '/create_p_auth', to: 'auth#create_p_auth', as: 'create_p_auth'
  delete '/destroy_session_m/:id', to: 'auth#destroy_session_m', as: 'destroy_s_m'
  delete '/destroy_session_p/:id', to: 'auth#destroy_session_p', as: 'destroy_s_p'

  # petugas
  get '/petugas/profile/:id', to: 'petugas#profile_petugas', as: 'profile_p'
  patch '/petugas/profile/:id', to: 'petugas#update_profile_p', as: 'update_profile_p'

  get '/petugas/', to: 'petugas#index', as: 'petugas_index'

  get '/petugas/pendataan-barang', to: 'petugas#pendataan_barang', as: 'data_barang_p'
  post '/petugas/pendataan-barang', to: 'petugas#create_new_barang', as: 'create_new_barang'
  get '/petugas/pendataan-barang/:id',to: 'petugas#detail_barang_item', as: 'detail_barang_item'
  get '/petugas/pendataan-barang/:id/edit', to: 'petugas#edit_barang', as: 'edit_barang'
  patch '/petugas/pendataan-barang/:id/edit', to: 'petugas#update_barang', as: 'update_barang'
  delete '/petugas/pendataan-barang/:id/delete', to: 'petugas#destroy_barang', as: 'destroy_barang' 

  get '/petugas/lelang/', to: 'petugas#barang_lelang', as: 'barang_lelang_p'
  get '/petugas/lelang/:id', to: 'petugas#barang_lelang_detail', as: 'barang_lelang_detail'
  post '/petugas/lelang/:id/buka-lelang', to: 'petugas#buka_lelang', as: 'buka_lelang'
  post '/petugas/lelang/:id/tutup-lelang', to: 'petugas#tutup_lelang', as: 'tutup_lelang'

  get '/petugas/daftar-petugas/', to: 'petugas#manage_petugas', as: 'manage_petugas'
  post '/petugas/daftar-petugas/', to: 'petugas#create_new_petugas', as: 'create_new_petugas'
  
  get '/petugas/laporan/', to: 'petugas#generate_laporan', as: 'laporan'
end
