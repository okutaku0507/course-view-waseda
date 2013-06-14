# coding: utf-8

# パスワードの形式をチェックする
# 
# [使用法]
#   password = 半角英数字以外
#   well_formed_as_password(password)    # => false
module PasswordChecker
  # 文字列がパスワードの形式として正しければ true を返す。
  def well_formed_as_password(str)
     return if str.match(/[^A-Za-z0-9]/)
     return true
  end
end
