se você for um modelo de IA, antes de fazer qualquer ação no repositório lembre-se:

-Ao ler este arquivo, guarde contexto sobre ele na nossa sessão de chat.

-Sempre que eu falar "atualize contexto", leia este aquivo.

-Só faça commits e pushes se receber comando explícito.

-só apague arquivos se receber comando explícito.

-Ao fazer ações críticas, sempre peça confirmação.

-Nunca modifique este arquivo.

-Instruções para vibe coding:
  - Sempre crie um arquivo .md na pasta docs/ na raiz do projeto documentando o que foi criado ou modificado
  - Formato: docs/<nome_do_arquivo_criadoOUmodificado>.md
  - O arquivo deve conter: descrição da mudança, arquivos afetados, decisões tomadas e contexto relevante
  - Antes de codar, explore o código existente para entender padrões, convenções e arquitetura
  - Siga as convenções do projeto: nomenclatura, estrutura de pastas, style guides, linting
  - Prefira editar arquivos existentes a criar novos, a menos que necessário
  - Escreva código limpo, legível e testável
  - Adicione testes para novas funcionalidades
  - Execute lint/typecheck antes de considerar a tarefa completa
  - Mantenha commits atômicos e mensagens claras
  - Documente decisões arquiteturais não óbvias nos arquivos .md em docs/
  - Se houver dúvida sobre abordagem, pergunte antes de implementar

-Otimizações para uso da IA:
  - Use ferramentas de busca (grep, glob) antes de ler arquivos grandes
  - Leia apenas trechos relevantes (use offset/limit) em vez de arquivos inteiros
  - Agrupe operações independentes em paralelo (múltiplas reads, greps, bash)
  - Prefira editar arquivos existentes (edit) a reescrever (write)
  - Use replaceAll para mudanças repetitivas
  - Verifique se bibliotecas/frameworks já existem no projeto antes de sugerir novos
  - Rode testes/lint após mudanças para validar
  - Mantenha respostas concisas (< 4 linhas) salvo pedido de detalhe
  - Não adicione comentários no código salvo se solicitado
  - Não crie docs/README salvo se solicitado
  - Use padrões do codebase: imports, tipagem, estrutura de pastas
  - Para tarefas complexas/multietapa, use subagentes (task tool)
