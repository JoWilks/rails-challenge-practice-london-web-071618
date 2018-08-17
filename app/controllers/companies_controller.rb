class CompaniesController < ApplicationController

  def show
    @company = Company.find(params[:id])
    @employee = Employee.new
  end

  def index
    @companies = Company.all
  end

  def new
    @company = Company.new
    @buildings = Building.all
  end

  def create
    company = Company.create(company_params)
    company.mult_offices(params["building"])
    company.save
    redirect_to company_path(company)
  end

  private

  def company_params
    params.require(:company).permit(:name)
  end

end
