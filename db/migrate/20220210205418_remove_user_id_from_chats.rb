class RemoveUserIdFromChats < ActiveRecord::Migration[7.0]
  def change
    remove_column :chats, :user_id, :bigint
  end
end
