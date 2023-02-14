const JwtService = {

    destroyToken: () => {
        localStorage.removeItem('token'),
            localStorage.removeItem("active")
    },

    saveToken: (token) => {
        localStorage.setItem('token', token)
    },

    getToken: () => localStorage.getItem('token')
}

export default JwtService;