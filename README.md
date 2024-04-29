import pygame
import random

# Inicialização do Pygame
pygame.init()

# Definição das cores
BLACK = (0, 0, 0)
WHITE = (255, 255, 255)
GREEN = (0, 255, 0)
RED = (255, 0, 0)

# Definição do tamanho da tela
WIDTH = 800
HEIGHT = 600

# Definição do tamanho do bloco da cobrinha
BLOCK_SIZE = 20

# Inicialização da tela
screen = pygame.display.set_mode((WIDTH, HEIGHT))
pygame.display.set_caption("Snake Game")

# Relógio para controlar a taxa de atualização da tela
clock = pygame.time.Clock()

# Função para desenhar a cobrinha na tela
def draw_snake(snake):
    for segment in snake:
        pygame.draw.rect(screen, GREEN, [segment[0], segment[1], BLOCK_SIZE, BLOCK_SIZE])

# Função para desenhar a maçã na tela
def draw_apple(apple):
    pygame.draw.rect(screen, RED, [apple[0], apple[1], BLOCK_SIZE, BLOCK_SIZE])

# Função principal do jogo
def game_loop():
    # Posição inicial da cobrinha
    snake = [[WIDTH / 2, HEIGHT / 2]]

    # Velocidade inicial da cobrinha
    speed = BLOCK_SIZE

    # Direção inicial da cobrinha
    direction = 'RIGHT'

    # Posição inicial da maçã
    apple = [random.randrange(0, WIDTH - BLOCK_SIZE, BLOCK_SIZE),
             random.randrange(0, HEIGHT - BLOCK_SIZE, BLOCK_SIZE)]

    # Loop principal do jogo
    running = True
    while running:
        for event in pygame.event.get():
            if event.type == pygame.QUIT:
                running = False
            elif event.type == pygame.KEYDOWN:
                if event.key == pygame.K_LEFT and direction != 'RIGHT':
                    direction = 'LEFT'
                elif event.key == pygame.K_RIGHT and direction != 'LEFT':
                    direction = 'RIGHT'
                elif event.key == pygame.K_UP and direction != 'DOWN':
                    direction = 'UP'
                elif event.key == pygame.K_DOWN and direction != 'UP':
                    direction = 'DOWN'

        # Movimento da cobrinha
        if direction == 'LEFT':
            snake[0][0] -= speed
        elif direction == 'RIGHT':
            snake[0][0] += speed
        elif direction == 'UP':
            snake[0][1] -= speed
        elif direction == 'DOWN':
            snake[0][1] += speed

        # Verifica se a cobrinha colidiu com a parede
        if snake[0][0] < 0 or snake[0][0] >= WIDTH or snake[0][1] < 0 or snake[0][1] >= HEIGHT:
            running = False

        # Verifica se a cobrinha colidiu consigo mesma
        for segment in snake[1:]:
            if snake[0] == segment:
                running = False

        # Verifica se a cobrinha comeu a maçã
        if snake[0] == apple:



-[image](https://github.com/Kayquews/Kayquews/assets/146845968/2eb774b4-c0ed-418e-8ccf-632380acb471)

- 👋 Hi, I’m @Kayquews
- 
- 👀 I’m interested in ...
- 🌱 I’m currently learning ...
- 💞️ I’m looking to collaborate on ...
- 📫 How to reach me ...
- 😄 Pronouns: ...
- ⚡ Fun fact: ...

<!---
Kayquews/Kayquews is a ✨ special ✨ repository because its `README.md` (this file) appears on your GitHub profile.
You can click the Preview link to take a look at your changes.
--->
