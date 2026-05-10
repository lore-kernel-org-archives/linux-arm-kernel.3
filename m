Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A644CD3427
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 10 May 2026 05:21:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ByD/C9lLdqNb5sEC4Ll4SpfSx43c4fiEK3gBugZ/0MQ=; b=nVVYVcmB447gBIr+1GRaS3pM72
	F6/qdCYh3xhhst1rhOHsHZEnpsHudKMKz4xUdWlyVPaIbpMGoTmpsfPQU6qOtib+SPTi1/vGXHBqN
	tf70nJ3uiOjRLmm8smWBm1bkLUEA1EjoaHlB/RoFVVVBFev6sQWSsdVDmqxRG6gj99yaB5pLRtMZ2
	vEyokdxeI2tH0DcEPlsOg0+ugg5F0K3zSeq6M0DXQtYa6sSXotZ727ahpD/phfE0fQzcX0Yw+4B5T
	C4oQ0mOkgrgUtGBR2X+zKvT4LaD69ZFO+u3oWgVkUzUX6SsfzQZBRFfhF85ME0QXNkCCu48cld6oV
	1XDarEOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLwbm-0000000ACmc-3Q3W;
	Sun, 10 May 2026 05:21:42 +0000
Received: from mail-dy1-x1343.google.com ([2607:f8b0:4864:20::1343])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLwbk-0000000ACm9-0QDC
	for linux-arm-kernel@lists.infradead.org;
	Sun, 10 May 2026 05:21:41 +0000
Received: by mail-dy1-x1343.google.com with SMTP id 5a478bee46e88-2f3c623322bso5396606eec.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 09 May 2026 22:21:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778390499; x=1778995299; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ByD/C9lLdqNb5sEC4Ll4SpfSx43c4fiEK3gBugZ/0MQ=;
        b=aGPAHuR4pvq/Co0/0yr2WdFmupii75hatJ6w79raBXxlbnvjRhVgsAI4Q2FoSX9MGK
         bqUfdV20hiVTKb50NeKZ4L/D8b6/3sp0SPf5cIB6yMnQRzoDJa4WYFsBD1Gsorojv2nI
         fvBUDGPlI8zgGDPJ3My6x73f+j225ZojG8ZgXEV0z+grJ22psGX2YUQJsuPpF6s8BBq/
         vohb7e1XCREaAxf1UsIe+1Ueb549CiozRE+Baj7wftsQiGCbyngoShsW+3+Wfjc03vkN
         KdVq/hrdis9UF12OtF1PrmXGMgMyMz5EXTM2340GWihZoWt04UvbuJbdOBlIUGJDKbti
         9SmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778390499; x=1778995299;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ByD/C9lLdqNb5sEC4Ll4SpfSx43c4fiEK3gBugZ/0MQ=;
        b=OVF1WrFqYQqaluzSwvVZasfyAQ5pyHpeTp2qaWXRPVRo6Bl/1TYdjbip4tMI+2nqE8
         yolvfgHpXJ+djL2uCxwMXmeVZ77WIUxtBQ5PmqivCNXj09y5Arc4YfXr6ZySNeHOe3Wu
         BMWez5fGnpTa6sP2b1GqOsEf+aiamiFhe1gmOJHcce3mxXWwpnzFGAt3840zMRDW63gL
         ayg/RyycqQJPSxmj1CkUqAmbFEEHLOLqsdQ2IMpXxZptjBTOmnaCUdkMi2Inb8o60m5J
         ejpa4X5RR0OkQY1tn9bHh6dsowDI1rYpRl61aKHdIt4ZudNiYlCftcZNONH19Cb9CCvE
         Fm7A==
X-Gm-Message-State: AOJu0Yzd0XhQvzrf21B4tmWIfv7X2+v+4K27jvtILfTQzL3mwQssKppZ
	WCy2uyORDwDLBozYg+3v7jbwjoehRu8gsc0I+gnIqBM5+PzCPv7xWO33UGbGpx/xxn0=
X-Gm-Gg: Acq92OHU7qR0CaHO7qp+fCTNZGUYGqLJXFDFCTlCsViyQccHQRjxlWEkyyvfgreyJjP
	3R3JVo96RMiz80cwTSeAKjkOuvENIAAF+dT5ANJd0D1TZQU0+0Zf5VJGJOrc52Mt15Gclm5Rh3D
	CFPtUj53kHbIV6jI4WEzzM15AmlumA3NlaQSP3iGqz+JH8bayCiFgi4dv4ew6oafcixygmMQZ//
	AdzV6DnM6Ie/IUKzzqREM0uyNCr/j3zKuFDfa6tkHIcoao+95jaqh2ln9vk56Wjd4WIde6uYh19
	r6jLf0WVv/CkFC+Pd6jSxtMOVEY6SrFdqmu13HB71oPhqYkUcYsO6fiBrJV+gLZulE3U7fjItAe
	RM2/7ikM8Z06bCLu0oat+5iXuS0Vuo4rJfdHb4Lv1sBCYhtHtDxZy/sFIoqIVc+VHv9vvpBFGMw
	ZYk85YfLBM45dKlXK5PvYvHpgdmeOu6RF3wQzCCpH1fZiVZ3yP+nZSrJowVbF08e/YAUzfQd/j+
	kw71SEHO8I6KucCmvRoHIMlWUPCSsvYNrKCy8jpmz2b6Zdj5sHl0ZeX/Ss7X0xx7K5owBl5Ofhf
	Q8Xny/hvz2w+/ctcGA==
X-Received: by 2002:a05:7301:7c12:b0:2d8:df01:d9f7 with SMTP id 5a478bee46e88-2f54b891fd0mr10659278eec.15.1778390498897;
        Sat, 09 May 2026 22:21:38 -0700 (PDT)
Received: from ethan-latitude5420.. (host-127-24.cafrjco.fresno.ca.us.clients.pavlovmedia.net. [68.180.127.24])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f888c469b6sm8749587eec.24.2026.05.09.22.21.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 May 2026 22:21:38 -0700 (PDT)
From: Ethan Nelson-Moore <enelsonmoore@gmail.com>
To: linux-arm-kernel@lists.infradead.org,
	linux-input@vger.kernel.org,
	linux-serial@vger.kernel.org
Cc: Ethan Nelson-Moore <enelsonmoore@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Jiri Slaby <jirislaby@kernel.org>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Linus Walleij <linusw@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Steven Rostedt <rostedt@goodmis.org>,
	Thomas Weissschuh <thomas.weissschuh@linutronix.de>,
	Peter Zijlstra <peterz@infradead.org>
Subject: [PATCH] ARM: footbridge: convert to sparse IRQs
Date: Sat,  9 May 2026 22:20:49 -0700
Message-ID: <20260510052107.555825-1-enelsonmoore@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260509_222140_168090_FB4E1D17 
X-CRM114-Status: GOOD (  17.56  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

To improve future maintainability, change the interrupt handling for
mach-footbridge to use sparse IRQs.

Since the number of possible interrupts is already fixed and relatively
small, just make it use all legacy interrupts preallocated using the
.nr_irqs field in the machine descriptor, rather than actually
allocating domains on the fly.

Many files had to be adjusted to include <mach/irqs.h>
explicitly because it is no longer implicitly included with sparse
IRQs.

Description adapted from commit c78a41fc04f0 ("ARM: s3c24xx: convert
to sparse-irq").

Signed-off-by: Ethan Nelson-Moore <enelsonmoore@gmail.com>
---
This commit depends on my previous submission "ARM: <asm/floppy.h>: fix
build with sparse IRQs".

 arch/arm/Kconfig                             | 2 +-
 arch/arm/include/asm/irq.h                   | 4 +++-
 arch/arm/mach-footbridge/dc21285-timer.c     | 2 +-
 arch/arm/mach-footbridge/dc21285.c           | 2 +-
 arch/arm/mach-footbridge/ebsa285-pci.c       | 2 +-
 arch/arm/mach-footbridge/ebsa285.c           | 2 ++
 arch/arm/mach-footbridge/include/mach/irqs.h | 4 +---
 arch/arm/mach-footbridge/isa-irq.c           | 2 +-
 arch/arm/mach-footbridge/isa-timer.c         | 2 +-
 arch/arm/mach-footbridge/isa.c               | 2 +-
 arch/arm/mach-footbridge/netwinder-hw.c      | 2 ++
 arch/arm/mach-footbridge/netwinder-pci.c     | 2 +-
 drivers/char/nwbutton.c                      | 2 +-
 drivers/input/serio/i8042-io.h               | 6 +++---
 drivers/tty/serial/21285.c                   | 2 +-
 15 files changed, 21 insertions(+), 17 deletions(-)

diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index 09b2767fee0f..1155c78bb6aa 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -153,7 +153,7 @@ config ARM
 	select PCI_SYSCALL if PCI
 	select PERF_USE_VMALLOC
 	select RTC_LIB
-	select SPARSE_IRQ if !ARCH_FOOTBRIDGE
+	select SPARSE_IRQ
 	select SYS_SUPPORTS_APM_EMULATION
 	select THREAD_INFO_IN_TASK
 	select TIMER_OF if OF
diff --git a/arch/arm/include/asm/irq.h b/arch/arm/include/asm/irq.h
index 26c1d2ced4ce..08589b88c3b9 100644
--- a/arch/arm/include/asm/irq.h
+++ b/arch/arm/include/asm/irq.h
@@ -10,7 +10,9 @@
 #define NR_IRQS NR_IRQS_LEGACY
 #endif
 
-#ifndef irq_canonicalize
+#ifdef CONFIG_ARCH_FOOTBRIDGE
+#define irq_canonicalize(i)	(((i) == 2) ? 9 : i)
+#else
 #define irq_canonicalize(i)	(i)
 #endif
 
diff --git a/arch/arm/mach-footbridge/dc21285-timer.c b/arch/arm/mach-footbridge/dc21285-timer.c
index 2908c9ef3c9b..7d7ad1c1ef3f 100644
--- a/arch/arm/mach-footbridge/dc21285-timer.c
+++ b/arch/arm/mach-footbridge/dc21285-timer.c
@@ -12,7 +12,7 @@
 #include <linux/irq.h>
 #include <linux/sched_clock.h>
 
-#include <asm/irq.h>
+#include <mach/irqs.h>
 
 #include <asm/hardware/dec21285.h>
 #include <asm/mach/time.h>
diff --git a/arch/arm/mach-footbridge/dc21285.c b/arch/arm/mach-footbridge/dc21285.c
index e1b336624883..ffdecfadc9e2 100644
--- a/arch/arm/mach-footbridge/dc21285.c
+++ b/arch/arm/mach-footbridge/dc21285.c
@@ -17,7 +17,7 @@
 #include <linux/io.h>
 #include <linux/spinlock.h>
 
-#include <asm/irq.h>
+#include <mach/irqs.h>
 #include <asm/mach/pci.h>
 #include <asm/hardware/dec21285.h>
 
diff --git a/arch/arm/mach-footbridge/ebsa285-pci.c b/arch/arm/mach-footbridge/ebsa285-pci.c
index c3f280d08fa7..d2168660dd01 100644
--- a/arch/arm/mach-footbridge/ebsa285-pci.c
+++ b/arch/arm/mach-footbridge/ebsa285-pci.c
@@ -10,7 +10,7 @@
 #include <linux/pci.h>
 #include <linux/init.h>
 
-#include <asm/irq.h>
+#include <mach/irqs.h>
 #include <asm/mach/pci.h>
 #include <asm/mach-types.h>
 
diff --git a/arch/arm/mach-footbridge/ebsa285.c b/arch/arm/mach-footbridge/ebsa285.c
index 1cb7d674bc81..a820f7467468 100644
--- a/arch/arm/mach-footbridge/ebsa285.c
+++ b/arch/arm/mach-footbridge/ebsa285.c
@@ -10,6 +10,7 @@
 #include <linux/slab.h>
 #include <linux/leds.h>
 
+#include <mach/irqs.h>
 #include <asm/hardware/dec21285.h>
 #include <asm/mach-types.h>
 
@@ -117,6 +118,7 @@ MACHINE_START(EBSA285, "EBSA285")
 	.video_end	= 0x000bffff,
 	.map_io		= footbridge_map_io,
 	.init_early	= footbridge_sched_clock,
+	.nr_irqs	= FOOTBRIDGE_NR_IRQS,
 	.init_irq	= footbridge_init_irq,
 	.init_time	= footbridge_timer_init,
 	.restart	= footbridge_restart,
diff --git a/arch/arm/mach-footbridge/include/mach/irqs.h b/arch/arm/mach-footbridge/include/mach/irqs.h
index a5f41846ab9c..10f1fbc24012 100644
--- a/arch/arm/mach-footbridge/include/mach/irqs.h
+++ b/arch/arm/mach-footbridge/include/mach/irqs.h
@@ -11,7 +11,7 @@
  */
 #include <asm/mach-types.h>
 
-#define NR_IRQS			36
+#define FOOTBRIDGE_NR_IRQS	36
 #define NR_DC21285_IRQS		16
 
 #define _ISA_IRQ(x)		(0 + (x))
@@ -93,5 +93,3 @@
 #define I8042_KBD_IRQ	IRQ_ISA_KEYBOARD
 #define I8042_AUX_IRQ	(machine_is_netwinder() ? IRQ_NETWINDER_PS2MOUSE : IRQ_ISA_PS2MOUSE)
 #define IRQ_FLOPPYDISK	IRQ_ISA_FLOPPY
-
-#define irq_canonicalize(_i)	(((_i) == IRQ_ISA_CASCADE) ? IRQ_ISA_2 : _i)
diff --git a/arch/arm/mach-footbridge/isa-irq.c b/arch/arm/mach-footbridge/isa-irq.c
index 842ddb4121ef..e4e71bdf1dc7 100644
--- a/arch/arm/mach-footbridge/isa-irq.c
+++ b/arch/arm/mach-footbridge/isa-irq.c
@@ -21,8 +21,8 @@
 #include <asm/mach/irq.h>
 
 #include <mach/hardware.h>
+#include <mach/irqs.h>
 #include <asm/hardware/dec21285.h>
-#include <asm/irq.h>
 #include <asm/mach-types.h>
 
 #include "common.h"
diff --git a/arch/arm/mach-footbridge/isa-timer.c b/arch/arm/mach-footbridge/isa-timer.c
index 723e3eae995d..07dee61b0b03 100644
--- a/arch/arm/mach-footbridge/isa-timer.c
+++ b/arch/arm/mach-footbridge/isa-timer.c
@@ -13,7 +13,7 @@
 #include <linux/spinlock.h>
 #include <linux/timex.h>
 
-#include <asm/irq.h>
+#include <mach/irqs.h>
 #include <asm/mach/time.h>
 
 #include "common.h"
diff --git a/arch/arm/mach-footbridge/isa.c b/arch/arm/mach-footbridge/isa.c
index 84caccddce44..1e7b0f5fb111 100644
--- a/arch/arm/mach-footbridge/isa.c
+++ b/arch/arm/mach-footbridge/isa.c
@@ -7,7 +7,7 @@
 #include <linux/init.h>
 #include <linux/serial_8250.h>
 
-#include <asm/irq.h>
+#include <mach/irqs.h>
 #include <asm/hardware/dec21285.h>
 
 #include "common.h"
diff --git a/arch/arm/mach-footbridge/netwinder-hw.c b/arch/arm/mach-footbridge/netwinder-hw.c
index c024eefd4978..ab17ba916d47 100644
--- a/arch/arm/mach-footbridge/netwinder-hw.c
+++ b/arch/arm/mach-footbridge/netwinder-hw.c
@@ -16,6 +16,7 @@
 #include <linux/slab.h>
 #include <linux/leds.h>
 
+#include <mach/irqs.h>
 #include <asm/hardware/dec21285.h>
 #include <asm/mach-types.h>
 #include <asm/setup.h>
@@ -766,6 +767,7 @@ MACHINE_START(NETWINDER, "Rebel-NetWinder")
 	.reserve_lp2	= 1,
 	.fixup		= fixup_netwinder,
 	.map_io		= footbridge_map_io,
+	.nr_irqs	= FOOTBRIDGE_NR_IRQS,
 	.init_irq	= footbridge_init_irq,
 	.init_time	= isa_timer_init,
 	.restart	= netwinder_restart,
diff --git a/arch/arm/mach-footbridge/netwinder-pci.c b/arch/arm/mach-footbridge/netwinder-pci.c
index e8304392074b..bfd5c0606c71 100644
--- a/arch/arm/mach-footbridge/netwinder-pci.c
+++ b/arch/arm/mach-footbridge/netwinder-pci.c
@@ -10,7 +10,7 @@
 #include <linux/pci.h>
 #include <linux/init.h>
 
-#include <asm/irq.h>
+#include <mach/irqs.h>
 #include <asm/mach/pci.h>
 #include <asm/mach-types.h>
 
diff --git a/drivers/char/nwbutton.c b/drivers/char/nwbutton.c
index 92cee5717237..99819b184aac 100644
--- a/drivers/char/nwbutton.c
+++ b/drivers/char/nwbutton.c
@@ -18,7 +18,7 @@
 #include <linux/init.h>
 
 #include <linux/uaccess.h>
-#include <asm/irq.h>
+#include <mach/irqs.h>
 #include <asm/mach-types.h>
 
 #define __NWBUTTON_C		/* Tell the header file who we are */
diff --git a/drivers/input/serio/i8042-io.h b/drivers/input/serio/i8042-io.h
index a8f4b2d70e59..cea72bd888af 100644
--- a/drivers/input/serio/i8042-io.h
+++ b/drivers/input/serio/i8042-io.h
@@ -15,9 +15,9 @@
  * IRQs.
  */
 
-#if defined(__arm__)
-/* defined in include/asm-arm/arch-xxx/irqs.h */
-#include <asm/irq.h>
+#ifdef CONFIG_ARCH_FOOTBRIDGE
+/* defined in arch/arm/mach-footbridge/include/mach/irqs.h */
+#include <mach/irqs.h>
 #elif defined(CONFIG_PPC)
 extern int of_i8042_kbd_irq;
 extern int of_i8042_aux_irq;
diff --git a/drivers/tty/serial/21285.c b/drivers/tty/serial/21285.c
index 4de0c975ebdc..f0c63875912e 100644
--- a/drivers/tty/serial/21285.c
+++ b/drivers/tty/serial/21285.c
@@ -15,11 +15,11 @@
 #include <linux/serial.h>
 #include <linux/io.h>
 
-#include <asm/irq.h>
 #include <asm/mach-types.h>
 #include <asm/system_info.h>
 #include <asm/hardware/dec21285.h>
 #include <mach/hardware.h>
+#include <mach/irqs.h>
 
 #define BAUD_BASE		(mem_fclk_21285/64)
 
-- 
2.43.0


