class User < ActiveRecord::Base
    has_many :favorites
    has_many :facts, through: :favorites
end