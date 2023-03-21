import { createContext } from "react";
import {Supermercado} from '../model/Supermercado'
import {Producto} from '../model/Producto'
import { ROUTES } from "../util/Routes";


export interface tipos {
    route: string,
    setRoute:(c: string) => void,
}

let initialState:tipos = {
    route: '',
    setRoute: ()=>{},
}

export const ProductsContext = createContext<typeof initialState>(initialState);
