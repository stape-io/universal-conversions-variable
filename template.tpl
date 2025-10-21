___TERMS_OF_SERVICE___

By creating or modifying this file you agree to Google Tag Manager's Community
Template Gallery Developer Terms of Service available at
https://developers.google.com/tag-manager/gallery-tos (or such other URL as
Google may provide), as modified from time to time.


___INFO___

{
  "type": "MACRO",
  "id": "cvt_temp_public_id",
  "version": 1,
  "securityGroups": [],
  "displayName": "Universal Conversions Variable",
  "description": "Generates the desired parameter from an array.\nby Stape.io",
  "containerContexts": [
    "WEB"
  ]
}


___TEMPLATE_PARAMETERS___

[
  {
    "type": "SELECT",
    "name": "platform",
    "displayName": "Platform",
    "macrosInSelect": false,
    "selectItems": [
      {
        "value": "meta",
        "displayValue": "Meta Pixel/CAPI"
      },
      {
        "value": "ga4",
        "displayValue": "Google Analytics 4"
      },
      {
        "value": "tiktok",
        "displayValue": "TikTok CAPI"
      },
      {
        "value": "twitter",
        "displayValue": "Twitter CAPI"
      },
      {
        "value": "microsoft",
        "displayValue": "Microsoft Ads"
      },
      {
        "value": "klaviyo",
        "displayValue": "Klaviyo"
      },
      {
        "value": "snap",
        "displayValue": "Snapchat"
      },
      {
        "value": "gAdsOff",
        "displayValue": "Google Ads Offline"
      },
      {
        "value": "pinterest",
        "displayValue": "Pinterest"
      },
      {
        "value": "rakuten",
        "displayValue": "Rakuten"
      },
      {
        "value": "criteo",
        "displayValue": "Criteo"
      },
      {
        "value": "reddit",
        "displayValue": "Reddit"
      }
    ],
    "simpleValueType": true,
    "help": "Choose which platform to generate parameter"
  },
  {
    "type": "RADIO",
    "name": "meta_task",
    "displayName": "What to return",
    "radioItems": [
      {
        "value": "contents",
        "displayValue": "contents [ {} ]"
      },
      {
        "value": "ids",
        "displayValue": "content_ids [ ]"
      },
      {
        "value": "name",
        "displayValue": "content_name ' '",
        "help": "will only return value if there is one object in product array, since content_name parameter is applicable only to single product (type) events"
      },
      {
        "value": "value",
        "displayValue": "value",
        "help": "use wisely, value will be calculated based on product prices and will not account for discounts. not recommended for purchase events"
      },
      {
        "value": "numitems",
        "displayValue": "num_items",
        "subParams": []
      }
    ],
    "simpleValueType": true,
    "enablingConditions": [
      {
        "paramName": "platform",
        "paramValue": "meta",
        "type": "EQUALS"
      }
    ]
  },
  {
    "type": "RADIO",
    "name": "ga4_task",
    "displayName": "What to return",
    "radioItems": [
      {
        "value": "value",
        "displayValue": "value",
        "help": "use wisely, value will be calculated based on product prices and will not account for discounts. not recommended for purchase events"
      },
      {
        "value": "items",
        "displayValue": "items",
        "help": ""
      },
      {
        "value": "ids",
        "displayValue": "ecomm_prodid",
        "help": "for Ads Remarketing"
      }
    ],
    "simpleValueType": true,
    "enablingConditions": [
      {
        "paramName": "platform",
        "paramValue": "ga4",
        "type": "EQUALS"
      }
    ]
  },
  {
    "type": "RADIO",
    "name": "rakuten_task",
    "displayName": "What to return",
    "radioItems": [
      {
        "value": "items",
        "displayValue": "line_items",
        "help": "",
        "subParams": []
      }
    ],
    "simpleValueType": true,
    "enablingConditions": [
      {
        "paramName": "platform",
        "paramValue": "rakuten",
        "type": "EQUALS"
      }
    ]
  },
  {
    "type": "RADIO",
    "name": "gAdsOff_task",
    "displayName": "What to return",
    "radioItems": [
      {
        "value": "value",
        "displayValue": "value",
        "help": "use wisely, value will be calculated based on product prices and will not account for discounts. not recommended for purchase events"
      },
      {
        "value": "items",
        "displayValue": "items"
      }
    ],
    "simpleValueType": true,
    "enablingConditions": [
      {
        "paramName": "platform",
        "paramValue": "gAdsOff",
        "type": "EQUALS"
      }
    ]
  },
  {
    "type": "RADIO",
    "name": "klaviyo_task",
    "displayName": "What to return",
    "radioItems": [
      {
        "value": "value",
        "displayValue": "value",
        "help": "use wisely, value will be calculated based on product prices and will not account for discounts. not recommended for purchase events"
      },
      {
        "value": "item",
        "displayValue": "item",
        "help": "for ViewedProduct event"
      },
      {
        "value": "items",
        "displayValue": "items"
      }
    ],
    "simpleValueType": true,
    "enablingConditions": [
      {
        "paramName": "platform",
        "paramValue": "klaviyo",
        "type": "EQUALS"
      }
    ]
  },
  {
    "type": "RADIO",
    "name": "microsoft_task",
    "displayName": "What to return",
    "radioItems": [
      {
        "value": "value",
        "displayValue": "revenue_value",
        "help": "use wisely, value will be calculated based on product prices and will not account for discounts. not recommended for purchase events"
      }
    ],
    "simpleValueType": true,
    "enablingConditions": [
      {
        "paramName": "platform",
        "paramValue": "microsoft",
        "type": "EQUALS"
      }
    ]
  },
  {
    "type": "RADIO",
    "name": "tiktok_task",
    "displayName": "What to return",
    "radioItems": [
      {
        "value": "contents",
        "displayValue": "contents [ {} ]",
        "subParams": [
          {
            "type": "SELECT",
            "name": "contentType",
            "displayName": "content_type parameter",
            "macrosInSelect": false,
            "selectItems": [
              {
                "value": "product",
                "displayValue": "product"
              },
              {
                "value": "product_group",
                "displayValue": "product_group"
              }
            ],
            "simpleValueType": true,
            "help": "choose either product or product_group as is required by TikTok events API",
            "defaultValue": "product",
            "enablingConditions": []
          }
        ]
      },
      {
        "value": "name",
        "displayValue": "content_name ' '",
        "help": "will only return value if there is one object in product array, since content_name parameter is applicable only to single product (type) events"
      },
      {
        "value": "value",
        "displayValue": "value",
        "help": "use wisely, value will be calculated based on product prices and will not account for discounts. not recommended for purchase events"
      },
      {
        "value": "numitems",
        "displayValue": "num_items",
        "subParams": []
      }
    ],
    "simpleValueType": true,
    "enablingConditions": [
      {
        "paramName": "platform",
        "paramValue": "tiktok",
        "type": "EQUALS"
      }
    ]
  },
  {
    "type": "RADIO",
    "name": "twitter_task",
    "displayName": "What to return",
    "radioItems": [
      {
        "value": "contents",
        "displayValue": "contents [{ }]"
      },
      {
        "value": "value",
        "displayValue": "value",
        "subParams": [],
        "help": "use wisely, value will be calculated based on product prices and will not account for discounts. not recommended for purchase events"
      }
    ],
    "simpleValueType": true,
    "enablingConditions": [
      {
        "paramName": "platform",
        "paramValue": "twitter",
        "type": "EQUALS"
      }
    ]
  },
  {
    "type": "RADIO",
    "name": "criteo_task",
    "displayName": "What to return",
    "radioItems": [
      {
        "value": "items",
        "displayValue": "items [{ }]"
      }
    ],
    "simpleValueType": true,
    "enablingConditions": [
      {
        "paramName": "platform",
        "paramValue": "criteo",
        "type": "EQUALS"
      }
    ]
  },
  {
    "type": "RADIO",
    "name": "pinterest_task",
    "displayName": "What to return",
    "radioItems": [
      {
        "value": "items",
        "displayValue": "line_items [{ }]"
      },
      {
        "value": "value",
        "displayValue": "value",
        "subParams": [],
        "help": "use wisely, value will be calculated based on product prices and will not account for discounts. not recommended for purchase events"
      },
      {
        "value": "ids",
        "displayValue": "content_ids [ ]"
      },
      {
        "value": "contents",
        "displayValue": "contents [{ }]"
      }
    ],
    "simpleValueType": true,
    "enablingConditions": [
      {
        "paramName": "platform",
        "paramValue": "pinterest",
        "type": "EQUALS"
      }
    ]
  },
  {
    "type": "RADIO",
    "name": "snap_task",
    "displayName": "What to return",
    "radioItems": [
      {
        "value": "value",
        "displayValue": "price",
        "help": "use wisely, value will be calculated based on product prices and will not account for discounts. not recommended for purchase events"
      },
      {
        "value": "ids",
        "displayValue": "item_ids"
      },
      {
        "value": "numitems",
        "displayValue": "number_items",
        "subParams": []
      }
    ],
    "simpleValueType": true,
    "enablingConditions": [
      {
        "paramName": "platform",
        "paramValue": "snap",
        "type": "EQUALS"
      }
    ]
  },
  {
    "type": "RADIO",
    "name": "reddit_task",
    "displayName": "What to return",
    "radioItems": [
      {
        "value": "value",
        "displayValue": "value",
        "help": "use wisely, value will be calculated based on product prices and will not account for discounts. not recommended for purchase events"
      },
      {
        "value": "numitems",
        "displayValue": "itemCount",
        "subParams": []
      },
      {
        "value": "items",
        "displayValue": "products"
      }
    ],
    "simpleValueType": true,
    "enablingConditions": [
      {
        "paramName": "platform",
        "paramValue": "reddit",
        "type": "EQUALS"
      }
    ]
  },
  {
    "type": "GROUP",
    "name": "arrayGroup",
    "displayName": "Input Array",
    "groupStyle": "ZIPPY_OPEN",
    "subParams": [
      {
        "type": "TEXT",
        "name": "orderItems",
        "displayName": "Array of Objects",
        "simpleValueType": true,
        "help": "[{}] any structured array of item objects",
        "valueValidators": [
          {
            "type": "NON_EMPTY"
          }
        ]
      }
    ]
  },
  {
    "type": "GROUP",
    "name": "keyGroup",
    "displayName": "Input Array Keys",
    "groupStyle": "ZIPPY_OPEN",
    "subParams": [
      {
        "type": "TEXT",
        "name": "keyId",
        "displayName": "Product ID/SKU",
        "simpleValueType": true,
        "valueValidators": [
          {
            "type": "NON_EMPTY"
          }
        ]
      },
      {
        "type": "TEXT",
        "name": "keyNm",
        "displayName": "Product Name",
        "simpleValueType": true,
        "valueValidators": [
          {
            "type": "NON_EMPTY"
          }
        ]
      },
      {
        "type": "TEXT",
        "name": "keyPr",
        "displayName": "Product Price",
        "simpleValueType": true,
        "valueValidators": [
          {
            "type": "NON_EMPTY"
          }
        ]
      },
      {
        "type": "TEXT",
        "name": "keyQt",
        "displayName": "Product Quantity",
        "simpleValueType": true,
        "valueValidators": [
          {
            "type": "NON_EMPTY"
          }
        ]
      },
      {
        "type": "TEXT",
        "name": "keyCat",
        "displayName": "Product Category",
        "simpleValueType": true,
        "enablingConditions": [
          {
            "paramName": "platform",
            "paramValue": "ga4",
            "type": "EQUALS"
          },
          {
            "paramName": "platform",
            "paramValue": "klaviyo",
            "type": "EQUALS"
          },
          {
            "paramName": "platform",
            "paramValue": "twitter",
            "type": "EQUALS"
          },
          {
            "paramName": "platform",
            "paramValue": "reddit",
            "type": "EQUALS"
          }
        ]
      },
      {
        "type": "TEXT",
        "name": "keyImg",
        "displayName": "Product Image URL",
        "simpleValueType": true,
        "enablingConditions": [
          {
            "paramName": "platform",
            "paramValue": "klaviyo",
            "type": "EQUALS"
          }
        ]
      },
      {
        "type": "CHECKBOX",
        "name": "buildCatTree",
        "checkboxText": "Build Category Tree?",
        "simpleValueType": true,
        "help": "If your items have multiple categories, create a tree in 'cat1 > cat2 > cat3' string format",
        "enablingConditions": [
          {
            "paramName": "platform",
            "paramValue": "rakuten",
            "type": "EQUALS"
          }
        ]
      },
      {
        "type": "TEXT",
        "name": "keyCatList",
        "displayName": "Category parameter keys",
        "simpleValueType": true,
        "help": "coma separated in order of appearance in tree, like: 'cat_key,mykey,custom_var_7'",
        "enablingConditions": [
          {
            "paramName": "buildCatTree",
            "paramValue": true,
            "type": "EQUALS"
          }
        ]
      }
    ],
    "help": "keys for corresponding parameters within input array"
  },
  {
    "type": "GROUP",
    "name": "rakDiscountGroup",
    "displayName": "Discount Configuration",
    "groupStyle": "ZIPPY_OPEN",
    "subParams": [
      {
        "type": "SELECT",
        "name": "discConfig",
        "displayName": "Choose discount configuration method",
        "macrosInSelect": false,
        "selectItems": [
          {
            "value": "item_level",
            "displayValue": "From item-level"
          },
          {
            "value": "order_level",
            "displayValue": "From order-level"
          },
          {
            "value": "none",
            "displayValue": "None"
          }
        ],
        "simpleValueType": true,
        "defaultValue": "none"
      },
      {
        "type": "TEXT",
        "name": "keyDiscItemLevel",
        "displayName": "Parameter key for item-level discount",
        "simpleValueType": true,
        "enablingConditions": [
          {
            "paramName": "discConfig",
            "paramValue": "item_level",
            "type": "EQUALS"
          }
        ],
        "help": "discount parameter KEY for input array"
      },
      {
        "type": "TEXT",
        "name": "discOrderLevel",
        "displayName": "Order-level discount amount",
        "simpleValueType": true,
        "help": "order-level discount VALUE",
        "enablingConditions": [
          {
            "paramName": "discConfig",
            "paramValue": "order_level",
            "type": "EQUALS"
          }
        ]
      }
    ],
    "enablingConditions": [
      {
        "paramName": "platform",
        "paramValue": "rakuten",
        "type": "EQUALS"
      }
    ]
  },
  {
    "type": "GROUP",
    "name": "rakTaxGroup",
    "displayName": "Tax Configuration",
    "groupStyle": "ZIPPY_OPEN",
    "subParams": [
      {
        "type": "SELECT",
        "name": "taxPriceConfig",
        "displayName": "Item price tax application",
        "macrosInSelect": false,
        "selectItems": [
          {
            "value": "priceTaxless",
            "displayValue": "Item price is taxless"
          },
          {
            "value": "priceDeduct",
            "displayValue": "Item price needs tax deduction"
          }
        ],
        "simpleValueType": true
      },
      {
        "type": "SELECT",
        "name": "taxDiscountConfig",
        "displayName": "Discount tax application",
        "macrosInSelect": false,
        "selectItems": [
          {
            "value": "discTaxless",
            "displayValue": "Discount is taxless"
          },
          {
            "value": "discDeduct",
            "displayValue": "Discount needs tax deduction"
          }
        ],
        "simpleValueType": true
      },
      {
        "type": "TEXT",
        "name": "taxDeductPercent",
        "displayName": "Tax %",
        "simpleValueType": true,
        "help": "just number, no % symbol",
        "valueValidators": [],
        "enablingConditions": [
          {
            "paramName": "taxPriceConfig",
            "paramValue": "priceDeduct",
            "type": "EQUALS"
          },
          {
            "paramName": "taxDiscountConfig",
            "paramValue": "discDeduct",
            "type": "EQUALS"
          }
        ]
      }
    ],
    "enablingConditions": [
      {
        "paramName": "platform",
        "paramValue": "rakuten",
        "type": "EQUALS"
      }
    ]
  },
  {
    "type": "GROUP",
    "name": "customParamsGroup",
    "displayName": "Additional/Optional Parameters",
    "groupStyle": "ZIPPY_OPEN",
    "subParams": [
      {
        "type": "SIMPLE_TABLE",
        "name": "customParams",
        "displayName": "",
        "simpleTableColumns": [
          {
            "defaultValue": "",
            "displayName": "Custom parameter key in your array",
            "name": "cusKey",
            "type": "TEXT"
          },
          {
            "defaultValue": "",
            "displayName": "Custom parameter name to return",
            "name": "cusName",
            "type": "TEXT"
          }
        ],
        "newRowButtonText": "Add Custom Parameter",
        "alwaysInSummary": false
      }
    ],
    "enablingConditions": [
      {
        "paramName": "platform",
        "paramValue": "ga4",
        "type": "EQUALS"
      },
      {
        "paramName": "platform",
        "paramValue": "klaviyo",
        "type": "EQUALS"
      },
      {
        "paramName": "platform",
        "paramValue": "rakuten",
        "type": "EQUALS"
      }
    ]
  }
]


___SANDBOXED_JS_FOR_WEB_TEMPLATE___

const makeInteger = require('makeInteger');
const makeNumber = require('makeNumber');
const makeString = require('makeString');
const makeTableMap = require('makeTableMap');
const getType = require('getType');
const math = require('Math');

let keyId = data.keyId;
let keyPr = data.keyPr;
let keyNm = data.keyNm;
let keyQt = data.keyQt;
let keyVar = data.keyVar;
let keyCat = data.keyCat;
let keyImg = data.keyImg;
let contentType = data.contentType;
let taxDeductPercent = toFixed2(makeNumber(data.taxDeductPercent));
let task; 
const customParamMap = data.customParams ? makeTableMap(data.customParams, 'cusKey', 'cusName') : {};

let keyDisc = data.keyDiscItemLevel;
//let rakTax = makeNumber(data.rakTax);

let keyCatList = data.keyCatList ? data.keyCatList.split(',') : [];

if (!data.orderItems || !data.orderItems.length)
  return ;
else
  return runTask();


function runTask() {

  if (data.meta_task)
    task = data.meta_task;

  if (data.ga4_task)
    task = data.ga4_task;

  if (data.tiktok_task)
    task = data.tiktok_task;

  if (data.twitter_task)
    task = data.twitter_task;

  if (data.microsoft_task)
    task = data.microsoft_task;

  if (data.klaviyo_task)
    task = data.klaviyo_task;
  
  if (data.snap_task)
    task = data.snap_task;

  if (data.gAdsOff_task)
    task = data.gAdsOff_task;
  
  if (data.pinterest_task)
    task = data.pinterest_task;
  
  if (data.rakuten_task)
    task = data.rakuten_task;
  
  if (data.criteo_task)
    task = data.criteo_task;

  if (task === 'contents')
    return getContents(data.orderItems, data.platform);

  if (task === 'ids')
    return getContentIds(data.orderItems);

  if (task === 'name')
    return getContentName(data.orderItems);

  if (task === 'value')
    return getValue(data.orderItems);

  if (task === 'numitems')
    return getNumItems(data.orderItems);

  if (task === 'items')
    return getItems(data.orderItems, data.platform);
  
  if (task === 'item')
    return getItem(data.orderItems);
}  


function toFixed2(num){
   return math.round(num * 100) / 100;
}


function makeNumberToFixed2(str) {
  
  const dotIndex = str.indexOf('.');
  
  if (dotIndex < 0)
    return makeNumber(str + '.00');
  
  let integerPart = str.substring(0, dotIndex);
  let decimalPart = str.substring(dotIndex + 1, dotIndex + 3);
  
  let a = decimalPart[0] ? decimalPart[0] : '0';
  let b = decimalPart[1] ? decimalPart[1] : '0';

  return makeNumber(integerPart + '.' + a + b);
}


function getItem(arr) {

  let cat = [];
  cat.push(arr[0][keyCat]);
      
  let item = {
    'ProductID': arr[0][keyId],
    'ProductName': arr[0][keyNm],
    'Price': arr[0][keyPr],
    'ImageURL': arr[0][keyImg],
    'Categories': cat
  };

  return item;
}



function getContents(arr, platform) {
  
  let contents = [];
  
  for (let i = 0; i < arr.length; i++) {
    
    let qt = 1;
    if (arr[i][keyQt])
      qt = makeNumber(arr[i][keyQt]);
    
    if (platform === 'meta') {
      contents.push({
        'id': arr[i][keyId],
        'quantity': qt,
        'item_price': arr[i][keyPr]
      });
    }
    
    if (platform === 'tiktok') {
      contents.push({
        'content_id': arr[i][keyId],
        'content_type': contentType,
        'content_category': arr[i][keyCat],
        'content_name': arr[i][keyNm],
        'quantity': qt,
        'price': arr[i][keyPr] ? makeNumber(arr[i][keyPr]) : 0,
      });
    }
    
    if (platform === 'twitter') {
      contents.push({
        'content_id': arr[i][keyId],
        'content_name': arr[i][keyNm],
        'content_type': arr[i][keyCat],
        'num_items': qt,
        'content_price': arr[i][keyPr]
      });
    }
    
    if (platform === 'pinterest') {
      contents.push({
        'quantity': qt,
        'item_price': arr[i][keyPr] ? makeString(arr[i][keyPr]) : '0'
      });
    }
        
  }

  return contents;
}


function getContentIds(arr) {
  
  let content_ids = [];

  for (let i = 0; i < arr.length; i++) {
    content_ids.push(arr[i][keyId]);
  }
    
  return content_ids;
}


function getValue(arr) {
  
  let value = 0; 
  let price;
  
  for (let i = 0; i < arr.length; i++) {

    price = arr[i][keyPr] ? makeNumber(arr[i][keyPr]) : 0;
    
    
    if (arr[i][keyQt]) {

       if (getType(arr[i][keyQt]) === 'string')
         value = value + makeInteger(arr[i][keyQt]) * price;   
       else             
         value = value + arr[i][keyQt] * price;
     
     }
     else
       value = value + price;
  }
    
  let res = math.round(value * 100) / 100; 
  return res;
}


function getItems(arr, platform) {

  let items = [];
  let totalDiscount = 0;
  if (data.discConfig === 'order_level') {
    
    totalDiscount = makeNumber(data.discOrderLevel);
    
    if (data.taxDiscountConfig == 'discDeduct') {
      totalDiscount = totalDiscount / ((taxDeductPercent / 100) + 1);
    }
      
  }
  
  for (let i = 0; i < arr.length; i++) {
    
    let qt = 1;
    if (arr[i][keyQt])
      qt = makeInteger(arr[i][keyQt]);

    if (platform === 'ga4') {    
      
      let itemObj = {
        'item_id': arr[i][keyId],
        'item_name': arr[i][keyNm],
        'quantity': qt,
        'price': arr[i][keyPr],
        'item_category': arr[i][keyCat]
      };
      
      for (let prop in customParamMap) {
        if (customParamMap[prop]) {
          if (prop === 'discountamountqty')
            itemObj[customParamMap[prop]] = arr[i][prop] * qt;
          else
            itemObj[customParamMap[prop]] = arr[i][prop];
        }
      }    
      
      items.push(itemObj);      
      
    }
    
    if (platform === 'klaviyo') {    
      
      let cat = [];
      cat.push(arr[i][keyCat]);
      
      let itemObj = {
        'ProductID': arr[i][keyId],
        'ProductName': arr[i][keyNm],
        'Quantity': qt,
        'ItemPrice': arr[i][keyPr],
        'ImageURL': arr[i][keyImg],
        'ProductCategories': cat
      };

      for (let prop in customParamMap) {
        if (customParamMap[prop]) { 
          itemObj[customParamMap[prop]] = arr[i][prop];
        }
      }
      
      items.push(itemObj);

    }
    
    
    if (platform === 'criteo') {    
      
      let itemObj = {
        'id': arr[i][keyId],
        'quantity': qt,
        'price': arr[i][keyPr]
      };
          
      items.push(itemObj);      
      
    }
    
    
   if (platform === 'gAdsOff') {    
      
      items.push({
        'productId': makeString(arr[i][keyId]),
        'quantity': qt,
        'unitPrice': makeNumber(arr[i][keyPr])
      });
    }
    
    
    if (platform === 'pinterest') {
      items.push({
        'product_id': arr[i][keyId],
        'product_name': arr[i][keyNm],
        'product_quantity': qt,
        'product_price': arr[i][keyPr] ? makeNumber(arr[i][keyPr]) : 0
      });
    }
    
    if (platform === 'rakuten') {
      
      //let p = arr[i][keyPr];
      let p = toFixed2(makeNumber(arr[i][keyPr]));
      let price;

      if (data.taxPriceConfig === 'priceDeduct' && taxDeductPercent && taxDeductPercent > 0) {       
        let tmp = p / ((taxDeductPercent / 100 ) + 1);
        price = (math.round(tmp * 100) / 100) * 100 * qt;
        price = math.round(price * 100) / 100;
      }
        
        
      if (data.discConfig === 'item_level' && arr[i][keyDisc]) {
        let tmp;
        let disc = makeNumber(arr[i][keyDisc]); //.replace(',','')
        if (data.taxDiscountConfig == 'discDeduct' && taxDeductPercent && taxDeductPercent > 0) {
          disc = disc / ((taxDeductPercent / 100) + 1);
        }
        
        totalDiscount = toFixed2(makeNumber(totalDiscount) + toFixed2(disc));
      
      }


      let itemObj = {
        'sku': arr[i][keyId],
        'product_name': arr[i][keyNm],
        'quantity': qt,
        'amount': price > 0 ? price : toFixed2(p * 100 * qt),
        'optional_data': {}
      };
      
      
      if (keyCatList.length > 0) {
        let catArr = [];
        keyCatList.forEach(element => catArr.push(arr[i][element]));
        itemObj.optional_data = { 'category': catArr.join(' > ') };   
      } 
      
      for (let prop in customParamMap) {
        if (customParamMap[prop]) { 
          itemObj.optional_data[customParamMap[prop]] = arr[i][prop];
        }
      }   
            
      items.push(itemObj);
    }
    
  } 
  
  if (platform === 'rakuten' && totalDiscount > 0) {
        
      items.push({
        'sku': "Discount",
        'quantity': "0",
        'amount': toFixed2(((totalDiscount - (totalDiscount * 2)) * 100)), 
        'product_name': "Discount"
      });
  }
  
  return items;
}


function getNumItems(arr) {

  let num_items = 0;
  
  for (let i = 0; i < arr.length; i++) {
    
    if (arr[i][keyQt]) {
    
      if (getType(arr[i][keyQt]) === 'string')
        num_items = num_items + makeInteger(arr[i][keyQt]);
      else
        num_items = num_items + arr[i][keyQt];
    }
    else
      num_items = num_items + 1;
    
  }
    
  return num_items;
}


function getContentName(arr) {

  let content_name = '';
  
  if (arr.length == 1)
    content_name = arr[0][keyNm];
  
  return content_name;
}


___TESTS___

scenarios: []


___NOTES___

Created on 12/10/2021, 11:11:20


