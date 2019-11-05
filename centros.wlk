import vendedores.*
import clientes.*

class Centro {
	var property ciudad
	var property vendedores = [] 
	
	method agregarVendedor(vendedor) {
		if (vendedores.contains(vendedor)) {
			self.error("ya esta agregado")
		} 
		else {
			vendedores.add(vendedor)
		}
	}
	method vendedorEstrella() {
		return vendedores.max({v => v.puntosDeCertificaciones()})
	}
	method vendedoresGenericos() {
		return vendedores.filter({ v => v.esGenerico() })
	}
	method esRobusto() {
		var vendedoresFirmes = vendedores.filter({v=>v.esFirme()})
		return vendedoresFirmes > 2
	}
	method puedeCubrir(city) {
		return vendedores.any({v => v.puedeTrabajarEn(city)})
	}
	method repartirCertificacion(certifica2) {
		vendedores.forEach({v => v.agregar(certifica2)})
	}
	method esCandidato(vende) {
		return vende.esVersatil() and vende.tieneAfinidad(self)
	}
}
