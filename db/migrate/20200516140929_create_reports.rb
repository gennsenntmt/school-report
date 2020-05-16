class CreateReports < ActiveRecord::Migration[5.2]
  def change
    create_table :reports do |t|
      t.string      :title,           null: false    
      t.text        :description,     null: false
      t.text        :homework,        null: false
      t.date        :day,             null: false
      t.integer     :subject,         null: false
      t.text        :other
      t.integer     :user,            foreign_key: true
      t.integer     :student,         foreign_key: true
      t.integer     :principal,       default: 0
      t.timestamps
    end
  end
end
