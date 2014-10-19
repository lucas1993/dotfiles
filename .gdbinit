python
import sys
sys.path.insert(0, '/home/amaral/.gdb/python')
sys.path.append("/home/amaral/.gdb/python/libstdcxx/v6")
from libstdcxx.v6.printers import register_libstdcxx_printers
#register_libstdcxx_printers (None)
end
