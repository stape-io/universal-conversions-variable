___TERMS_OF_SERVICE___

By creating or modifying this file you agree to Google Tag Manager's Community
Template Gallery Developer Terms of Service available at
https://developers.google.com/tag-manager/gallery-tos (or such other URL as
Google may provide), as modified from time to time.


___INFO___

{
  "type": "MACRO",
  "id": "cvt_WF8HR",
  "version": 1,
  "displayName": "Universal Conversions Variable",
  "categories": [
    "UTILITY",
    "CONVERSIONS",
    "REMARKETING"
  ],
  "description": "Generates the desired parameter from an array.\nBy stape.io.",
  "containerContexts": [
    "WEB"
  ],
  "securityGroups": []
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
    ],
    "help": "As described in the \u003ca href\u003d\"https://business.reddithelp.com/s/article/manual-conversion-events-with-the-reddit-pixel\"\u003eofficial documentation\u003c/a\u003e."
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
        "help": "If your items have multiple categories, create a tree in \u0027cat1 \u003e cat2 \u003e cat3\u0027 string format",
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
        "help": "coma separated in order of appearance in tree, like: \u0027cat_key,mykey,custom_var_7\u0027",
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
  },
  {
    "type": "SELECT",
    "name": "idFormatType",
    "displayName": "Product ID Format",
    "macrosInSelect": true,
    "selectItems": [
      {
        "value": "default",
        "displayValue": "Default (use \u0027Product ID/SKU\u0027 field)"
      },
      {
        "value": "variantId",
        "displayValue": "Variant ID (use \u0027Item Variant ID\u0027 field)"
      },
      {
        "value": "sku",
        "displayValue": "SKU (use \u0027Item SKU\u0027 field)"
      },
      {
        "value": "customShopify",
        "displayValue": "Custom Shopify (shopify_MARKET_prod_var)"
      }
    ],
    "simpleValueType": true
  },
  {
    "type": "TEXT",
    "name": "keyVariantId",
    "displayName": "Item Variant ID Key",
    "simpleValueType": true
  },
  {
    "type": "TEXT",
    "name": "keySku",
    "displayName": "Item SKU Key",
    "simpleValueType": true
  },
  {
    "type": "TEXT",
    "name": "marketCode",
    "displayName": "ISO Market Code (for Custom Shopify) e.g., GB, US",
    "simpleValueType": true
  }
]


___SANDBOXED_JS_FOR_WEB_TEMPLATE___

const makeInteger = require('makeInteger');
const makeNumber = require('makeNumber');
const makeString = require('makeString');
const makeTableMap = require('makeTableMap');
const getType = require('getType');
const math = require('Math');
const Object = require('Object');

/*==============================================================================
==============================================================================*/

// Original Key fields
const keyId = data.keyId;
const keyPr = data.keyPr;
const keyNm = data.keyNm;
const keyQt = data.keyQt;
const keyCat = data.keyCat;
const keyImg = data.keyImg;
const contentType = data.contentType;
const taxDeductPercent = toFixed2(makeNumber(data.taxDeductPercent));
const keyDisc = data.keyDiscItemLevel;

// --- NEW FIELDS ---
const idFormat = data.idFormatType;
const keySku = data.keySku;
const keyVariantId = data.keyVariantId;
const market = data.marketCode || '';
// --- END NEW FIELDS ---

const customParamMap = data.customParams
  ? makeTableMap(data.customParams, 'cusKey', 'cusName')
  : {};
const keyCatList = data.keyCatList ? data.keyCatList.split(',') : [];
const inputArray = data.orderItems;

if (getType(inputArray) === 'array' && inputArray.length) return runTask();
else return;

/*==============================================================================
  Vendor related functions
==============================================================================*/

function runTask() {
  const platform = data.platform;
  const dataKeys = Object.keys(data);
  let task;

  for (const key of dataKeys) {
    if (endsWith(key, '_task') && data[key]) {
      task = data[key];
      break;
    }
  }

  switch (task) {
    case 'contents':
      return getContents(inputArray, platform);
    case 'ids':
      return getContentIds(inputArray);
    case 'name':
      return getContentName(inputArray);
    case 'value':
      return getValue(inputArray);
    case 'numitems':
      return getNumItems(inputArray);
    case 'items':
      return getItems(inputArray, platform);
    case 'item':
      return getItem(inputArray);
  }
}

function getNumItems(arr) {
  const num_items = arr.reduce((acc, curr) => {
    const quantity = curr[keyQt] ? makeInteger(curr[keyQt]) : 1;
    return acc + quantity;
  }, 0);
  return num_items;
}

function getContentName(arr) {
  if (arr.length !== 1) return '';
  return arr[0][keyNm];
}

function getContentIds(arr) {
  // --- MODIFIED ---
  const content_ids = arr.map((item) => getFormattedId(item));
  // --- END MODIFIED ---
  return content_ids;
}

function getItem(arr) {
  let cat = [];
  cat.push(arr[0][keyCat]);

  let item = {
    // --- MODIFIED ---
    ProductID: getFormattedId(arr[0]),
    // --- END MODIFIED ---
    ProductName: arr[0][keyNm],
    Price: arr[0][keyPr],
    ImageURL: arr[0][keyImg],
    Categories: cat
  };

  return item;
}

function getValue(arr) {
  const value = arr.reduce((acc, curr) => {
    const itemPrice = curr[keyPr] ? makeNumber(curr[keyPr]) : 0;
    const itemQuantity = curr[keyQt];
    return acc + (itemQuantity ? makeInteger(itemQuantity) * itemPrice : itemPrice);
  }, 0);
  return toFixed2(value);
}

function getContents(arr, platform) {
  let contents = [];

  for (let i = 0; i < arr.length; i++) {
    let qt = 1;
    if (arr[i][keyQt]) qt = makeNumber(arr[i][keyQt]);

    if (platform === 'meta') {
      contents.push({
        // --- MODIFIED ---
        id: getFormattedId(arr[i]),
        // --- END MODIFIED ---
        quantity: qt,
        item_price: arr[i][keyPr]
      });
    }

    if (platform === 'tiktok') {
      contents.push({
        // --- MODIFIED ---
        content_id: getFormattedId(arr[i]),
        // --- END MODIFIED ---
        content_type: contentType,
        content_category: arr[i][keyCat],
        content_name: arr[i][keyNm],
        quantity: qt,
        price: arr[i][keyPr] ? makeNumber(arr[i][keyPr]) : 0
      });
    }

    if (platform === 'twitter') {
      contents.push({
        // --- MODIFIED ---
        content_id: getFormattedId(arr[i]),
        // --- END MODIFIED ---
        content_name: arr[i][keyNm],
        content_type: arr[i][keyCat],
        num_items: qt,
        content_price: arr[i][keyPr]
      });
    }

    if (platform === 'pinterest') {
      contents.push({
        quantity: qt,
        item_price: arr[i][keyPr] ? makeString(arr[i][keyPr]) : '0'
        // Pinterest 'contents' array doesn't use ID
      });
    }
  }

  return contents;
}

function getItems(arr, platform) {
  let items = [];
  let totalDiscount = 0;
  if (data.discConfig === 'order_level') {
    totalDiscount = makeNumber(data.discOrderLevel);

    if (data.taxDiscountConfig == 'discDeduct') {
      totalDiscount = totalDiscount / (taxDeductPercent / 100 + 1);
    }
  }

  for (let i = 0; i < arr.length; i++) {
    let qt = 1;
    if (arr[i][keyQt]) qt = makeInteger(arr[i][keyQt]);

    if (platform === 'ga4') {
      let itemObj = {
        // --- MODIFIED ---
        item_id: getFormattedId(arr[i]),
        // --- END MODIFIED ---
        item_name: arr[i][keyNm],
        quantity: qt,
        price: arr[i][keyPr],
        item_category: arr[i][keyCat]
      };

      for (let prop in customParamMap) {
        if (customParamMap[prop]) {
          if (prop === 'discountamountqty') itemObj[customParamMap[prop]] = arr[i][prop] * qt;
          else itemObj[customParamMap[prop]] = arr[i][prop];
        }
      }

      items.push(itemObj);
    }

    if (platform === 'klaviyo') {
      let cat = [];
      cat.push(arr[i][keyCat]);

      let itemObj = {
        // --- MODIFIED ---
        ProductID: getFormattedId(arr[i]),
        // --- END MODIFIED ---
        ProductName: arr[i][keyNm],
        Quantity: qt,
        ItemPrice: arr[i][keyPr],
        ImageURL: arr[i][keyImg],
        ProductCategories: cat
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
        // --- MODIFIED ---
        id: getFormattedId(arr[i]),
        // --- END MODIFIED ---
        quantity: qt,
        price: arr[i][keyPr]
      };

      items.push(itemObj);
    }

    if (platform === 'gAdsOff') {
      items.push({
        // --- MODIFIED ---
        productId: getFormattedId(arr[i]),
        // --- END MODIFIED ---
        quantity: qt,
        unitPrice: makeNumber(arr[i][keyPr])
      });
    }

    if (platform === 'pinterest') {
      items.push({
        // --- MODIFIED ---
        product_id: getFormattedId(arr[i]),
        // --- END MODIFIED ---
        product_name: arr[i][keyNm],
        product_quantity: qt,
        product_price: arr[i][keyPr] ? makeNumber(arr[i][keyPr]) : 0
      });
    }

    if (platform === 'reddit') {
      items.push({
        // --- MODIFIED ---
        id: getFormattedId(arr[i]),
        // --- END MODIFIED ---
        category: arr[i][keyCat],
        name: arr[i][keyNm]
      });
    }

    if (platform === 'rakuten') {
      //let p = arr[i][keyPr];
      let p = toFixed2(makeNumber(arr[i][keyPr]));
      let price;

      if (data.taxPriceConfig === 'priceDeduct' && taxDeductPercent && taxDeductPercent > 0) {
        let tmp = p / (taxDeductPercent / 100 + 1);
        price = (math.round(tmp * 100) / 100) * 100 * qt;
        price = math.round(price * 100) / 100;
      }

      if (data.discConfig === 'item_level' && arr[i][keyDisc]) {
        let tmp;
        let disc = makeNumber(arr[i][keyDisc]); //.replace(',','')
        if (data.taxDiscountConfig == 'discDeduct' && taxDeductPercent && taxDeductPercent > 0) {
          disc = disc / (taxDeductPercent / 100 + 1);
        }

        totalDiscount = toFixed2(makeNumber(totalDiscount) + toFixed2(disc));
      }

      let itemObj = {
        // --- MODIFIED ---
        sku: getFormattedId(arr[i]), // Rakuten uses SKU as the main ID
        // --- END MODIFIED ---
        product_name: arr[i][keyNm],
        quantity: qt,
        amount: price > 0 ? price : toFixed2(p * 100 * qt),
        optional_data: {}
      };

      if (keyCatList.length > 0) {
        let catArr = [];
        keyCatList.forEach((element) => catArr.push(arr[i][element]));
        itemObj.optional_data = { category: catArr.join(' > ') };
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
      sku: 'Discount',
      quantity: '0',
      amount: toFixed2((totalDiscount - totalDiscount * 2) * 100),
      product_name: 'Discount'
    });
  }

  return items;
}

/*==============================================================================
  Helpers
==============================================================================*/

// --- NEW HELPER FUNCTION ---
// This function builds the ID based on the user's selection
function getFormattedId(item) {
  // 1. Get the default ID (from the 'keyId' field) as a fallback
  const defaultId = item[keyId] ? makeString(item[keyId]) : undefined;

  // 2. Check the format dropdown
  switch (idFormat) {
    case 'sku':
      // Use 'keySku' field if available, otherwise fall back to default
      return item[keySku] ? makeString(item[keySku]) : defaultId;

    case 'variantId':
      // Use 'keyVariantId' field if available, otherwise fall back to default
      return item[keyVariantId] ? makeString(item[keyVariantId]) : defaultId;

    case 'customShopify':
      // Use 'keyId' (as Product) and 'keyVariantId' (as Variant)
      const prodId = item[keyId];
      const varId = item[keyVariantId];

      if (prodId && varId) {
        // Build the custom string
        return 'shopify_' + market + '_' + makeString(prodId) + '_' + makeString(varId);
      }
      // If data is missing, fall back to default
      return defaultId;
    
    case 'default':
    default:
      // Return the default ID
      return defaultId;
  }
}
// --- END NEW HELPER FUNCTION ---

function toFixed2(num) {
  return math.round(num * 100) / 100;
}

function endsWith(str, suffix) {
  return str.indexOf(suffix, str.length - suffix.length) !== -1;
}


___TESTS___

scenarios: []


___NOTES___

Created on 12/10/2021, 11:11:20


