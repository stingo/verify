class SessionsController < Devise::DeviseController

  def create
    
  end

    def after_sign_in_path_for(resource)
        if resource.sign_in_count == 1
           users_path
        else
           root_path
        end
    end

end