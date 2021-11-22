const cerdo1= new CerditoconEscudo(resistenciaEscudo=1)
const pared=new ParedDeVidrio(ancho=10)


class Obstaculo{
	method resistencia()
}

class CerditoconEscudo inherits Obstaculo{
	const resistenciaEscudo
	override method resistencia(){
		return 10*resistenciaEscudo
	}
}

class CerditoconCasco inherits Obstaculo{
	const resistenciaCasco
	override method resistencia(){
		return 10*resistenciaCasco
	}
}

object cerditoObrero inherits Obstaculo {
	override method resistencia(){return 50}
}

class Pared inherits Obstaculo{
	const property ancho
	
}




class ParedDeVidrio inherits Pared{
	
	override method resistencia(){
		return 10*ancho
	}
}

class ParedDeMadera inherits Pared{
	
	override method resistencia(){
		return 25*ancho
	}
}

class ParedDePiedra inherits Pared{
	
	override method resistencia(){
		return 50*ancho
	}
}



object islaPajaros{
	var property pajaros=[red,chuck,matilda]
	var property eventos=[manejoIra]
	
	method realizarEvento(evento){
		evento.hacerOcurrirEvento(pajaros)
	}
	
	method aniadirPajaro(unPajaro){
		pajaros.add(unPajaro)
	}
	
	method pajarosMasFuertes(){
		pajaros.filter({unPajaro=>unPajaro.fuerza()>50})
	}
	
	method fuerzaDeLaIsla(){
		pajaros.sum({unPajaro=>unPajaro.fuerza()})
	}
	
	method atacar(unPajaro){
		
	}
}


const pajaroComun1=new PajaroComun(ira=10,obstaculoMasCercano=cerditoObrero)

class Pajaro {
	var property ira
	const property obstaculoMasCercano
	
	method puedeDerribar(){
		return self.fuerza()>obstaculoMasCercano.resistencia()
	}
	
	method fuerza()
	method enojar(){}
	method tranquilizar(){
		ira=ira-5
	}
}

class PajaroComun inherits Pajaro{
	
	override method fuerza(){
		return ira*2
	}
}

object red inherits Pajaro(ira=20,obstaculoMasCercano=cerdo1){
	
	var property cantEnojos=0
	
	override method fuerza(){
		return ira*10*self.cantEnojos()
	}
	
	override method enojar(){
		cantEnojos=cantEnojos+1
	}
}

object bomb inherits Pajaro(ira=30,obstaculoMasCercano=cerdo1){
	override method fuerza(){
		if(self.fuerza()<9000){return ira*2}
		else{return ira}
	}
}

object chuck inherits Pajaro(ira=30,obstaculoMasCercano=cerdo1){
	var property velocidad=100
	
	override method fuerza(){
		if(self.velocidad()<80){return 150}
		else{return 5*(self.velocidad())-80}
	}
	
	override method enojar(){
		velocidad=velocidad*2
	}
	
	override method tranquilizar(){
		ira=ira+0
	}
}

object matilda inherits Pajaro(ira=500,obstaculoMasCercano=cerditoObrero){
	var property huevos=#{}
	
	override method fuerza(){
		return ira*2+huevos.sum({unHuevo=>unHuevo.fuerza()})
	}
	
	override method enojar(){
		huevos.add(huevo1)
	}
	
}

class Huevo {
	const property fuerza
}

const huevo1=new Huevo(fuerza=2)

class Evento {
	method hacerOcurrirEvento(unosPajaros)
}

object manejoIra inherits Evento{
	override method hacerOcurrirEvento(unosPajaros){
		unosPajaros.forEach({unPajaro=>unPajaro.tranquilizar()})
	}
}

object invasionCerditos inherits Evento{
	var cerditos=0
	
	
	override method hacerOcurrirEvento(unosPajaros){
		if(cerditos>100){
		unosPajaros.forEach({unPajaro=>unPajaro.enojar()})
		}
		}
		
	method nuevaInvasion(unosCerditos){
		cerditos=unosCerditos
	}	
		
	}

