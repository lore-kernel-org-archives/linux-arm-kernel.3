Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33D7DC54FB3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 May 2025 11:07:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=8wk788YsNPRrPAkhYz6Jk9InfBySPws7TIstr5FX49Y=; b=Z0ygzC8b9NMRSQ
	rw02i9OtTPQAH+zXeS6oXwFQ4IJtZO6WPqzBMjC0V52lBIK2tAXppQ6v1/nge3zowEJJvlrXuQWIb
	jRZtagPh77jM7fo/9d59OIsOgO3+ER3nHpvLy3BXdE48t4+yzzVoouTRqx70QXj7Khw+/pJabucic
	Wo5ugJcbW09vcqpWPdTeO+LgZuo2C5h02kr+P0wBlfFxChQrjS0vcUCsCM15Dt83RVcCaEmIEW3yn
	JNpiZGZOGMxlLmB+I6s3z7IQM+ZRt2MAL1bTAR3o350ki6Qs/3Hyq7Fmtv/mJlNMuOYHoXGMbFYSR
	5mf5WI5QvPtIHk6lfN8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJVft-00000008fuR-0zGf;
	Mon, 26 May 2025 11:07:21 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJVbe-00000008fYh-3jBO
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 May 2025 11:03:00 +0000
Received: from dude06.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::5c])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <f.pflug@pengutronix.de>)
	id 1uJVbX-0000Pi-89; Mon, 26 May 2025 13:02:51 +0200
From: Fabian Pflug <f.pflug@pengutronix.de>
Subject: [PATCH v2 0/2] Add devicetree for NXP i.MX93 FRDM board
Date: Mon, 26 May 2025 13:02:34 +0200
Message-Id: <20250526-fpg-nxp-imx93-frdm-v2-0-e5ad0efaec33@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEpKNGgC/33NQQ6DIBAF0KuYWXcaQGm0q96jcWFh0FmIBKyhM
 d691AN0+X7y/98hUWRKcK92iLRx4sUXqEsFZhr8SMi2GJRQWmhVowsj+hyQ59wVRTujNka2YpD
 ODh2UYojkOJ+jz7544rQu8XN+bPKX/p3bJArUze2lbN2oVutHID++17h4zldL0B/H8QV5ba4zu
 QAAAA==
X-Change-ID: 20250523-fpg-nxp-imx93-frdm-5cc180a1fda9
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Fabian Pflug <f.pflug@pengutronix.de>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Daniel Baluta <daniel.baluta@nxp.com>
X-Mailer: b4 0.14.2
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::5c
X-SA-Exim-Mail-From: f.pflug@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250526_040258_928599_16EC792F 
X-CRM114-Status: GOOD (  12.10  )
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

I could not test all features of the board, therefore a lot of stuff is
omitted from the devicetree. but this is enough to have the board boot
via eMMC or SD-Card, debug via debug USB connector and have a network
connection.

The FRDM i.MX 93 development board is a low-cost and compact development
board featuring the i.MX93 applications processor.

It features:
- Dual Cortex-A55
- 2 GB LPDDR4X / LPDDR4
- 32 GB eMMC5.1
- MicroSD slot
- GbE RJ45 x 2
- USB2.0 1x Type C, 1x Type A

This file is based upon the one provided by nxp in their own kernel and
yocto meta layer for the device, but adapted for mainline.

Signed-off-by: Fabian Pflug <f.pflug@pengutronix.de>
---
Changes in v2:
- 1/2: remove CAN node, as it has not been tested.
- 1/2: ran dt-format (Thanks Frank Li)
	But also reordered some nodes afterwards again to have
	regulator-min before regulator-max, have the pinmux at the end
	of the file, and have the regulator-name as the first node
	inside the regulators.
	Re-added comments, that were deleted.
- 1/2: changes subjet to ar64:dts (Thanks Fabio Estevan)
- 1/2: removed reg_vdd_12v (Tanks Fabio Estevan)
- 1/2: added aliases for rtc, emmc, serial (Thanks Fabio Estevan)
- reordered the series to have documentation before dts. (Thanks
  Krzystof Kozlowski)
- Link to v1: https://lore.kernel.org/r/20250523-fpg-nxp-imx93-frdm-v1-0-546b2d342855@pengutronix.de

---
Fabian Pflug (2):
      dt-bindings: arm: fsl: add i.MX93 11x11 FRDM board
      arm64: dts: freescale: add support for NXP i.MX93 FRDM

 Documentation/devicetree/bindings/arm/fsl.yaml     |   1 +
 arch/arm64/boot/dts/freescale/Makefile             |   1 +
 arch/arm64/boot/dts/freescale/imx93-11x11-frdm.dts | 613 +++++++++++++++++++++
 3 files changed, 615 insertions(+)
---
base-commit: 94305e83eccb3120c921cd3a015cd74731140bac
change-id: 20250523-fpg-nxp-imx93-frdm-5cc180a1fda9

Best regards,
-- 
Fabian Pflug <f.pflug@pengutronix.de>


