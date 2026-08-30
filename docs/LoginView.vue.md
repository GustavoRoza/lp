# LoginView.vue - Documentação

## Descrição da Mudança
Componente Vue 3 transformado de tela de login para **declaração de amor para a Katriny**.

## Arquivo
- `frontend/src/views/LoginView.vue`

## Funcionalidade Atual
- Exibe card com foto do casal (`/fotonossa.png`)
- Animação de entrada suave
- Corações flutuantes no fundo
- Coração pulsante no card
- Mensagem de amor personalizada
- Rodapé com assinatura do declarador (G. Fonseca)

## Decisões
- Composition API com `<script setup>`
- CSS scoped para isolamento de estilos
- Paleta de cores romântica (tons de rosa/vermelho)
- Fundo escuro com gradiente
- Tipografia serif (Georgia) para elegance
- Foto circular com efeito glow
- Animações CSS (heartbeat, floatUp, pulse-glow)

## Estado Interno
- `visible` - controla animação de entrada
- `hearts` - array de corações flutuantes com propriedades aleatórias

## Melhorias Futuras
- [ ] Adicionar música de fundo
- [ ] Efeito de digitação na mensagem
- [ ] Botão "Eu também te amo" com resposta
- [ ] Animação de confetes