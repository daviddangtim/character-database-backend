import { Module } from '@nestjs/common';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { DatabaseModule } from './database/database.module';
import { CharacterModule } from './character/character.module';

@Module({
  imports: [DatabaseModule, CharacterModule],
  controllers: [AppController],
  providers: [AppService],
})
export class AppModule {}
