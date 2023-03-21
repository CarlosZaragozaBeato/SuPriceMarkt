import React,{useState} from 'react';
import { BrowserRouter as Router, Route, Routes } from "react-router-dom";
import { ProductsContext, tipos } from './Context/Context';
import Home from './pages/Home/Home';
import { ROUTES } from './util/Routes';
import HomeImage from './static/images/home.png'
import CestaImage from './static/images/cesta.png'
import NavBar from './pages/Components/NavBar/NavBar';
import Cart from './pages/Cart/Cart';

function App() {
  const [route, setRoute] = useState<string>(ROUTES.HOME)

  let valores:tipos ={
    route:route,
    setRoute:setRoute
} 

  return (
    <>
      <Router>

        <ProductsContext.Provider value={valores}>
          <NavBar/>

          
          <Routes>
            <Route path={ROUTES.HOME} element={<Home/>}/>
            <Route path={ROUTES.CART} element={<Cart/>}/>
          </Routes>

          </ProductsContext.Provider>
      </Router>
    
    
    </>
  );
}
export default App;

export interface typeCards {
  nombre:string,
  route: string,
  image: string,
  color:string
}

export let cards:typeCards[] = [
    
  {
    nombre:"HOME",
    route:ROUTES.HOME,
    image:HomeImage,
    color:'#FFC4C4'
  },
  {
    nombre:"CART",
    route:ROUTES.CART,
    image: CestaImage,
    color:'#DFF6FF'
  }     
]
