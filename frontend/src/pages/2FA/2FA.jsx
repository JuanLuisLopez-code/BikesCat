import React, { useContext } from "react";
import '../Dashboard/Dashboard.scss'
import UserContext from "../../context/UserContext";
import TwoFA from "../../components/2FA/2FA";
import { use2FA } from "../../hooks/use2FA";


const TwoPageFA = () => {
    const { user } = useContext(UserContext);
    const { checkQRBD, input2FA } = use2FA();

    return (
        <div>
            <h1>
                Check qr please
            </h1>
            <TwoFA checkQRBD={checkQRBD} input2FA={input2FA} />
        </div>
    )
}

export default TwoPageFA