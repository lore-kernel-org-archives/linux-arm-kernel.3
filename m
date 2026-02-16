Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 432BBE81A49
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Feb 2026 16:56:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sC4bAGIJDG3yyvTBBbsE91LqqXHjAZB97T8h25dY4js=; b=2DmyMS9rLGFYn+QUAn50ab1Z1S
	KTpcgbA9xEiL1ymXs3A4dDxrA7JcJUMzdw8JdlzJur2C4IJ7iPrdSVSqTuOjDCL38+xO/suVaKOTA
	4UGvmIU61u/e+FaLhR6ypIPsyLIQwl/YRBSn29VgcQQOzSqL+FSryWkcVAKQxAUEC5yaO3AkK3zjS
	8AAAd5U++66MYXzw8aypo79rym6Lg141QJJ0bakycWpnGcU2/6TfyT+QctLgaf5CpKTSeW4S9QUrh
	RUPkH2XscSsIOpemLHG9qNw7pC03/7f4ij4lW8Q/smNa7V9B8DA0MXm3qW0OO2eWV6W+Z3vP2Mf/j
	krexMSWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vs1tb-000000073dl-0qQx;
	Mon, 16 Feb 2026 16:56:27 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vs1tW-000000073am-2Cvu
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Feb 2026 16:56:25 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 79D8AC16A15;
	Mon, 16 Feb 2026 16:56:30 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 69AFD606CF;
	Mon, 16 Feb 2026 16:56:19 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C22F510368019;
	Mon, 16 Feb 2026 17:56:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1771260978; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=sC4bAGIJDG3yyvTBBbsE91LqqXHjAZB97T8h25dY4js=;
	b=0t1mzztA+BNXLahIfAmH2E6QJ6kshnwGDk7Oiyf4VeQCNeKcb4ZMB6HyVFoJBCMBuRRnq/
	/jMlF/p4Ft7L+DeFei/7Phv4hs7XjpK36PbgiyohDEZskKvjI9zwq7Iy42w+k/tdFSnmEr
	0NskbHG+XwPELNyK6YYFVOPdQyyYyMEHdDI6CSl2FpjIFi5MCOM6PX9Aq9iwKbrCabwDxy
	ClxXe0XZX6R1LjUeQtzO7lvNCntk/rjIphQGGNz5gb9JfEPesGSbov/QwhAmvjKKeeUBFi
	eWuIAEbGxr5k5WZBonJn7I9K9MreBjMX/I1ySokQVkOLPOf4oNXnKwhRO9t+hw==
From: "Kory Maincent (TI)" <kory.maincent@bootlin.com>
Date: Mon, 16 Feb 2026 17:55:52 +0100
Subject: [PATCH v2 1/3] ARM: dts: ti: Enable overlays for am335x
 BeagleBoard devicetrees
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260216-feature_bbge-v2-1-22805cfdbf62@bootlin.com>
References: <20260216-feature_bbge-v2-0-22805cfdbf62@bootlin.com>
In-Reply-To: <20260216-feature_bbge-v2-0-22805cfdbf62@bootlin.com>
To: Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, 
 Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Russell King <linux@armlinux.org.uk>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 linux-omap@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 dri-devel@lists.freedesktop.org, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Bajjuri Praneeth <praneeth@ti.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Louis Chauvet <louis.chauvet@bootlin.com>, 
 "Kory Maincent (TI)" <kory.maincent@bootlin.com>
X-Mailer: b4 0.14-dev-d4707
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260216_085622_865828_EBF43954 
X-CRM114-Status: UNSURE (   9.29  )
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
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Allow overlays to be applied to am335x BeagleBoard boards. This adds
around ~40% to the total size of the DTB files on average.

Signed-off-by: Kory Maincent (TI) <kory.maincent@bootlin.com>
---

Changes in v2:
- Enable overlays only for am335x BeagleBoard boards.
---
 arch/arm/boot/dts/ti/omap/Makefile | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm/boot/dts/ti/omap/Makefile b/arch/arm/boot/dts/ti/omap/Makefile
index 14e500846875e..dcc6d4422e411 100644
--- a/arch/arm/boot/dts/ti/omap/Makefile
+++ b/arch/arm/boot/dts/ti/omap/Makefile
@@ -175,3 +175,11 @@ dtb-$(CONFIG_SOC_TI81XX) += \
 	dm8148-t410.dtb \
 	dm8168-evm.dtb \
 	dra62x-j5eco-evm.dtb
+
+# Enable support for device-tree overlays
+DTC_FLAGS_am335x-bone += -@
+DTC_FLAGS_am335x-boneblack += -@
+DTC_FLAGS_am335x-boneblack-wireless += -@
+DTC_FLAGS_am335x-bonegreen += -@
+DTC_FLAGS_am335x-bonegreen-wireless += -@
+DTC_FLAGS_am335x-bonegreen-eco += -@

-- 
2.43.0


