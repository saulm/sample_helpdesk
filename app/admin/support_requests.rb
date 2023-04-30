ActiveAdmin.register SupportRequest do
  permit_params :status, :response, :admin_user_id
  actions :index, :edit, :update

  ## Forms

  form do |f|
    f.semantic_errors # shows errors on :base
    f.inputs 'Details' do
      f.input :name, :input_html => { :readonly => true }
      f.input :email, :input_html => { :readonly => true }
      f.input :description, :input_html => { :readonly => true }
      f.input :status, :input_html => { :readonly => true }
    end

    if f.object.in_progress?
      f.inputs 'Resolution' do
        f.input :response, :required => true
      end
      f.actions         # adds the 'Submit' and 'Cancel' buttons
    end
  end


  ## Custom Actions

  member_action :assign_to_me, method: :post do
    resource.update!(admin_user: current_admin_user, status: "in progress")
    redirect_to edit_resource_path, notice: "Assigned!"
  end

  action_item :assign_to_me, only: :edit do
    button_to 'Assign to me', assign_to_me_admin_support_request_path(resource) if resource.is_new?
  end

  ## Filters

  filter :admin_user
  filter :status, as: :check_boxes, collection: SupportRequest::VALID_STATUSES.map{|x|[x.capitalize, x]}, :input_html => { :readonly => true }
  filter :name
  filter :email
  filter :created_at
  filter :updated_at
end
