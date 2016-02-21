ActiveAdmin.register Survey do
  permit_params :tile, :description, :user, :created_at, :questions

  actions :all, :except => [:new, :edit]

  filter :title
  filter :user
  filter :sign_in_count
  filter :created_at

  index do
    selectable_column
    id_column
    column :title
    column :description
    column :user
    column :created_at
    column :participants_count
    actions
  end

  show do
    attributes_table do
      row :title
      row :description
      row :Questions do |f|
       f.questions.map{|x| x.name}.join(', ')
      end
    end
  end
end
