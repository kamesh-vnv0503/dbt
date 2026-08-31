version: 2
 
models:
  - name: brz_customer
    columns: 
      - name: customerid
        tests:
          - unique
          - not_null
  - name: brz_orders
    columns:
      - name: orderid
        tests:
          - unique
          - not_null
      - name: shipmode
        tests:
          - accepted_values:
              arguments:
                values:
                  - 'First Class'
                  - 'Same Day'
                  - 'Second Class'
                  - 'Standard Class'