import { Injectable } from '@nestjs/common';
import { DatabaseService } from '../database/database.service';
import { Prisma } from '@prisma/client';

@Injectable()
export class CharacterService {
  constructor(private readonly databaseService: DatabaseService) {}

  async create(createCharacterDto: Prisma.CharacterCreateInput) {
    return this.databaseService.character.create({
      data: createCharacterDto,
    });
  }

  async findAll() {
    return this.databaseService.character.findMany({}); 
  }

  async findOne(id: number) {
    return this.databaseService.character.findUnique({
      where: { id },
      include: {
        mainAbility: true,
        relatives: true,
        tags: true
      }
    });
  }

  async update(id: number, updateCharacterDto: Prisma.CharacterUpdateInput) {
    return this.databaseService.character.update({
      where: { id },
      data: updateCharacterDto,
    });
  }

  async remove(id: number) {
    return this.databaseService.character.delete({
      where: { id },
    });
  }
}
