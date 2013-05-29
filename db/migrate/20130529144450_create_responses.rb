class CreateResponses < ActiveRecord::Migration
  def change
    create_table :responses do |t|
      t.references :member, null: false           # memberの外部キー
      t.references :course_view, null: false      # course_viewの外部キー
      t.text :view_response, null: false          # レスポンス
      
      t.timestamps
    end
    add_index :responses, :member_id
    add_index :responses, :course_view_id
  end
end
