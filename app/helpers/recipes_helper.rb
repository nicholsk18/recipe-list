module RecipesHelper
    def get_image(id)
        image_file = Rails.root.join('public', 'uploads', "recipe-#{id}.png")

        if !File.exist?(image_file)
            # path to generic img
            "/uploads/recipe-#{id}.png"
        end

        "/uploads/recipe-#{id}.png"
    end
end
