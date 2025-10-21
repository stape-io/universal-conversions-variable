const makeInteger = require('makeInteger');
const makeNumber = require('makeNumber');
const makeString = require('makeString');
const makeTableMap = require('makeTableMap');
const getType = require('getType');
const math = require('Math');
const Object = require('Object');

let keyId = data.keyId;
let keyPr = data.keyPr;
let keyNm = data.keyNm;
let keyQt = data.keyQt;
let keyCat = data.keyCat;
let keyImg = data.keyImg;
let contentType = data.contentType;
let taxDeductPercent = toFixed2(makeNumber(data.taxDeductPercent));
let task; 
let keyCatList = data.keyCatList ? data.keyCatList.split(',') : [];
let platform = data.platform;
let inputArray = data.orderItems;
const customParamMap = data.customParams ? makeTableMap(data.customParams, 'cusKey', 'cusName') : {};

let keyDisc = data.keyDiscItemLevel;
//let rakTax = makeNumber(data.rakTax);





/* Main Logic */

if (inputArray.length) return runTask();
else return;


function runTask() {
 let dataKeys = Object.keys(data);
 dataKeys.forEach(key => {
   if(key.indexOf('_task') > 0 && data[key]) task = data[key];
 });

  switch(task){
    case 'contents': return getContents(inputArray, platform);
    case 'ids': return getContentIds(inputArray);
    case 'name': return getContentName(inputArray);
    case 'value': return getValue(inputArray);
    case 'numitems': return getNumItems(inputArray);
    case 'items': return getItems(inputArray, platform);
    case 'item': return getItem(inputArray);
  }
}


function toFixed2(num){
   return math.round(num * 100) / 100;
}


function getNumItems(arr) {

  const num_items = arr.reduce((acc,curr)=>{return acc + curr[keyQt];},0);
    
  return num_items;
}


function getContentName(arr) {
  if(!arr.length) return;
  return arr[0][keyNm];
}


function getContentIds(arr) {

  let content_ids = arr.map(item => item[keyId]);

  return content_ids;
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


function getValue(arr) {
  
  let value = arr.reduce( (acc,curr) => {return acc + curr[keyQt]*curr[keyPr];},0); 

  return toFixed2(value);
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
    
    if (platform === 'reddit') {
      items.push({
      'id': arr[i][keyId],
      'category': arr[i][keyCat],
      'name': arr[i][keyNm]
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

