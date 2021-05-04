ActiveAdmin.register Comment, :as => "User Reviews" do
  permit_params :user_id, :brewery_id, :text, :rating, :created_at, :updated_at, :blacklist

  batch_action :anonymise do |ids|
    batch_action_collection.find(ids).each do |comment|
      comment.user_id = 69
      comment.save
    end
    redirect_to collection_path, alert: "The review has been anonymised."
  end
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :rating, :text, :brewery_id, :user_id
  #
  # or
  #
  # permit_params do
  #   permitted = [:rating, :text, :brewery_id, :user_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  action_item :only => :index do
    link_to 'Upload CSV', :action => 'upload_csv'
  end

  collection_action :upload_csv do
    render "admin/csv/upload_csv.html.haml"
  end

  collection_action :import_csv, :method => :post do
    CsvDb.convert_save("comment", params[:dump][:file])
    redirect_to :action => :index, :notice => "CSV imported successfully!"
  end

end
