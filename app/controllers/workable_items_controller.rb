class WorkableItemsController < ApplicationController


  # PUT /workable_items/1
  # PUT /workable_items/1.xml
  def update
    if params[:commit] == 'Delete'
      destroy
    else
      @workable_item = WorkableItem.find(params[:id])
      @workable_item.type = params[@workable_item.type.downcase][:type]

      respond_to do |format|
        if @workable_item.update_attributes!(params[@workable_item.type.downcase])
          format.html { redirect_to(project_url(@workable_item.project), :notice => @workable_item.type + ' was successfully updated.') }
          format.xml { head :ok }
        else
          format.html { render :action => "edit" }
          format.xml { render :xml => @workable_item.errors, :status => :unprocessable_entity }
        end
      end
    end
  end

  def start
    @workable_item = WorkableItem.find(params[:id])

    respond_to do |format|
      if @workable_item.start!
        format.html { redirect_to(project_url(@workable_item.project), :notice => @workable_item.type + ' was successfully started.') }
        format.xml { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml { render :xml => @workable_item.errors, :status => :unprocessable_entity }
      end
    end
  end

  def estimate
    @workable_item = WorkableItem.find(params[:id])

    respond_to do |format|
      if @workable_item.update_attributes(:estimate => params[:estimate])
        format.html { redirect_to(project_url(@workable_item.project), :notice => @workable_item.type + ' was successfully estimated as a ' + params[:estimate] +" pointer.") }
        format.xml { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml { render :xml => @workable_item.errors, :status => :unprocessable_entity }
      end
    end
  end

  def finish
    @workable_item = WorkableItem.find(params[:id])

    respond_to do |format|
      if @workable_item.finish!
        format.html { redirect_to(project_url(@workable_item.project), :notice => @workable_item.type + ' was successfully finished.') }
        format.xml { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml { render :xml => @workable_item.errors, :status => :unprocessable_entity }
      end
    end
  end

  def deliver
    @workable_item = WorkableItem.find(params[:id])

    respond_to do |format|
      if @workable_item.deliver!
        format.html { redirect_to(project_url(@workable_item.project), :notice => @workable_item.type + ' was successfully delivered.') }
        format.xml { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml { render :xml => @workable_item.errors, :status => :unprocessable_entity }
      end
    end
  end

  def accept
    @workable_item = WorkableItem.find(params[:id])

    respond_to do |format|
      if @workable_item.accept!
        format.html { redirect_to(project_url(@workable_item.project), :notice => @workable_item.type + ' was successfully accepted.') }
        format.xml { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml { render :xml => @workable_item.errors, :status => :unprocessable_entity }
      end
    end
  end

  def reject
    @workable_item = WorkableItem.find(params[:id])

    respond_to do |format|
      if @workable_item.reject!
        format.html { redirect_to(project_url(@workable_item.project), :notice => @workable_item.type + ' was rejected.') }
        format.xml { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml { render :xml => @workable_item.errors, :status => :unprocessable_entity }
      end
    end
  end

  def restart
    @workable_item = WorkableItem.find(params[:id])

    respond_to do |format|
      if @workable_item.restart!
        format.html { redirect_to(project_url(@workable_item.project), :notice => @workable_item.type + ' was successfully restarted.') }
        format.xml { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml { render :xml => @workable_item.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /workable_items/1
  # DELETE /workable_items/1.xml
  def destroy
    @workable_item = WorkableItem.find(params[:id])
    project = @workable_item.project
    @workable_item.destroy

    respond_to do |format|
      format.html { redirect_to(project_url(project), :notice => @workable_item.type + ' was successfully deleted.') }
      format.xml { head :ok }
    end
  end
end
