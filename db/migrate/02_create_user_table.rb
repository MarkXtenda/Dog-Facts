class CreateUserTable < ActiveRecord::Migration[5.2]
    def change
        create_table :users do |r|
            r.string :name
        end
    end
end