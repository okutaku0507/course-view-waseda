class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.string :family_name, null: false     # 氏(実名を推奨)
      t.string :first_name, null: false     # 名(実名を推奨)
      t.string :email, null: false        # IDとなるemail
      t.string :email_confirmation #emailの確認 
      t.string :faculty, null: false                # (出身)学部
      t.string :subject                    # 学科(任意)
      t.integer :gender, null: false, default: 0
                                         # 性別 (0:男, 1:女)
      t.boolean :administrator, null: false, default: false
                                         #管理者
      t.timestamps
    end
  end
end
