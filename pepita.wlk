object pepita {

	var energia = 100
	
	method comer(comida) {
		energia = energia + comida.energiaQueAporta()
	}
	
	method volar(distancia) {
		self.puedeVolar(distancia)
		energia = energia - 10 - distancia
	}
		
	method energia() {
		return energia
	}	

	method puedeVolar(distancia) {
		return energia > self.energiaAGastar(distancia)
	}

	method energiaAGastar(distancia) {
		return energia - 10 - distancia
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
		energia += energia + comida.energiaQueAporta() / 2
	}
		
	method volar(distancia) {
		self.puedeVolar(distancia)
		energia = energia - 20 - 2*distancia
	}

	method puedeVolar(distancia) {
		return energia > self.energiaAGastar(distancia)
	}

	method energiaAGastar(distancia) {
		return energia - 20 - 2 * distancia //MAL PERO NO ME DOY CUENTA COMO HACERLO
	}
	
}

object roque {
	var ave = pepita
	var cenas = 0;
	
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
		if (not self.puedeMovilizar(distancia)) {
			self.error("Una de las aves no tiene suficiente energia para movilizarse" )
		} else {
		aves.forEach({ave => ave.volar(distancia)}) }
	}

	method puedeMovilizar(distancia) {
		return aves.all({ave => ave.puedeVolar(distancia)})
	}
}

