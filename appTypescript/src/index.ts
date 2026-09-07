import { randomUUID } from "node:crypto";
import * as readline from 'readline';


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




// const usuarioAtualizado = updateUsuario(usuario, { name: "Gustavo Fonseca", isActive: false, email: "gustafonseca@gmail.com" });
// console.log(usuarioAtualizado);

enum Sexo {
    macho = "pintudo",
    femea = "xereca"
}

enum RacasDeCachorro {
    ViraLata = "cachorro caramelho",
    Pinscher = "pinscher",
    Belga = "belga Malinois"
}

interface Cachorro {
    id: string;
    nome: string;
    idade: number;
    raca: RacasDeCachorro;
    sexo: Sexo;
}


export function cadastrarCachorro(nome: string, idade: number, raca: RacasDeCachorro, sexo: Sexo): Cachorro {
    const cachorro = {
        id: randomUUID(),
        nome,
        idade,
        raca,
        sexo
    }
    return cachorro;
}


// const myDog = cadastrarCachorro("lilit", 5, RacasDeCachorro.pinscher, Sexo.femea);
// console.log(myDog);


function recursividade(valor: number): Promise<void> {
    if (valor === 0) return Promise.resolve();
    return new Promise((resolve) => {
        setTimeout(() => {
            console.log(valor);
            resolve(recursividade(valor - 1));
        }, 1000);
    });
}


const rl = readline.createInterface({
    input: process.stdin,
    output: process.stdout
});

export async function quiz(): Promise<void> {
    rl.question("Quanto é 20 + 20? ", async (resposta) => {
        if (resposta === "40") {
            await recursividade(3);
            console.log("Correto!");
        } else {
            await recursividade(5);
            console.log("Errado!");
        }
        rl.close();
    });
}

// quiz();