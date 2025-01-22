class CreateVirtualPersonas < ActiveRecord::Migration[7.2]
  def change
    create_table :virtual_personas do |t|
      t.timestamps
    end
  end
end
