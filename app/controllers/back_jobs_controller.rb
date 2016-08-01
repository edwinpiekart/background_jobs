class BackJobsController < ApplicationController
  before_action :set_back_job, only: [:show, :edit, :update, :destroy]

  # GET /back_jobs
  # GET /back_jobs.json
  def index
    @back_jobs = BackJob.all
  end

  # GET /back_jobs/1
  # GET /back_jobs/1.json
  def show
  end

  # GET /back_jobs/new
  def new
    @back_job = BackJob.new
  end

  # GET /back_jobs/1/edit
  def edit
  end

  # POST /back_jobs
  # POST /back_jobs.json
  def create
    @back_job = BackJob.new(back_job_params)

    respond_to do |format|
      if @back_job.save
        PerformIn.new({time: 0, retries: @back_job.retries}).perform(BackJobSaver, @back_job.id)

        format.html { redirect_to @back_job, notice: 'Back job was successfully created.' }
        format.json { render :show, status: :created, location: @back_job }
      else
        format.html { render :new }
        format.json { render json: @back_job.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /back_jobs/1
  # PATCH/PUT /back_jobs/1.json
  def update
    respond_to do |format|
      if @back_job.update(back_job_params)
        PerformIn.new({time: 0, retries: @back_job.retries}).perform(BackJobSaver, @back_job.id)

        format.html { redirect_to @back_job, notice: 'Back job was successfully updated.' }
        format.json { render :show, status: :ok, location: @back_job }
      else
        format.html { render :edit }
        format.json { render json: @back_job.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /back_jobs/1
  # DELETE /back_jobs/1.json
  def destroy
    @back_job.destroy
    respond_to do |format|
      format.html { redirect_to back_jobs_url, notice: 'Back job was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_back_job
    @back_job = BackJob.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def back_job_params
    params.require(:back_job).permit(:uri_str, :json_params, :retries, :exceptions)
  end

end
