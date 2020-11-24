ActiveAdmin.register Product do

  permit_params :name, :description, :price, :rating, :stock, :brand_id, :category_id, :color_id, :image

  form do |f|
    f.semantic_errors
    f.inputs
    f.inputs do
      f.input :image, as: :file, hint: f.object.image.present? ? image_tag(f.object.image, size: "250x200") : ''
    end
    f.actions
  end
  #
  # or
  #
  # permit_params do
  #   permitted = [:name, :description, :price, :rating, :stock, :brand_id, :category_id, :color_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

end
