import React, { useEffect, useState } from "react";
import QRCode from "react-qr-code";
import { toast } from "react-toastify";

const TwoFA = ({ checkQRBD, input2FA }) => {
    const [msg, setMsg] = useState()
    let [qr, setQr] = useState("");

    useEffect(() => {
        const randomN = JSON.stringify(Math.floor(Math.random() * 1000000000) + 100000000)
        setQr(randomN)
        if (randomN) {
            checkQRBD(randomN)
        }
    }, [])

    const handleChange = (event) => {
        setMsg(event.target.value)
    }

    const sendCode = () => {
        if (msg == qr) {
            input2FA(msg)
        } else {
            toast.error("Bad code")
        }
    }
    return (
        <div>
            <div style={{ height: "auto", margin: "0 auto", maxWidth: 64, width: "100%" }}>
                <QRCode
                    size={256}
                    style={{ height: "auto", maxWidth: "100%", width: "100%" }}
                    value={qr}
                    viewBox={`0 0 256 256`}
                />
            </div>
            <div>
                <input type="number" placeholder="Number QR" onChange={handleChange} />
            </div>
            <button onClick={sendCode}>Send Code</button>
        </div>
    )
}

export default TwoFA
