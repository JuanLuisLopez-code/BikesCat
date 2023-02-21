import React, { useCallback, useContext, useState, useEffect } from "react"
import TwoFA from "../services/2FAService"

export function use2FA() {
    const checkQRBD = (data) => {
        TwoFA.checkQRBD(data)
    }

    const input2FA = (data) => {
        console.log(data, "inputHOOK")
    }

    return { checkQRBD, input2FA }
}