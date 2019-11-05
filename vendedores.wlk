import centros.*
import clientes.*

class Vendedor {
	var property certificaciones = []
	
	method agregar(certificacion) {
		certificaciones.add(certificacion)
	}
	method quitar(certificacion) {
		certificaciones.remove(certificacion)
	}
	method esVersatil() {
		return certificaciones.size() >= 3 
		and certificaciones.any({c => c.sobreProducto()}) 
		and self.esGenerico()
	}
	method puntosDeCertificaciones() {
		return certificaciones.sum({c => c.puntos()})
	}
	method esFirme() {
		return self.puntosDeCertificaciones() >= 30
	}
	method esGenerico() {
		return certificaciones.any({c=> not c.sobreProducto()})
	}
	method puedeTrabajarEn(ciudad)
	method tieneAfinidad(centro) {
		return self.puedeTrabajarEn(centro.ciudad())
	}
	method certSobreProd3() {
		return certificaciones.filter({ c => c.sobreProducto() })
	}
	method esPersonaFisica()
}

class Fijo inherits Vendedor {
	var property ciudadVive
	override method puedeTrabajarEn(ciudad) {
		return ciudad == ciudadVive
	}
	method esInfluyente() { return false }
	override method esPersonaFisica() { return true }
}

class Viajante inherits Vendedor {
	var property provincias = #{}
	
	method agregarProv(provincia) {
		provincias.add(provincia)
	}
	override method puedeTrabajarEn(ciudad) {
		return provincias.any({p => p == ciudad.provincia()})
	}
	method esInfluyente() {
		return provincias.sum({p => p.poblacion()}) >= 10000000
	}
	override method esPersonaFisica() { return true }
}

class Comercio inherits Vendedor {
	var property ciudades = #{}
	
	method agregarCity(ciudad) {
		ciudades.add(ciudad)
	}
	override method puedeTrabajarEn(ciudad) {
		return ciudades.contains(ciudad)
	}
	method provincias() {
		return ciudades.map({c => c.provincia()}).asSet()
	}
	method esInfluyente() {
		return ciudades.size() > 4 or self.provincias().size() > 2
	}
	override method tieneAfinidad(centro) {
		return super(centro)
		and ciudades.any({ c => c != centro.ciudad() })
	}
	override method esPersonaFisica() { return false }
}

class Provincia {
	var property poblacion
}
class Ciudad  {
	 var property provincia
}

class Certificacion {
	var property puntos 
	var property sobreProducto = false
}