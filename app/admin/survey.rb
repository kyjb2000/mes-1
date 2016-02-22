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

      survey.questions.each_with_index do |question, index|
        row "Question [#{index + 1}]"  do |f|
         question.name
        end

        row :Options do |f|
         question.options.map{|x| x.text}.join(', ')
        end

        if question.video.present?
          row :Video do |f|
           video_tag(question.video.url, controls: true, autobuffer: false, size: "320x240")
          end
        end

        if question.image.present?
          row :Image do |f|
            image_tag(question.image.url, size: "320x240")
          end
        end
        
      end
    end
  end
end
