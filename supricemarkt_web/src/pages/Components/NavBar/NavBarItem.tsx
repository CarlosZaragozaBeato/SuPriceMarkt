import {useContext} from 'react';
import { Link } from 'react-router-dom';
import { ProductsContext } from '../../../Context/Context';
import CSS from 'csstype';
import { typeCards } from '../../../App';

function NavBarItem ({nombre,route,image,color}:typeCards) {



    const styles: CSS.Properties = {
        backgroundColor: color
      };

    return (
        <Link to={route}>
            <div style={styles} className="nav_extra_item">
                <img src={image} alt={nombre}/>
                <p>{nombre}</p>
            </div>

        </Link>
    );
  }
  
  export default NavBarItem;
  