GO_EASY_ON_ME = 1

include theos/makefiles/common.mk

TWEAK_NAME = WhatsAppLSTimeST
WhatsAppLSTimeST_FILES = Tweak.xm
WhatsAppLSTimeST_FRAMEWORKS = UIKit Foundation

include $(THEOS_MAKE_PATH)/tweak.mk
SUBPROJECTS += whatsapplstime
include $(THEOS_MAKE_PATH)/aggregate.mk
