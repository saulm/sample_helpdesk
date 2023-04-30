class AddAdminAccount < ActiveRecord::Migration[7.0]
  def change
    AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')
  end
end
