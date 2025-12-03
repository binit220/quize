class RenameDescriptonToDescription < ActiveRecord::Migration[7.1]
  def change
    rename_column :quizzes, :descripton, :description
  end
end
