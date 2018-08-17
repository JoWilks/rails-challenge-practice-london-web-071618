class Building < ApplicationRecord
  has_many :offices

  validates :name, :country, :address, presence: true
  validates :rent_per_floor, numericality: true
  validates :number_of_floors, numericality: { only_integer: true }


  def number_of_floors_available
    # Will not work until relationships and schema are corretly setup

    all_floors = Array(1..self.number_of_floors)
    self.offices.each do |office|
      all_floors.delete(office.floor)
    end
    all_floors
  end

  def empty_offices
    number_of_floors_available.map { |f| offices.build(floor: f) }
  end

  def companies
    self.offices.map {|office| office.company }.uniq
  end

  def total_rent
    (self.companies.count)*(self.rent_per_floor)
  end

  def number_employees
    array = []
    self.companies.each{|company|
      company.offices.each {|office|
        if office.building == self
          array << office.employees.count
        end
        }}
    array.reduce(:+)
  end

end
