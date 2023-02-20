import React, { useContext } from "react";
import '../Dashboard/Dashboard.scss'
import UserContext from "../../context/UserContext";
import TwoFA from "../../components/2FA/2FA";


const TwoPageFA = () => {
    const { user } = useContext(UserContext)


    console.log(user)

    return (
        <div>
            <h1>
                Check qr please
            </h1>
            <TwoFA />
        </div>
    )
}

export default TwoPageFA