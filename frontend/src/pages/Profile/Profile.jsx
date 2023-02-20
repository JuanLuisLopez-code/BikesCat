import React, { useContext, useEffect } from "react";
import IncidentsUser from "../../components/Incidents/IncidentsUser";
import '../Dashboard/Dashboard.scss'
import UserContext from "../../context/UserContext";
import { useUser } from "../../hooks/useUser";


const Profile = () => {
    const { user } = useContext(UserContext)
    const { modify2FA } = useUser()

    const data2FA = user.is_2FA == false ? "Yes" : "No";

    return (
        <div>
            <div>
                <h1>You want to use 2FA?</h1>
                <button className="btn-5" style={{ marginLeft: "45%" }} onClick={modify2FA}>{data2FA}</button>
            </div>
            <IncidentsUser />
        </div>
    )
}

export default Profile