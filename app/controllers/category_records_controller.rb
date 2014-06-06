class CategoryRecordsController < ApplicationController
  before_action :set_category_record, only: [:show, :edit, :update, :destroy]

  # GET /category_records
  # GET /category_records.json
  def index
    # @search = CategoryRecord.search(params[:search])
    # @category_records = @search.all   # load all matching records
    if params[:category]
      @category_records = CategoryRecord.where(category: params[:category])
    else
      @category_records = CategoryRecord.all
    end
  end

  # GET /category_records/1
  # GET /category_records/1.json
  def show
  end

  # GET /category_records/new
  def new
    @category_record = CategoryRecord.new
  end

  # GET /category_records/1/edit
  def edit
  end

  # POST /category_records
  # POST /category_records.json
  def create
    @category_record = CategoryRecord.new(category_record_params)

    respond_to do |format|
      if @category_record.save
        format.html { redirect_to @category_record, notice: 'Category record was successfully created.' }
        format.json { render :show, status: :created, location: @category_record }
      else
        format.html { render :new }
        format.json { render json: @category_record.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /category_records/1
  # PATCH/PUT /category_records/1.json
  def update
    respond_to do |format|
      if @category_record.update(category_record_params)
        format.html { redirect_to @category_record, notice: 'Category record was successfully updated.' }
        format.json { render :show, status: :ok, location: @category_record }
      else
        format.html { render :edit }
        format.json { render json: @category_record.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /category_records/1
  # DELETE /category_records/1.json
  def destroy
    @category_record.destroy
    respond_to do |format|
      format.html { redirect_to category_records_url, notice: 'Category record was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_category_record
      @category_record = CategoryRecord.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def category_record_params
      params.require(:category_record).permit(:recipient_id, :category)
    end
end
