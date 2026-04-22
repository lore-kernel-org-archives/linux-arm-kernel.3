Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC48DFA1FFE
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Apr 2026 21:10:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7T6vZhHl8TSBdOsriXfUWP4e8No8iyNMWD8GABChdsk=; b=V1wCAq+HJ4wEfGb7QXLwNU30IT
	CuneZxQr8EMgG80mKHoo/9xRp70rf23VeGIeyeA7QqQrCMRWQE2BnlDqQpzvauf/Vxap3A4wM67O0
	qbZI6oDWQVsJaaN8ZaTiEvhsHEoA5duLzpUVQcYHzUPxCAEI6cnwlled6A2wrFOZ/U8zWucy571Aj
	tKoZXFlG/dzXKGBpmCexOS0+hNKgbym5hH6Mtf5EXyo1X21SCHYYDRtE3Rvykj58+1nUtrxCUX/8Z
	p0EmAUqkIFDPn9S/37ZcP6JjCCkFgC/fZot4MUWiLqpPUQnOvvAqlRXNw3XKrGOwV9C26ydMf/dMn
	ExuzZa6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFepb-0000000AkL5-2sbZ;
	Wed, 22 Apr 2026 21:09:59 +0000
Received: from mx.nabladev.com ([2a00:f820:417:0:178:251:229:89])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFepW-0000000AkHd-2cl0
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Apr 2026 21:09:55 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 92417113395;
	Wed, 22 Apr 2026 23:09:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1776892185; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=7T6vZhHl8TSBdOsriXfUWP4e8No8iyNMWD8GABChdsk=;
	b=U8yigYDTgYCWMZeC9D8jqd0KyXII2RErOPStW0UwZiq3Uc1QkfsOg93lqRwG8dv0/v6iFM
	2rVoL8pKVrX8rCJNk8CSvT5sXeLhW7RD5HblkMBImK4dfThnY+mOEkfG865ZxKFuf8Wu/M
	+HujQcW1h1XzZ/6gu2uzgm8K9r706qaJZRfTOwbhWWGBPBAJLgM/x7yr6iYzQsvP9WVZTp
	Thai8UqUkq9TGLZ4HWBXvVnhnWgYTg2lBKvJ0I1GPDLcclOg+XxXI9u7S0uBvyPC5GRFrZ
	p2IVpPKYORKZqnP7nmZl8LT3T+01/S7QQaTDIBsmACjIrqu1mRZoH7GJUc0zmw==
From: Marek Vasut <marex@nabladev.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marex@nabladev.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: imx8mn: Sort ifm VHIP4 EvalBoard Makefile entries
Date: Wed, 22 Apr 2026 23:09:23 +0200
Message-ID: <20260422210939.81012-1-marex@nabladev.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260422_140954_821026_973D2862 
X-CRM114-Status: UNSURE (   9.13  )
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

Sort the Makefile entries alphabetically. No functional change.

Signed-off-by: Marek Vasut <marex@nabladev.com>
---
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: Frank Li <Frank.Li@nxp.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Rob Herring <robh@kernel.org>
Cc: Sascha Hauer <s.hauer@pengutronix.de>
Cc: devicetree@vger.kernel.org
Cc: imx@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
---
 arch/arm64/boot/dts/freescale/Makefile | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 711e36cc2c990..1a08c5202f0fd 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -206,10 +206,10 @@ imx8mn-vhip4-evalboard-v1-overlay-ksz8794-dtbs := imx8mn-vhip4-evalboard-v1.dtb
 						  imx8mn-vhip4-evalboard-v1-overlay-ksz8794.dtbo
 imx8mn-vhip4-evalboard-v1-overlay-ksz9031-dtbs := imx8mn-vhip4-evalboard-v1.dtb \
 						  imx8mn-vhip4-evalboard-v1-overlay-ksz9031.dtbo
-imx8mn-vhip4-evalboard-v2-overlay-ksz8794-dtbs := imx8mn-vhip4-evalboard-v2.dtb \
-						  imx8mn-vhip4-evalboard-v2-overlay-ksz8794.dtbo
 imx8mn-vhip4-evalboard-v2-overlay-adin1300-dtbs := imx8mn-vhip4-evalboard-v2.dtb \
 						   imx8mn-vhip4-evalboard-v2-overlay-adin1300.dtbo
+imx8mn-vhip4-evalboard-v2-overlay-ksz8794-dtbs := imx8mn-vhip4-evalboard-v2.dtb \
+						  imx8mn-vhip4-evalboard-v2-overlay-ksz8794.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mn-vhip4-evalboard-v1.dtb \
 			  imx8mn-vhip4-evalboard-v1-overlay-ksz8794.dtb \
 			  imx8mn-vhip4-evalboard-v1-overlay-ksz8794.dtbo \
-- 
2.53.0


