import React, { useContext } from 'react';
import { ProductsContext } from '../../Context/Context';
import { ROUTES } from '../../util/Routes';


function Cart() {

    const { setRoute} = useContext(ProductsContext);
    setRoute(ROUTES.CART)
    return (
        <main>  
            <h1>Cart</h1>
        </main>
    );
  }
  
  export default Cart;
  