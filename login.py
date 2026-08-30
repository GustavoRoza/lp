import tkinter as tk
from tkinter import messagebox


class LoginScreen:
    def __init__(self, root):
        self.root = root
        self.root.title("Login")
        self.root.geometry("350x400")
        self.root.resizable(False, False)
        self.root.configure(bg="#f0f0f0")

        self.setup_ui()

    def setup_ui(self):
        main_frame = tk.Frame(self.root, bg="#f0f0f0")
        main_frame.pack(expand=True, fill="both", padx=40, pady=30)

        tk.Label(
            main_frame,
            text="Entrar",
            font=("Segoe UI", 24, "bold"),
            bg="#f0f0f0",
            fg="#333333"
        ).pack(pady=(0, 10))

        tk.Label(
            main_frame,
            text="Digite suas credenciais",
            font=("Segoe UI", 11),
            bg="#f0f0f0",
            fg="#666666"
        ).pack(pady=(0, 30))

        self.email_entry = self.create_entry(main_frame, "E-mail", "seu@email.com")
        self.password_entry = self.create_entry(main_frame, "Senha", "********", show="*")

        tk.Checkbutton(
            main_frame,
            text="Lembrar-me",
            font=("Segoe UI", 10),
            bg="#f0f0f0",
            fg="#333333",
            activebackground="#f0f0f0"
        ).pack(anchor="w", pady=(15, 0))

        tk.Button(
            main_frame,
            text="Entrar",
            font=("Segoe UI", 11, "bold"),
            bg="#007bff",
            fg="white",
            activebackground="#0056b3",
            activeforeground="white",
            relief="flat",
            cursor="hand2",
            command=self.handle_login
        ).pack(fill="x", pady=(20, 10), ipady=10)

        tk.Label(
            main_frame,
            text="Não tem conta?",
            font=("Segoe UI", 10),
            bg="#f0f0f0",
            fg="#666666"
        ).pack()

        tk.Button(
            main_frame,
            text="Cadastrar-se",
            font=("Segoe UI", 10, "underline"),
            bg="#f0f0f0",
            fg="#007bff",
            activebackground="#f0f0f0",
            activeforeground="#0056b3",
            relief="flat",
            borderwidth=0,
            cursor="hand2",
            command=self.handle_register
        ).pack(pady=(5, 0))

    def create_entry(self, parent, label_text, placeholder, show=""):
        tk.Label(
            parent,
            text=label_text,
            font=("Segoe UI", 10),
            bg="#f0f0f0",
            fg="#333333"
        ).pack(anchor="w", pady=(0, 5))

        entry = tk.Entry(
            parent,
            font=("Segoe UI", 11),
            relief="solid",
            borderwidth=1,
            show=show
        )
        entry.pack(fill="x", pady=(0, 15), ipady=8)
        entry.insert(0, placeholder)
        entry.bind("<FocusIn>", lambda e: self.clear_placeholder(entry, placeholder))
        entry.bind("<FocusOut>", lambda e: self.restore_placeholder(entry, placeholder))
        return entry

    def clear_placeholder(self, entry, placeholder):
        if entry.get() == placeholder:
            entry.delete(0, tk.END)
            entry.config(fg="black")

    def restore_placeholder(self, entry, placeholder):
        if not entry.get():
            entry.insert(0, placeholder)
            entry.config(fg="gray")

    def handle_login(self):
        email = self.email_entry.get()
        password = self.password_entry.get()

        if email == "seu@email.com" or not email:
            messagebox.showwarning("Aviso", "Por favor, insira seu e-mail")
            return

        if password == "********" or not password:
            messagebox.showwarning("Aviso", "Por favor, insira sua senha")
            return

        if email == "admin@teste.com" and password == "123456":
            messagebox.showinfo("Sucesso", f"Bem-vindo, {email}!")
            self.root.destroy()
        else:
            messagebox.showerror("Erro", "E-mail ou senha incorretos")

    def handle_register(self):
        messagebox.showinfo("Cadastro", "Redirecionando para página de cadastro...")


def main():
    root = tk.Tk()
    app = LoginScreen(root)
    root.mainloop()


if __name__ == "__main__":
    main()