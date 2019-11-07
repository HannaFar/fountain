class JobsController < ApplicationController
  before_action :find_job, only: [:show, :edit, :update, :destroy]

  def index
    @jobs = Job.all
  end

  def show
    @applied = current_candidate.jobs.include?(@job)
  end

  def new
    @job = Job.new
  end

  def create
    @job = Job.new(job_params)
    if current_employer
      @job.employer_id = current_employer.id
    end
      if @job.save
        redirect_to @job
      else
        render ‘new’
      end
  end

  def edit
  end

  def update
    if @job.update(job_params)
      redirect_to @job
    else
      render ‘edit’
    end
  end

  def apply
    @job = find_job
    # TODO : Add apply_to_job in apply and make it a simple apply button
  end

  def apply_to_job
    @job = find_job
    if current_candidate
      if current_candidate.jobs.include?(@job)
        puts 'already applied'
        redirect_to job_path(@job)
      else
        current_candidate.jobs.push(@job)
        redirect_to job_path(@job)
      end
    end
  end

  def destroy
    @job.destroy
    redirect_to jobs_path
  end

  private
    def job_params
       params.require(:job).permit(:title, :description, :employer_id)
    end
    def find_job
         @job = Job.find(params[:id])
    end
end
