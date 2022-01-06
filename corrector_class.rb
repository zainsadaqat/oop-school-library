class Corrector
  def correct_name(name)
    name.split(name[9]) if name[0].upcase.eql?(name[0]) && (name.length > 10)
  end
end
