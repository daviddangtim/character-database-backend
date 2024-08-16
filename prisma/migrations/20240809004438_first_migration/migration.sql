-- CreateEnum
CREATE TYPE "Gender" AS ENUM ('MALE', 'FEMALE');

-- CreateTable
CREATE TABLE "Character" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "abilities" TEXT NOT NULL,
    "firstAppearance" TEXT NOT NULL,
    "relations" TEXT NOT NULL,
    "powerLevel" DOUBLE PRECISION NOT NULL,
    "gender" "Gender" NOT NULL,
    "isFusion" BOOLEAN NOT NULL DEFAULT false,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Character_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "Character_id_key" ON "Character"("id");
