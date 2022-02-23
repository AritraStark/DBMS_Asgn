import React from "react";
import { StudentTable } from "./studentTable";

export const HandleTable = ({ type, data, showData }) => {
    if(type==='search') return <StudentTable rows={showData}/>
    else if(type==='showAll') return <StudentTable rows={data}/>
    else return <StudentTable rows={data}/>
}