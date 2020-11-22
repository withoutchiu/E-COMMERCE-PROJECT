ActiveAdmin.register Product do

  permit_params :name, :description, :price, :rating, :stock, :brand_id, :category_id, :color_id
  #
  # or
  #
  # permit_params do
  #   permitted = [:name, :description, :price, :rating, :stock, :brand_id, :category_id, :color_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

end
