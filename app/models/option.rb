class Option < ApplicationRecord
    validates_uniqueness_of :code
end
