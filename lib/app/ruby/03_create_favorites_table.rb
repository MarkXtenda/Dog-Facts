class CreateFavoritesTable < ActiveRecord::Migration[5.2]
    def change
        create_table :favorites do |r|
            r.integer :user_id
            r.integer :fact_id
        end
    end
end