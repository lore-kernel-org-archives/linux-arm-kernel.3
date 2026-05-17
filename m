Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95AADCD37AC
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 17 May 2026 04:24:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=d8n3eAJD8ESNWs1d2EHnu9xgSDw32ShgEg//3WrtNcs=; b=e4hsV+/D8DyVA4Cq3zhbRa3spt
	2o9RDNQz3wPHEcnpuasMxCnDMDWoGvXrP6tS42a1KttPN6nDG0iKm4/gIgz3/KhZYAUlfogBnZd7d
	HGO7Y8q1sSuLr66Uebwe/0HQntMgbqyk2tntSrskf6oT/lKjTLO69mOqhVprZT2HI6Vq18XsnrGCX
	Cd/hoxE/95IGDMaUZQz3ndqfvIceRpB4rhvLzPSSsE33NrQ9PK1d9Sf8Hg9k0WDm/EaE54D8b37oi
	ddcx+xjekbFZOI/bQlr7+lvlI16XfAwkcNoLeY1iFYlAIbm+Reezl0D5RMQwxH5PTDeXv4ti+ldBe
	Rxat2uQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOT3U-0000000C4OH-3LOC;
	Sun, 17 May 2026 04:24:44 +0000
Received: from mail-dy1-x1343.google.com ([2607:f8b0:4864:20::1343])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOT3T-0000000C4Nm-0aau
	for linux-arm-kernel@lists.infradead.org;
	Sun, 17 May 2026 04:24:44 +0000
Received: by mail-dy1-x1343.google.com with SMTP id 5a478bee46e88-2ef8d6ba48bso528821eec.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 16 May 2026 21:24:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778991882; x=1779596682; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=d8n3eAJD8ESNWs1d2EHnu9xgSDw32ShgEg//3WrtNcs=;
        b=MeLX1L1/tkgH9mhshmXnv5TxyMi69FOH9WipLk/0mG4MohCNOkTFQqqA2vz4PT3udK
         /SEr8WU0xLmbDs7DthP7V3iQzlbEUES5aY3jaCB4Yzxhn52vhGl9wlKG933VRDGZbbkZ
         X8LWi9t7v+kBU9RNqifXPMtYoPssPYM5xRJVB0JuvjNV6japGGogslb7yXvSd9lJk4M5
         N10CaCjAEgGfS9/8nB/v6euAMiRct7eG1Ly2gEhu1LEAtIKjfiFEgo1WWqs/AyhQMf1i
         gHz/TfHbYRPgssH19G1S80Mb9MTKROdBwon74vREnAA9KoaRa5jc8M4P2yygL7aHniBe
         cdyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778991882; x=1779596682;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d8n3eAJD8ESNWs1d2EHnu9xgSDw32ShgEg//3WrtNcs=;
        b=Gska4mfpOf8kcY2FMNjFXCqZesPksrscJSQab/yaouLvYJ0uConj1m8n5AmU3bH4RU
         J33mpM8tmxjiRZOp1SZJma+NcJ6xsh3rPfdYu6/et0HqaQsNSsTELMZsSYz92UMuUobz
         V+equGmID813NZtR4g7oLDH4k5esVxteZz0OJwzHL2GJSRu+Lap4pilVAbBhBOrcTPGT
         /2XjFxBnOs2KTVE611CNy+jRPvDGufC8Lhm2SrD0gzh9WyzUO9X6QulUBbrorZz6UmSu
         cQTZ4yjPb/v9db428eIAWtxVBoLX5KlYvo1r9gu52YetZ5NtuS8t4+LqA4Bxn/FQRGwx
         ra2w==
X-Gm-Message-State: AOJu0Yy67n6PILTYb7N7ZjPnxdxVyqz/K2asHIc7IJiR+WTZwyTEK4+j
	gkf/w9IeuloyCvpGLwWAnF+QaUZE9OCxFCs0tS9qGmKiDG/K+W2GrZj3zlwuLKPpRKc=
X-Gm-Gg: Acq92OFcNB0+hra5f6/DvB8HmXBw/lW2UWHSULkYsNDoqnBc3iva6RV9f/zEErkPRlp
	QTTV3y7CKHu25Y5yqcy3SS7f6zCTxodOMBIT5Oz8g9gqpH92p5yuBByFNR7y0h10owhGg5ad9RH
	0Xw5jl0mDnP5xmK+CW23B6Bck7ZTh68dSio+I8wTYkxpqvN39TYGyp4MaSfQW8piQm1noOO3BMN
	nL+0mHWJp3x8OrVZGufUw2zweURw2IugPLHOA5PlqmX9pERv/kx+Qrt32+lUdrijpa+QqEP1ICC
	5BXIJWXLiOs1yG+XWQH/xbsomtPzlsVRAPk7gOPmrBQAztGgDN91K3da7eCyZ7P11iuK5AVz9Nw
	Yp8zxeIO7TEKOPDtg8QzzejG1Om0l+8MWncuJ1kcoj2KB5idNm0IuyZloMlVtdJc3zHKqV3sO2/
	p9pgUlPBhiV2nlkzZ9+dfAzwvRwt18ok2YCCQu3gzuvKaQYsufS2L36VrkOsZ3huWzBsHbYqySr
	xP6iMXBk4gexi7wKRc5xNsFYEf7xaWLyf0+lICGyf9XSdRqMPc/82Nfb+mbhxBdBWGTMSLlVM/Y
	Loo37AV6cd1p86Aaa1IdJo9hyxLm
X-Received: by 2002:a05:7300:4306:b0:2df:498e:811b with SMTP id 5a478bee46e88-3025fa58925mr6970894eec.7.1778991882063;
        Sat, 16 May 2026 21:24:42 -0700 (PDT)
Received: from ethan-latitude5420.. (host-127-24.cafrjco.fresno.ca.us.clients.pavlovmedia.net. [68.180.127.24])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-302978afdd3sm11218719eec.29.2026.05.16.21.24.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 May 2026 21:24:41 -0700 (PDT)
From: Ethan Nelson-Moore <enelsonmoore@gmail.com>
To: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Ethan Nelson-Moore <enelsonmoore@gmail.com>,
	Russell King <linux@armlinux.org.uk>
Subject: [PATCH] ARM: clean up machine-specific PCI code and move it into mach-footbridge
Date: Sat, 16 May 2026 21:24:25 -0700
Message-ID: <20260517042431.288801-1-enelsonmoore@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260516_212443_183583_A8AAF193 
X-CRM114-Status: GOOD (  17.43  )
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

arch/arm/include/asm/mach/pci.h contains function definitions specific
to Intel IOP3xx and the DC21285 Footbridge chip. This machine-specific
code should not be in a global include file. The last IOP3xx platform
supported was removed in commit b91a69d162aa ("ARM: iop32x: remove the
platform"), so the IOP3xx definitions are unused. Remove them and move
the DC21285 definitions into mach-footbridge.

Tested by compiling footbridge_defconfig and netwinder_defconfig.

Signed-off-by: Ethan Nelson-Moore <enelsonmoore@gmail.com>
---
 arch/arm/include/asm/mach/pci.h          | 13 -------------
 arch/arm/mach-footbridge/dc21285.c       |  2 ++
 arch/arm/mach-footbridge/ebsa285-pci.c   |  2 ++
 arch/arm/mach-footbridge/netwinder-pci.c |  2 ++
 arch/arm/mach-footbridge/pci.h           | 12 ++++++++++++
 5 files changed, 18 insertions(+), 13 deletions(-)
 create mode 100644 arch/arm/mach-footbridge/pci.h

diff --git a/arch/arm/include/asm/mach/pci.h b/arch/arm/include/asm/mach/pci.h
index ea9bd08895b7..ece5283bdaec 100644
--- a/arch/arm/include/asm/mach/pci.h
+++ b/arch/arm/include/asm/mach/pci.h
@@ -70,17 +70,4 @@ extern void pci_map_io_early(unsigned long pfn);
 static inline void pci_map_io_early(unsigned long pfn) {}
 #endif
 
-/*
- * PCI controllers
- */
-extern struct pci_ops iop3xx_ops;
-extern int iop3xx_pci_setup(int nr, struct pci_sys_data *);
-extern void iop3xx_pci_preinit(void);
-extern void iop3xx_pci_preinit_cond(void);
-
-extern struct pci_ops dc21285_ops;
-extern int dc21285_setup(int nr, struct pci_sys_data *);
-extern void dc21285_preinit(void);
-extern void dc21285_postinit(void);
-
 #endif /* __ASM_MACH_PCI_H */
diff --git a/arch/arm/mach-footbridge/dc21285.c b/arch/arm/mach-footbridge/dc21285.c
index e1b336624883..5a68b6739ecf 100644
--- a/arch/arm/mach-footbridge/dc21285.c
+++ b/arch/arm/mach-footbridge/dc21285.c
@@ -21,6 +21,8 @@
 #include <asm/mach/pci.h>
 #include <asm/hardware/dec21285.h>
 
+#include "pci.h"
+
 #define MAX_SLOTS		21
 
 #define PCICMD_ABORT		((PCI_STATUS_REC_MASTER_ABORT| \
diff --git a/arch/arm/mach-footbridge/ebsa285-pci.c b/arch/arm/mach-footbridge/ebsa285-pci.c
index c3f280d08fa7..797485249d0c 100644
--- a/arch/arm/mach-footbridge/ebsa285-pci.c
+++ b/arch/arm/mach-footbridge/ebsa285-pci.c
@@ -14,6 +14,8 @@
 #include <asm/mach/pci.h>
 #include <asm/mach-types.h>
 
+#include "pci.h"
+
 static int irqmap_ebsa285[] = { IRQ_IN3, IRQ_IN1, IRQ_IN0, IRQ_PCI };
 
 static int ebsa285_map_irq(const struct pci_dev *dev, u8 slot, u8 pin)
diff --git a/arch/arm/mach-footbridge/netwinder-pci.c b/arch/arm/mach-footbridge/netwinder-pci.c
index e8304392074b..66fedf182744 100644
--- a/arch/arm/mach-footbridge/netwinder-pci.c
+++ b/arch/arm/mach-footbridge/netwinder-pci.c
@@ -14,6 +14,8 @@
 #include <asm/mach/pci.h>
 #include <asm/mach-types.h>
 
+#include "pci.h"
+
 /*
  * We now use the slot ID instead of the device identifiers to select
  * which interrupt is routed where.
diff --git a/arch/arm/mach-footbridge/pci.h b/arch/arm/mach-footbridge/pci.h
new file mode 100644
index 000000000000..8616e9fe6c8c
--- /dev/null
+++ b/arch/arm/mach-footbridge/pci.h
@@ -0,0 +1,12 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#ifndef __FOOTBRIDGE_PCI_H
+#define __FOOTBRIDGE_PCI_H
+
+/* PCI controller-related definitions for the DC21285 Footbridge chip */
+extern struct pci_ops dc21285_ops;
+extern int dc21285_setup(int nr, struct pci_sys_data *sys);
+extern void dc21285_preinit(void);
+extern void dc21285_postinit(void);
+
+#endif /* __FOOTBRIDGE_PCI_H */
-- 
2.43.0


