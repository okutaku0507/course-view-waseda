
class CreateCourseViews < ActiveRecord::Migration
  def change
    create_table :course_views do |t|
      t.references :member, null: false           # memberの外部キー
      t.references :course_info, null: false      # course_infoの外部キー
      t.string :title_of_course, null: false           # コメントが属する講義名  
      t.text :view, null: false                   # コメント(view)
      t.integer :id_course, null: false          # コースのＩＤを渡す
      t.integer :id_member, null: false          # 書いたメンバーのＩＤを渡す

      t.timestamps
    end
    add_index :course_views, :member_id
    add_index :course_views, :course_info_id
  end
end