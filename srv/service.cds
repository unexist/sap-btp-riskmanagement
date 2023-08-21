using { BusinessPartnerA2X } from './external/BusinessPartnerA2X.cds';

using { RiskManagement as my } from '../db/schema';

using RiskManagement from '../db/schema';

@path : '/service/RiskManagement'
service RiskManagementService
{
    annotate Migrations with @restrict :
    [
        { grant : [ 'READ' ], to : [ 'RiskViewer' ] },
        { grant : [ '*' ], to : [ 'RiskManager' ] }
    ];

    annotate Risks with @restrict :
    [
        { grant : [ 'READ' ], to : [ 'RiskViewer' ] },
        { grant : [ '*' ], to : [ 'RiskManager' ] }
    ];

    @odata.draft.enabled
    entity Risks as
        projection on my.Risks;

    @odata.draft.enabled
    entity Migrations as
        projection on my.Migrations;

    entity A_BusinessPartner as
        projection on BusinessPartnerA2X.A_BusinessPartner;
}

annotate RiskManagementService with @requires :
[
    'authenticated-user'
];
