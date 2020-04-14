class DeleteColumn < ActiveRecord::Migration[6.0]
  def change
    remove_column :sensors, :gov_owned
    remove_column :sensors, :op_hrs
    remove_column :sensors, :datatype
    remove_column :sensors, :study_area_id
  end
end
