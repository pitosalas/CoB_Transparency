RailsAdmin.config do |config|

  ### Popular gems integration

  ## == Devise ==
  # config.authenticate_with do
  #   warden.authenticate! scope: :user
  # end
  # config.current_user_method(&:current_user)

  ## == CancanCan ==
  config.authorize_with :cancancan
  # config.current_user_method { current_user } # refers to the current_user helper method in my case

  ## == Pundit ==
  # config.authorize_with :pundit

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  ## == Gravatar integration ==
  ## To disable Gravatar integration in Navigation Bar set to false
  # config.show_gravatar = true

  # config.main_app_name = ["Cool app", "BackOffice"]
  # or something more dynamic
  # config.main_app_name = Proc.new { |controller| [ "Cool app", "BackOffice - #{controller.params[:action].try(:titleize)}" ] }

  # More at https://github.com/sferik/rails_admin/wiki/Horizontally-scrolling-table-with-frozen-columns-in-list-view
  # Use default horizontal scroll settings of 3 frozen columns (checkboxes, links/actions, ID) with a border on the right:
  config.sidescroll = {num_frozen_columns: 2}

  # Turn off horizontal scrolling for a specific model:
  # config.model 'Feedback' do
  #   list do
  #     sidescroll false
  #   end
  # end

  config.parent_controller = "::ApplicationController"
  config.current_user_method { current_user }

  # REQUIRED:
  # Include the import action
  # See https://github.com/sferik/rails_admin/wiki/Actions
  config.actions do
    # root actions
    dashboard                     # mandatory
    # collection actions 
    index                         # mandatory
    new
    export
    #history_index
    bulk_delete
    # member actions
    show
    edit
    delete
    import
  end

  # configure fields
  config.model 'Sensor' do
    configure :street do
      hide
    end
    import do
      mapping_key_list [:longitude, :latitude]
    end
    list do
      # field :sensor_id do
      #   label "Sensor ID"
      # end
      field :sensor_type do
        label "Sensor Type"
      end
      field :owner do
        label "Owner"
      end
      field :description do
        label "Description"
      end
      field :location do
        label "Location"
      end
      field :longitude do
        label "Longitude"
      end
      field :latitude do
        label "Latitude"
      end
      configure :street do
        hide
      end
    end
  end

  config.model "Administrator" do
    configure :password_digest do
      hide
    end
    configure :remember_digest do
      hide
    end
    configure :activation_digest do
      hide
    end
    configure :reset_digest do
      hide
    end
    list do
      configure :password_digest do
        hide
      end
      configure :remember_digest do
        hide
      end
      configure :activation_digest do
        hide
      end
      configure :reset_digest do
        hide
      end
      configure :reset_sent_at do
        hide
      end
    end
  end

  # Optional:
  # Configure global RailsAdminImport options
  config.configure_with(:import) do |config|
    config.logging = true
  end

  # Optional:
  # Configure model-specific options using standard RailsAdmin DSL
  # See https://github.com/sferik/rails_admin/wiki/Railsadmin-DSL
  # config.model 'User' do
  #   import do
  #     include_all_fields
  #     exclude_fields :secret_token
  #   end
  # end
end
