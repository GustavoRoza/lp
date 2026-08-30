# LoginView.vue - Documentação

## Descrição da Mudança
Componente Vue 3 para tela de login, substituindo o HTML puro anterior.

## Arquivo
- `frontend/src/views/LoginView.vue`

## Decisões
- Composition API com `<script setup>`
- Estado reativo com `ref`
- CSS scoped para isolamento de estilos
- Integração direta com backend via `fetch` + proxy Vite

## Props/Emits
- Nenhuma (componente de página autossuficiente)

## Estado Interno
- `email`, `password` - inputs do formulário
- `remember` - checkbox lembrar-me
- `loading` - estado de carregamento
- `error`, `success` - mensagens de toast

## Métodos
- `handleLogin()` - Chama API, trata resposta, salva no localStorage, redireciona
- `handleRegister()` - Placeholder para futuro cadastro

## Melhorias Futuras
- [ ] Extrair lógica de auth para composable `useAuth()`
- [ ] Adicionar validação de email (regex)
- [ ] Mostrar/ocultar senha
- [ ] Animação de shake em erro
- [ ] Acessibilidade: aria-live para toasts

## Bugs Conhecidos
- Redirecionamento hardcoded para `/dashboard` (rota inexistente)
- Sem limpeza de erro/success ao digitar novamente