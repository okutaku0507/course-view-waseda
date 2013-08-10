class CreateCircleTopImages < ActiveRecord::Migration
  def change
    create_table :circle_top_images do |t|
      t.references :circle, null: false               #サークルの外部キー
      t.binary :data, limit: 100.megabytes            #画像データ
      t.string :content_type                          #MIMEタイプ
      t.string :description, null: false              #画像の説明
      
      t.timestamps
    end
    
    add_index :circle_top_images, :circle_id
  end
end
