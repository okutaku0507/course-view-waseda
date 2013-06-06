
# coding: utf-8
%w(佐藤 鈴木 高橋).each do |family_name|
member = Member.find_by_family_name(family_name)
%w(数学基礎 応用化学概論 政治経済).each do |title|
course_info = CourseInfo.find_by_title(title)


0.upto(9) do |idx|
  CourseView.create( {
    member: member,
    course_info: course_info,
    view: "教室は広く、内職をしていても怒られることはない。しかし、テストでは、授業内容が出題されるので
             ちゃんと聞いとくことをお勧めする。授業内容は楽しい人には楽しい。しかし、為になる授業である。
             \n授業のはじめに出席カードが一人一人配られるので代返をすることはできない。\n単位は出席してい
             れば一応くるが期待できない。",
    title_of_course: "生物",
    id_course: 1,
    id_member: 1,
    member_id: 1
    
  }, without_protection: true)
    end
  end
end
