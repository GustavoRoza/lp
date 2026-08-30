# Login Web - Documentação

## Descrição da Mudança
Criação de versão web (HTML/CSS/JS) do login que anteriormente era apenas desktop (Tkinter). O usuário solicitou usar o login no navegador.

## Arquivos Afetados
- `login.html` - Novo arquivo: login web mock (frontend apenas)
- `login.py` - Mantido inalterado (versão desktop original)

## Decisões Tomadas
1. **Abordagem**: HTML/JS puro (mock) conforme solicitado pelo usuário
2. **Credenciais de teste**: Mantidas as mesmas do original (`admin@teste.com` / `123456`)
3. **Validação**: Client-side apenas (sem backend real)
4. **Estilo**: Replicado visual do Tkinter (cores, espaçamento, tipografia)
5. **Toast notifications**: Substitui `messagebox` do Tkinter
6. **Redirecionamento**: Após login bem-sucedido, redireciona para `dashboard.html` (a criar)

## Contexto Relevante
- O `login.py` original usa Tkinterface e roda como app desktop
- Esta versão web roda direto no navegador (abrir `login.html`)
- Sem dependências externas - funciona abrindo o arquivo diretamente
- Placeholders nos inputs replicam comportamento do original (limpam no focus, restauram no blur)

## Como Testar
1. Abrir `login.html` no navegador
2. Testar com credenciais inválidas → mostra toast de erro
3. Testar com `admin@teste.com` / `123456` → mostra toast de sucesso e redireciona
4. Testar campos vazios → mostra toast de aviso
5. Clicar em "Cadastrar-se" → mostra toast informativo