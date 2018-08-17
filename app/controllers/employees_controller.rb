class EmployeesController < ApplicationController


  def create
    company = Company.find(params["employee"]["company_id"])
    new_employee = Employee.create(employee_params)
    redirect_to company_path(company)
  end

  def destroy
    company = Company.find(params["company_id"])
    Employee.find(params[:id]).destroy
    redirect_to company_path(company)
  end

  private

  def employee_params
    params.require(:employee).permit(:name, :title, :company_id, :office_id)
  end

end
