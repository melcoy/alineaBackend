BEGIN TRY

BEGIN TRAN;

-- CreateSchema
EXEC sp_executesql N'CREATE SCHEMA [master];';;

-- CreateSchema
EXEC sp_executesql N'CREATE SCHEMA [transaction];';;

-- CreateTable
CREATE TABLE [master].[master_items] (
    [id] INT NOT NULL IDENTITY(1,1),
    [priceId] NVARCHAR(1000) NOT NULL,
    [hold] INT NOT NULL,
    [versionNo] INT NOT NULL,
    [custName] NVARCHAR(1000) NOT NULL,
    [countryName] NVARCHAR(1000) NOT NULL,
    [countryCode] NVARCHAR(1000),
    [salesRepId] NVARCHAR(1000) NOT NULL,
    [itemId] NVARCHAR(1000) NOT NULL,
    [description] TEXT,
    [unitId] NVARCHAR(1000) NOT NULL,
    [currencyId] NVARCHAR(1000) NOT NULL,
    [unitPrice] FLOAT(53) NOT NULL,
    [lobCode] NVARCHAR(1000) NOT NULL,
    [lobName] NVARCHAR(1000) NOT NULL,
    [brand] NVARCHAR(1000) NOT NULL,
    [prioritySuppID] NVARCHAR(1000) NOT NULL,
    [suppName] TEXT NOT NULL,
    [weight] INT NOT NULL CONSTRAINT [master_items_weight_df] DEFAULT 0,
    [length] INT NOT NULL CONSTRAINT [master_items_length_df] DEFAULT 0,
    [width] INT NOT NULL CONSTRAINT [master_items_width_df] DEFAULT 0,
    [height] INT NOT NULL CONSTRAINT [master_items_height_df] DEFAULT 0,
    CONSTRAINT [master_items_pkey] PRIMARY KEY CLUSTERED ([id])
);

COMMIT TRAN;

END TRY
BEGIN CATCH

IF @@TRANCOUNT > 0
BEGIN
    ROLLBACK TRAN;
END;
THROW

END CATCH
