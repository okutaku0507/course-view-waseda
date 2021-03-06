# coding: utf-8

course_names = %w(数学基礎 応用化学概論 政治経済 卓球基礎 生物の適応能力 教職概論 ヨーロッパ文化近代システム誕生の地 ConceptBuildingAndDiscussion 数学基礎 応用化学概論 政治経済 卓球基礎 生物の適応能力 教職概論 ヨーロッパ文化近代システム誕生の地 ConceptBuildingAndDiscussion 数学基礎 応用化学概論 政治経済 卓球基礎 生物の適応能力 教職概論 ヨーロッパ文化近代システム誕生の地 ConceptBuildingAndDiscussion 数学基礎 応用化学概論 政治経済 卓球基礎 生物の適応能力 教職概論 ヨーロッパ文化近代システム誕生の地 ConceptBuildingAndDiscussion 数学基礎 応用化学概論 政治経済 卓球基礎 生物の適応能力 教職概論 ヨーロッパ文化近代システム誕生の地 ConceptBuildingAndDiscussion 数学基礎 応用化学概論 政治経済 卓球基礎 生物の適応能力 教職概論 ヨーロッパ文化近代システム誕生の地 ConceptBuildingAndDiscussion)
teacher_names = %w(清水太郎 門間忠文 菅原敏弘 細川清十郎 馬場百合 ジョウ・ウィリー マナロ・エマニュエル 清水太郎 門間忠文 菅原敏弘 細川清十郎 馬場百合 ジョウ・ウィリー マナロ・エマニュエル 清水太郎 門間忠文 菅原敏弘 細川清十郎 馬場百合 ジョウ・ウィリー マナロ・エマニュエル 清水太郎 門間忠文 菅原敏弘 細川清十郎 馬場百合 ジョウ・ウィリー マナロ・エマニュエル 清水太郎 門間忠文 菅原敏弘 細川清十郎 馬場百合 ジョウ・ウィリー マナロ・エマニュエル 清水太郎 門間忠文 菅原敏弘 細川清十郎 馬場百合 ジョウ・ウィリー マナロ・エマニュエル)
weeks = %w(月 火 水 木 金 土 月 火 水 木 金 土 月 火 水 木 金 土 月 火 水 木 金 土 月 火 水 木 金 土 月 火 水 木 金 土)
times = %w(1 1 1 1 1 1 2 2 2 2 2 2 3 3 3 3 3 3 4 4 4 4 4 4 5 5 5 5 5 5 6 6 6 6 6 6 7 7 7 7 7 7)
faculties = %w(政治経済学部 法学部 第一文学部 第二文学部 文化構想学部 文学部 教育学部 商学部 基幹理工学部 創造理工学部 先進理工学部 社会科学部 人間科学部 スポーツ科学部 国際教養学部 その他 政治経済学部 法学部 第一文学部 第二文学部 文化構想学部 文学部 教育学部 商学部 基幹理工学部 創造理工学部 先進理工学部 社会科学部 人間科学部 スポーツ科学部 国際教養学部 その他 政治経済学部 法学部 第一文学部 第二文学部 文化構想学部 文学部 教育学部 商学部 基幹理工学部 創造理工学部 先進理工学部 社会科学部 人間科学部 スポーツ科学部 国際教養学部 その他 政治経済学部 法学部 第一文学部 第二文学部 文化構想学部 文学部 教育学部 商学部 基幹理工学部 創造理工学部 先進理工学部 社会科学部 人間科学部 スポーツ科学部 国際教養学部 その他 政治経済学部 法学部 第一文学部 第二文学部 文化構想学部 文学部 教育学部 商学部 基幹理工学部 創造理工学部 先進理工学部 社会科学部 人間科学部 スポーツ科学部 国際教養学部 その他)
terms = %w(通年 春期 秋期 その他 通年 春期 秋期 その他 通年 春期 秋期 その他 通年 春期 秋期 その他 通年 春期 秋期 その他 通年 春期 秋期 その他 通年 春期 秋期 その他 通年 春期 秋期 その他 通年 春期 秋期 その他 通年 春期 秋期 その他 通年 春期)
0.upto(41) do |idx|
  CourseInfo.create( {
    title: "#{course_names[idx]}",
    teacher: "#{teacher_names[idx]}",
    open_faculty: "#{faculties[idx]}",
    day_of_the_week: "#{weeks[idx]}",
    open_time: "#{times[idx]}",
    open_term: "#{terms[idx]}",
    text_for_search: "#{course_names[idx]} #{teacher_names[idx]}",
 }, without_protection: true)
end