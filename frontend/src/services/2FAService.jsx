import Api from './Api';

const TwoFA = {

    checkQRBD(data){
        return Api().put("/checkQRBD", data)
    },    
}

export default TwoFA;