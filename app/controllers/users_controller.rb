class UsersController < ApplicationController

  def index
    matching_users = User.all
    @users = matching_users.order(:created_at)

    render({ :template => "users_templates/all_users.html.erb"})
  end
  
  def show
    username = params.fetch("username")
    matching_users = User.where({ :username => username })
    @user = matching_users.at(0)

    render({ :template => "users_templates/user_details.html.erb"})
  end
  
  def create
    user = User.new
    user.username = params.fetch("query_username")
    user.save
    
    redirect_to("/users/"+ user.username)
  end
  
  def update
   # the_name = params.fetch("m_name")
    #matching_users = User.where({ :username => the_name })
    #the_user = matching_users.at(0)
    
    #the_user.username = params.fetch("query_username")
    #the_user.save
    #redirect_to("/users/"+ the_user.username)

    the_username = params.fetch("modify_username")

    cur_username = params.fetch("query_username")
    matching_user = User.where({:username => the_username})
    the_user = matching_user.at(0)   

    the_user.username = cur_username
    the_user.save
    
   #render({:template => "user_templates/update.html.erb"})
   redirect_to("/users/"+ the_user.username)
  end

end
