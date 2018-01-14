class OpinionsController < ApplicationController
  before_action :authenticate_user!, :set_opinion, only: [:show, :edit, :update, :destroy]
  before_action :belongs_to_current_user, only: [:destroy, :edit]
  helper_method :belongs_to_current_user
  
  # GET /opinions
  # GET /opinions.json
  def index
    @opinions = Opinion.all
  end

  # GET /opinions/1
  # GET /opinions/1.json
  def show
  end

  # GET /opinions/new
  def new
    @opinion = Opinion.new
  end

  # GET /opinions/1/edit
  def edit
    if !belongs_to_current_user
      respond_to do |format|
        format.html { redirect_to @opinion, notice: "You're not authorised to do this" }
      end
    end
  end

  # POST /opinions
  # POST /opinions.json
  def create
    if user_signed_in?
      @opinion = Opinion.new({preview:opinion_params[:preview], explanation:opinion_params[:explanation], proof:opinion_params[:proof], user_id: current_user.id})
      # @opinion = Opinion.new(opinion_params)
      # @opinion.user_id = current_user.id
      respond_to do |format|
        if @opinion.save
          format.html { redirect_to @opinion, notice: 'Opinion was successfully created. for the user'}
          format.json { render :show, status: :created, location: @opinion }
        else
          format.html { render :new }
          format.json { render json: @opinion.errors, status: :unprocessable_entity }
        end
      end
    
    end
  end

  # PATCH/PUT /opinions/1
  # PATCH/PUT /opinions/1.json
  def update
    respond_to do |format|
      if @opinion.update(opinion_params)
        format.html { redirect_to @opinion, notice: 'Opinion was successfully updated.' }
        format.json { render :show, status: :ok, location: @opinion }
      else
        format.html { render :edit }
        format.json { render json: @opinion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /opinions/1
  # DELETE /opinions/1.json
  def destroy
    does_it = belongs_to_current_user
    if does_it
      @opinion.destroy

      respond_to do |format|
        format.html { redirect_to opinions_url, notice: 'Opinion was successfully destroyed.' }
        format.json { head :no_content }
      end
      
    end
  end


  def belongs_to_current_user
    current_user.id == @opinion.user_id
  end
  

  private

  
    # Use callbacks to share common setup or constraints between actions.
    def set_opinion
      @opinion = Opinion.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def opinion_params
      params.require(:opinion).permit(:preview, :explanation, :proof, :user_id)
    end
  
    
end
