class DeviseCreateAdminUsers < ActiveRecord::Migration
  def migrate(direction)
    super
    AdminUser.create!({
      email: 'admin@example.com',
      password: 'password',
      password_confirmation: 'password',
      type: 'AdminUser',
    }) if direction == :up
  end
end
