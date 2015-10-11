dash_data = DashboardData.new

monto_vendido_inicial = 200000
trx_ok = 34
trx_nook = 20

#Refresco de los 10 productos vendidos cada 6 segundos
SCHEDULER.every '6s' do
  top_10_prod = dash_data.get_ultimas_10_ventas_fixed
  send_event('top_10_prod', { items: top_10_prod })
end

SCHEDULER.every '10s' do
  send_event('ventas', points: dash_data.get_montos_ventas)
end

SCHEDULER.every '10s' do
  prox_monto = (monto_vendido_inicial * rand(1..1.1)).round
  prox_trx_ok = (trx_ok * rand(1..1.1)).round
  prox_trx_nook = (trx_nook * rand(1..1.1)).round
  send_event('monto_vendido', current: prox_monto, last: monto_vendido_inicial)
  send_event('trx_ok', current: prox_trx_ok, last: trx_ok)
  send_event('trx_nook', current: prox_trx_nook, last: trx_nook)
  monto_vendido_inicial = prox_monto
  trx_ok = prox_trx_ok
  trx_nook = prox_trx_nook
end

# Refresco los valores de ayer todos los dias (a la 00:00)

SCHEDULER.cron '00 00 * * *' do
  monto_vendido_inicial = 200000
  trx_ok = 34
  trx_nook = 20
end
