import React, { useContext } from "react";
import '../Dashboard/Dashboard.scss'
import UserContext from "../../context/UserContext";


const TwoPageFA = () => {
    const { user } = useContext(UserContext)

    return (
        <div>
            Check qr please
        </div>
    )
}

export default TwoPageFA