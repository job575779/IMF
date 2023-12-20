angular.module('demo').constant('dimensionHierarchies', [
  {
    dimensionTable: {
      dimension: 'value',
      keyProps: ['value']
    },

    level: [
      {
        dimensionTable: {
          dimension: 'date',
          keyProps: ['date', 'frequency']
        },

        level: [
          {
            dimensionTable: {
              dimension: 'indicatorName',
              keyProps: ['indicatorName', 'indicatorCode']
            },

            level: [
              {
                dimensionTable: {
                  dimension: 'countryName',
                  keyProps: ['countryName', 'countryCode']
                }
              }
            ]
          }
        ]
      }
    ]
  }
]);
