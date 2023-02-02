BEGIN TRY

BEGIN TRAN;

-- CreateSchema
EXEC sp_executesql N'CREATE SCHEMA [master];';;

-- CreateSchema
EXEC sp_executesql N'CREATE SCHEMA [transaction];';;

-- CreateTable
CREATE TABLE [master].[master_country] (
    [id] INT NOT NULL IDENTITY(1,1),
    [codeCountry] NVARCHAR(1000) NOT NULL,
    [countryName] NVARCHAR(1000) NOT NULL,
    [typeCountry] NVARCHAR(1000) NOT NULL,
    [isActive] INT NOT NULL CONSTRAINT [master_country_isActive_df] DEFAULT 1,
    CONSTRAINT [master_country_pkey] PRIMARY KEY CLUSTERED ([id])
);

-- CreateTable
CREATE TABLE [master].[master_dossage] (
    [id] INT NOT NULL IDENTITY(1,1),
    [nameDossage] NVARCHAR(1000) NOT NULL,
    [isActive] INT NOT NULL CONSTRAINT [master_dossage_isActive_df] DEFAULT 1,
    CONSTRAINT [master_dossage_pkey] PRIMARY KEY CLUSTERED ([id])
);

-- CreateTable
CREATE TABLE [master].[master_speciality] (
    [id] INT NOT NULL IDENTITY(1,1),
    [nameSpeciality] NVARCHAR(1000) NOT NULL,
    [isActive] INT NOT NULL CONSTRAINT [master_speciality_isActive_df] DEFAULT 1,
    CONSTRAINT [master_speciality_pkey] PRIMARY KEY CLUSTERED ([id])
);

-- CreateTable
CREATE TABLE [master].[master_umbrella_brand] (
    [id] INT NOT NULL IDENTITY(1,1),
    [nameUmbrellaBrand] NVARCHAR(1000) NOT NULL,
    [isActive] INT NOT NULL CONSTRAINT [master_umbrella_brand_isActive_df] DEFAULT 1,
    [masterSpecialityId] INT,
    CONSTRAINT [master_umbrella_brand_pkey] PRIMARY KEY CLUSTERED ([id])
);

-- CreateTable
CREATE TABLE [master].[master_brand] (
    [id] INT NOT NULL IDENTITY(1,1),
    [umbrellaBrandId] INT NOT NULL,
    [nameBrand] NVARCHAR(1000) NOT NULL,
    [isActive] INT NOT NULL CONSTRAINT [master_brand_isActive_df] DEFAULT 1,
    CONSTRAINT [master_brand_pkey] PRIMARY KEY CLUSTERED ([id])
);

-- CreateTable
CREATE TABLE [master].[master_composition] (
    [id] INT NOT NULL IDENTITY(1,1),
    [brandId] INT NOT NULL,
    [nameComposition] NVARCHAR(1000) NOT NULL,
    [sku] NVARCHAR(1000) NOT NULL,
    [isActive] INT NOT NULL CONSTRAINT [master_composition_isActive_df] DEFAULT 1,
    CONSTRAINT [master_composition_pkey] PRIMARY KEY CLUSTERED ([id])
);

-- CreateTable
CREATE TABLE [master].[master_distribution_partner] (
    [id] INT NOT NULL IDENTITY(1,1),
    [nameDist] NVARCHAR(1000) NOT NULL,
    [isActive] INT NOT NULL CONSTRAINT [master_distribution_partner_isActive_df] DEFAULT 1,
    CONSTRAINT [master_distribution_partner_pkey] PRIMARY KEY CLUSTERED ([id])
);

-- CreateTable
CREATE TABLE [transaction].[market_survei_request] (
    [id] NVARCHAR(1000) NOT NULL,
    [numberDocument] NVARCHAR(1000) NOT NULL,
    [type] NVARCHAR(1000) NOT NULL,
    [idBrand] INT NOT NULL,
    [country] NVARCHAR(1000) NOT NULL,
    [brand] NVARCHAR(1000) NOT NULL,
    [dosageForm] NVARCHAR(1000) NOT NULL,
    [date] DATETIME2 NOT NULL CONSTRAINT [market_survei_request_date_df] DEFAULT CURRENT_TIMESTAMP,
    [originatorBrand] NVARCHAR(1000) NOT NULL,
    [originatorCompany] NVARCHAR(1000) NOT NULL,
    [statusForm] NVARCHAR(1000) NOT NULL,
    [approvedIdUser] NVARCHAR(1000) NOT NULL,
    [createdAt] DATETIME2 NOT NULL CONSTRAINT [market_survei_request_createdAt_df] DEFAULT CURRENT_TIMESTAMP,
    [updatedAt] DATETIME2 NOT NULL,
    [updatedBy] NVARCHAR(1000),
    [createdBy] NVARCHAR(1000),
    CONSTRAINT [market_survei_request_pkey] PRIMARY KEY CLUSTERED ([id])
);

-- CreateTable
CREATE TABLE [transaction].[market_survey] (
    [id] NVARCHAR(1000) NOT NULL,
    [numberDocument] NVARCHAR(1000) NOT NULL,
    [pic] NVARCHAR(1000) NOT NULL,
    [date] DATETIME2 NOT NULL CONSTRAINT [market_survey_date_df] DEFAULT CURRENT_TIMESTAMP,
    [priceSurveyed] NVARCHAR(1000) NOT NULL,
    [statusForm] NVARCHAR(1000) NOT NULL,
    [approvedIdUser] NVARCHAR(1000) NOT NULL,
    [createdAt] DATETIME2 NOT NULL CONSTRAINT [market_survey_createdAt_df] DEFAULT CURRENT_TIMESTAMP,
    [updatedAt] DATETIME2 NOT NULL,
    [updatedBy] NVARCHAR(1000),
    [createdBy] NVARCHAR(1000),
    CONSTRAINT [market_survey_pkey] PRIMARY KEY CLUSTERED ([id])
);

-- CreateTable
CREATE TABLE [transaction].[market_survey_detail] (
    [id] NVARCHAR(1000) NOT NULL,
    [brand] NVARCHAR(1000) NOT NULL,
    [unit] INT NOT NULL,
    [uomId] NVARCHAR(1000) NOT NULL,
    [manufacturer] NVARCHAR(1000) NOT NULL,
    [countryOrigin] NVARCHAR(1000) NOT NULL,
    [priceLocal] FLOAT(53) NOT NULL,
    [priceUSD] FLOAT(53) NOT NULL,
    [sales] NVARCHAR(1000) NOT NULL,
    [marketSurveyId] NVARCHAR(1000),
    CONSTRAINT [market_survey_detail_pkey] PRIMARY KEY CLUSTERED ([id])
);

-- CreateTable
CREATE TABLE [transaction].[market_survey_detail_Comp] (
    [id] NVARCHAR(1000) NOT NULL,
    [composition] NVARCHAR(1000) NOT NULL,
    [marketSurveyDetailId] NVARCHAR(1000),
    CONSTRAINT [market_survey_detail_Comp_pkey] PRIMARY KEY CLUSTERED ([id])
);

-- CreateTable
CREATE TABLE [master].[master_role] (
    [id] INT NOT NULL IDENTITY(1,1),
    [roleName] NVARCHAR(1000) NOT NULL,
    [createdAt] DATETIME2 NOT NULL CONSTRAINT [master_role_createdAt_df] DEFAULT CURRENT_TIMESTAMP,
    [updatedAt] DATETIME2 NOT NULL,
    [updatedBy] NVARCHAR(1000),
    [createdBy] NVARCHAR(1000),
    CONSTRAINT [master_role_pkey] PRIMARY KEY CLUSTERED ([id])
);

-- CreateTable
CREATE TABLE [master].[master_role_user] (
    [id] INT NOT NULL IDENTITY(1,1),
    [userId] NVARCHAR(1000) NOT NULL,
    [nameRoleUser] NVARCHAR(1000) NOT NULL,
    CONSTRAINT [master_role_user_pkey] PRIMARY KEY CLUSTERED ([id])
);

-- AddForeignKey
ALTER TABLE [master].[master_umbrella_brand] ADD CONSTRAINT [master_umbrella_brand_masterSpecialityId_fkey] FOREIGN KEY ([masterSpecialityId]) REFERENCES [master].[master_speciality]([id]) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE [master].[master_brand] ADD CONSTRAINT [master_brand_umbrellaBrandId_fkey] FOREIGN KEY ([umbrellaBrandId]) REFERENCES [master].[master_umbrella_brand]([id]) ON DELETE NO ACTION ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE [master].[master_composition] ADD CONSTRAINT [master_composition_brandId_fkey] FOREIGN KEY ([brandId]) REFERENCES [master].[master_brand]([id]) ON DELETE NO ACTION ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE [transaction].[market_survey_detail] ADD CONSTRAINT [market_survey_detail_marketSurveyId_fkey] FOREIGN KEY ([marketSurveyId]) REFERENCES [transaction].[market_survey]([id]) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE [transaction].[market_survey_detail_Comp] ADD CONSTRAINT [market_survey_detail_Comp_marketSurveyDetailId_fkey] FOREIGN KEY ([marketSurveyDetailId]) REFERENCES [transaction].[market_survey_detail]([id]) ON DELETE SET NULL ON UPDATE CASCADE;

COMMIT TRAN;

END TRY
BEGIN CATCH

IF @@TRANCOUNT > 0
BEGIN
    ROLLBACK TRAN;
END;
THROW

END CATCH
