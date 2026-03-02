-- CreateTable
CREATE TABLE "Property" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "name" TEXT NOT NULL,
    "address" TEXT NOT NULL,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- CreateTable
CREATE TABLE "Room" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "propertyId" TEXT NOT NULL,
    "number" TEXT NOT NULL,
    "layout" TEXT NOT NULL,
    CONSTRAINT "Room_propertyId_fkey" FOREIGN KEY ("propertyId") REFERENCES "Property" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "Restoration" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "roomId" TEXT NOT NULL,
    "status" TEXT NOT NULL DEFAULT 'LEAVED',
    "leaveDate" DATETIME NOT NULL,
    "totalAmount" INTEGER NOT NULL DEFAULT 0,
    "tenantShare" INTEGER NOT NULL DEFAULT 0,
    "ownerShare" INTEGER NOT NULL DEFAULT 0,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" DATETIME NOT NULL,
    CONSTRAINT "Restoration_roomId_fkey" FOREIGN KEY ("roomId") REFERENCES "Room" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "ConstructionItem" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "restorationId" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "unitPrice" INTEGER NOT NULL,
    "quantity" REAL NOT NULL,
    "isTenantShare" BOOLEAN NOT NULL DEFAULT false,
    CONSTRAINT "ConstructionItem_restorationId_fkey" FOREIGN KEY ("restorationId") REFERENCES "Restoration" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);
