class CreateFactTable < ActiveRecord::Migration[5.2]
    def change
        create_table :facts do |r|
            r.string :fact
        end
    end
end