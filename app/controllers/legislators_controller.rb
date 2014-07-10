class LegislatorsController < ActionController::Base

  def home
  end

  def index
    #legis.legislator.find_by_state(state: )
  end

  def show
    @legislator = Legislator.find(params[:id])
  end

  def search
    # create a query hash from the form input
    query = {state: params[:state], name: params[:name]}

    @legislators = Legislator.search_for(query)
    render :index
  end

private

  def legislator_params
    params.require(:legislator).permit(:id, :title, :firstname,:lastname, :party, :state, :state_name, :bioguide_id, :crp_id)
  end

end

