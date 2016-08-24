require 'bcrypt'

class User < ActiveRecord::Base

  include BCrypt

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  def self.authenticate
    @user = User.find_by_username(params[:username])
    @user.password == params[:password]

  end
end
