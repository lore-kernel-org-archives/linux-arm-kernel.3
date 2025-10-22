Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CAEDCCD1AB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Oct 2025 14:06:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=PLAAXJFMtp0N5zL2GmpZvClGgvnays4YyzT3A279+hg=; b=rKLVWzaoIoRz3+
	zr9ENdU7Ziyo65d1uBp9GSJtVWEYUw3iN0M61s+iiwGc4fZJxSgSrC+MCaTHtqmYaBfULzojXl7Ot
	jNHr8dv4VXcOOXWYCdhYQ5B/21Rj+XzPZd6zsQA9Uerax02jq2b38159/BFBcITtX+qydi9yfbr1c
	pN8+UTmDQD/5w8kZHxOX6lA9szc/FExNbheIKk4he5mDhLszn/IqOX/t2Sp2lqP2KBITAThXGD5zS
	aoz3V57TpxFGR49Iy24T4tt8AdS/j7i8ClUz/PrDVZ2quMv4NQFhPYNXCApvmxAtTsN/huwhxZpAa
	JvOk6/9SX5i/eBFprH0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBZTR-000000038lo-2Rho;
	Wed, 22 Oct 2025 14:05:57 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBZTM-000000038k7-2Xjm
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 22 Oct 2025 14:05:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:From:Sender:Reply-To:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=PLAAXJFMtp0N5zL2GmpZvClGgvnays4YyzT3A279+hg=; b=kIGaW8DVLGVlNo2fqyfvw45PLq
	cfL08/w9pqc0K+dNKxzWvha42dI7gNYqPvL0VD5MFmgxbpowBllNmdIVg4yOMsPPZpsSBr2yDz7I6
	BcicV546+14YneculzJlzOs7t723pq1NU8KoK+lYXofDUmvYxgQvlLtK8qeijyQMm7bBqVKmnw2pS
	QZThQWoEKUQGwrhTVTMQsyvSnqmthQOP3qoDw+6NC8/nNrXNr8Qc1d9zXBxeKXpxfdIv9QJSnGZLf
	nVd87LiLruLPQ6T4QDjvKvcz+2RqgPsK1NnROy6+a9xROgQDqrI/nSNfo2xQirTY83TX58Gvb6sYu
	b3SS+ECw==;
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBYbd-00000000bwX-2eof
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Oct 2025 13:10:23 +0000
Received: from dude06.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::5c])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <f.pflug@pengutronix.de>)
	id 1vBZTI-0000vR-9a; Wed, 22 Oct 2025 16:05:48 +0200
From: Fabian Pflug <f.pflug@pengutronix.de>
Subject: [PATCH v3 0/2] Add devicetree for NXP i.MX93 FRDM board
Date: Wed, 22 Oct 2025 16:05:21 +0200
Message-Id: <20251022-fpg-nxp-imx93-frdm-v3-0-03ec40a1ccc0@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKLk+GgC/33NTQ6CMBCG4auQrq3pDyXgynsYF7WdwiwoTYukh
 nB3CysTjcv3S+aZlSSICIlcqpVEWDDh5EvIU0XMoH0PFG1pIphQTAlJXeipz4HimLtS0Y5UGcN
 bprmzuiPlMERwmA/0di89YJqn+Dp+LHxf/3ILp4yqunkIK2vRKnUN4PvnHCeP+WyB7OYiPp3mp
 yOKA0pbBk6DkfLL2bbtDU5DSxQBAQAA
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
 Daniel Baluta <daniel.baluta@nxp.com>, 
 Haidong Zheng <haidong.zheng@nxp.com>, Danwei Luo <danwei.luo@nxp.com>, 
 Lei Xu <lei.xu@nxp.com>
X-Mailer: b4 0.14.3
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::5c
X-SA-Exim-Mail-From: f.pflug@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251022_141021_802648_35C432BC 
X-CRM114-Status: GOOD (  12.60  )
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
 arch/arm64/boot/dts/freescale/imx93-11x11-frdm.dts | 658 +++++++++++++++++++++
 3 files changed, 660 insertions(+)
---
base-commit: 552c50713f273b494ac6c77052032a49bc9255e2
change-id: 20250523-fpg-nxp-imx93-frdm-5cc180a1fda9

Best regards,
-- 
Fabian Pflug <f.pflug@pengutronix.de>


