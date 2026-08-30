# Instruções IA - Repositório 

## Meta-Instruções
- **Ao ler**: Guarde contexto na sessão de chat
- **Ao ouvir "atualize contexto"**: Releia este arquivo, e informe o que de novo foi adicionado ao contexto.
- **Ao modificar/criar arquivo**: Verifique se existe doc correspondente em `docs/` com instruções ou anotações relevantes antes de prosseguir
- **Commits/pushes**: Apenas com comando explícito
- **Antes de commitar**: Verifique status do repo (git status, git diff) para confirmar o que será commitado
- **Na dúvida sobre commit**: Pergunte se deve commitar determinados arquivos
- **Exclusões**: Apenas com comando explícito
- **Ações críticas**: Peça confirmação antes
- **Este arquivo**: NUNCA modifique sem ordem explícita

## Regras para Vibe Coding

### Documentação
- Crie `.md` em `docs/` para cada arquivo criado/modificado
- Formato: `docs/<nome_arquivo_criadoOUmodificado>.md`
- Conteúdo: descrição da mudança, arquivos afetados, decisões, contexto
- **Documente melhorias e bugs**: Ao criar/editar, registre no doc possíveis melhorias futuras ou bugs conhecidos do arquivo

### Fluxo de Desenvolvimento
1. **Explore primeiro** - Busque no codebase (grep/glob) para entender padrões, convenções, arquitetura
2. **Siga convenções** - Nomenclatura, estrutura de pastas, style guides, linting
3. **Edite > Crie** - Prefira editar arquivos existentes a criar novos
4. **Código limpo** - Legível, testável, mínimo
5. **Adicione testes** - Para novas funcionalidades
6. **Valide** - Rode lint/typecheck antes de considerar completo
7. **Commits atômicos** - Mensagens claras
8. **Documente decisões** - Escolhas arquiteturais não óbvias em docs/
9. **Pergunte se dúbio** - Não assuma abordagem

## Otimizações para IA

### Uso de Ferramentas
- **Busque primeiro**: grep/glob antes de ler arquivos grandes
- **Leia seletivamente**: Use offset/limit, não arquivos inteiros
- **Paralelize**: Agrupe reads, greps, bash independentes
- **Edite > Reescreva**: Use ferramenta `edit`, não `write` para arquivos existentes
- **replaceAll**: Para mudanças repetitivas no arquivo

### Dependências e Padrões
- **Verifique existentes**: Confirme libs/frameworks no projeto antes de sugerir novos
- **Siga padrões do codebase**: Imports, tipagem, estrutura de pastas
- **Sem comentários** salvo se solicitado
- **Sem docs/README** salvo se solicitado

### Saída e Processo
- **Respostas concisas**: < 4 linhas salvo pedido de detalhe
- **Rode testes/lint** após mudanças
- **Subagentes**: Use ferramenta `task` para tarefas complexas/multietapa

---
**G. Fonseca**
