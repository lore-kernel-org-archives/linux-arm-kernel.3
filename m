Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCC59C02194
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jan 2025 21:07:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MBWs5oIhnhuwantlcNVJJR9qYtNyEsREGT8NBj46Yjk=; b=T3K/B1YGof9zBo
	Ljkych7Wgg5pNz2nLV+QV0LiKyg7k3Q/BFGT2w67xIwXRBWGneZ8nv8nhEx6dHZLMn0R8ETueFz/W
	OqM8OcVOtvDwry0N4+bJ7i8IMuwTMAU+TSo0fz1BqMg9QqFHN/NFJ86nanGBPXkqucu2tfuzIs6y4
	iGtttIbHTRMrMMryAlYrH1AkkoCPlGEH2dpoACSzxf5ti4kENDWzebroOTsn/qaGackz9Kyh2eciE
	BHUUWvJD4v9GOEddDZ0Yw4H4kD6XxluWzC+5ZF6HcGryzcEJvUi5CIc7KrA7ZUQ+T0YbnLqxDo7BY
	GxotYI4O6FeXGd4+SjBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdyE1-0000000BPze-1lB2;
	Fri, 31 Jan 2025 21:06:53 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdyA9-0000000BPf1-3L8R
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Jan 2025 21:02:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=MBWs5oIhnhuwantlcNVJJR9qYtNyEsREGT8NBj46Yjk=; b=O7Or3H
	PzGKOvd43xjIrcfCQHziVWd3yh4RspNAEh6GJS8/MSx5NSM5Gi6R3dowoK3tiEMf
	el3uf5lkhaQB7qcrP/MWl5z+xpeyHHp3WUewlLZlm5XiCKKlz7Cp12sPXMB+c+SB
	12OPlkShT0ILEVL89FRx74VmsdfFj2vDq1Bmm3bT7VxHPubpiLmgtURwZ6SfdUbs
	MW9vpLA4YPx+otjkTDfEHmaW6+kZpNLLdzGACjOrUMIP0zyg9L6SVazuzNnwfoB1
	uVL/Eg9hi8d8jYbszpne3hcoaompb1wzfoPTai7uRXTxiQiNHTVFdF0PQYva+Lvv
	BYexg2uqMVvhzWyw==
Received: (qmail 1802054 invoked from network); 31 Jan 2025 22:02:51 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 31 Jan 2025 22:02:51 +0100
X-UD-Smtp-Session: l3s3148p1@C1yb3QYtrAjUph5e
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-arm-kernel@lists.infradead.org
Subject: [PATCH 2/4] ARM: dts: at91: use correct vendor name for Calao boards
Date: Fri, 31 Jan 2025 22:02:37 +0100
Message-ID: <20250131210236.36212-8-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250131210236.36212-6-wsa+renesas@sang-engineering.com>
References: <20250131210236.36212-6-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250131_130254_108090_202AD3D2 
X-CRM114-Status: UNSURE (   9.00  )
X-CRM114-Notice: Please train this message.
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
Cc: Conor Dooley <conor+dt@kernel.org>, Rob Herring <robh@kernel.org>, Alexandre Belloni <alexandre.belloni@bootlin.com>, devicetree@vger.kernel.org, Claudiu Beznea <claudiu.beznea@tuxon.dev>, Wolfram Sang <wsa+renesas@sang-engineering.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

The company was named "Calao", not "Caloa".

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 arch/arm/boot/dts/microchip/tny_a9260.dts         | 2 +-
 arch/arm/boot/dts/microchip/tny_a9260_common.dtsi | 2 +-
 arch/arm/boot/dts/microchip/tny_a9263.dts         | 2 +-
 arch/arm/boot/dts/microchip/tny_a9g20.dts         | 2 +-
 arch/arm/boot/dts/microchip/usb_a9260.dts         | 2 +-
 arch/arm/boot/dts/microchip/usb_a9260_common.dtsi | 2 +-
 arch/arm/boot/dts/microchip/usb_a9263.dts         | 2 +-
 arch/arm/boot/dts/microchip/usb_a9g20.dts         | 2 +-
 arch/arm/boot/dts/microchip/usb_a9g20_common.dtsi | 2 +-
 arch/arm/boot/dts/microchip/usb_a9g20_lpw.dts     | 2 +-
 10 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/arch/arm/boot/dts/microchip/tny_a9260.dts b/arch/arm/boot/dts/microchip/tny_a9260.dts
index ef6d586ce887..f0f2a787d669 100644
--- a/arch/arm/boot/dts/microchip/tny_a9260.dts
+++ b/arch/arm/boot/dts/microchip/tny_a9260.dts
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * tny_a9260.dts - Device Tree file for Caloa TNY A9260 board
+ * tny_a9260.dts - Device Tree file for Calao TNY A9260 board
  *
  * Copyright (C) 2012 Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
  */
diff --git a/arch/arm/boot/dts/microchip/tny_a9260_common.dtsi b/arch/arm/boot/dts/microchip/tny_a9260_common.dtsi
index 70e5635c78ed..4d4377f51bec 100644
--- a/arch/arm/boot/dts/microchip/tny_a9260_common.dtsi
+++ b/arch/arm/boot/dts/microchip/tny_a9260_common.dtsi
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * tny_a9260_common.dtsi - Device Tree file for Caloa TNY A926x board
+ * tny_a9260_common.dtsi - Device Tree file for Calao TNY A926x board
  *
  * Copyright (C) 2012 Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
  */
diff --git a/arch/arm/boot/dts/microchip/tny_a9263.dts b/arch/arm/boot/dts/microchip/tny_a9263.dts
index 62b7d9f9a926..3dd48b3e06da 100644
--- a/arch/arm/boot/dts/microchip/tny_a9263.dts
+++ b/arch/arm/boot/dts/microchip/tny_a9263.dts
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * usb_a9263.dts - Device Tree file for Caloa USB A9293 board
+ * usb_a9263.dts - Device Tree file for Calao USB A9293 board
  *
  *  Copyright (C) 2012 Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
  */
diff --git a/arch/arm/boot/dts/microchip/tny_a9g20.dts b/arch/arm/boot/dts/microchip/tny_a9g20.dts
index 118d766a1265..cebd5696a2c1 100644
--- a/arch/arm/boot/dts/microchip/tny_a9g20.dts
+++ b/arch/arm/boot/dts/microchip/tny_a9g20.dts
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * tny_a9g20.dts - Device Tree file for Caloa TNY A9G20 board
+ * tny_a9g20.dts - Device Tree file for Calao TNY A9G20 board
  *
  * Copyright (C) 2012 Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
  */
diff --git a/arch/arm/boot/dts/microchip/usb_a9260.dts b/arch/arm/boot/dts/microchip/usb_a9260.dts
index 66f8da89007d..e7f7b259ccf3 100644
--- a/arch/arm/boot/dts/microchip/usb_a9260.dts
+++ b/arch/arm/boot/dts/microchip/usb_a9260.dts
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
 /*
- * usb_a9260.dts - Device Tree file for Caloa USB A9260 board
+ * usb_a9260.dts - Device Tree file for Calao USB A9260 board
  *
  *  Copyright (C) 2011-2012 Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
  */
diff --git a/arch/arm/boot/dts/microchip/usb_a9260_common.dtsi b/arch/arm/boot/dts/microchip/usb_a9260_common.dtsi
index 9672a5626cae..19084ba75883 100644
--- a/arch/arm/boot/dts/microchip/usb_a9260_common.dtsi
+++ b/arch/arm/boot/dts/microchip/usb_a9260_common.dtsi
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
 /*
- * usb_a926x.dts - Device Tree file for Caloa USB A926x board
+ * usb_a926x.dts - Device Tree file for Calao USB A926x board
  *
  *  Copyright (C) 2011-2012 Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
  */
diff --git a/arch/arm/boot/dts/microchip/usb_a9263.dts b/arch/arm/boot/dts/microchip/usb_a9263.dts
index 23240f2c8a16..e1f6dd7ed2d4 100644
--- a/arch/arm/boot/dts/microchip/usb_a9263.dts
+++ b/arch/arm/boot/dts/microchip/usb_a9263.dts
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * usb_a9263.dts - Device Tree file for Caloa USB A9293 board
+ * usb_a9263.dts - Device Tree file for Calao USB A9293 board
  *
  *  Copyright (C) 2012 Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
  */
diff --git a/arch/arm/boot/dts/microchip/usb_a9g20.dts b/arch/arm/boot/dts/microchip/usb_a9g20.dts
index 2f667b083e81..a2f748141d4b 100644
--- a/arch/arm/boot/dts/microchip/usb_a9g20.dts
+++ b/arch/arm/boot/dts/microchip/usb_a9g20.dts
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
 /*
- * usb_a9g20.dts - Device Tree file for Caloa USB A9G20 board
+ * usb_a9g20.dts - Device Tree file for Calao USB A9G20 board
  *
  *  Copyright (C) 2011 Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
  */
diff --git a/arch/arm/boot/dts/microchip/usb_a9g20_common.dtsi b/arch/arm/boot/dts/microchip/usb_a9g20_common.dtsi
index 7d10b36db1ee..f1946e0996b7 100644
--- a/arch/arm/boot/dts/microchip/usb_a9g20_common.dtsi
+++ b/arch/arm/boot/dts/microchip/usb_a9g20_common.dtsi
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
 /*
- * usb_a9g20.dts - Device Tree file for Caloa USB A9G20 board
+ * usb_a9g20.dts - Device Tree file for Calao USB A9G20 board
  *
  *  Copyright (C) 2011 Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
  */
diff --git a/arch/arm/boot/dts/microchip/usb_a9g20_lpw.dts b/arch/arm/boot/dts/microchip/usb_a9g20_lpw.dts
index f65712015d40..19e377020d56 100644
--- a/arch/arm/boot/dts/microchip/usb_a9g20_lpw.dts
+++ b/arch/arm/boot/dts/microchip/usb_a9g20_lpw.dts
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
 /*
- * usb_a9g20_lpw.dts - Device Tree file for Caloa USB A9G20 Low Power board
+ * usb_a9g20_lpw.dts - Device Tree file for Calao USB A9G20 Low Power board
  *
  *  Copyright (C) 2013 Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
  */
-- 
2.45.2


