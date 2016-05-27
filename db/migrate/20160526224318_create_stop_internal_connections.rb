class CreateStopInternalConnections < ActiveRecord::Migration
  def change
    [:current, :old].each do |version|
      create_table "#{version}_stop_internal_connections" do |t|
        t.string :connection_type, index: true
        t.hstore :tags
        t.references :stop, index: true
        t.references :origin, class_name: "Stop", index: true
        t.references :destination, class_name: "Stop", index: true
        t.integer :version
        t.timestamps
      end
    end
  end
end
