class OnlineSchoolsController < ApplicationController

  def index
    @onlineschools = OnlineSchool.all
  end

  def new
    @online_school = OnlineSchool.new
  end

  def create
    new_onlineschool = OnlineSchool.create(params[:online_school])
    redirect_to "/online_schools"
  end

  def show
    @onlineschool = OnlineSchool.find(params[:id])
  end

end
