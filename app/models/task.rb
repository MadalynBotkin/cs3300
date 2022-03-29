class Task < ApplicationRecord
    #presence validators
    validates_presence_of :title, :descritpion
end
