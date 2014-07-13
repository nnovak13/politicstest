class LegislatorsController < ApplicationController

  def home
  end

  def index
  end

  def show
    @legislator = Legislator.find(params[:id])

    if !@legislator.contributions.present?
      @legislator.collect_contribution_info("sector")
      @legislator.collect_contribution_info("industry")
    end

  end

  def search
    # create a query hash from the form input
    query = {state: params[:state], name: params[:name]}

    @legislators = []
    if !query[:name].empty?
      legis_found = Legislator.where(lastname: query[:name])
      @legislators = legis_found unless legis_found.nil?


    elsif !query[:state].empty?
      legis_found = Legislator.where(state: query[:state])
      @legislators = legis_found unless legis_found.nil?
    end

    render :index
  end

private

  def legislator_params
    params.require(:legislator).permit(:id, :title, :firstname,:lastname, :party, :state, :state_name, :bioguide_id, :crp_id)
  end

end

