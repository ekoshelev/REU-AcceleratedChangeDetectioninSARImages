function err = ObjectFunc( dbn, IN, OUT, opts )

OBJECTSQUARE = 1;
OBJECTCROSSENTROPY = 2;
Object = OBJECTSQUARE;

if( exist('opts' ) )
 if( isfield(opts,'Object') )
  if( strcmpi( opts.object, 'Square' ) )
   Object = OBJECTSQUARE;
  elseif( strcmpi( opts.object, 'CrossEntropy' ) )
   Object = OBJECTCROSSENTROPY;
  end
 end
end
 
est = v2h( dbn, IN );

if( Object == OBJECTSQUARE )
    err = ( OUT - est );
    err = err .* err;
    err = sum(err(:)) / size(OUT,1) / 2;

elseif( Object == OBJECTCROSSENTROPY )
    e1 = OUT .* log( est );
    e2 = (1-OUT) .* log( 1 - est );
    err = -( sum(e1(:)) + sum(e2(:)) ) / size(OUT, 1);
end

end

