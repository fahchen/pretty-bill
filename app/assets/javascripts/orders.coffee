$ () ->
  if $('.order-items').length > 0
    update_total_cost

  $('#order_transacted_at').datetimepicker
    format: 'yyyy-mm-dd hh:ii::ss'
    autoclose: true
    startView: 1
    todayBtn: true
    todayHighlight: true
    forceParse: false

  $('.order-item-form').on 'change', '.js-order-item .product', (event) =>
    product_html = $(event.target)
    price_html = $(event.target).closest('.js-order-item').find('.price')
    quantity_html = $(event.target).closest('.js-order-item').find('.quantity')
    total_html = $(event.target).closest('.js-order-item').find('.total')

    merchant_id = location.pathname.match(///merchants\/(\d+)///)[1]
    product_id = $(event.target).val()

    $.get("/merchants/#{merchant_id}/products/#{product_id}.json").success (data, status, jqxhr)=>
      product = data
      price_html.val(product.price)
      update_total(product_html.closest('.js-order-item'))

  .on 'change', '.js-order-item .discount', (event) =>
    update_total($(event.target).closest('.js-order-item'))

    total_html.val(total)

  .on 'change', '.js-order-item .quantity', (event) =>
    update_total($(event.target).closest('.js-order-item'))

  .on 'click', '.js-order-item .destroy', (event) =>
    destroy_btn = $(event.target)
    order_item_html = destroy_btn.closest('.js-order-item')
    destroy_html = order_item_html.find('.destroy')

    destroy_html.val(1)
    order_item_html.hide()
    update_total_cost()

  .on 'click', '.js-order-item-add', (event) =>
    merchant_id = location.pathname.match(///merchants\/(\d+)///)[1]

    $.get("/merchants/#{merchant_id}/orders/add_order_item").success (data, status, jqxhr)=>
      rand = new Date().getTime()
      order_item_data = data.replace ///order\[order_items_attributes\]\[0\]///g, "order[order_items_attributes][#{rand}]"
      order_item_form = $(order_item_data)
      order_items_html = $('.order-items')
      order_item_html = order_item_form.find('.js-order-item')

      order_items_html.append order_item_html

  update_total = (order_item_html) ->
    price_html = order_item_html.find('.price')
    discount_html = order_item_html.find('.discount')
    quantity_html = order_item_html.find('.quantity')
    total_html = order_item_html.find('.total')
    total = price_html.val() * quantity_html.val() * discount_html.val()

    total_html.val(total.toFixed(2))
    update_total_cost()

  update_total_cost = () ->
    total_cost = 0.0

    for order_item_html in $('.order-items').find('.js-order-item')
       if $(order_item_html).find('.destroy').val() == 'false'
        total_cost += parseFloat($(order_item_html).find('.total').val())

    $('.js-order-total-cost').html(total_cost.toFixed(2))
