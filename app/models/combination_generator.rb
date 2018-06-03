require 'roo'
class CombinationGenerator
  attr_accessor :xlsx, :family_names, :positions, :areas, :worlds

  def initialize
    @xlsx = Roo::Spreadsheet.open('./0311_326_definicionfamilias.xlsx').sheet(0)
    set_arrays
  end

  def save_family_goals
    generate_combinations
  end

  private

  def set_arrays
    @family_names = @xlsx.column(1)
    @positions = @xlsx.column(3)
    @areas = @xlsx.column(4)
    @worls = @xlsx.column(5)
  end

  def generate_combinations
      @family_names.product(@positions, @areas, @worlds)
  end
end