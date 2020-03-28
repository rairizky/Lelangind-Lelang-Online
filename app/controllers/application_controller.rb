class ApplicationController < ActionController::Base


    def current_user_m
        if session[:m_id]
            Masyarakat.find(session[:m_id])
        else
            nil
        end
    end

    def current_user_p
        if session[:p_id]
            Petugas.find(session[:p_id])
        else
            nil
        end
    end

    def m_signed_in?
        if current_user_m
            true
        else
            redirect_to auth_new_path, alert: 'Silahkan login dahulu!'
            return false
        end
    end
    
    def p_signed_in?
        if current_user_p
            true
        else
            redirect_to auth_p_new_path, alert: 'Silahkan login dahulu!'
            return false
        end
    end
end
