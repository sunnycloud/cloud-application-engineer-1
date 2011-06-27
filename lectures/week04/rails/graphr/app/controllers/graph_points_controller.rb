class GraphPointsController < ApplicationController
  # GET /graph_points
  # GET /graph_points.xml
  # GET /graph_points.json
  def index
    @graph_points = GraphPoint.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @graph_points }
      format.json { render :json => @graph_points }
    end
  end

  # GET /graph_points/1
  # GET /graph_points/1.xml
  # GET /graph_points/1.json
  def show
    @graph_point = GraphPoint.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @graph_point }
      format.json { render :json => @graph_point }
    end
  end

  # GET /graph_points/new
  # GET /graph_points/new.xml
  def new
    @graph_point = GraphPoint.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @graph_point }
    end
  end

  # GET /graph_points/1/edit
  def edit
    @graph_point = GraphPoint.find(params[:id])
  end

  # POST /graph_points
  # POST /graph_points.xml
  # POST /graph_points.json
  def create
    @graph_point = GraphPoint.new(params[:graph_point])

    respond_to do |format|
      if @graph_point.save
        format.html { redirect_to(@graph_point, :notice => 'Graph point was successfully created.') }
        format.xml  { render :xml => @graph_point, :status => :created, :location => @graph_point }
        format.json  { render :json => @graph_point, :status => :created, :location => @graph_point }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @graph_point.errors, :status => :unprocessable_entity }
        format.json  { render :json => @graph_point.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /graph_points/1
  # PUT /graph_points/1.xml
  # PUT /graph_points/1.json
  def update
    @graph_point = GraphPoint.find(params[:id])

    respond_to do |format|
      if @graph_point.update_attributes(params[:graph_point])
        format.html { redirect_to(@graph_point, :notice => 'Graph point was successfully updated.') }
        format.xml  { head :ok }
        format.json { render :json => @graph_point }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @graph_point.errors, :status => :unprocessable_entity }
        format.json  { render :json => @graph_point.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /graph_points/1
  # DELETE /graph_points/1.xml
  # DELETE /graph_points/1.json
  def destroy
    @graph_point = GraphPoint.find(params[:id])
    @graph_point.destroy

    respond_to do |format|
      format.html { redirect_to(graph_points_url) }
      format.xml  { head :ok }
      format.json { render :nothing => true }
    end
  end
end
