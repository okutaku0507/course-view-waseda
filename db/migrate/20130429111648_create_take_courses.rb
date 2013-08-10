class CreateTakeCourses < ActiveRecord::Migration
  def change
    create_table :take_courses do |t|
      t.references :member, null: false                             # メンバーの外部キー
      t.references :course_info, null: false                        # コースの外部キー
      t.string :take_course_title, null: false	                    # 履修しているコースのタイトルを渡す
      t.string :take_course_open_week, null: false                  # 履修しているコースの曜日を渡す
      t.integer :take_course_open_time, null: false                 # 履修しているコースの時限を渡す
      t.integer :id_of_take_course, null: false                     # 履修しているコースのユニークなidを渡す
      t.integer :take_course_late_point, null: false   # 遅刻回数
      t.integer :take_course_absent_point, null: false  # 欠席回数
      t.text :take_course_note, null: false                         # 備考
      
      t.timestamps
    end
    add_index :take_courses, :member_id
    add_index :take_courses, :course_info_id
  end
end
