# Backend Express - Documentação

## Descrição da Mudança
Criação de backend simples com Express para validar login. Substitui a validação mock do frontend por uma API real.

## Arquivos Afetados
- `backend/package.json` - Dependências e scripts
- `backend/server.js` - Servidor Express com endpoint `/api/login`

## Decisões Tomadas
1. **Stack**: Express (Node.js) com ES Modules (`"type": "module"`)
2. **Porta**: 3001
3. **CORS**: Habilitado para permitir requisições do frontend (Vite proxy)
4. **Autenticação**: Mock simples com array de usuários em memória
5. **Endpoints**:
   - `POST /api/login` - Valida credenciais e retorna token mock
   - `GET /api/health` - Health check

## Credenciais de Teste
- `admin@teste.com` / `123456` → Admin
- `user@teste.com` / `123456` → Usuário

## Como Testar
```bash
cd backend && npm run dev
# Em outro terminal:
curl -X POST http://localhost:3001/api/login -H "Content-Type: application/json" -d '{"email":"admin@teste.com","password":"123456"}'
```

## Melhorias Futuras
- [ ] Substituir array em memória por banco de dados (SQLite/PostgreSQL)
- [ ] Implementar hash de senha (bcrypt)
- [ ] JWT real com expiração e refresh token
- [ ] Rate limiting no endpoint de login
- [ ] Validação de input com Zod/Joi
- [ ] Logs estruturados (pino/winston)
- [ ] Testes automatizados (Jest/Vitest)

## Bugs Conhecidos
- Senhas em plain text no código (apenas para demo)
- Sem persistência - usuários perdidos ao reiniciar
- Token mock não expira