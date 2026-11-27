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
  "categories": [
    "UTILITY",
    "CONVERSIONS",
    "REMARKETING"
  ],
  "description": "Maps an array of products to the format each supported platform expects. By stape.io.",
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
        "displayValue": "Meta Pixel / Conversions API"
      },
      {
        "value": "ga4",
        "displayValue": "Google Analytics 4"
      },
      {
        "value": "tiktok",
        "displayValue": "TikTok Pixel / Events API"
      },
      {
        "value": "twitter",
        "displayValue": "X (Twitter) Pixel / Conversion API"
      },
      {
        "value": "microsoft",
        "displayValue": "Microsoft Advertising UET"
      },
      {
        "value": "klaviyo",
        "displayValue": "Klaviyo Onsite Tracking"
      },
      {
        "value": "snap",
        "displayValue": "Snapchat Pixel"
      },
      {
        "value": "gAdsOff",
        "displayValue": "Google Ads Offline Conversions"
      },
      {
        "value": "pinterest",
        "displayValue": "Pinterest Tag"
      },
      {
        "value": "rakuten",
        "displayValue": "Rakuten Advertising"
      },
      {
        "value": "criteo",
        "displayValue": "Criteo OneTag"
      },
      {
        "value": "reddit",
        "displayValue": "Reddit Pixel"
      },
      {
        "value": "openai",
        "displayValue": "OpenAI (ChatGPT Ads) Measurement Pixel"
      },
      {
        "value": "generic",
        "displayValue": "Generic (Item ID Builder)"
      }
    ],
    "simpleValueType": true,
    "help": "The platform to format the parameter for."
  },
  {
    "type": "GROUP",
    "name": "returnParametersGroup",
    "displayName": "",
    "groupStyle": "NO_ZIPPY",
    "subParams": [
      {
        "type": "RADIO",
        "name": "meta_task",
        "displayName": "What to return",
        "radioItems": [
          {
            "value": "contents",
            "displayValue": "contents [ { } ]"
          },
          {
            "value": "ids",
            "displayValue": "content_ids [ ]"
          },
          {
            "value": "name",
            "displayValue": "content_name \u0027 \u0027",
            "help": "Returns a value only when the product array has one object, because content_name applies only to single-product events."
          },
          {
            "value": "value",
            "displayValue": "value",
            "help": "Calculated from product prices and quantities, without discounts. Not recommended for purchase events."
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
            "help": "Calculated from product prices and quantities, without discounts. Not recommended for purchase events."
          },
          {
            "value": "items",
            "displayValue": "items [ { } ]",
            "help": ""
          },
          {
            "value": "ids",
            "displayValue": "ecomm_prodid",
            "help": "For Google Ads remarketing."
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
            "help": "Calculated from product prices and quantities, without discounts. Not recommended for purchase events."
          },
          {
            "value": "items",
            "displayValue": "items [ { } ]"
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
            "help": "Calculated from product prices and quantities, without discounts. Not recommended for purchase events."
          },
          {
            "value": "item",
            "displayValue": "item",
            "help": "For the Viewed Product event."
          },
          {
            "value": "items",
            "displayValue": "items [ { } ]"
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
            "help": "Calculated from product prices and quantities, without discounts. Not recommended for purchase events."
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
            "displayValue": "contents [ { } ]",
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
                "help": "Use product or product_group, as the TikTok Events API requires.",
                "defaultValue": "product",
                "enablingConditions": []
              }
            ]
          },
          {
            "value": "name",
            "displayValue": "content_name \u0027 \u0027",
            "help": "Returns a value only when the product array has one object, because content_name applies only to single-product events."
          },
          {
            "value": "value",
            "displayValue": "value",
            "help": "Calculated from product prices and quantities, without discounts. Not recommended for purchase events."
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
            "displayValue": "contents [ { } ]"
          },
          {
            "value": "value",
            "displayValue": "value",
            "subParams": [],
            "help": "Calculated from product prices and quantities, without discounts. Not recommended for purchase events."
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
            "displayValue": "items [ { } ]"
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
            "displayValue": "line_items [ { } ]"
          },
          {
            "value": "value",
            "displayValue": "value",
            "subParams": [],
            "help": "Calculated from product prices and quantities, without discounts. Not recommended for purchase events."
          },
          {
            "value": "ids",
            "displayValue": "content_ids [ ]"
          },
          {
            "value": "contents",
            "displayValue": "contents [ { } ]"
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
            "help": "Calculated from product prices and quantities, without discounts. Not recommended for purchase events."
          },
          {
            "value": "ids",
            "displayValue": "item_ids [ ]"
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
            "help": "Calculated from product prices and quantities, without discounts. Not recommended for purchase events."
          },
          {
            "value": "numitems",
            "displayValue": "itemCount",
            "subParams": []
          },
          {
            "value": "items",
            "displayValue": "products [ { } ]"
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
        "type": "RADIO",
        "name": "openai_task",
        "displayName": "What to return",
        "radioItems": [
          {
            "value": "contents",
            "displayValue": "contents [ { } ]",
            "help": "Returns a list of product objects, as described in the \u003ca href\u003d\"https://developers.openai.com/ads/supported-events#contents\"\u003eofficial documentation\u003c/a\u003e as of June 2026.",
            "subParams": [
              {
                "type": "SELECT",
                "name": "contentTypeOpenAI",
                "displayName": "content_type parameter",
                "macrosInSelect": false,
                "selectItems": [
                  {
                    "value": "product",
                    "displayValue": "product"
                  },
                  {
                    "value": "plan",
                    "displayValue": "plan"
                  },
                  {
                    "value": "page",
                    "displayValue": "page"
                  }
                ],
                "simpleValueType": true,
                "help": "Choose \u003cb\u003eproduct\u003c/b\u003e, \u003cb\u003eplan\u003c/b\u003e or \u003cb\u003epage\u003c/b\u003e.",
                "defaultValue": "product",
                "enablingConditions": [
                  {
                    "paramName": "platform",
                    "paramValue": "openai",
                    "type": "EQUALS"
                  }
                ],
                "valueValidators": [
                  {
                    "type": "NON_EMPTY"
                  }
                ]
              }
            ]
          },
          {
            "value": "value",
            "displayValue": "amount",
            "subParams": [],
            "help": "Returns the total value in the currency\u0027s minor unit, as described in the \u003ca href\u003d\"https://developers.openai.com/ads/supported-events#contents\"\u003eofficial documentation\u003c/a\u003e as of June 2026."
          }
        ],
        "simpleValueType": true,
        "enablingConditions": [
          {
            "paramName": "platform",
            "paramValue": "openai",
            "type": "EQUALS"
          }
        ],
        "help": "As described in the \u003ca href\u003d\"https://developers.openai.com/ads/supported-events\"\u003eofficial documentation\u003c/a\u003e."
      },
      {
        "type": "RADIO",
        "name": "generic_task",
        "displayName": "What to return",
        "radioItems": [
          {
            "value": "items",
            "displayValue": "items [ { } ]",
            "help": "Returns the Input Array items with all their keys, with the Product ID/SKU Key replaced by the rebuilt Product ID."
          },
          {
            "value": "ids",
            "displayValue": "ids [ ]",
            "help": "Returns a flat array of the rebuilt Product IDs, e.g. for Meta \u003ci\u003econtent_ids\u003c/i\u003e."
          }
        ],
        "simpleValueType": true,
        "enablingConditions": [
          {
            "paramName": "platform",
            "paramValue": "generic",
            "type": "EQUALS"
          }
        ],
        "defaultValue": "items"
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
        "help": "Any array of item objects [{}].",
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
        "displayName": "Product ID/SKU Key",
        "simpleValueType": true,
        "valueValidators": [
          {
            "type": "NON_EMPTY"
          }
        ],
        "valueHint": "item_id"
      },
      {
        "type": "CHECKBOX",
        "name": "useAdditionalKeyId",
        "checkboxText": "Use an additional Product ID/SKU Key",
        "simpleValueType": true,
        "subParams": [
          {
            "type": "TEXT",
            "name": "keyIdAdditional",
            "displayName": "Additional Product ID/SKU Key",
            "simpleValueType": true,
            "valueValidators": [
              {
                "type": "NON_EMPTY"
              }
            ],
            "enablingConditions": [
              {
                "paramName": "useAdditionalKeyId",
                "paramValue": true,
                "type": "EQUALS"
              }
            ],
            "valueHint": "productId"
          }
        ],
        "help": "When enabled, the Product ID is read from this key first. If the item has no value there, the Product ID/SKU Key above is used."
      },
      {
        "type": "CHECKBOX",
        "name": "formatIdInShopifyFormat",
        "checkboxText": "Format Product ID in Shopify Product Feed format",
        "simpleValueType": true,
        "help": "When enabled, the Product ID is formatted as:\u003cbr/\u003e\u003ci\u003eshopify_{Market Code}_{Product ID/SKU}_{Variant ID}\u003c/i\u003e\u003cbr/\u003e\u003cbr/\u003eThe value is formatted only when both the Product ID/SKU and the Product Variant ID are found. Otherwise, the Product ID/SKU is returned unchanged.\u003cbr/\u003e\u003cbr/\u003eFor multi-market stores or other formats, use the \u003cstrong\u003eItem ID Builder\u003c/strong\u003e section instead.",
        "subParams": [
          {
            "type": "TEXT",
            "name": "shopifyKeyVariant",
            "displayName": "Product Variant ID Key",
            "simpleValueType": true,
            "valueValidators": [
              {
                "type": "NON_EMPTY"
              }
            ],
            "enablingConditions": [
              {
                "paramName": "formatIdInShopifyFormat",
                "paramValue": true,
                "type": "EQUALS"
              }
            ],
            "valueHint": "variant_id"
          },
          {
            "type": "TEXT",
            "name": "shopifyMarketCode",
            "displayName": "Shopify Market Code",
            "simpleValueType": true,
            "valueHint": "US",
            "help": "ISO country code of the Shopify market, e.g. BR, GB or US. Use ZZ if your feed comes from the new Merchant API.",
            "enablingConditions": [
              {
                "paramName": "formatIdInShopifyFormat",
                "paramValue": true,
                "type": "EQUALS"
              }
            ],
            "valueValidators": [
              {
                "type": "NON_EMPTY"
              }
            ]
          }
        ],
        "enablingConditions": [
          {
            "paramName": "buildIdFromPattern",
            "paramValue": true,
            "type": "NOT_EQUALS"
          }
        ]
      },
      {
        "type": "TEXT",
        "name": "keyNm",
        "displayName": "Product Name Key",
        "simpleValueType": true,
        "valueValidators": [
          {
            "type": "NON_EMPTY"
          }
        ],
        "valueHint": "item_name",
        "enablingConditions": [
          {
            "paramName": "platform",
            "paramValue": "generic",
            "type": "NOT_EQUALS"
          }
        ]
      },
      {
        "type": "TEXT",
        "name": "keyPr",
        "displayName": "Product Price Key",
        "simpleValueType": true,
        "valueValidators": [
          {
            "type": "NON_EMPTY"
          }
        ],
        "valueHint": "price",
        "enablingConditions": [
          {
            "paramName": "platform",
            "paramValue": "generic",
            "type": "NOT_EQUALS"
          }
        ]
      },
      {
        "type": "TEXT",
        "name": "keyQt",
        "displayName": "Product Quantity Key",
        "simpleValueType": true,
        "valueValidators": [
          {
            "type": "NON_EMPTY"
          }
        ],
        "valueHint": "quantity",
        "enablingConditions": [
          {
            "paramName": "platform",
            "paramValue": "generic",
            "type": "NOT_EQUALS"
          }
        ]
      },
      {
        "type": "TEXT",
        "name": "keyCat",
        "displayName": "Product Category Key",
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
        ],
        "valueHint": "category"
      },
      {
        "type": "TEXT",
        "name": "keyImg",
        "displayName": "Product Image URL Key",
        "simpleValueType": true,
        "enablingConditions": [
          {
            "paramName": "platform",
            "paramValue": "klaviyo",
            "type": "EQUALS"
          }
        ],
        "valueHint": "image_url"
      },
      {
        "type": "TEXT",
        "name": "keyCurrency",
        "displayName": "Currency Key",
        "simpleValueType": true,
        "enablingConditions": [
          {
            "paramName": "platform",
            "paramValue": "openai",
            "type": "EQUALS"
          }
        ],
        "help": "Key of the currency. It is read from the item and, if not found there, from the dataLayer.",
        "valueValidators": [
          {
            "type": "NON_EMPTY"
          }
        ],
        "valueHint": "currency"
      },
      {
        "type": "CHECKBOX",
        "name": "buildCatTree",
        "checkboxText": "Build Rakuten Category Tree",
        "simpleValueType": true,
        "help": "Joins several category keys into one string, e.g. \u003ci\u003ecat1 \u003e cat2 \u003e cat3\u003c/i\u003e.",
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
        "displayName": "Category Keys",
        "simpleValueType": true,
        "help": "Comma-separated, in tree order, e.g. \u003ci\u003ecat_key,mykey,custom_var_7\u003c/i\u003e.",
        "enablingConditions": [
          {
            "paramName": "buildCatTree",
            "paramValue": true,
            "type": "EQUALS"
          }
        ]
      }
    ],
    "help": "Input Array keys to read each parameter from."
  },
  {
    "type": "GROUP",
    "name": "idBuilderGroup",
    "displayName": "Item ID Builder",
    "groupStyle": "ZIPPY_OPEN_ON_PARAM",
    "subParams": [
      {
        "type": "CHECKBOX",
        "name": "buildIdFromPattern",
        "checkboxText": "Build Product ID from a pattern",
        "simpleValueType": true,
        "help": "When enabled, the Product ID is rebuilt from the \u003cstrong\u003eID Pattern\u003c/strong\u003e below, so it matches the IDs in your Google Merchant Center, Meta or TikTok catalog.\u003cbr/\u003e\u003cbr/\u003eExample: \u003ci\u003eshopify_{country}_{item_id}_{variant}\u003c/i\u003e returns \u003ci\u003eshopify_SE_8123456789_44556677\u003c/i\u003e.\u003cbr/\u003e\u003cbr/\u003eTakes precedence over the Shopify Product Feed format option.",
        "subParams": [
          {
            "type": "TEXT",
            "name": "idPattern",
            "displayName": "ID Pattern",
            "simpleValueType": true,
            "valueHint": "shopify_{country}_{item_id}_{variant}",
            "valueValidators": [
              {
                "type": "NON_EMPTY"
              }
            ],
            "enablingConditions": [
              {
                "paramName": "buildIdFromPattern",
                "paramValue": true,
                "type": "EQUALS"
              }
            ],
            "help": "Text with tokens in curly braces. Each \u003ci\u003e{token}\u003c/i\u003e is replaced, in this order, by:\u003cbr/\u003e1. \u003cstrong\u003e{id}\u003c/strong\u003e: the Product ID read with the Product ID/SKU Key (or the Additional Product ID/SKU Key, if enabled).\u003cbr/\u003e2. The Hostname Lookup value, if the token matches its Token Name.\u003cbr/\u003e3. A row with the same name in \u003cstrong\u003ePattern Variables\u003c/strong\u003e.\u003cbr/\u003e4. Otherwise, the item key with the same name, e.g. \u003ci\u003e{item_id}\u003c/i\u003e or \u003ci\u003e{item_variant}\u003c/i\u003e. Nested keys use dots, e.g. \u003ci\u003e{variant.id}\u003c/i\u003e.\u003cbr/\u003e\u003cbr/\u003eText outside curly braces is kept as written. A pattern with no token is ignored, as if a token were missing."
          },
          {
            "type": "SIMPLE_TABLE",
            "name": "idPatternVariables",
            "displayName": "Pattern Variables",
            "simpleTableColumns": [
              {
                "defaultValue": "",
                "displayName": "Token Name",
                "name": "name",
                "type": "TEXT",
                "isUnique": true,
                "valueHint": "country",
                "valueValidators": [
                  {
                    "type": "NON_EMPTY"
                  },
                  {
                    "type": "REGEX",
                    "args": [
                      "^(.?|.{3,}|[^i].|i[^d])$"
                    ],
                    "errorMessage": "The Token Name id is reserved for the original Product ID."
                  }
                ]
              },
              {
                "defaultValue": "value",
                "displayName": "Source",
                "name": "source",
                "type": "SELECT",
                "selectItems": [
                  {
                    "value": "value",
                    "displayValue": "Value (text or variable)"
                  },
                  {
                    "value": "itemKey",
                    "displayValue": "Item key"
                  }
                ]
              },
              {
                "defaultValue": "",
                "displayName": "Value",
                "name": "value",
                "type": "TEXT",
                "valueHint": "SE"
              }
            ],
            "newRowButtonText": "Add variable",
            "enablingConditions": [
              {
                "paramName": "buildIdFromPattern",
                "paramValue": true,
                "type": "EQUALS"
              }
            ],
            "help": "Defines tokens used in the ID Pattern.\u003cbr/\u003e\u003cstrong\u003eValue\u003c/strong\u003e: the token is replaced by the text or GTM variable in the Value column, e.g. \u003ci\u003ecountry\u003c/i\u003e \u003d \u003ci\u003eSE\u003c/i\u003e or \u003ci\u003e{{Market}}\u003c/i\u003e.\u003cbr/\u003e\u003cstrong\u003eItem key\u003c/strong\u003e: the token is replaced by that key of each item, e.g. \u003ci\u003evariant\u003c/i\u003e \u003d \u003ci\u003eitem_variant\u003c/i\u003e.\u003cbr/\u003eThe Token Name \u003ci\u003eid\u003c/i\u003e is reserved for the original Product ID."
          },
          {
            "type": "CHECKBOX",
            "name": "useHostnameLookup",
            "checkboxText": "Fill a token from a hostname lookup table",
            "simpleValueType": true,
            "enablingConditions": [
              {
                "paramName": "buildIdFromPattern",
                "paramValue": true,
                "type": "EQUALS"
              }
            ],
            "help": "Use it for multi-market stores where each domain has its own feed, e.g. \u003ci\u003eshop.no\u003c/i\u003e \u003d \u003ci\u003eNO\u003c/i\u003e, \u003ci\u003eshop.se\u003c/i\u003e \u003d \u003ci\u003eSE\u003c/i\u003e. Hostnames are compared in lower case and without a leading \u003ci\u003ewww.\u003c/i\u003e.",
            "subParams": [
              {
                "type": "TEXT",
                "name": "hostnameLookupToken",
                "displayName": "Token Name",
                "simpleValueType": true,
                "defaultValue": "country",
                "valueValidators": [
                  {
                    "type": "NON_EMPTY"
                  }
                ],
                "enablingConditions": [
                  {
                    "paramName": "useHostnameLookup",
                    "paramValue": true,
                    "type": "EQUALS"
                  }
                ],
                "help": "The token this lookup fills, e.g. \u003ci\u003ecountry\u003c/i\u003e for \u003ci\u003e{country}\u003c/i\u003e."
              },
              {
                "type": "SIMPLE_TABLE",
                "name": "hostnameLookupTable",
                "displayName": "Hostname Lookup Table",
                "simpleTableColumns": [
                  {
                    "defaultValue": "",
                    "displayName": "Hostname",
                    "name": "hostname",
                    "type": "TEXT",
                    "isUnique": true,
                    "valueHint": "shop.no",
                    "valueValidators": [
                      {
                        "type": "NON_EMPTY"
                      }
                    ]
                  },
                  {
                    "defaultValue": "",
                    "displayName": "Token Value",
                    "name": "tokenValue",
                    "type": "TEXT",
                    "valueHint": "NO"
                  }
                ],
                "newRowButtonText": "Add hostname",
                "enablingConditions": [
                  {
                    "paramName": "useHostnameLookup",
                    "paramValue": true,
                    "type": "EQUALS"
                  }
                ]
              },
              {
                "type": "TEXT",
                "name": "hostnameLookupDefault",
                "displayName": "Default Value",
                "simpleValueType": true,
                "help": "Used when no hostname matches, or when the matching row has an empty Token Value. If empty, the token counts as missing.",
                "enablingConditions": [
                  {
                    "paramName": "useHostnameLookup",
                    "paramValue": true,
                    "type": "EQUALS"
                  }
                ]
              },
              {
                "type": "TEXT",
                "name": "hostnameLookupSource",
                "displayName": "Hostname (optional)",
                "simpleValueType": true,
                "help": "Leave empty to use the hostname of the current page. Set a hostname or URL variable to look up another value.",
                "enablingConditions": [
                  {
                    "paramName": "useHostnameLookup",
                    "paramValue": true,
                    "type": "EQUALS"
                  }
                ]
              }
            ]
          },
          {
            "type": "CHECKBOX",
            "name": "stripShopifyGid",
            "checkboxText": "Strip Shopify GID prefixes",
            "simpleValueType": true,
            "defaultValue": true,
            "enablingConditions": [
              {
                "paramName": "buildIdFromPattern",
                "paramValue": true,
                "type": "EQUALS"
              }
            ],
            "help": "Token values like \u003ci\u003egid://shopify/ProductVariant/44556677\u003c/i\u003e become \u003ci\u003e44556677\u003c/i\u003e. The same applies to an original Product ID kept because a token is missing."
          },
          {
            "type": "RADIO",
            "name": "onMissingToken",
            "displayName": "If a token is missing or empty",
            "radioItems": [
              {
                "value": "original",
                "displayValue": "Keep the original Product ID"
              },
              {
                "value": "fallback",
                "displayValue": "Use a fallback pattern",
                "subParams": [
                  {
                    "type": "TEXT",
                    "name": "idFallbackPattern",
                    "displayName": "Fallback ID Pattern",
                    "simpleValueType": true,
                    "valueHint": "shopify_{country}_{item_id}",
                    "valueValidators": [
                      {
                        "type": "NON_EMPTY"
                      }
                    ],
                    "help": "Same syntax as the ID Pattern. If a token is missing here too, the original Product ID is kept."
                  }
                ]
              }
            ],
            "simpleValueType": true,
            "defaultValue": "original",
            "enablingConditions": [
              {
                "paramName": "buildIdFromPattern",
                "paramValue": true,
                "type": "EQUALS"
              }
            ]
          }
        ]
      }
    ]
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
        "displayName": "Discount Source",
        "macrosInSelect": false,
        "selectItems": [
          {
            "value": "item_level",
            "displayValue": "From item level"
          },
          {
            "value": "order_level",
            "displayValue": "From order level"
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
        "displayName": "Item-Level Discount Key",
        "simpleValueType": true,
        "enablingConditions": [
          {
            "paramName": "discConfig",
            "paramValue": "item_level",
            "type": "EQUALS"
          }
        ],
        "help": "Input Array key of the item\u0027s discount."
      },
      {
        "type": "TEXT",
        "name": "discOrderLevel",
        "displayName": "Order-Level Discount Amount",
        "simpleValueType": true,
        "help": "Discount amount for the whole order.",
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
        "displayName": "Item Price Tax",
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
        "displayName": "Discount Tax",
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
        "help": "A number without the % sign, e.g. 20.",
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
        "simpleTableColumns": [
          {
            "defaultValue": "",
            "displayName": "Input Array Key",
            "name": "cusKey",
            "type": "TEXT"
          },
          {
            "defaultValue": "",
            "displayName": "Output Key",
            "name": "cusName",
            "type": "TEXT"
          }
        ],
        "newRowButtonText": "Add Custom Parameter",
        "alwaysInSummary": false,
        "help": "Item keys to add to each output item."
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

const copyFromDataLayer = require('copyFromDataLayer');
const getUrl = require('getUrl');
const makeInteger = require('makeInteger');
const makeNumber = require('makeNumber');
const makeString = require('makeString');
const makeTableMap = require('makeTableMap');
const getType = require('getType');
const Math = require('Math');
const Object = require('Object');
const parseUrl = require('parseUrl');

/*==============================================================================
==============================================================================*/

const keyId = data.keyId;
const keyPr = data.keyPr;
const keyNm = data.keyNm;
const keyQt = data.keyQt;
const keyCat = data.keyCat;
const keyImg = data.keyImg;
const taxDeductPercent = toFixed2(makeNumber(data.taxDeductPercent));
const keyDisc = data.keyDiscItemLevel;
const customParamMap = data.customParams
  ? makeTableMap(data.customParams, 'cusKey', 'cusName')
  : {};
const keyCatList = data.keyCatList ? data.keyCatList.split(',') : [];
const inputArray = data.orderItems;
const idBuilder = data.buildIdFromPattern ? createIdBuilder() : undefined;

if (getType(inputArray) === 'array' && inputArray.length) return runTask();
else return;

/*==============================================================================
  Vendor related functions
==============================================================================*/

function runTask() {
  const platform = data.platform;
  if (platform === 'generic') {
    return data.generic_task === 'ids' ? getContentIds(inputArray) : getGenericItems(inputArray);
  }

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

function getId(item) {
  let id = item[keyId];

  if (data.useAdditionalKeyId && data.keyIdAdditional && item[data.keyIdAdditional]) {
    id = item[data.keyIdAdditional];
  }

  if (idBuilder) return buildItemId(item, id);

  if (data.formatIdInShopifyFormat && data.shopifyKeyVariant && item[data.shopifyKeyVariant]) {
    const marketCode = data.shopifyMarketCode || 'ZZ';
    if (id) id = 'shopify_' + marketCode + '_' + id + '_' + item[data.shopifyKeyVariant];
  }

  return id;
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
  const content_ids = arr.map((item) => getId(item));
  return content_ids;
}

function getItem(arr) {
  let cat = [];
  cat.push(arr[0][keyCat]);

  let item = {
    ProductID: getId(arr[0]),
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

  const platform = data.platform;
  if (platform === 'openai') {
    const keyCurrency = data.keyCurrency || 'currency';
    const currency = arr[0][keyCurrency] || copyFromDataLayer(keyCurrency);
    return convertCurrencyValueToMinorUnit(value, currency);
  }

  return toFixed2(value);
}

function getContents(arr, platform) {
  let contents = [];

  for (let i = 0; i < arr.length; i++) {
    let qt = 1;
    if (arr[i][keyQt]) qt = makeNumber(arr[i][keyQt]);

    if (platform === 'meta') {
      contents.push({
        id: getId(arr[i]),
        quantity: qt,
        item_price: arr[i][keyPr]
      });
    }

    if (platform === 'tiktok') {
      const contentType = data.contentType;
      const id = getId(arr[i]);
      contents.push({
        content_id: id ? makeString(id) : undefined,
        content_type: contentType,
        content_category: arr[i][keyCat],
        content_name: arr[i][keyNm],
        quantity: qt,
        price: arr[i][keyPr] ? makeNumber(arr[i][keyPr]) : 0
      });
    }

    if (platform === 'twitter') {
      contents.push({
        content_id: getId(arr[i]),
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
      });
    }

    if (platform === 'openai') {
      const keyCurrency = data.keyCurrency || 'currency';
      const contentType = data.contentTypeOpenAI;
      const id = getId(arr[i]);
      const amount = arr[i][keyPr] ? makeNumber(arr[i][keyPr]) : 0;
      const currency = arr[i][keyCurrency] || copyFromDataLayer(keyCurrency);
      contents.push({
        id: id ? makeString(id) : undefined,
        name: arr[i][keyNm] ? makeString(arr[i][keyNm]) : undefined,
        quantity: qt,
        amount: convertCurrencyValueToMinorUnit(amount, currency),
        content_type: contentType,
        currency: currency
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
        item_id: getId(arr[i]),
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
        ProductID: getId(arr[i]),
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
        id: getId(arr[i]),
        quantity: qt,
        price: arr[i][keyPr]
      };

      items.push(itemObj);
    }

    if (platform === 'gAdsOff') {
      const id = getId(arr[i]);
      items.push({
        productId: id ? makeString(id) : undefined,
        quantity: qt,
        unitPrice: makeNumber(arr[i][keyPr])
      });
    }

    if (platform === 'pinterest') {
      items.push({
        product_id: getId(arr[i]),
        product_name: arr[i][keyNm],
        product_quantity: qt,
        product_price: arr[i][keyPr] ? makeNumber(arr[i][keyPr]) : 0
      });
    }

    if (platform === 'reddit') {
      const id = getId(arr[i]);
      items.push({
        id: id ? makeString(id) : undefined,
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
        price = toFixed2(tmp) * 100 * qt;
        price = toFixed2(price);
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
        sku: getId(arr[i]),
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

function toFixed2(value) {
  if (!value) return value;
  return Math.round(makeNumber(value) * 100) / 100;
}

function endsWith(str, suffix) {
  return str.indexOf(suffix, str.length - suffix.length) !== -1;
}

function convertCurrencyValueToMinorUnit(value, currency) {
  if (!value) return value;

  // prettier-ignore
  const zeroDecimalCurrencies = [
    'BIF', 'CLP', 'DJF', 'GNF', 'IDR', 'ISK',
    'JPY', 'KMF', 'KRW', 'MGA', 'PYG', 'RWF',
    'UGX', 'VND', 'VUV', 'XAF', 'XOF', 'XPF'
  ];
  const threeDecimalCurrencies = ['BHD', 'IQD', 'JOD', 'KWD', 'LYD', 'OMR', 'TND'];
  const upperCurrency = currency ? makeString(currency).toUpperCase() : '';

  let multiplier = 100; // default: 2 decimal places (BRL, USD, EUR, GBP, etc.)
  if (zeroDecimalCurrencies.indexOf(upperCurrency) !== -1) multiplier = 1;
  else if (threeDecimalCurrencies.indexOf(upperCurrency) !== -1) multiplier = 1000;

  return makeInteger(toFixed2(value * multiplier));
}

/*==============================================================================
  Item ID Builder
==============================================================================*/

function getGenericItems(inputArray) {
  return inputArray.map((item) => {
    if (getType(item) !== 'object') return item;
    const genericItem = {};
    Object.keys(item).forEach((key) => {
      genericItem[key] = item[key];
    });
    const id = getId(item);
    if (id !== undefined) genericItem[keyId] = id;
    return genericItem;
  });
}

function createIdBuilder() {
  const variables = {};
  (data.idPatternVariables || []).forEach((row) => {
    if (row && row.name) variables[makeString(row.name).trim()] = row;
  });

  return {
    pattern: parsePattern(data.idPattern),
    fallbackPattern:
      data.onMissingToken === 'fallback' ? parsePattern(data.idFallbackPattern) : undefined,
    variables: variables,
    hostnameToken: data.useHostnameLookup
      ? makeString(data.hostnameLookupToken || '').trim() || 'country'
      : undefined,
    hostnameValue: data.useHostnameLookup ? lookupHostnameValue() : undefined
  };
}

function parsePattern(pattern) {
  if (pattern === undefined || pattern === null || pattern === '') return undefined;
  pattern = makeString(pattern);

  const parts = [];
  let hasToken = false;
  let cursor = 0;
  while (cursor < pattern.length) {
    const close = pattern.indexOf('}', cursor);
    const open = close === -1 ? -1 : pattern.lastIndexOf('{', close);
    const tokenName = open >= cursor ? pattern.substring(open + 1, close).trim() : '';

    if (!tokenName) {
      const end = close === -1 ? pattern.length : close + 1;
      parts.push({ text: pattern.substring(cursor, end) });
      cursor = end;
    } else {
      if (open > cursor) parts.push({ text: pattern.substring(cursor, open) });
      parts.push({ token: tokenName });
      hasToken = true;
      cursor = close + 1;
    }
  }
  return hasToken ? parts : undefined;
}

function buildItemId(item, originalId) {
  let id = buildIdFromParts(idBuilder.pattern, item, originalId);
  if (id === undefined) id = buildIdFromParts(idBuilder.fallbackPattern, item, originalId);
  return id === undefined ? stripShopifyGid(originalId) : id;
}

function buildIdFromParts(parts, item, originalId) {
  if (!parts) return undefined;

  let id = '';
  for (let i = 0; i < parts.length; i++) {
    if (parts[i].token) {
      const value = resolveToken(parts[i].token, item, originalId);
      if (value === undefined) return undefined;
      id += value;
    } else {
      id += parts[i].text;
    }
  }
  return id;
}

function resolveToken(name, item, originalId) {
  let value;
  if (name === 'id') {
    value = originalId;
  } else if (name === idBuilder.hostnameToken) {
    value = idBuilder.hostnameValue;
  } else if (idBuilder.variables.hasOwnProperty(name)) {
    const variable = idBuilder.variables[name];
    value =
      variable.source === 'itemKey'
        ? getItemValue(item, makeString(variable.value || '').trim())
        : variable.value;
  } else {
    value = getItemValue(item, name);
  }
  return cleanTokenValue(value);
}

function getItemValue(item, path) {
  if (!path) return undefined;
  if (item[path] !== undefined) return item[path];

  const keys = path.split('.');
  let value = item;
  for (let i = 0; i < keys.length; i++) {
    const type = getType(value);
    if (type !== 'object' && type !== 'array') return undefined;
    value = value[keys[i]];
  }
  return value;
}

function cleanTokenValue(value) {
  const type = getType(value);
  if (type !== 'string' && type !== 'number' && type !== 'boolean') return undefined;

  const stringValue = stripShopifyGid(makeString(value).trim());
  return stringValue === '' ? undefined : stringValue;
}

function stripShopifyGid(value) {
  if (!data.stripShopifyGid || getType(value) !== 'string' || value.indexOf('gid://') !== 0) {
    return value;
  }
  return value.substring(value.lastIndexOf('/') + 1);
}

function lookupHostnameValue() {
  const hostname = normalizeHostname(data.hostnameLookupSource || getUrl('host'));
  const rows = data.hostnameLookupTable || [];
  for (let i = 0; i < rows.length; i++) {
    if (hostname && normalizeHostname(rows[i].hostname) === hostname) {
      const value = rows[i].tokenValue;
      if (value !== undefined && value !== null && makeString(value).trim() !== '') return value;
      break;
    }
  }
  return data.hostnameLookupDefault;
}

function normalizeHostname(hostname) {
  if (!hostname) return '';
  let host = makeString(hostname).trim().toLowerCase();
  if (host.indexOf('://') !== -1) {
    const url = parseUrl(host);
    host = url && url.hostname ? url.hostname : '';
  }
  if (host.indexOf('www.') === 0) host = host.substring(4);
  return host;
}


___WEB_PERMISSIONS___

[
  {
    "instance": {
      "key": {
        "publicId": "read_data_layer",
        "versionId": "1"
      },
      "param": [
        {
          "key": "allowedKeys",
          "value": {
            "type": 1,
            "string": "any"
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  },
  {
    "instance": {
      "key": {
        "publicId": "get_url",
        "versionId": "1"
      },
      "param": [
        {
          "key": "urlParts",
          "value": {
            "type": 1,
            "string": "specific"
          }
        },
        {
          "key": "host",
          "value": {
            "type": 8,
            "boolean": true
          }
        },
        {
          "key": "queriesAllowed",
          "value": {
            "type": 1,
            "string": "any"
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  }
]


___TESTS___

scenarios:
- name: '[Generic] items keep every key and get the rebuilt ID'
  code: |-
    const result = runCode(createMockData({ generic_task: 'items' }));

    assertThat(result).isEqualTo([
      {
        item_id: 'shopify_SE_8123456789_44556677',
        item_variant: 'gid://shopify/ProductVariant/44556677',
        price: 10,
        quantity: 2
      }
    ]);
    assertThat(shopItem.item_id).isEqualTo('8123456789');
- name: '[Generic] ids return a flat array of rebuilt IDs'
  code: |-
    assertThat(runCode(createMockData())).isEqualTo(['shopify_SE_8123456789_44556677']);
- name: '[Generic] items without an ID or not objects are kept as they are'
  code: |-
    const result = runCode(
      createMockData({ generic_task: 'items', orderItems: [{ item_name: 'Shirt' }] })
    );

    assertThat(result).isEqualTo([{ item_name: 'Shirt' }]);

    const mixed = createMockData({ generic_task: 'items', idPattern: '{constructor}_{item_id}' });
    mixed.orderItems = ['not an object', { item_id: 1 }];
    assertThat(runCode(mixed)).isEqualTo(['not an object', { item_id: 1 }]);
- name: '[Platforms] Meta, TikTok and GA4 outputs use the rebuilt ID'
  code: |-
    const expectedId = 'shopify_SE_8123456789_44556677';
    const other = (overrides) => createMockData(assign({ generic_task: undefined }, overrides));

    const contentIds = runCode(other({ platform: 'meta', meta_task: 'ids' }));
    const metaContents = runCode(other({ platform: 'meta', meta_task: 'contents' }));
    const tiktokContents = runCode(other({ platform: 'tiktok', tiktok_task: 'contents' }));
    const ga4Items = runCode(other({ platform: 'ga4', ga4_task: 'items' }));

    assertThat(contentIds).isEqualTo([expectedId]);
    assertThat(metaContents[0].id).isEqualTo(expectedId);
    assertThat(tiktokContents[0].content_id).isEqualTo(expectedId);
    assertThat(ga4Items[0].item_id).isEqualTo(expectedId);
- name: '[Missing token] keeps the original ID or uses the fallback pattern'
  code: |-
    [
      { item: { item_id: '555' }, overrides: {}, expected: '555' },
      {
        item: { item_id: '555' },
        overrides: { onMissingToken: 'fallback', idFallbackPattern: 'shopify_{country}_{item_id}' },
        expected: 'shopify_SE_555'
      },
      {
        item: { item_id: 7 },
        overrides: { onMissingToken: 'fallback', idFallbackPattern: '{sku}' },
        expected: 7
      },
      { item: { item_id: '555', item_variant: '  ' }, overrides: {}, expected: '555' },
      { item: { item_id: '555', item_variant: null }, overrides: {}, expected: '555' },
      { item: { item_id: 'gid://shopify/Product/9' }, overrides: {}, expected: '9' },
      { item: { item_id: '555' }, overrides: { idPattern: 'EU-id' }, expected: '555' }
    ].forEach((scenario) => {
      const mockData = createMockData(scenario.overrides);
      mockData.orderItems = [scenario.item];

      assertThat(runCode(mockData)).isEqualTo([scenario.expected]);
    });
- name: '[Cleanup] GID strip on and off, and values become trimmed strings'
  code: |-
    assertThat(runCode(createMockData({ stripShopifyGid: false }))).isEqualTo([
      'shopify_SE_8123456789_gid://shopify/ProductVariant/44556677'
    ]);
    assertThat(
      runCode(createMockData({ idPattern: '{item_id}|{sku}', orderItems: [{ item_id: 42, sku: ' A1 ' }] }))
    ).isEqualTo(['42|A1']);
    assertThat(
      runCode(createMockData({ stripShopifyGid: false, orderItems: [{ item_id: 'gid://shopify/Product/9' }] }))
    ).isEqualTo(['gid://shopify/Product/9']);
    assertThat(
      runCode(
        createMockData({
          idPattern: '{v}',
          idPatternVariables: [{ name: 'v', source: 'itemKey', value: ' sku ' }],
          orderItems: [{ sku: 'A1' }]
        })
      )
    ).isEqualTo(['A1']);
- name: '[Tokens] id uses the Additional Key, dot paths read nested keys'
  code: |-
    const additional = createMockData({
      useAdditionalKeyId: true,
      keyIdAdditional: 'sku',
      idPattern: 'x_{id}',
      orderItems: [{ item_id: 1, sku: 'S1' }]
    });
    const nested = createMockData({
      idPattern: '{item_id}-{variant.id}-{variant.missing.key}',
      idPatternVariables: [],
      onMissingToken: 'fallback',
      idFallbackPattern: '{item_id}-{variant.id}',
      orderItems: [{ item_id: 1, variant: { id: 22 } }]
    });

    assertThat(runCode(additional)).isEqualTo(['x_S1']);
    assertThat(runCode(nested)).isEqualTo(['1-22']);
- name: '[Pattern] empty, unclosed and nested braces stay as literal text'
  code: |-
    const mockData = createMockData({ idPattern: 'a{}b_{item_id}_{x', orderItems: [{ item_id: 1 }] });
    const nested = createMockData({ idPattern: 'a{b{item_id}', orderItems: [{ item_id: 1 }] });

    assertThat(runCode(mockData)).isEqualTo(['a{}b_1_{x']);
    assertThat(runCode(nested)).isEqualTo(['a{b1']);
- name: '[Hostname] lookup from the page host (match, www, default, no match)'
  code: |-
    [
      { host: 'www.shop.no', expected: 'shopify_NO_8123456789_44556677' },
      { host: 'SHOP.de', expected: 'shopify_DE_8123456789_44556677' },
      { host: 'other.com', expected: '8123456789' },
      { host: undefined, expected: '8123456789' },
      { host: 'other.com', fallback: 'SE', expected: 'shopify_SE_8123456789_44556677' },
      { host: 'shop.fi', fallback: 'SE', expected: 'shopify_SE_8123456789_44556677' }
    ].forEach((scenario) => {
      pageHost = scenario.host;
      const mockData = createMockData({
        idPatternVariables: [{ name: 'variant', source: 'itemKey', value: 'item_variant' }],
        useHostnameLookup: true,
        hostnameLookupToken: 'country',
        hostnameLookupDefault: scenario.fallback,
        hostnameLookupTable: [
          { hostname: 'shop.no', tokenValue: 'NO' },
          { hostname: 'www.shop.de', tokenValue: 'DE' },
          { hostname: 'shop.fi', tokenValue: '' }
        ]
      });

      assertThat(runCode(mockData)).isEqualTo([scenario.expected]);
    });
- name: '[Hostname] override field wins over the page host'
  code: |-
    pageHost = 'shop.de';
    const mockData = createMockData({
      idPatternVariables: [{ name: 'variant', source: 'itemKey', value: 'item_variant' }],
      useHostnameLookup: true,
      hostnameLookupToken: ' market ',
      idPattern: '{market}_{item_id}',
      hostnameLookupTable: [
        { hostname: 'shop.no', tokenValue: 'NO' },
        { hostname: 'shop.de', tokenValue: 'DE' }
      ]
    });

    mockData.hostnameLookupSource = 'https://shop.no/page';
    assertThat(runCode(mockData)).isEqualTo(['NO_8123456789']);

    mockData.hostnameLookupSource = 'shop.no';
    assertThat(runCode(mockData)).isEqualTo(['NO_8123456789']);
- name: '[Legacy] Shopify format is unchanged and the builder takes precedence'
  code: |-
    const legacy = {
      platform: 'meta',
      meta_task: 'ids',
      orderItems: [shopItem],
      keyId: 'item_id',
      formatIdInShopifyFormat: true,
      shopifyKeyVariant: 'item_variant',
      shopifyMarketCode: 'SE'
    };

    assertThat(runCode(legacy)).isEqualTo([
      'shopify_SE_8123456789_gid://shopify/ProductVariant/44556677'
    ]);

    const both = createMockData(assign({ generic_task: undefined }, legacy));
    both.idPattern = 'built_{item_id}';
    assertThat(runCode(both)).isEqualTo(['built_8123456789']);
setup: |-
  const assign = (target, source) => {
    for (let key in source) target[key] = source[key];
    return target;
  };

  let pageHost;
  mock('getUrl', (component) => (component === 'host' ? pageHost : undefined));

  const shopItem = {
    item_id: '8123456789',
    item_variant: 'gid://shopify/ProductVariant/44556677',
    price: 10,
    quantity: 2
  };

  const createMockData = (overrides) =>
    assign(
      {
        platform: 'generic',
        generic_task: 'ids',
        orderItems: [shopItem],
        keyId: 'item_id',
        keyPr: 'price',
        keyQt: 'quantity',
        buildIdFromPattern: true,
        idPattern: 'shopify_{country}_{item_id}_{variant}',
        idPatternVariables: [
          { name: 'country', source: 'value', value: 'SE' },
          { name: 'variant', source: 'itemKey', value: 'item_variant' }
        ],
        stripShopifyGid: true,
        onMissingToken: 'original'
      },
      overrides || {}
    );


___NOTES___

2026-11-27 - Change Notes:
 - Add the Item ID Builder: rebuilds the Product ID from a pattern whose tokens come from item keys, Pattern Variables (text or GTM variables) or a hostname lookup table, so IDs match Merchant Center, Meta and TikTok catalogs (e.g. Shopify multi-market feeds).
 - Add Shopify GID prefix stripping, a missing-token strategy (keep the original Product ID or try a fallback pattern) and unit tests for the Item ID Builder.
 - Add the Generic platform, which returns the input items with the rebuilt Product ID (all other keys kept) or a flat array of rebuilt IDs; Name, Price and Quantity keys are hidden for it.
 - Add the get_url permission (host only), used by the hostname lookup when no Hostname is set.
 - Reword labels and help texts so they read consistently: Platform options use each pixel's or API's official name (e.g. TikTok Pixel / Events API, OpenAI (ChatGPT Ads) Measurement Pixel), checkbox labels drop the trailing question mark and help texts use full sentences.

2026-06-15 - Change Notes:
 - Add OpenAI Ads parameters.
 - Add additional source for Product ID/SKU.
 - Add Shopify Product ID Feed format support.

Created on 12/10/2021, 11:11:20

