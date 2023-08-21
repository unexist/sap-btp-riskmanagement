namespace RiskManagement;

using { BusinessPartnerA2X } from '../srv/external/BusinessPartnerA2X.cds';

using
{
    Country,
    Currency,
    Language,
    User,
    cuid,
    extensible,
    managed,
    temporal
}
from '@sap/cds/common';

entity Risks : managed
{
    key ID : UUID
        @Core.Computed;
    miti : Association to one Migrations;
    title : String(100);
    piro : String(5);
    descr : String(100);
    impact : Integer;
    criticality : String(100);
    supplier : Association to one BusinessPartnerA2X.A_BusinessPartner;
}

entity Migrations : managed
{
    key ID : UUID
        @Core.Computed;
    risks : Association to many Risks on risks.miti = $self;
    description : String(100);
    owner : String(100);
    timeline : String(100);
}
