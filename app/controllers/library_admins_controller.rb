class LibraryAdminsController < ApplicationController
  before_action :authorize_request, except: :create
  before_action :find_library_admin, except: %i[create index]

  def index
    @library_admins = LibraryAdmin.all
    render json: @library_admins, status: :ok
  end

  def show
    render json: @library_admin, status: :ok
  end

  def create
    @library_admin = LibraryAdmin.new(library_admin_params)
    if @library_admin.save
      render json: @library_admin, status: :created
    else
      render json: { errors: @library_admin.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  def update
    unless @library_admin.update(library_admin_params)
      render json: { errors: @library_admin.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  def destroy
    @library_admin.destroy
  end

  private

  def find_library_admin
    @library_admin = LibraryAdmin.find_by_username!(params[:_username])
    rescue ActiveRecord::RecordNotFound
      render json: { errors: 'Not found' }, status: :not_found
  end

  def library_admin_params
    params.permit(
      :avatar, :name, :username, :email, :password, :password_confirmation
    )
  end
end