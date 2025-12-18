Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11B68D6ACED
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Dec 2025 11:40:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=g/ebJA5sQoiJkmJj33UgkkK/kpbHawgkAq2CASo8q5I=; b=srjAZBeZXnkunB
	NEygkSAcAY9tpeO7m8ahnz3FwE2NV29KeDuFzNhwm3kdSf+EmLu2co6lu9dqjnVyKOHmk+mMDa2Wt
	HiGlVrp7FbK/4FedR+rfpqfePSBoh/gSH/2r8WDZjcpBatUleFHSKY1EvxlXwV1WxriVjZ+5vzwjC
	vQxXJuLqn8+Q5xvfEgdM2mdYBx8YDi2XXiK72xcaBBT4W2JMorpYm4K2JT/XjJ1Muuza7t5t4Q5wl
	NFWBlOf34TFu+n1FWWuryJuJmc8PoOmMmTLciNdWBgeCff5n5ufaLLx1x9JKPt4jv6Fm/Sh05wpHw
	smzetyNx4p79f9Pr3/MA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWCMh-00000008Mjh-3c8M;
	Thu, 18 Dec 2025 11:40:15 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWCMe-00000008Mi0-0kqX
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 18 Dec 2025 11:40:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Cc:To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:From:Sender:Reply-To:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=g/ebJA5sQoiJkmJj33UgkkK/kpbHawgkAq2CASo8q5I=; b=GdOEJNbyywYEXHbHGYdAqHmHJH
	QeWNOZAA/+J2+TW4cJIKYPEJ9VRktW+QYNnChqGOKfKKAlSQ61UsCb/fcSc1uCre890RGpN5lmra1
	Q6XQLxZCRm9KaOdQljKlLYJ8hrPp0LmKVqcPTsi/HVrgFakP8T5NilWtnAeX6+inIbMfvVFv3q1nO
	MWJIYaVMOjfII9rKTy/iWS8K3L8HnUU+3CnzkySrkSCYmQF9CFdkPttsKp/BKakKMTkFNK4ADtB4j
	q0Lv6iigr9dfr15umxdoZG08hH/vx18GKZvaR/nS4TKpcFEuUPZBVN2R4fjLYUMZpNHirTcbRVr27
	n0u4w5Lg==;
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by casper.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWCMa-000000064Ba-0QrV
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Dec 2025 11:40:10 +0000
Received: from dude06.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::5c])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <f.pflug@pengutronix.de>)
	id 1vWCMB-0001vK-1v; Thu, 18 Dec 2025 12:39:43 +0100
From: Fabian Pflug <f.pflug@pengutronix.de>
Subject: [PATCH v4 0/2] Add devicetree for NXP i.MX93 FRDM board
Date: Thu, 18 Dec 2025 12:39:20 +0100
Message-Id: <20251218-fpg-nxp-imx93-frdm-v4-0-cd3a9f6ac89a@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOjnQ2kC/33PwQ6DIAyA4VcxnMcCBYzutPdYdmBQlINowBkX4
 7sPPSxLZnb8m/RrupCE0WMil2IhESeffB9yyFNBTKtDg9Tb3AQYKKZAUDc0NMwD9d1c54q2o8o
 YXjHNndU1yYtDROfnHb3dc7c+jX187Tcmvk3/chOnjCpZPsAKCZVS1wFD8xxjH/x8tkg2c4Jvp
 zx0IDuotGXoNBohDh3xcTgDOHREdphAI/OPxhj246zr+gYOCYz6SQEAAA==
X-Change-ID: 20250523-fpg-nxp-imx93-frdm-5cc180a1fda9
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Fabian Pflug <f.pflug@pengutronix.de>, 
 Daniel Baluta <daniel.baluta@nxp.com>, 
 Haidong Zheng <haidong.zheng@nxp.com>, Danwei Luo <danwei.luo@nxp.com>, 
 Lei Xu <lei.xu@nxp.com>, Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.14.3
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::5c
X-SA-Exim-Mail-From: f.pflug@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251218_114008_159920_A9F37DAF 
X-CRM114-Status: GOOD (  11.43  )
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
Changes in v4:
- remove it6263 block in i2c1, since it is not finished
- remove usdhc3 pwrsequence, since WLAN is not tested on my board
- remove eee-broken-1000t on phy2, since it is not broken
- update min/max-microvlt on buck converters
- Link to v3: https://lore.kernel.org/r/20251022-fpg-nxp-imx93-frdm-v3-0-03ec40a1ccc0@pengutronix.de

Changes in v3:
- Add Signed-off for original NXP contributors.
- Fixed whitespace errors (Thanks Francesco Valla)
- Added mu1 with status okay (Thanks Francesco Valla)
- Removed address cells from lpi2c3 (Thanks Frank Li)
- Configure pin for watchdog (Thanks Peng Fan)
- Updated regulator config
- Configure i2c0
- Link to v2: https://lore.kernel.org/r/20250526-fpg-nxp-imx93-frdm-v2-0-e5ad0efaec33@pengutronix.de

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
 arch/arm64/boot/dts/freescale/imx93-11x11-frdm.dts | 620 +++++++++++++++++++++
 3 files changed, 622 insertions(+)
---
base-commit: ea1013c1539270e372fc99854bc6e4d94eaeff66
change-id: 20250523-fpg-nxp-imx93-frdm-5cc180a1fda9

Best regards,
-- 
Fabian Pflug <f.pflug@pengutronix.de>


