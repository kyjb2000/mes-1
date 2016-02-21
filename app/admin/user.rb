ActiveAdmin.register User do

permit_params :email, :name, :is_active

actions :all, :except => [:new]
filter :is_active
filter :confirmed_at


index do
  selectable_column
  id_column
  column :email
  column :name
  column :is_active
  column :created_at
  column :confirmed_at
  actions
end

form do |f|
  f.inputs "Block/Unblock User" do
    f.input :is_active, label: "Block/Unblock"
  end
  f.actions
end
end
