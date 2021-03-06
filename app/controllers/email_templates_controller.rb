class EmailTemplatesController < ApplicationController
  before_action :set_email_template, only: %i[ show edit update destroy publish take_off]

  # GET /email_templates or /email_templates.json
  def index
    @email_templates = EmailTemplate.all.page(params[:page])
  end

  # GET /email_templates/1 or /email_templates/1.json
  def show
  end

  # GET /email_templates/new
  def new
    @email_template = EmailTemplate.new
  end

  # GET /email_templates/1/edit
  def edit
  end

  # POST /email_templates or /email_templates.json
  def create
    @email_template = EmailTemplate.new(email_template_params)

    respond_to do |format|
      if @email_template.save
        format.html { redirect_to email_template_url(@email_template), notice: "Email template was successfully created." }
        format.json { render :show, status: :created, location: @email_template }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @email_template.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /email_templates/1 or /email_templates/1.json
  def update
    respond_to do |format|
      if @email_template.update(email_template_params)
        format.html { redirect_to email_template_url(@email_template), notice: "Email template was successfully updated." }
        format.json { render :show, status: :ok, location: @email_template }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @email_template.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /email_templates/1 or /email_templates/1.json
  def destroy
    respond_to do |format|
      if @email_template.destroy
        format.html { redirect_to email_templates_url, notice: "Email template was successfully destroyed." }
        format.json { head :no_content }
      else
        format.html { render :show, status: :unprocessable_entity }
        format.json { render json: @email_template.errors, status: :unprocessable_entity }
      end
    end
  end

  def publish
    respond_to do |format|
      if @email_template.publish!
        format.html { redirect_to email_template_url(@email_template), notice: "Email template is online." }
        format.json { render :show, status: :ok, location: @email_template }
      else
        format.html { render :show, status: :unprocessable_entity }
        format.json { render json: @email_template.errors, status: :unprocessable_entity }
      end
    end
  end

  def take_off
    respond_to do |format|
      if @email_template.take_off!
        format.html { redirect_to email_template_url(@email_template), notice: "Email template is offline." }
        format.json { render :show, status: :ok, location: @email_template }
      else
        format.html { render :show, status: :unprocessable_entity }
        format.json { render json: @email_template.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_email_template
      @email_template = EmailTemplate.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def email_template_params
      params.require(:email_template).permit(:name, :email_marketing_category_id, :subject, :content, :send_date)
    end
end
