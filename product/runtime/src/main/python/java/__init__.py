from __future__ import absolute_import, division, print_function

# On Android, the native module is stored separately to the Python modules.
from pkgutil import extend_path
__path__ = extend_path(__path__, __name__)

from .chaquopy import *  # noqa
from .signatures import *  # noqa
from .reflect import *  # noqa

# This is the public API. jvoid is not included because the user would have no use for it.
__all__ = ["jclass", "cast", "JavaException",
           "jboolean", "jbyte", "jshort", "jint", "jlong", "jfloat", "jdouble", "jchar",
           "jarray"]


# TODO #5167 test this. I don't see any reason why it has to be Android-specific, though maybe
# it's only Android which enforces it.
import os
if "ANDROID_ARGUMENT" in os.environ:
    # on android, catch all exception a detach
    import threading
    import java
    orig_thread_run = threading.Thread.run

    def cqp_thread_hook(*args, **kwargs):
        try:
            return orig_thread_run(*args, **kwargs)
        finally:
            java.detach()

    threading.Thread.run = cqp_thread_hook
