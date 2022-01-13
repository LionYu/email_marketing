class EmailMarketingCategoriesController < ApplicationController
  before_action :set_email_marketing_category, only: %i[ show edit update destroy ]

  # GET /email_marketing_categories or /email_marketing_categories.json
  def index
    @email_marketing_categories = EmailMarketingCategory.all.page(params[:page])
  end

  # GET /email_marketing_categories/1 or /email_marketing_categories/1.json
  def show
  end

  # GET /email_marketing_categories/new
  def new
    @email_marketing_category = EmailMarketingCategory.new
  end

  # GET /email_marketing_categories/1/edit
  def edit
  end

  # POST /email_marketing_categories or /email_marketing_categories.json
  def create
    @email_marketing_category = EmailMarketingCategory.new(email_marketing_category_params)

    respond_to do |format|
      if @email_marketing_category.save
        format.html { redirect_to email_marketing_category_url(@email_marketing_category), notice: "Email marketing category was successfully created." }
        format.json { render :show, status: :created, location: @email_marketing_category }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @email_marketing_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /email_marketing_categories/1 or /email_marketing_categories/1.json
  def update
    respond_to do |format|
      if @email_marketing_category.update(email_marketing_category_params)
        format.html { redirect_to email_marketing_category_url(@email_marketing_category), notice: "Email marketing category was successfully updated." }
        format.json { render :show, status: :ok, location: @email_marketing_category }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @email_marketing_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /email_marketing_categories/1 or /email_marketing_categories/1.json
  def destroy
    @email_marketing_category.destroy

    respond_to do |format|
      format.html { redirect_to email_marketing_categories_url, notice: "Email marketing category was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_email_marketing_category
      @email_marketing_category = EmailMarketingCategory.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def email_marketing_category_params
      params.require(:email_marketing_category).permit(:name)
    end
end
