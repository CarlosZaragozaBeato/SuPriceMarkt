import {useContext} from 'react';
import { Link } from 'react-router-dom';
import { cards } from '../../../App';
import { ProductsContext } from '../../../Context/Context';
import { ROUTES } from '../../../util/Routes';
import NavBarItem from './NavBarItem';


function NavBar() {

    const { route } = useContext(ProductsContext);



    return (
        <nav className={`nav_styles ${route===ROUTES.HOME?`nav`:`nav_extra`}`}>
            <div  className='navbar'>            
  
                <div className='nav_extra_container'>
                    {cards.map((item)=>(
                            <NavBarItem nombre={item.nombre}
                                     route={item.route}
                                     image={item.image}
                                     color={item.color}
                                     key={item.color}/>
                    ))}
                </div>
            </div>
        </nav>
    );
  }
  
  export default NavBar;
  