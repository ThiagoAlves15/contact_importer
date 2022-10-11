class FileUploadsController < ApplicationController
  before_action :set_file_upload, only: %i[ show ]

  # GET /file_uploads
  def index
    @file_upload = FileUpload.new
  end

  # GET /file_uploads/1 or /file_uploads/1.json
  def show
  end

  # POST /file_uploads or /file_uploads.json
  def create
    @file_upload = FileUpload.new
    file = params[:file]

    unless file.content_type == 'text/csv'
      message = 'Use CSV format with ; as separator'
      @file_upload.errors.add(:file, message: message)

      respond_to do |format|
        format.html { render :index, status: :unprocessable_entity, alert: message }
        format.json { render json: @file_upload.errors, status: :unprocessable_entity }
      end
    else
      CsvImportContactsService.new.call(file)

      respond_to do |format|
        if @file_upload.save
          format.html { redirect_to file_upload_url(@file_upload), notice: "File upload was successfully created." }
          format.json { render :show, status: :created, location: @file_upload }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @file_upload.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_file_upload
      @file_upload = FileUpload.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def file_upload_params
      params.permit(:file, :name, :email, :phone, :address, :date_of_birth)
    end
end
