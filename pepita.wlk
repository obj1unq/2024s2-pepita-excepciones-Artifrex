object pepita {

	var energia = 100
	
	method comer(comida) {
		energia = energia + comida.energiaQueAporta()
	}
	
	method volar(distancia) {
		self.puedeVolar(distancia)
		energia = energia - self.energiaNecesaria(distancia)
	}
		
	method energia() {
		return energia
	}	

	method puedeVolar(distancia) {
		return energia >= self.energiaNecesaria(distancia)
	}

	method energiaNecesaria(distancia) {
		return  10 + distancia
	}
}

object alpiste {
	method energiaQueAporta() {
		return 20
	}
}

object manzana {
	var madurez = 1
	const base = 5
	
	method madurez() {
		return madurez
	}
	
	method madurez(_madurez) {
		madurez = _madurez
	}
	
	method madurar() {
		self.madurez(madurez + 1)
	}
	
	method energiaQueAporta() {
		return base * madurez
	}
	
}

object pepon {
	var energia = 30
	
	method energia() {
		return energia
	}
		
	method comer(comida) {
		energia += comida.energiaQueAporta() / 2
	}
		
	method volar(distancia) {
		self.puedeVolar(distancia)
		energia = energia - self.energiaNecesaria(distancia)
	}

	method puedeVolar(distancia) {
		return energia >= self.energiaNecesaria(distancia)
	}
	method energiaNecesaria(distancia) {
              return 20 + 2*distancia
        }
}

object roque {
	var ave = pepita
	var cenas = 0
	
	method ave(_ave) {
		ave = _ave
		cenas = 0
	}
	
	method alimentar(alimento) {
		ave.comer(alimento)
		cenas = cenas + 1
	}
}

object milena {
	const property aves = #{}

	method entrenarAve(ave) {
		aves.add(ave)
	}

	method movilizar(distancia) {
		self.validarMovilizar(distancia)
		aves.forEach({ave => ave.volar(distancia)}) }
	}

	method validarMovilizar(distancia) {
		if (not self.puedeMovilizar(distancia)) {
                           self.error("Una de las aves no tiene suficiente energia para movilizarse") 
                       }
	}

        method puedeMovilizar(distancia){
               return aves.all({ave => ave.puedeVolar(distancia)})
        }
}

