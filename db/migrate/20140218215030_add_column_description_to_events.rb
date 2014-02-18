class AddColumnDescriptionToEvents < ActiveRecord::Migration
  def change
    add_column :events, :description, :text
    add_column :events, :event_day, :datetime
  end
end
