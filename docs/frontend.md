# Frontend Vue + Vite - Documentação

## Descrição da Mudança
Criação de frontend moderno com Vue 3 + Vite para substituir o HTML puro (`login.html`). Inclui tela de login integrada ao backend Express.

## Arquivos Afetados
- `frontend/package.json` - Dependências e scripts (gerado pelo Vite)
- `frontend/vite.config.js` - Configuração Vite com proxy `/api` → `localhost:3001`
- `frontend/src/main.js` - Entry point (inalterado)
- `frontend/src/App.vue` - Componente raiz (simplificado para usar LoginView)
- `frontend/src/views/LoginView.vue` - **Novo**: Tela de login com Vue 3 Composition API
- `frontend/src/style.css` - **Substituído**: Reset CSS mínimo (removido estilo Vite padrão)
- `frontend/src/components/HelloWorld.vue` - **Removido**

## Decisões Tomadas
1. **Framework**: Vue 3 com `<script setup>` (Composition API)
2. **Build Tool**: Vite (configurado com proxy para backend)
3. **Estilo**: CSS scoped no componente (replicado visual do `login.html` original)
4. **Estado**: `ref` para email, password, remember, loading, error, success
5. **Integração**: `fetch` nativo para `/api/login` (proxy Vite → backend)
6. **Persistência**: `localStorage` para token e user (mock)
7. **Feedback**: Toasts animados (sucesso/erro) substituindo `alert()`

## Funcionalidades
- Validação client-side (campos obrigatórios)
- Loading state no botão durante requisição
- Checkbox "Lembrar-me" (preparado para futuro)
- Redirecionamento automático para `/dashboard` após sucesso (1.5s)
- Tratamento de erros de rede e credenciais inválidas

## Como Testar
```bash
# Terminal 1 - Backend
cd backend && npm run dev

# Terminal 2 - Frontend
cd frontend && npm run dev

# Acessar http://localhost:5173
# Login: admin@teste.com / 123456
```

## Melhorias Futuras
- [ ] Roteamento com Vue Router (página `/dashboard`, `/register`)
- [ ] Pinia para gerenciamento de estado global (auth store)
- [ ] Interceptor Axios para token automático
- [ ] Validação de formulário com VeeValidate/Zod
- [ ] Testes unitários (Vitest + Vue Test Utils)
- [ ] E2E tests (Cypress/Playwright)
- [ ] Acessibilidade (ARIA labels, focus management)
- [ ] Internacionalização (i18n)
- [ ] Dark mode toggle
- [ ] Remember me real (refresh token + cookie seguro)

## Bugs Conhecidos
- `/dashboard` não existe (redirecionamento 404)
- Sem proteção de rotas (qualquer um acessa `/dashboard` direto)
- Token no localStorage vulnerável a XSS (deveria ser HttpOnly cookie)
- Sem logout funcional
- Sem recuperação de senha