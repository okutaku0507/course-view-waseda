class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.references :member, null: false             # memberの外部キー
      t.references :course_info, null: false        # course_infoの外部キー

      t.timestamps
    end
    add_index :likes, :member_id
    add_index :likes, :course_info_id
  end
end
