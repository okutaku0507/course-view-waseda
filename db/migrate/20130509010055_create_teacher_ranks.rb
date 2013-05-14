class CreateTeacherRanks < ActiveRecord::Migration
  def change
    create_table :teacher_ranks do |t|
      t.references :member, null: false                             # メンバーの外部キー
      t.references :course_info, null: false                        # コースの外部キー
      t.integer :teacher_rank, null: false                          # 教授の単位



      t.timestamps
    end
    add_index :teacher_ranks, :member_id
    add_index :teacher_ranks, :course_info_id

  end
  
  def destroy
    @teacher_rank = TeacherRnak.find(params[:id])
    @course_info = @teacher_rank.course_info
    @teacher_rank.destroy

    redirect_to @course_info, notice: "教授評価を削除しました"
  end

end
