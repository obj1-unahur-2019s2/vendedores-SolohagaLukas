import centros.*
import vendedores.*

class Cliente {
	method puedeSerAtendidoPor(vendedor) 
}
class Inseguro inherits Cliente {
	override method puedeSerAtendidoPor(vendedor) {
		return vendedor.esVersatil() and vendedor.esFirme()
	}
}
class Detallista inherits Cliente {
	override method puedeSerAtendidoPor(vendedor) { 
		return vendedor.certSobreProd3().size() > 2
	}
}
class Humanista inherits Cliente {
	override method puedeSerAtendidoPor(vendedor) {
		return vendedor.esPersonaFisica()
	}
}