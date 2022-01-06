class Corrector
  def correct_name(name)
    if(name[0].upcase === name[0])
      if(name.length > 10)
        name = name.split(name[9])
      end
    end
  end
end