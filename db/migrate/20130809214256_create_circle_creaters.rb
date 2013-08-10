class CreateCircleCreaters < ActiveRecord::Migration
  def change
    create_table :circle_creaters do |t|
      t.references :circle, null: false       #circleの外部キー
      t.references :member, null: false       #memberの外部キー

      t.timestamps
    end
    
    add_index :circle_creaters, :circle_id
    add_index :circle_creaters, :member_id
  end
end
