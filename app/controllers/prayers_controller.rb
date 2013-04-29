class PrayersController < ApplicationController
  before_filter :signed_in_user, only: [:create, :destroy]
  before_filter :correct_user,   only: :destroy
  # GET /prayers
  # GET /prayers.json
  def index
    @prayers = Prayer.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @prayers }
    end
  end

  # GET /prayers/1
  # GET /prayers/1.json
  def show
    @prayer = Prayer.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @prayer }
    end
  end

  # GET /prayers/new
  # GET /prayers/new.json
  def new
    @prayer = Prayer.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @prayer }
    end
  end

  # GET /prayers/1/edit
  def edit
    @prayer = Prayer.find(params[:id])
  end

  # POST /prayers
  # POST /prayers.json
  def create
    @prayer = current_user.prayers.build(params[:prayer])

    respond_to do |format|
      if @prayer.save
        flash[:success] = "Prayer created!"
        format.html { redirect_to root_url, notice: 'Prayer was successfully created.' }
        format.json { render json: @prayer, status: :created, location: @prayer }
      else
        @feed_items = []
        format.html { render action: "static_pages/home" }
        format.json { render json: @prayer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /prayers/1
  # PUT /prayers/1.json
  def update
    @prayer = Prayer.find(params[:id])

    respond_to do |format|
      if @prayer.update_attributes(params[:prayer])
        format.html { redirect_to @prayer, notice: 'Prayer was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @prayer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /prayers/1
  # DELETE /prayers/1.json
  def destroy
    @prayer = Prayer.find(params[:id])
    @prayer.destroy

    respond_to do |format|
      format.html { redirect_to prayers_url }
      format.json { head :no_content }
    end
  end

  private

    def correct_user
      @prayer = current_user.prayers.find_by_id(params[:id])
      redirect_to root_url if @prayer.nil?
    end  
end
