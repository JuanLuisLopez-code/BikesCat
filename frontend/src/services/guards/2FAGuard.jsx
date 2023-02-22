import React, { useContext, useState } from 'react'
import { Navigate, Outlet } from "react-router-dom"
import { useNavigate, useLocation } from 'react-router-dom'
import { toast } from 'react-toastify';

import UserContext from '../../context/UserContext'

function TwoFAGuard() {
    const { pathname } = useLocation();
    const { user } = useContext(UserContext)

    const path = pathname.split('/')[1];

    let [count, setCount] = useState()

    if (user.is_2FA == true) {
        if (count = 0) {
            setCount(count + 1);
            return user.countLogs == 10 ? <Navigate to="/2FA" /> : <Outlet />
        } else {
            if (path != "2FA" && user.countLogs == 10) {
                toast.warning("Please enter the code of QR")
                return <Navigate to="/2FA" />
            }
        }
    }
}

export default TwoFAGuard;