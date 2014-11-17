class ChangeOauthTokenInUsers < ActiveRecord::Migration
  def change
    change_column :users, :oauth_token, :text, :limit => nil
  end
end
