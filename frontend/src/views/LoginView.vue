<script setup>
import { ref, onMounted } from 'vue'

const visible = ref(false)
const hearts = ref([])

onMounted(() => {
  setTimeout(() => { visible.value = true }, 100)
  for (let i = 0; i < 15; i++) {
    hearts.value.push({
      id: i,
      left: Math.random() * 100,
      delay: Math.random() * 5,
      duration: 3 + Math.random() * 4,
      size: 14 + Math.random() * 20
    })
  }
})
</script>

<template>
  <div class="love-container">
    <div v-for="h in hearts" :key="h.id" class="floating-heart"
         :style="{ left: h.left + '%', animationDelay: h.delay + 's', animationDuration: h.duration + 's', fontSize: h.size + 'px' }">
      &#10084;
    </div>

    <div class="love-card" :class="{ show: visible }">
      <div class="photo-wrapper">
        <img src="/fotonossa.png" alt="Nós dois" class="couple-photo" />
      </div>
      <h1 class="love-title">Katriny</h1>
      <p class="love-subtitle">Eu te amo</p>

      <div class="love-message">
        <p>Eu não sei explicar o que sinto, mas sei que cada segundo ao seu lado é especial.</p>
        <p>Voce faz meu dia ter mais cor, meu sorriso ser mais verdadeiro.</p>
        <p>Eu quero estar ao seu lado em todos os momentos, nos bons e nos difíceis.</p>
      </div>

      <div class="love-footer">
        <span class="signature">Com todo o meu amor,</span>
        <span class="declarer">G. Fonseca</span>
      </div>
    </div>
  </div>
</template>

<style scoped>
.love-container {
  min-height: 100vh;
  display: flex;
  align-items: center;
  justify-content: center;
  padding: 20px;
  background: linear-gradient(135deg, #1a0a0a 0%, #2d1015 50%, #1a0a0a 100%);
  font-family: "Georgia", "Times New Roman", serif;
  overflow: hidden;
  position: relative;
}

.floating-heart {
  position: fixed;
  bottom: -50px;
  color: rgba(255, 100, 120, 0.25);
  animation: floatUp linear infinite;
  pointer-events: none;
  z-index: 0;
}

@keyframes floatUp {
  0% {
    transform: translateY(0) rotate(0deg);
    opacity: 0;
  }
  10% {
    opacity: 1;
  }
  90% {
    opacity: 1;
  }
  100% {
    transform: translateY(-110vh) rotate(360deg);
    opacity: 0;
  }
}

.love-card {
  background: rgba(255, 255, 255, 0.06);
  backdrop-filter: blur(12px);
  border: 1px solid rgba(255, 100, 120, 0.2);
  border-radius: 16px;
  padding: 50px 40px;
  width: 100%;
  max-width: 420px;
  text-align: center;
  opacity: 0;
  transform: translateY(30px) scale(0.95);
  transition: all 0.8s cubic-bezier(0.22, 1, 0.36, 1);
  position: relative;
  z-index: 1;
}

.love-card.show {
  opacity: 1;
  transform: translateY(0) scale(1);
}

.photo-wrapper {
  width: 130px;
  height: 130px;
  margin: 0 auto 20px;
  border-radius: 50%;
  overflow: hidden;
  border: 3px solid rgba(255, 100, 120, 0.4);
  box-shadow: 0 0 25px rgba(255, 100, 120, 0.3);
  animation: pulse-glow 2s ease-in-out infinite;
}

.couple-photo {
  width: 100%;
  height: 100%;
  object-fit: cover;
}

@keyframes pulse-glow {
  0%, 100% { box-shadow: 0 0 20px rgba(255, 100, 120, 0.3); }
  50% { box-shadow: 0 0 35px rgba(255, 100, 120, 0.5); }
}

@keyframes heartbeat {
  0%, 100% { transform: scale(1); }
  15% { transform: scale(1.2); }
  30% { transform: scale(1); }
  45% { transform: scale(1.15); }
}

.love-title {
  font-size: 40px;
  font-weight: 700;
  color: #ff6b8a;
  margin-bottom: 8px;
  letter-spacing: 2px;
}

.love-subtitle {
  font-size: 18px;
  color: #ff9eb5;
  font-style: italic;
  margin-bottom: 30px;
}

.love-message {
  margin-bottom: 30px;
}

.love-message p {
  font-size: 15px;
  line-height: 1.8;
  color: rgba(255, 200, 210, 0.85);
  margin-bottom: 12px;
}

.love-footer {
  border-top: 1px solid rgba(255, 100, 120, 0.15);
  padding-top: 20px;
}

.signature {
  font-size: 14px;
  color: #ff6b8a;
  font-style: italic;
  letter-spacing: 1px;
  display: block;
  margin-bottom: 4px;
}

.declarer {
  font-size: 18px;
  color: #ff9eb5;
  font-weight: 600;
  letter-spacing: 1px;
}
</style>