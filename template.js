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
        'content_id': makeString(arr[i][keyId]),
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
    content_ids.push(makeString(arr[i][keyId]));
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