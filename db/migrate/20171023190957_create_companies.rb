class CreateCompanies < ActiveRecord::Migration[5.1]
  def change
    create_table :companies do |t|
      t.string :name
      t.string :username
      t.string :password
      t.string :host
      t.string :port
      t.string :service_name

      t.timestamps
    end
  end
end
