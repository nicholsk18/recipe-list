class Recipe < ApplicationRecord
    attribute :title, :string
    attribute :description, :string
    attribute :recipe_body, :text
end
