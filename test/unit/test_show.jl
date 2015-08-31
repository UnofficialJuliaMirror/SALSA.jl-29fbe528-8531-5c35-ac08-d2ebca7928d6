using SALSA, Base.Test, Base.convert

outOriginal = STDOUT
(outRead, outWrite) = redirect_stdout()
model = SALSAModel(LINEAR,PEGASOS(),HINGE)
model.output.dfunc = loss_derivative(HINGE)
show(outWrite, model)

s = UTF8String(readavailable(outRead))
redirect_stdout(outOriginal)

@test contains(s,"SALSA model:")
@test contains(s,"SALSA model.output:")
@test contains(s,"PEGASOS")
@test contains(s,"LINEAR")
@test contains(s,"HINGE")
@test contains(s,"dfunc")