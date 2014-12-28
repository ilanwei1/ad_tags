class CreateAdTags < ActiveRecord::Migration
  def change
    create_table :ad_tags do |t|
    	t.string  'ip'
    	t.string  'name'
    	t.string  'size'
    	t.timestamps
    end
  end
end
