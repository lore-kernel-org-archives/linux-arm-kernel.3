Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81DA6F47CB1
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 18:08:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Cc:To:From:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2H6tfy1TUzvjSiheWLKqM1iMWWpxdKE5eZOP/ogsv6M=; b=JUG4SVu/Spb22Ibcta1OTCGaOM
	JrxN0Pk9CtM+KaV7bcdYewXYN6tqp/KZLeSTgatsXI5BTBhHkYNBN7zsKgXxDgQMAXq0oSeJTu4qD
	3q/jXoQuoy6lKOhPD9gZ/LS8rd6QSA9W2cs/JuJHKmGysaKcTdPTdyU/Zh/TN4kweXk8a93gQERfG
	tUCcnvnqlciTGiNJuqUEVvDvR08fjkPV9eGO1oLkycKYyr+tA26hlilfdNkSGQxp4f6aciYwlbiD9
	g2eBj01+k56U7n6BIsZDhwMFN9ZuRNaMS4w7fV8XIsCoVDyojsIqA3BATARuZNYtYEQ3sDvHtW1PY
	Vt+dITUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyD7u-00000002LRw-1ZzM;
	Thu, 05 Mar 2026 18:08:46 +0000
Received: from mail.hugovil.com ([162.243.120.170])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyD7p-00000002LOa-1AMs
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Mar 2026 18:08:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hugovil.com
	; s=x; h=Subject:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Cc:To
	:From:subject:date:message-id:reply-to;
	bh=2H6tfy1TUzvjSiheWLKqM1iMWWpxdKE5eZOP/ogsv6M=; b=pHUww/FoKw00KckWsKTOiXsvfd
	427upCKlkgP0YqSLtD96gSCWc9JrcS2B5Lx42WNh6jK6NdZwxHRinYzDndImiU/3/6JC6tAoHokjB
	5nMJYC3LfSDeOORo0pTRxVDkEaxNvYDR1vwIf1P3wy2sgXU8EuRlKzXQcC7FXYxPlnko=;
Received: from modemcable168.174-80-70.mc.videotron.ca ([70.80.174.168]:37706 helo=pettiford.lan)
	by mail.hugovil.com with esmtpa (Exim 4.92)
	(envelope-from <hugo@hugovil.com>)
	id 1vyD7Z-0002aR-AO; Thu, 05 Mar 2026 13:08:25 -0500
From: Hugo Villeneuve <hugo@hugovil.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	andrzej.hajda@intel.com,
	neil.armstrong@linaro.org,
	rfoss@kernel.org,
	Laurent.pinchart@ideasonboard.com,
	jonas@kwiboo.se,
	jernej.skrabec@gmail.com,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	shawnguo@kernel.org,
	laurent.pinchart+renesas@ideasonboard.com,
	antonin.godard@bootlin.com
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	hugo@hugovil.com,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>
Date: Thu,  5 Mar 2026 13:06:18 -0500
Message-ID: <20260305180651.1827087-4-hugo@hugovil.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260305180651.1827087-1-hugo@hugovil.com>
References: <20260305180651.1827087-1-hugo@hugovil.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 70.80.174.168
X-SA-Exim-Mail-From: hugo@hugovil.com
Subject: [PATCH v2 03/15] ARM: dts: imx6ul-var-som: change incorrect VAR-SOM-MX6UL references
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.hugovil.com)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_100841_316030_212FAC5C 
X-CRM114-Status: GOOD (  14.88  )
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

From: Hugo Villeneuve <hvilleneuve@dimonoff.com>

There is no Variscite module named VAR-SOM-MX6UL, but there is VAR-SOM-MX6
and also VAR-SOM-6UL, so it is confusing at first to know to which one it
refers to. The imx6ul-var-som* dts/dtsi supports only the VAR-SOM-6UL [1],
not VAR-SOM-MX6 [2], so modify comments and model descriptions accordingly.

Link  https://dev.variscite.com/var-som-6ul [1]
Link: https://dev.variscite.com/var-som-mx6 [2]

Signed-off-by: Hugo Villeneuve <hvilleneuve@dimonoff.com>
---
 arch/arm/boot/dts/nxp/imx/imx6ul-var-som-concerto.dts | 4 ++--
 arch/arm/boot/dts/nxp/imx/imx6ul-var-som.dtsi         | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-concerto.dts b/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-concerto.dts
index 085985356668f..35ce647a64075 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-concerto.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-concerto.dts
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0+
 /*
- * Support for Variscite MX6 Concerto Carrier board with the VAR-SOM-MX6UL
+ * Support for Variscite Concerto Carrier board with the VAR-SOM-6UL
  * Variscite SoM mounted on it
  *
  * Copyright 2019 Variscite Ltd.
@@ -11,7 +11,7 @@
 #include <dt-bindings/leds/common.h>
 
 / {
-	model = "Variscite VAR-SOM-MX6UL Concerto Board";
+	model = "Variscite VAR-SOM-6UL Concerto Board";
 	compatible = "variscite,mx6ulconcerto", "variscite,var-som-imx6ul", "fsl,imx6ul";
 
 	chosen {
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-var-som.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ul-var-som.dtsi
index 30032be6fdd50..7259526e2b884 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6ul-var-som.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6ul-var-som.dtsi
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0+
 /*
- * Support for Variscite VAR-SOM-MX6UL Module
+ * Support for Variscite VAR-SOM-6UL Module
  *
  * Copyright 2019 Variscite Ltd.
  * Copyright 2025 Bootlin
@@ -13,7 +13,7 @@
 #include <dt-bindings/gpio/gpio.h>
 
 / {
-	model = "Variscite VAR-SOM-MX6UL module";
+	model = "Variscite VAR-SOM-6UL module";
 	compatible = "variscite,var-som-imx6ul", "fsl,imx6ul";
 
 	memory@80000000 {
-- 
2.47.3


