$ () ->
  $('#order_transacted_at').datetimepicker
    format: 'yyyy-mm-dd hh:ii::ss'
    autoclose: true
    startView: 1
    todayBtn: true
    todayHighlight: true
    forceParse: false

  $('.js-order-item').on 'change', '.product', (event) =>
    product_html = $(event.target)
    price_html = $(event.target).closest('.js-order-item').find('.price')
    quantity_html = $(event.target).closest('.js-order-item').find('.quantity')
    total_html = $(event.target).closest('.js-order-item').find('.total')

    merchant_id = location.pathname.match(///merchants\/(\d+)///)[1]
    product_id = $(event.target).val()

    $.get("/merchants/#{merchant_id}/products/#{product_id}.json").success (data, status, jqxhr)=>
      product = data
      price_html.val(product.price)
      total_html.val(product.price * quantity_html.val())

  .on 'change', '.quantity', (event) =>
    quantity_html = $(event.target)
    price_html = $(event.target).closest('.js-order-item').find('.price')
    total_html = $(event.target).closest('.js-order-item').find('.total')
    total = price_html.val() * quantity_html.val()

    total_html.val(total)

  .on 'click', '.destroy', (event) =>
    destroy_btn = $(event.target)
    order_item_html = destroy_btn.closest('.js-order-item')
    destroy_html = order_item_html.find('.destroy')

    destroy_html.val(1)
    order_item_html.hide()
