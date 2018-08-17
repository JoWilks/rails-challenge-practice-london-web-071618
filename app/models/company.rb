class Company < ApplicationRecord
  has_many :offices
  has_many :employees


  def mult_offices(hash)
    hash.each{|building_id, floor_array|
        floor_array.each{|floor_num|
          Office.create(floor: floor_num, building_id: building_id, company_id: self.id)}}
  end

  def buildings
    self.offices.map{|office| office.building}.uniq
  end

  def floors
    self.buildings.map{|building| building.number_of_floors_available}
  end

  def total_rent
    hash = {}
    self.offices.each {|office| hash[office.building.rent_per_floor] == nil ? hash[office.building.rent_per_floor] = 1 : hash[office.building.rent_per_floor] += 1}
    hash.collect{|rent_floor, num_floors| rent_floor * num_floors}.reduce(:+)
  end

end
