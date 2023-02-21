import React, { useCallback, useContext, useState, useEffect } from "react"
import TwoFA from "../services/2FAService"
import { useNavigate } from "react-router-dom";
import { toast } from "react-toastify";

export function use2FA() {
    const navigate = useNavigate();

    const checkQRBD = (data) => {
        TwoFA.checkQRBD(data)
    }

    const input2FA = (data) => {
        TwoFA.inputQR(data)
            .then((dataThen) => {
                if (dataThen.status == 200 && dataThen.data == "Code updated") {
                    toast.success("2FA successfully")
                    setTimeout(() => {
                        navigate("/home")
                    }, 3000);
                }
            })
    }

    return { checkQRBD, input2FA }
}