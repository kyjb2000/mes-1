ActiveAdmin.register User do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if resource.something?
#   permitted
# end

permit_params :email, :name, :is_active

index do
  selectable_column
  id_column
  column :email
  column :name
  column :is_active
  column :created_at
  actions
end

form do |f|
  f.inputs "Block/Unblock User" do
    f.input :is_active, label: "Block/Unblock"
  end
  f.actions
end
end
