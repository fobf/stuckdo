class TasksController < ApplicationController
  #before_action :authenticate_user!
  before_action :set_task, only: [:show, :edit, :update, :destroy, :change]

  # GET /tasks
  # GET /tasks.json
   #@to_do = current_user.tasks.where(state: "to_do")
    #@doing = current_user.tasks.where(state: "doing")
    #@done = current_user.tasks.where(state: "done")
  def index
    @to_do = Task.where(state: "to_do").order(created_at: :desc)
    @doing = Task.where(state: "doing").order(created_at: :desc)
    @done = Task.where(state: "done").order(created_at: :desc)
  end

  # GET /tasks/1
  # GET /tasks/1.json
  def show
  end

  # GET /tasks/new
  def new
    @task = Task.new
  end

  # GET /tasks/1/edit
  def edit
  end

  # POST /tasks
  # POST /tasks.json
  #@task = current_user.tasks.new(task_params)
  def create
   @task =Task.new(task_params)

    respond_to do |format|
      if @task.save
        format.html { redirect_to tasks_url, notice: 'Task was successfully created.' }
        format.json { render :show, status: :created, location: @task }
      else
        format.html { render :new }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tasks/1
  # PATCH/PUT /tasks/1.json
  def update
    respond_to do |format|
      if @task.update(task_params)
        format.html { redirect_to tasks_url, notice: 'Task was successfully updated.' }
        format.json { render :show, status: :ok, location: @task }
      else
        format.html { render :edit }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tasks/1
  # DELETE /tasks/1.json
  def destroy
    @task.destroy
    respond_to do |format|
      format.html { redirect_to tasks_path, notice: 'Task was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
  
  def change
    @task.update_attributes(state: params[:state])
    respond_to do |format|
      format.html {redirect_to tasks_path, notice: "Task updated"}
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = Task.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def task_params
      params.require(:task).permit(:content, :state)
    end
end
