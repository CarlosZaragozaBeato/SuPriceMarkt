import { Producto } from "../../../model/Producto"



function ProductsItem(item:typeProducts){
    


    return (
        <div className="product_item">
            <div className="product_item_header">
                <img src={item.producto.image} alt={item.producto.nombre}/>
                <div>
                    <h3>{item.producto.nombre}</h3>
                    <p>{item.producto.precio}</p>
                </div>
            </div>

            <button>Añadir</button>
        </div>

    )
}

export interface typeProducts {
    supermercado:string,
    producto: Producto,
  }

export default ProductsItem