interface User {
    id: number;
    name: string;
    email?: string;
    isActive: boolean;
}

function updateUsuario(usuario: User, dados: Partial<Omit<User, 'id'>>): User {
    return {
        ...usuario,
        ...dados
    };
}

function criarUsuario(dados: Omit<User, 'id'>): User {
    return {
        id: Math.floor(Math.random() * 1000),
        ...dados
    };
};

const usuario = criarUsuario({
    // id: 1,
    name: "John Doe",
    email: "fonsca@gmail",
    isActive: true
});

console.log(usuario);


const usuarioAtualizado = updateUsuario(usuario, { name: "Gustavo Fonseca", isActive: false, email: "gustafonseca@gmail.com" });
console.log(usuarioAtualizado);




