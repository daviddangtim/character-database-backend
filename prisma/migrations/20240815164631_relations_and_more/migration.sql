/*
  Warnings:

  - You are about to drop the column `abilities` on the `Character` table. All the data in the column will be lost.
  - You are about to drop the column `relations` on the `Character` table. All the data in the column will be lost.

*/
-- AlterTable
ALTER TABLE "Character" DROP COLUMN "abilities",
DROP COLUMN "relations";

-- CreateTable
CREATE TABLE "MainAbility" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "type" TEXT NOT NULL,
    "rating" INTEGER NOT NULL,
    "characterId" INTEGER NOT NULL,

    CONSTRAINT "MainAbility_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Relatives" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "characterId" INTEGER NOT NULL,

    CONSTRAINT "Relatives_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Tags" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,

    CONSTRAINT "Tags_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "_CharacterToTags" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "MainAbility_characterId_key" ON "MainAbility"("characterId");

-- CreateIndex
CREATE UNIQUE INDEX "Relatives_id_key" ON "Relatives"("id");

-- CreateIndex
CREATE UNIQUE INDEX "Relatives_name_key" ON "Relatives"("name");

-- CreateIndex
CREATE UNIQUE INDEX "_CharacterToTags_AB_unique" ON "_CharacterToTags"("A", "B");

-- CreateIndex
CREATE INDEX "_CharacterToTags_B_index" ON "_CharacterToTags"("B");

-- AddForeignKey
ALTER TABLE "MainAbility" ADD CONSTRAINT "MainAbility_characterId_fkey" FOREIGN KEY ("characterId") REFERENCES "Character"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Relatives" ADD CONSTRAINT "Relatives_characterId_fkey" FOREIGN KEY ("characterId") REFERENCES "Character"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_CharacterToTags" ADD CONSTRAINT "_CharacterToTags_A_fkey" FOREIGN KEY ("A") REFERENCES "Character"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_CharacterToTags" ADD CONSTRAINT "_CharacterToTags_B_fkey" FOREIGN KEY ("B") REFERENCES "Tags"("id") ON DELETE CASCADE ON UPDATE CASCADE;
