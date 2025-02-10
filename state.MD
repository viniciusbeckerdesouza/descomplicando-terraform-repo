## State
O arquivo de State serve para mapear o mundo real. Tudo que está neste arquivo existe no mundo real.
Os blocos do terraform precisam estar persistidos.
O state faz um mapeamento entre o que está na cloud e o que está no seu código.
O state mantém metadados que são aproveitados em diversas necessidades.
Um exemplo, se eu removo o resource do meu HCL e rodo um plan, o state vai olhar nos metadados e verificar que o HCL foi alterado. No plano ele vai flar que o recurso que está na cloud será destruído, porque se ele não existe no código também não deve existir no mundo real.
O state garante a integridade. Toda a infra tem que estar controlada pelo terraform.
Ao contrário, o ansible não é assim. Quando você tira um recurso do playbook, o ansible para de controlar aquele recurso, mas ele não deixa de existir.
