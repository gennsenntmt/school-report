class CreateStudents < ActiveRecord::Migration[5.2]
  def change
    create_table :students do |t|
      t.string      :name,           null: false
      t.integer     :grade,          null: false
      t.boolean     :english
      t.boolean     :math
      t.boolean     :japanese
      t.boolean     :science
      t.boolean     :social_studies
      t.timestamps
    end
  end
end
