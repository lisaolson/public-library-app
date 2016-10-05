class LibrariesController < ApplicationController

  def index
    @libraries = Library.all
  end

  def new
    @library = Library.new
  end

  before_action :logged_in?, only: [:show]

  def create
    @library = Library.create(library_params)
    redirect_to libraries_path
  end

  def show
    @library = Library.find_by_id(params[:id])
  end

  def edit
    library_id = params[:id]
    @library = Library.find_by_id(library_id)
  end

  def update
    library_id = params[:id]
    library = Library.find_by_id(library_id)
    library.update_attributes(library_params)
    redirect_to library_path(library)
  end

  def destroy
    library_id = params[:id]
    library = Library.find_by_id(library_id)
    library.destroy
    redirect_to libraries_path
  end

  private

  def library_params
    params.require(:library).permit(:name, :floor_count, :floor_area)
  end

end
