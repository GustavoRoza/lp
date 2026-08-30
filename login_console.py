import getpass
import sys


USUARIOS = {
    "admin@teste.com": "123456",
    "user@teste.com": "senha123"
}


def limpar_tela():
    print("\033[2J\033[H", end="")


def mostrar_banner():
    print("=" * 40)
    print("       SISTEMA DE LOGIN")
    print("=" * 40)
    print()


def login():
    max_tentativas = 3
    tentativas = 0

    while tentativas < max_tentativas:
        limpar_tela()
        mostrar_banner()

        if tentativas > 0:
            print(f"Tentativas restantes: {max_tentativas - tentativas}")
            print()

        email = input("E-mail: ").strip().lower()

        if not email:
            print("\nE-mail não pode ser vazio!")
            input("Pressione Enter para continuar...")
            tentativas += 1
            continue

        senha = getpass.getpass("Senha: ").strip()

        if not senha:
            print("\nSenha não pode ser vazia!")
            input("Pressione Enter para continuar...")
            tentativas += 1
            continue

        if email in USUARIOS and USUARIOS[email] == senha:
            limpar_tela()
            print("=" * 40)
            print(f"  Login realizado com sucesso!")
            print(f"  Bem-vindo, {email}")
            print("=" * 40)
            return True
        else:
            print("\nE-mail ou senha incorretos!")
            input("Pressione Enter para continuar...")
            tentativas += 1

    limpar_tela()
    print("=" * 40)
    print("  Número máximo de tentativas excedido!")
    print("=" * 40)
    return False


def menu_principal():
    while True:
        limpar_tela()
        print("=" * 40)
        print("       MENU PRINCIPAL")
        print("=" * 40)
        print("\n1. Ver perfil")
        print("2. Configurações")
        print("3. Sair")
        print()

        opcao = input("Escolha uma opção: ").strip()

        if opcao == "1":
            print("\nPerfil do usuário")
            input("\nPressione Enter para voltar...")
        elif opcao == "2":
            print("\nConfigurações")
            input("\nPressione Enter para voltar...")
        elif opcao == "3":
            print("\nSaindo... Até logo!")
            break
        else:
            print("\nOpção inválida!")
            input("Pressione Enter para continuar...")


def main():
    try:
        if login():
            menu_principal()
    except KeyboardInterrupt:
        print("\n\nPrograma interrompido pelo usuário.")
    except EOFError:
        print("\n\nEntrada encerrada.")


if __name__ == "__main__":
    main()