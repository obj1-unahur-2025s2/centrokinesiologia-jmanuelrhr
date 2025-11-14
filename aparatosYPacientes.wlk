class Paciente{
    const property edad
    var property fortalezaMuscular
    var property nivelDeDolor

    method puedeUsar(unAparato) = unAparato.puedeSerUsadoPor(self)

    method disminuirNivelDeDolorEn(unaCantidad){
        nivelDeDolor -= unaCantidad 
    }

    method aumentarFortalezaMuscuarEn(unaCantidad){
        fortalezaMuscular += unaCantidad
    }

    method usar(unAparato){
        if(unAparato.puedeSerUsadoPor(self)){
          unAparato.usarse(self)
        }
    }

}

class Aparato{
    method puedeSerUsadoPor(unPaciente) = true

    method disminuirNivelDeDolorDe(unPaciente)

    method usarse(unPaciente)
}

class Magneto inherits Aparato{
    override method disminuirNivelDeDolorDe(unPaciente){
        unPaciente.disminuirNivelDeDolorEn(unPaciente.nivelDeDolor()*0.1)
    }

    override method usarse(unPaciente){
       self.disminuirNivelDeDolorDe(unPaciente)
    }
}

class Bicicleta inherits Aparato{
    override method puedeSerUsadoPor(unPaciente) = unPaciente.edad() > 8

    override method disminuirNivelDeDolorDe(unPaciente){
      unPaciente.disminuirNivelDeDolorEn(4)
    }

    method aumentarFortalezaDe(unPaciente) { 
        unPaciente.aumentarFortalezaMuscuarEn(3)
    }

    override method usarse(unPaciente){
       self.disminuirNivelDeDolorDe(unPaciente)
       self.aumentarFortalezaDe(unPaciente)
    }
}

class Minitramp{
    method puedeSerUsadoPor(unPaciente) = unPaciente.nivelDeDolor() < 20

    method aumentarFortalezaDe(unPaciente){
        unPaciente.aumentarFortalezaMuscuarEn(unPaciente.fortalezaMuscular() * 0.1)
    }

    method usarse(unPaciente){
       self.aumentarFortalezaDe(unPaciente) 
    }
}

const leonardo = new Paciente(edad=40, fortalezaMuscular=20, nivelDeDolor=10)
const milena = new Paciente(edad=3, fortalezaMuscular=50, nivelDeDolor=30)

const magneto1 = new Magneto()
const bici1 = new Bicicleta()
const minitramp1 = new Minitramp()