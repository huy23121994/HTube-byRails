class ChangeAccountToUsernameInUsers < ActiveRecord::Migration
  def change

  	change_table :users do |t|
  		t.rename :account, :username
  	end

  end
end
