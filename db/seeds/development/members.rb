# coding: utf-8

names = %w(Taro Jiro Hana John Mike Sophy Bill Alex Mary Tom)
fnames = ["奥原", "鈴木", "高橋", "田中"]
gnames = ["拓也", "次郎", "花子"]
0.upto(9) do |idx|
  Member.create(
  { family_name: "#{fnames[idx % 4]}",
    first_name: "#{gnames[idx % 3]}",
    email: "#{names[idx]}@fuji.waseda.jp",
    email_confirmation: "#{names[idx]}@fuji.waseda.jp",
    faculty: "先進理工学部",
    subject: "#{names[idx]}学科",
    gender: [0, 0, 1][idx % 3],
    password: "monsterg",
    password_confirmation: "monsterg",
    administrator: (idx == 0)
 }, without_protection: true)
end