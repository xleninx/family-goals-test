require 'roo'
class CombinationGenerator
  attr_accessor :xlsx, :family_names, :positions, :worlds, :area

  def initialize(mode: :dummy)
    if mode == :xlsx
      @xlsx = Roo::Spreadsheet.open('./0311_326_definicionfamilias.xlsx').sheet(0)
      set_arrays_by_xlsx
    else
      set_array_by_dummy
    end
  end

  def save_family_goals
    generate_combinations.each do |arr|
      FamilyGoal.create(name: arr[0], position: arr[1], area: arr[2], world: arr[3])
    end
  end

  private

  def set_arrays_by_xlsx
    @family_names = @xlsx.column(1).uniq.compact
    @positions = @xlsx.column(3).uniq.compact
    @areas = @xlsx.column(4).uniq.compact
    @worlds = @xlsx.column(5).uniq.compact
    remove_headers
  end

  def set_array_by_dummy
    @family_names = families_dummy.map {|row| row[0] }.uniq
    @positions = families_dummy.map {|row| row[1] }.uniq
    @areas = families_dummy.map {|row| row[2] }.uniq
    @worlds = families_dummy.map {|row| row[3] }.uniq
  end

  def generate_combinations
      @family_names.product(@positions, @areas, @worlds)
  end

  def families_dummy
    [["EJECUTIVO PERSONAS","EJECUTIVO PERSONAS TRAINEE", "ZONA CENTRO 1", "Banco y Filiales"],
     ["EJECUTIVO SELECT", "EJECUTIVO PERSONAS SENIOR", "ZONA CENTRO 2", "Banco y Filiales"],
     ["AGENTE", "EJECUTIVO PERSONAS JUNIOR", "ZONA CENTRO 3", "Banefe"]]
  end

  def remove_headers
    @family_names.delete_at(0)
    @positions.delete_at(0)
    @areas.delete_at(0)
    @worlds.delete_at(0)
  end
end