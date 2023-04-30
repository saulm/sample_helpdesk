class CreateSupportRequests < ActiveRecord::Migration[7.0]
  def change
    create_table :support_requests do |t|
      t.string :name
      t.string :email
      t.text :description
      t.text :response
      t.string :status, default: "new", null: false
      t.timestamps
    end
  end
end
