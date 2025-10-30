Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D00DBCCF9F0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Oct 2025 06:35:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Yn5a2IstU4FuflZuyHFZqfWgVOJGYQHa0deNOR6x0Ps=; b=AR1R7j4/UgEPZPOT0vYCXSeGON
	i471Tg0SeiHHYz/Jww8tlupdvw++gueUhioI3JOcNVRoZHw83I6dkXQ0k8e2NkKppDypt6Wl2Asam
	dPS0nClkL2wYiVZ0ypwFOQKIj/TAPSzP4QRce766t/nrgA7i/t81l8ZBWxmfTHYL+nbLA1ZFMegqH
	e9jnwyrxtXELuydb/2CgqNrVsujZosyb0LoE1KxUW0tkd30b39Q9hfzzRO5VPY9nG+HdUB5d2bbqV
	KGVCMfjV7lwO/cgVADvVSxYbyy46G7we9S1admzS+vi1bYRpdHOs0gx+N3P4IdZ+CRNgZse2dMNwL
	stG5uGaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEMG8-00000003ZDq-0tYK;
	Thu, 30 Oct 2025 06:35:44 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEMG7-00000003ZCQ-0bB5
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Oct 2025 06:35:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 37AF9602A2;
	Thu, 30 Oct 2025 06:35:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id CE418C4CEF1;
	Thu, 30 Oct 2025 06:35:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761806141;
	bh=U7srSnWzfH6yj+mfSTGf2OP0Gg/vZlzbpPNFl8Dk7XQ=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=NlDL1fkOcAvWdTiWh1qtupEVkylVn1RCIvJ+Ecjz5Oz1PDX6y8bXubduJuudCf07i
	 LCmJxNofOQoRyt3bMHI4qEr0Xt6n0oJjHCMpCeBX+V/6+tuQiSNkTdXeow1yIUTSv2
	 PgbOCoRVkPwNfrZhWtr7vHionZGSVsLxEOCG/zMN9XufSTj5LKgLOLuY37HeBY3ICr
	 /vrSwoXJjPpPMwxIeoHAcfNWaRJDtgnbgl63QX53xtCfVIxVSFyODmSwVCxPURc+x5
	 fC9+x1NZOa5BOfCtR6HyoEO2sTjD+y2GBdkiZXtsuHBQaEc9TShNMEoWnywD8BB2Kr
	 1coGiCDQUhPDg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B982CCCF9F0;
	Thu, 30 Oct 2025 06:35:41 +0000 (UTC)
From: Maud Spierings via B4 Relay <devnull+maudspierings.gocontroll.com@kernel.org>
Subject: [PATCH v3 0/6] arm64: dts: freescale: add support for the
 GOcontroll Moduline IV/Mini
Date: Thu, 30 Oct 2025 07:35:36 +0100
Message-Id: <20251030-mini_iv-v3-0-ef56c4d9f219@gocontroll.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADgHA2kC/2WMwQqDMBAFf0X23JRkNdT01P8opYQ00QVNJJHQI
 v57o5cWPM7jzSyQbCSb4FotEG2mRMEXqE8VmF77zjJ6FQbkKAXnio3k6UmZaS6tNGgEYg3lPUX
 r6L2X7o/CPaU5xM8ezmJbj40sGGeubltlGoWNvNy6YIKfYxiGswkjbKGMfzLiT8YiI9eudUprI
 5qDvK7rF7GCyXHgAAAA
X-Change-ID: 20251009-mini_iv-a05e5c2c1223
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Matti Vaittinen <mazziesaccount@gmail.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Maud Spierings <maudspierings@gocontroll.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761806140; l=2171;
 i=maudspierings@gocontroll.com; s=20250214; h=from:subject:message-id;
 bh=U7srSnWzfH6yj+mfSTGf2OP0Gg/vZlzbpPNFl8Dk7XQ=;
 b=dUk+8sCZB3oHVtlOsJveFBg7XJlVdMloMj3tLjhulGXp3ipCK3pKsZ3y9+/ItK5lwGpdeSH5w
 w8ba6dfY5LSB1w1EJjYBMGOe9hQZkJEhiH4z1nI3D8f52VgHf6f8MpU
X-Developer-Key: i=maudspierings@gocontroll.com; a=ed25519;
 pk=7chUb8XpaTQDvWhzTdHC0YPMkTDloELEC7q94tOUyPg=
X-Endpoint-Received: by B4 Relay for maudspierings@gocontroll.com/20250214
 with auth_id=341
X-Original-From: Maud Spierings <maudspierings@gocontroll.com>
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
Reply-To: maudspierings@gocontroll.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Add initial support for the Moduline IV and Moduline Mini embedded
controllers.

These systems are powered by the Ka-Ro Electronics tx8m-1610 COM, which
features an imx8mm SoC.

Signed-off-by: Maud Spierings <maudspierings@gocontroll.com>
---
Changes in v3:
- Add patch fixing the pmic driver
- Use the proper feedback properties for BUCK6
- Slightly rework the compatibles, acked by conor dropped
- Add missing CAN interface supplies, remove the leftover comment
- Add missing vled-supply
- Add missing ethernet phy interrupt (doesn't work)
- Fix the cs-gpios properties in all spi interfaces
- Fix the order of properties in all spi interfaces
- Remove unused labels for regulators of the PMIC
- Link to v2: https://lore.kernel.org/r/20251022-mini_iv-v2-0-20af8f9aac14@gocontroll.com

Changes in v2:
- Fix allignment issue in imx8mm-tx8m-1610.dtsi (fec1)
- Move phy-reset into fec (works better in barebox)
- Make the gpio-line-names groups of four on every line
- Link to v1: https://lore.kernel.org/r/20251009-mini_iv-v1-0-f3889c492457@gocontroll.com

---
Maud Spierings (6):
      dt-bindings: arm: fsl: Add GOcontroll Moduline IV/Mini
      regulator: bd718x7: Fix voltages scaled by resistor divider
      arm64: dts: imx8mm: Add pinctrl config definitions
      arm64: dts: freescale: add Ka-Ro Electronics tx8m-1610 COM
      arm64: dts: freescale: Add the GOcontroll Moduline IV
      arm64: dts: freescale: Add the GOcontroll Moduline Mini

 Documentation/devicetree/bindings/arm/fsl.yaml     |   8 +
 arch/arm64/boot/dts/freescale/Makefile             |   3 +
 arch/arm64/boot/dts/freescale/imx8mm-pinfunc.h     |  33 +
 .../imx8mm-tx8m-1610-moduline-iv-306-d.dts         | 800 +++++++++++++++++++++
 .../imx8mm-tx8m-1610-moduline-mini-111.dts         | 688 ++++++++++++++++++
 .../arm64/boot/dts/freescale/imx8mm-tx8m-1610.dtsi | 444 ++++++++++++
 drivers/regulator/bd718x7-regulator.c              |   2 +
 7 files changed, 1978 insertions(+)
---
base-commit: 7c3ba4249a3604477ea9c077e10089ba7ddcaa03
change-id: 20251009-mini_iv-a05e5c2c1223

Best regards,
-- 
Maud Spierings <maudspierings@gocontroll.com>



