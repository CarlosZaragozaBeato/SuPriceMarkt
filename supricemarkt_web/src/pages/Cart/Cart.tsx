import React, { useContext } from 'react';
import { ProductsContext } from '../../Context/Context';
import { ROUTES } from '../../util/Routes';
import ProductChar from './ProductChart';
import './Cart.css'

function Cart() {

    const { setRoute, listaProducts} = useContext(ProductsContext);
    setRoute(ROUTES.CART)
    return (
        <main className='main_cart'>  
            <h1>Cart</h1>


            {listaProducts.map((item)=>(
                <ProductChar image={item.image}
                            nombre={item.nombre}
                            precio={item.precio}/>
            ))}


        </main>
    );
  }
  
  export default Cart;
  