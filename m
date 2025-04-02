Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A007C36018
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Apr 2025 20:58:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SRirtoVTMfeN0wRj4jAqh+TanwneimSbjL8xhCx/W9k=; b=ghee/OE32uZlk4qTbGARMeY8uc
	KO7oI2y9MPgOTN0RdW+zIGCF1IyZKjhd95lz9CRJAZtda2JkyBfC/e9PGUNFdWVXELGHS4H4nJsuV
	pZb+SKkw3VEpicB1f3uDhFeBdh1PEFOx6DYVKTuSOzfVE9ddOZ15OYIyVXQu4Vlcoa16kK8riw8+v
	94CRmpLdENx9RZ+GK9PYVV+gn0Snj1EU3X7YjjhjzybgkJRUtYKTY6B+zjAy89djKA6YCKRkGLIKA
	QbeIqHGFnCqEKKy3HrChzpAZlePGfY2DyaLgZ69RF1Uj/NIH5/e7OudhGLzScEGP3tJkOqZ/bwIZH
	S6glprBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u059w-00000007Bkj-32TX;
	Wed, 02 Apr 2025 20:58:04 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u051K-00000007ArE-0ckK
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Apr 2025 20:49:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=SRirtoVTMfeN0wRj4jAqh+TanwneimSbjL8xhCx/W9k=; b=hCXW25
	Vk44beEORpdGugC+9CFWPwy7kLibtxamDrsndsWHNWDhyubDLZNZE91wDEYAxIsF
	tyhseuLfvHsseL8Ncd7j6ngsHymPA6wiQJBFNPUDUZ7G/CNwuDkTyRUvipEB+lg7
	K+3OCj3N4epfObCWVF2WHYN7ioLRg+UCz53RdwRYjHzYWNTvkjCVmF9+4ur0WEyn
	RpLkm43HalZ0V+AS1qYA4ss5m9imEY3EOKWJ97cFEI6JJNpBkBUTo+dH+S/Lzfd1
	lLVh+idcIq4b7Dty1se4JoGsF/DGicgNraH3FJe16DsNNtl9z8cnubmsKNZo1wf2
	NOVGUkjZjbidRajA==
Received: (qmail 2132961 invoked from network); 2 Apr 2025 22:49:03 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 2 Apr 2025 22:49:03 +0200
X-UD-Smtp-Session: l3s3148p1@54GYyNExurwujnsv
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org
Subject: [PATCH 4/4] ARM: dts: at91: usb_a9g20: move wrong RTC node
Date: Wed,  2 Apr 2025 22:48:54 +0200
Message-ID: <20250402204856.5197-5-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250402204856.5197-1-wsa+renesas@sang-engineering.com>
References: <20250402204856.5197-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250402_134910_460469_395D9530 
X-CRM114-Status: GOOD (  12.30  )
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

Only the LPW variant has the external RTC. Move it to that board
specific DT. As a result, the common include for A9G20 boards can
go now.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 arch/arm/boot/dts/microchip/usb_a9g20.dts      |  3 ++-
 .../boot/dts/microchip/usb_a9g20_common.dtsi   | 18 ------------------
 arch/arm/boot/dts/microchip/usb_a9g20_lpw.dts  | 10 +++++++++-
 3 files changed, 11 insertions(+), 20 deletions(-)
 delete mode 100644 arch/arm/boot/dts/microchip/usb_a9g20_common.dtsi

diff --git a/arch/arm/boot/dts/microchip/usb_a9g20.dts b/arch/arm/boot/dts/microchip/usb_a9g20.dts
index a2f748141d4b..bdaf35c6526e 100644
--- a/arch/arm/boot/dts/microchip/usb_a9g20.dts
+++ b/arch/arm/boot/dts/microchip/usb_a9g20.dts
@@ -5,7 +5,8 @@
  *  Copyright (C) 2011 Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
  */
 /dts-v1/;
-#include "usb_a9g20_common.dtsi"
+#include "at91sam9g20.dtsi"
+#include "usb_a9260_common.dtsi"
 
 / {
 	model = "Calao USB A9G20";
diff --git a/arch/arm/boot/dts/microchip/usb_a9g20_common.dtsi b/arch/arm/boot/dts/microchip/usb_a9g20_common.dtsi
deleted file mode 100644
index 6bc307c91d65..000000000000
--- a/arch/arm/boot/dts/microchip/usb_a9g20_common.dtsi
+++ /dev/null
@@ -1,18 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-or-later
-/*
- * usb_a9g20.dts - Device Tree file for Calao USB A9G20 board
- *
- *  Copyright (C) 2011 Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
- */
-
-#include "at91sam9g20.dtsi"
-#include "usb_a9260_common.dtsi"
-
-/ {
-	i2c-gpio-0 {
-		rtc@56 {
-			compatible = "microcrystal,rv3029";
-			reg = <0x56>;
-		};
-	};
-};
diff --git a/arch/arm/boot/dts/microchip/usb_a9g20_lpw.dts b/arch/arm/boot/dts/microchip/usb_a9g20_lpw.dts
index 4d104797176c..2eda00477bc5 100644
--- a/arch/arm/boot/dts/microchip/usb_a9g20_lpw.dts
+++ b/arch/arm/boot/dts/microchip/usb_a9g20_lpw.dts
@@ -5,7 +5,8 @@
  *  Copyright (C) 2013 Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
  */
 /dts-v1/;
-#include "usb_a9g20_common.dtsi"
+#include "at91sam9g20.dtsi"
+#include "usb_a9260_common.dtsi"
 
 / {
 	model = "Calao USB A9G20 Low Power";
@@ -27,4 +28,11 @@ mmc@0 {
 			};
 		};
 	};
+
+	i2c-gpio-0 {
+		rtc@56 {
+			compatible = "microcrystal,rv3029";
+			reg = <0x56>;
+		};
+	};
 };
-- 
2.47.2


