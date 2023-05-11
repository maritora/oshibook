class RemoveBirthFromProfiles < ActiveRecord::Migration[6.1]
  def change
    remove_column :profiles, :birth, :date
    remove_column :profiles, :f_object, :string
    remove_column :profiles, :f_object_content, :string
  end
end
