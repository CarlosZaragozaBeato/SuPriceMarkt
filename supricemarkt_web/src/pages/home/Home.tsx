import axios from 'axios';
import React, { useContext } from 'react';
import { ProductsContext } from '../../Context/Context';
import { ROUTES } from '../../util/Routes';
import Lupa from '../../static/images/lupa.png'
import './home.css'



function Home() {


    const { setRoute} = useContext(ProductsContext);
    setRoute(ROUTES.HOME)


    const config = {
        headers: {
          "Access-Control-Allow-Origin": "*",
          "Access-Control-Allow-Methods": "GET,PUT,POST,DELETE,PATCH,OPTIONS",
        },
        withCredentials: false,
      };
    
      // eslint-disable-next-line react-hooks/exhaustive-deps
     async function getAllData(producto:string) {
        await axios
          .get(`http://127.0.0.1:8000/api/search?producto=${producto}`, config)
          .then((response) => {
                console.log(response.data)
    
          })
          .catch((e) => {});
      }


    return (
        <main>  
            <aside className="search">
                <div>
                    <input type="text"/>
                    <button>
                        <img src={Lupa} alt="Search"/>
                    </button>
                </div>

            </aside>
        </main>
    );
  }
  
  export default Home;
  