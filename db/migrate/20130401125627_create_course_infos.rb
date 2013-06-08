# coding: utf-8

class CreateCourseInfos < ActiveRecord::Migration
  def change
    create_table :course_infos do |t|
      t.string :title, null: false                 # 科目名
      t.string :teacher_family_name, null: false   # 教員の氏
      t.string :teacher_first_name, null: false    # 教員の名
      t.string :open_faculty, null: false          # 提供学部
      t.string :day_of_the_week, null: false       # 開設曜日
      t.integer :open_time, null: false            # 時限
      t.string :open_term, null: false             # 開設学期
      t.timestamps
    end
  end
end