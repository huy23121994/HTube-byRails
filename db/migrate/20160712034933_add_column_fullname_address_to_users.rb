class AddColumnFullnameAddressToUsers < ActiveRecord::Migration
  def change
  	change_table :users do |t|
  		t.string :fullname
  		t.string :address
  		t.remove :isAdmin
  		t.string :role
  	end	
  end
end
