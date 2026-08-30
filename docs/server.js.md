# server.js - Documentação

## Descrição da Mudança
Servidor Express principal com endpoints de login e health check.

## Arquivo
- `backend/server.js`

## Endpoints
- `POST /api/login` - Autentica usuário, retorna user + token mock
- `GET /api/health` - Health check

## Usuários Mock
- `admin@teste.com` / `123456` (Admin)
- `user@teste.com` / `123456` (Usuário)

## Middlewares
- `cors()` - Permite requisições cross-origin
- `express.json()` - Parse JSON body

## Melhorias Futuras
- [ ] Validação de input (Zod)
- [ ] Hash de senha (bcrypt)
- [ ] JWT real com expiração
- [ ] Rate limiting (express-rate-limit)
- [ ] Logger (pino)
- [ ] Variáveis de ambiente (dotenv)
- [ ] Estrutura modular (routes, controllers, services)

## Bugs Conhecidos
- Senhas em plain text
- Array em memória (não persiste)
- Token mock não expira
- Sem validação de email/senha