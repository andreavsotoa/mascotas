class Visitante < ActiveRecord::Base
	has_no_table

attr_accessor :email, :string

 validates_presence_of :email
 validates_format_of :email, :with => /\A[-a-z0-9_+\.]+\@([-a-z0-9]+\.)+[a-z0-9]{2,4}\z/i

#column :nombre, :string

def nombre
    nombre = "Andrea Soto"
end


def fechacumple
    $fechacumple= Date.new(1993, 10, 15)
end

def conteo
  Rails.logger.debug 'DEBUG: Entrando en el método conteo del modelo de visitante'

  hoy= Date.today
  $fechacumple= Date.new(hoy.year, $fechacumple.month, $fechacumple.day)
  if $fechacumple > hoy
    conteo = ($fechacumple - hoy).to_i
  else
    conteo = ($fechacumple.next_year - hoy).to_i
  end
end

end
