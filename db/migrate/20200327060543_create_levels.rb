class CreateLevels < ActiveRecord::Migration[6.0]
  def change
    create_table :levels do |t|
      t.string :level

      t.timestamps
    end

    data = ["admin", "petugas"]
    data.each do |l|
      Level.create! do |f|
        f.level = l
      end
    end
  end
end
