class AddNicknameToReplies < ActiveRecord::Migration[7.0]
  def change
    add_column :replies, :nickname, :string
  end
end
