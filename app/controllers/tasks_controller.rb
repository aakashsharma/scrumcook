class TasksController < ApplicationController
  # GET /tasks/1
  # GET /tasks/1.xml
  def show
    @task = Task.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @task }
    end
  end

  # GET /tasks/new
  # GET /tasks/new.xml
  def new
    @task = Task.new
    @task.workable_item = WorkableItem.find(params[:workable_item])
    @task.created_by = current_user.id

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @task }
    end
  end

  # GET /tasks/1/edit
  def edit
    @task = Task.find(params[:id])
  end

  # POST /tasks
  # POST /tasks.xml
  def create
    @task = Task.new(params[:task])

    respond_to do |format|
      if @task.save
        format.html { redirect_to(workable_item_url(@task.workable_item), :notice => 'Task was successfully created.') }
        format.xml  { render :xml => @task, :status => :created, :location => @task }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @task.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /tasks/1
  # PUT /tasks/1.xml
  def update
    @task = Task.find(params[:id])

    respond_to do |format|
      if @task.update_attributes(params[:task])
        format.html { redirect_to(workable_item_url(@task.workable_item), :notice => 'Task was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @task.errors, :status => :unprocessable_entity }
      end
    end
  end

  def finish
    @task = Task.find(params[:id])

    respond_to do |format|
      if @task.finish!
        format.html { redirect_to(workable_item_url(@task.workable_item), :notice => 'Task was successfully finished.') }
        format.xml  { head :ok }
      else
        format.html { redirect_to(workable_item_url(@task.workable_item), :notice => 'Error finishing the task.') }
        format.xml  { render :xml => @task.errors, :status => :unprocessable_entity }
      end
    end
  end

  def start
    @task = Task.find(params[:id])

    respond_to do |format|
      if @task.start!
        format.html { redirect_to(workable_item_url(@task.workable_item), :notice => 'Task was successfully started.') }
        format.xml  { head :ok }
      else
        format.html { redirect_to(workable_item_url(@task.workable_item), :notice => 'Error starting the task.') }
        format.xml  { render :xml => @task.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /tasks/1
  # DELETE /tasks/1.xml
  def destroy
    @task = Task.find(params[:id])
    workable_item  = @task.workable_item
    @task.destroy

    respond_to do |format|
      format.html { redirect_to(workable_item_url(workable_item), :notice => 'Task was successfully deleted.') }
      format.xml  { head :ok }
    end
  end
end
