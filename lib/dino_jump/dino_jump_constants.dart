const double dinoJumpSpeedPixelPerMs = 0.5;

class DinoJumpImageKeys {
  static const dinoIdle = 'dino_idle';
  static const dinoRun1 = 'dino_run_1';
  static const dinoRun2 = 'dino_run_2';
  static const dinoJump = 'dino_jump';
  static const dinoDead1 = 'dino_dead_1';
  static const dinoDead2 = 'dino_dead_2';
  static const ground = 'ground';
  static const cactusSmall1 = 'cactus_small_1';
  static const cactusSmall2 = 'cactus_small_2';
  static const cactusSmall3 = 'cactus_small_3';
  static const cactusLarge1 = 'cactus_large_1';
  static const cactusLarge2 = 'cactus_large_2';
  static const cactusLarge3 = 'cactus_large_3';
}

const dinoJumpAssets = <String, String>{
  DinoJumpImageKeys.dinoIdle: 'assets/images/dino_jump/dino_idle.png',
  DinoJumpImageKeys.dinoRun1: 'assets/images/dino_jump/dino_run_1.png',
  DinoJumpImageKeys.dinoRun2: 'assets/images/dino_jump/dino_run_2.png',
  DinoJumpImageKeys.dinoJump: 'assets/images/dino_jump/dino_jump.png',
  DinoJumpImageKeys.dinoDead1: 'assets/images/dino_jump/dino_dead_1.png',
  DinoJumpImageKeys.dinoDead2: 'assets/images/dino_jump/dino_dead_2.png',
  DinoJumpImageKeys.ground: 'assets/images/dino_jump/ground.png',
  DinoJumpImageKeys.cactusSmall1: 'assets/images/dino_jump/cactus_small_1.png',
  DinoJumpImageKeys.cactusSmall2: 'assets/images/dino_jump/cactus_small_2.png',
  DinoJumpImageKeys.cactusSmall3: 'assets/images/dino_jump/cactus_small_3.png',
  DinoJumpImageKeys.cactusLarge1: 'assets/images/dino_jump/cactus_large_1.png',
  DinoJumpImageKeys.cactusLarge2: 'assets/images/dino_jump/cactus_large_2.png',
  DinoJumpImageKeys.cactusLarge3: 'assets/images/dino_jump/cactus_large_3.png',
};
