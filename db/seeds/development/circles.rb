# coding: utf-8
0.upto(50) do
Circle.create(
  { title: "卓球同好会",
    headline: "いきあいあいと活動しています！ぜひ一緒に卓球やりましょう！",
    circle_type: "all_waseda",
    belong: "center",
    genre: "卓球 オールラウンド",
    open: "yes",
    detail: "私達は2010年より活動を開始した新興サークルです。現在は、多くの仲間に恵まれ、男子28人、女子15人で活動しています。年会費などはかかりません！\n
    飲みでもコールは一切禁止、安心して飲めます！\n学年などの隔たりはなく、みんなでわいわいやってます！\n興味がわいたらぜひ参加してください！",
    password: "monsterg"
 }, without_protection: true)
end