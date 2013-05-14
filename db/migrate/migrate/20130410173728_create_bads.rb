class CreateBads < ActiveRecord::Migration
  def change
    create_table :bads do |t|
      t.references :member, null: false             # memberの外部キー
      t.references :course_info, null: false        # course_infoの外部キー

      t.timestamps
    end
    add_index :bads, :member_id
    add_index :bads, :course_info_id
  end
end
