<script setup>
import { ref } from 'vue'

const email = ref('')
const password = ref('')
const remember = ref(false)
const loading = ref(false)
const error = ref('')
const success = ref('')

const handleLogin = async () => {
  error.value = ''
  success.value = ''
  loading.value = true

  try {
    const res = await fetch('/api/login', {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({ email: email.value, password: password.value })
    })

    const data = await res.json()

    if (!res.ok) {
      error.value = data.error || 'Erro ao fazer login'
      return
    }

    success.value = `Bem-vindo, ${data.user.name}!`
    localStorage.setItem('token', data.token)
    localStorage.setItem('user', JSON.stringify(data.user))

    setTimeout(() => {
      window.location.href = '/dashboard'
    }, 1500)
  } catch (err) {
    error.value = 'Erro de conexão com o servidor'
  } finally {
    loading.value = false
  }
}

const handleRegister = () => {
  alert('Redirecionando para página de cadastro...')
}
</script>

<template>
  <div class="login-container">
    <div class="login-box">
      <h1 class="login-title">Entrar</h1>
      <p class="login-subtitle">Digite suas credenciais</p>

      <form @submit.prevent="handleLogin" class="login-form">
        <div class="form-group">
          <label for="email">E-mail</label>
          <input
            id="email"
            type="email"
            v-model="email"
            placeholder="seu@email.com"
            autocomplete="email"
            required
            :disabled="loading"
          >
        </div>

        <div class="form-group">
          <label for="password">Senha</label>
          <input
            id="password"
            type="password"
            v-model="password"
            placeholder="********"
            autocomplete="current-password"
            required
            :disabled="loading"
          >
        </div>

        <div class="remember-row">
          <input type="checkbox" id="remember" v-model="remember" :disabled="loading">
          <label for="remember">Lembrar-me</label>
        </div>

        <button type="submit" class="btn-login" :disabled="loading">
          {{ loading ? 'Entrando...' : 'Entrar' }}
        </button>

        <div v-if="error" class="toast error">{{ error }}</div>
        <div v-if="success" class="toast success">{{ success }}</div>
      </form>

      <div class="register-row">
        Não tem conta? <button type="button" class="btn-register" @click="handleRegister">Cadastrar-se</button>
      </div>
    </div>
  </div>
</template>

<style scoped>
.login-container {
  min-height: 100vh;
  display: flex;
  align-items: center;
  justify-content: center;
  padding: 20px;
  background-color: #f0f0f0;
  font-family: "Segoe UI", system-ui, sans-serif;
}

.login-box {
  background: white;
  border-radius: 8px;
  box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
  padding: 40px;
  width: 100%;
  max-width: 350px;
}

.login-title {
  font-size: 24px;
  font-weight: 700;
  color: #333;
  margin-bottom: 8px;
  text-align: center;
}

.login-subtitle {
  font-size: 14px;
  color: #666;
  text-align: center;
  margin-bottom: 30px;
}

.form-group {
  margin-bottom: 20px;
}

.form-group label {
  display: block;
  font-size: 14px;
  font-weight: 500;
  color: #333;
  margin-bottom: 6px;
}

.form-group input {
  width: 100%;
  padding: 12px 14px;
  font-size: 14px;
  border: 1px solid #ddd;
  border-radius: 4px;
  transition: border-color 0.2s, box-shadow 0.2s;
  outline: none;
  box-sizing: border-box;
}

.form-group input:focus {
  border-color: #007bff;
  box-shadow: 0 0 0 3px rgba(0, 123, 255, 0.15);
}

.form-group input:disabled {
  background-color: #f5f5f5;
  cursor: not-allowed;
}

.form-group input::placeholder {
  color: #999;
}

.remember-row {
  display: flex;
  align-items: center;
  margin-bottom: 20px;
}

.remember-row input[type="checkbox"] {
  width: 16px;
  height: 16px;
  margin-right: 8px;
  accent-color: #007bff;
}

.remember-row label {
  font-size: 14px;
  color: #333;
  cursor: pointer;
}

.btn-login {
  width: 100%;
  padding: 12px;
  font-size: 14px;
  font-weight: 600;
  color: white;
  background-color: #007bff;
  border: none;
  border-radius: 4px;
  cursor: pointer;
  transition: background-color 0.2s;
}

.btn-login:hover:not(:disabled) {
  background-color: #0056b3;
}

.btn-login:active:not(:disabled) {
  background-color: #004085;
}

.btn-login:disabled {
  background-color: #99c2f2;
  cursor: not-allowed;
}

.toast {
  padding: 12px 16px;
  border-radius: 4px;
  font-size: 14px;
  font-weight: 500;
  margin-top: 16px;
  text-align: center;
  animation: slideIn 0.3s ease;
}

.toast.error {
  background-color: #dc3545;
  color: white;
}

.toast.success {
  background-color: #28a745;
  color: white;
}

.register-row {
  text-align: center;
  margin-top: 20px;
  font-size: 14px;
  color: #666;
}

.btn-register {
  background: none;
  border: none;
  color: #007bff;
  font-size: 14px;
  font-weight: 500;
  cursor: pointer;
  text-decoration: underline;
  padding: 0;
}

.btn-register:hover {
  color: #0056b3;
}

@keyframes slideIn {
  from {
    opacity: 0;
    transform: translateY(-10px);
  }
  to {
    opacity: 1;
    transform: translateY(0);
  }
}
</style>