class AddDefaultToTrackBonus < ActiveRecord::Migration[5.2]
  def up
    change_column :tracks, :bonus, :boolean, default: false
  end

  def down
    change_column :profiles, :show_attribute, :boolean, default: nil
  end
end
