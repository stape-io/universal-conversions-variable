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
  "description": "Generates the desired parameter from an array.",
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
        "displayValue": "Twitter Ads"
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
      }
    ],
    "simpleValueType": true,
    "help": "Choose which platform to generate parameters for, template only allows one per variable instance."
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
        "displayValue": "content_name \u0027 \u0027",
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
        "displayValue": "items"
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
            "defaultValue": "product"
          }
        ]
      },
      {
        "value": "name",
        "displayValue": "content_name \u0027 \u0027",
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
        "value": "ids",
        "displayValue": "content_ids [ ]"
      },
      {
        "value": "name",
        "displayValue": "content_name \u0027 \u0027",
        "help": "will only return value if there is one object in product array, since content_name parameter is applicable only to single product (type) events"
      },
      {
        "value": "value",
        "displayValue": "value",
        "subParams": [],
        "help": "use wisely, value will be calculated based on product prices and will not account for discounts. not recommended for purchase events"
      },
      {
        "value": "numitems",
        "displayValue": "num_items"
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
    "type": "GROUP",
    "name": "arrayGroup",
    "displayName": "Array of product objects",
    "groupStyle": "ZIPPY_OPEN",
    "subParams": [
      {
        "type": "TEXT",
        "name": "orderItems",
        "displayName": "Array of Objects",
        "simpleValueType": true,
        "help": "For example, this can be \u0027products\u0027 array from enhanced ecommerce variable, or any other array of objects",
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
    "displayName": "Array keys",
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
          }
        ]
      },
      {
        "type": "TEXT",
        "name": "keyVar",
        "displayName": "Product Variant",
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
        "type": "TEXT",
        "name": "keyListName",
        "displayName": "Item List Name",
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
        "type": "TEXT",
        "name": "keyListId",
        "displayName": "Item List Id",
        "simpleValueType": true,
        "enablingConditions": [
          {
            "paramName": "platform",
            "paramValue": "ga4",
            "type": "EQUALS"
          }
        ]
      }
    ],
    "help": "keys for corresponding parameters within input array"
  }
]


___SANDBOXED_JS_FOR_WEB_TEMPLATE___

const makeInteger = require('makeInteger');
const getType = require('getType');
const math = require('Math');

let keyId = data.keyId;
let keyPr = data.keyPr;
let keyNm = data.keyNm;
let keyQt = data.keyQt;
let keyVar = data.keyVar;
let keyCat = data.keyCat;
let keyImg = data.keyImg;
let keyListName = data.keyListName;
let keyListId = data.keyListId;
let contentType = data.contentType;
let task;


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


function getItem(arr) {

    let cat = [];
    cat.push(arr[0][keyCat]);

    return {
        'ProductID': arr[0][keyId],
        'ProductName': arr[0][keyNm],
        'Price': arr[0][keyPr],
        'ImageURL': arr[0][keyImg],
        'Categories': cat
    };
}


function getContents(arr, platform) {

    let contents = [];

    for (let i = 0; i < arr.length; i++) {

        let qt = 1;
        if (arr[i][keyQt])
            qt = arr[i][keyQt];

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
                'quantity': qt,
                'price': arr[i][keyPr]
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

    for (let i = 0; i < arr.length; i++) {

        if (arr[i][keyQt]) {

            if (getType(arr[i][keyQt]) === 'string')
                value = value + makeInteger(arr[i][keyQt]) * arr[i][keyPr];
            else
                value = value + arr[i][keyQt] * arr[i][keyPr];

        }
        else
            value = value + arr[i][keyPr];
    }

    return math.round(value * 100) / 100;

}


function getItems(arr, platform) {

    let items = [];

    for (let i = 0; i < arr.length; i++) {

        let qt = 1;
        if (arr[i][keyQt])
            qt = arr[i][keyQt];

        if (platform === 'ga4') {
            items.push({
                'item_id': arr[i][keyId],
                'item_name': arr[i][keyNm],
                'quantity': qt,
                'price': arr[i][keyPr],
                'item_category': arr[i][keyCat],
                'item_variant': arr[i][keyVar],
                'item_list_id': arr[i][keyListId],
                'item_list_name': arr[i][keyListName]
            });
        }

        if (platform === 'klaviyo') {

            let cat = [];
            cat.push(arr[i][keyCat]);

            items.push({
                'ProductID': arr[i][keyId],
                'ProductName': arr[i][keyNm],
                'Quantity': qt,
                'ItemPrice': arr[i][keyPr],
                'ImageURL': arr[i][keyImg],
                'ProductCategories': cat
            });
        }
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

    if (arr.length === 1)
        content_name = arr[0][keyNm];

    return content_name;
}


___TESTS___

scenarios: []


___NOTES___

Created on 12/10/2021, 11:11:20


