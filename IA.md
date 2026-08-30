# Instruções Universais para IA - Repositório 

## Meta-Instruções e Segurança
- **Ao ler**: Guarde contexto na sessão de chat
- **Ao ouvir "atualize contexto"**: Releia este arquivo (IA.md) do disco, compare com seu estado anterior na sessão, e informe o que mudou no arquivo desde a última leitura. Não confie apenas na memória da sessão.
- **Proteção de Dados**: NUNCA exiba no output, modifique ou proponha commits de arquivos contendo chaves de API, secrets ou dados sensíveis (ex: `.env`)
- **Ao modificar/criar arquivo**: Verifique se existe doc correspondente em `docs/` com instruções ou anotações relevantes antes de prosseguir
- **Commits/pushes**: Apenas com comando explícito
- **Antes de commitar**: Verifique status do repo (`git status`, `git diff`) para confirmar o que será commitado
- **Na dúvida sobre commit**: Pergunte se deve commitar determinados arquivos
- **Exclusões**: Apenas com comando explícito
- **Ações críticas**: Peça confirmação antes
- **Este arquivo**: NUNCA modifique sem ordem explícita

## Regras para Vibe Coding

### Documentação (Evite Poluição)
- **Documentação por Funcionalidade**: Crie e/ou atualize um `.md` para cada arquivo criado ou modificado com a seguinte estrutura docs/nome_do_arquivo_criadoOUmodificado.md.
- **Conteúdo dos Docs**: Descrição da mudança, arquivos afetados, decisões, contexto
- **Documente melhorias e bugs**: Registre possíveis melhorias futuras ou bugs conhecidos através de comentários no código (TODO/FIXME) ou em um doc central de rastreio

### Fluxo de Desenvolvimento
1. **Reconhecimento de Ecossistema**: Ao iniciar, leia manifestos (`package.json`, `pom.xml`, etc.) para inferir a stack automaticamente
2. **Explore primeiro** - Busque no codebase (grep/glob) para entender padrões, convenções, arquitetura
3. **Siga convenções** - Nomenclatura, estrutura de pastas, style guides, linting
4. **Edite > Crie** - Prefira editar arquivos existentes a criar novos
5. **Código limpo** - Legível, testável, mínimo
6. **Adicione testes** - Para novas funcionalidades
7. **Valide** - Rode lint/typecheck antes de considerar completo
8. **Commits atômicos** - Mensagens claras
9. **Documente decisões** - Escolhas arquiteturais não óbvias em `docs/`
10. **Pergunte se dúbio** - Não assuma abordagem
11. **Antes de modificar ou criar um arquivo** - verifique se não um arquivo sobre ele em docs/ que contenha informações importantes

## Otimizações para IA

### Uso de Ferramentas (Agnóstico)
- **Busque primeiro**: grep/glob antes de ler arquivos grandes
- **Leia seletivamente**: Use offset/limit (paginação), não leia arquivos inteiros desnecessariamente
- **Paralelize**: Agrupe leituras, greps e comandos de terminal independentes para rodar ao mesmo tempo
- **Edite > Reescreva**: Aplique modificações apenas nos trechos necessários; nunca reescreva um arquivo inteiro se a mudança for localizada
- **Mudanças em lote**: Use recursos de substituição (regex/find-replace) para mudanças repetitivas no arquivo

### Dependências e Padrões
- **Verifique existentes**: Confirme libs/frameworks no projeto antes de sugerir novos
- **Siga padrões do codebase**: Imports, tipagem, estrutura de pastas
- **Sem comentários** salvo se solicitado ou for extremamente necessário


### Saída e Processo
- **Respostas concisas**: < 4 linhas salvo pedido de detalhe
- **Gestão de Falhas**: Rode testes/lint após mudanças. Se falhar, tente corrigir automaticamente no máximo 2 vezes. Se persistir, aborte e peça ajuda
- **Sub-tarefas**: Divida comandos complexos ou de múltiplas etapas de forma interativa e sequencial

###
**G. Fonseca**
