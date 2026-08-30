# vite.config.js - Documentação

## Descrição da Mudança
Configuração do Vite com proxy para backend Express.

## Arquivo
- `frontend/vite.config.js`

## Configurações
- Plugin: `@vitejs/plugin-vue`
- Porta dev server: 5173
- Proxy: `/api` → `http://localhost:3001` (changeOrigin: true)

## Melhorias Futuras
- [ ] Configurar build para produção (minify, chunk splitting)
- [ ] Variáveis de ambiente (.env) para URL do backend
- [ ] Plugin para análise de bundle (vite-bundle-analyzer)
- [ ] Configurar aliases (@/ → src/)