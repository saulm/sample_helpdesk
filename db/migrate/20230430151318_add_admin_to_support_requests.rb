class AddAdminToSupportRequests < ActiveRecord::Migration[7.0]
  def change
    add_reference :support_requests, :admin_user, null: true, foreign_key: true
  end
end
