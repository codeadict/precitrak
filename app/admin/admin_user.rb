ActiveAdmin.register User do
  permit_params :email, :password, :password_confirmation, :approved
  menu label: "User Accounts", parent: "Configuration"

  index do
    selectable_column
    id_column
    column :email
    column :approved
    column :current_sign_in_at
    column :sign_in_count
    column :created_at
    actions defaults: false do |c|
      item 'Show', admin_user_path(c.id)
      span '  |  '
      item 'Edit', edit_admin_user_path(c.id)
      span '  |  '
      item 'User Pins', admin_user_pins_path(c.id)
    end
  end

  filter :email
  filter :current_sign_in_at
  filter :sign_in_count
  filter :created_at

  form do |f|
    f.inputs "User Details" do
      f.input :email
      f.input :approved
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end

  member_action :approve_user, method: :post do
    user = User.find(params[:id])
    if !user.approved?
      user.approved = true
      user.save!
      flash[:notice] = "User has been approved successfully"
      redirect_to admin_user_path(id: user.id)
    end
  end

  action_item only: :show do
    link_to 'Approve User', approve_user_admin_user_path(user), :method => :post if !user.approved?
  end

end

ActiveAdmin.register Pin do
  permit_params :sim_number, :user_id
  belongs_to :user
  navigation_menu :user
end
