import React, { useState } from "react";
import { Carousel } from "react-responsive-carousel";
import { Producto } from "../../../model/Producto";
import Previous from "../../../static/images/izquierda.png"
import Next from "../../../static/images/derecha.png"
import Delete from "../../../static/images/borrar.png"


type Props = {
  slides: Producto[];
};

const Carrousel: React.FC<Props> = ({ slides }) => {

  const [currentIndex, setCurrentIndex] = useState<number>(0);

  function handleChange(index:number) {
    setCurrentIndex(index);
  }
  function one_more(){
    if (currentIndex === slides.length){
        setCurrentIndex(0)
    }else{
        setCurrentIndex(currentIndex+1)
    }
  }
  function one_minus(){
    if (currentIndex === 0){
        setCurrentIndex(slides.length)
    }else{
        setCurrentIndex(currentIndex-1)
    }
  }



  return (
    <div className="image_producto">

        <div>
        <p className="precio_producto">{slides[currentIndex].precio}</p>
        <img src={Delete} alt="remove_item" onClick={()=>{}} className="delete_producto"/>
        </div>
        <div>
            <img src={Previous} alt="proxima" onClick={()=>one_minus} className="img_action"/>
            <img src={slides[currentIndex].image} alt={slides[currentIndex].nombre} className="img_producto"/>
            <img src={Next} alt="siguiente" onClick={()=>one_more} className="img_action"/>
        </div>
        <p className="nombre_producto">{slides[currentIndex].nombre}</p>


    </div>
  );
};

export default Carrousel;
