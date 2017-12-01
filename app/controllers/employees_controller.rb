class EmployeesController < ApplicationController
  expose :employees, -> { Employee.all }

  def index
    render json: employees
  end
end
