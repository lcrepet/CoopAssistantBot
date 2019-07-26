class AuthController < ApplicationController
  def login
    redirect_to controller: 'messages', action: 'redirect', payload: params[:state], token: coop_repository.auth_user
  end

  private

  def coop_repository
    @coop_repository ||= Coop::Repository.new
  end
end
