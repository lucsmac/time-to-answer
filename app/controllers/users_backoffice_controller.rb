class UsersBackofficeController < ApplicationController
  before_action :authenticate_users!
  
  layout 'users_backoffice'
end
