class SessionsController < ApplicationController
  before_action :set_session, only: [:show, :update, :destroy]

  # GET /sessions
  # GET /sessions.json
  # GET /sessions
  def index
    @sessions = Session.all
    json_response(@sessions)
  end

  # POST /sessions
  def create
    @session = Session.new(session_params)
    if @session.save
      json_response(@session, :created)
    else
      json_response(@session.errors, :unprocessable_entity)
    end
  end

  # GET /sessions/:id
  def show
    if @session
      json_response(@session)
    else
      json_response('not found', :not_found)
    end
  end

  # PUT /sessions/:id
  def update
    @session.update(session_params)
    head :no_content
  end

  # DELETE /sessions/:id
  def destroy
    @session.destroy
    head :no_content
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_session
      @session = Session.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def session_params
      params.require(:session).permit(:title,:status,:startAt)
    end
end
