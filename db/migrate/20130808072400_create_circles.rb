class CreateCircles < ActiveRecord::Migration
  def change
    create_table :circles do |t|
      t.string :title, null: false                    #サークル名
      t.string :headline, null: false                 #サークルの意気込みなど、キャッチコピーなど
      t.string :circle_type, null: false              #オール早稲田かインカレokかをボタンで選んで、コントローラーで文字列に変換
      t.string :belong, null: false                   #本キャン・文・理工・所沢
      t.string :genre, null: false                    #ジャンル(複数回答可だが、一つ推奨)
      t.string :open, null: false                     #現在メンバーを募集かどうか
      t.text :detail, null: false                   	#サークル詳細
      t.string :hashed_password, null: false          #パスワード
      
      t.timestamps
    end
  end
end