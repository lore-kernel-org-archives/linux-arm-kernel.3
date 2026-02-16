Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3980BE7BDBB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Feb 2026 13:07:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=EgA1EP0NxVORnJT94FoGZWFubps4xgYB4GHnjyozQOg=; b=ikU2wF6LWlY2mbnYoLb7vbcozU
	ATa0JsNsg4ZPbrAhytpqraWhxW7HEmNjMKYHsIYAi3Z9a4jxOYBSc8+E89Z1Fy/9pI+D03Ra9Zx20
	Ha3+cyEF89GwuFvLP/keteN+7CBcSE5O2jsriXU61KrsQgcZsOUot6Ysk4znljlK5yPiOE7gu7HYn
	P9APjU58pd9zlTiPUsVz8qyRsYI5OzqJDj8RPI+Ntve3Es36JdJdW5ClVxofPSzIiYV4nRpzhxPML
	OBidYF/Hn4xLpSyKDIpn6n92MrX6+iEVBmceIOPWwQ5BXMLlf1YNqO/Ig5heaXMA8of6XDu6nXzs0
	GQaO9/4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vryJt-00000006cBb-2tfA;
	Mon, 16 Feb 2026 13:07:21 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vryJr-00000006cAE-2zxO
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Feb 2026 13:07:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B411F61118;
	Mon, 16 Feb 2026 13:07:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5AB3EC116C6;
	Mon, 16 Feb 2026 13:07:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771247238;
	bh=yVLlRPm6vATEXsxQUpcRC7wOFSzgIFI3POyiJ1X8Kfo=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=FhvEdXuI8Gol7NPUXYUOlttfJeirY5/RRoYti5ZS/o9vO21S20Zl2UylwpUumBMP1
	 b2WeiOK3LfW2gG2FCUj8ktNk5319AaiDc2KeeVGMOLZSXfsnMcDEMZ6tD+LVDf9osm
	 S5yQpAyl994GSQSE0Ux4WOk+CLN5Bn9XkP7IAq4Rtd53kdy3n0mcvmBp+MWhpfh3AY
	 eqyGwoe5vdt4whmzoLfFBo0Rq4SokBaRFdYX2tH21pQObrhzeepld2Y//5HzSWFJu9
	 HxPFsHeEwuKgbQaqxXAGPKY9Pi+r7nIrGWIRG8nVgTCFu4BFgufxvpgLNSe+vrpx6n
	 r8RPSofpzbDQw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 436DBE7BDAC;
	Mon, 16 Feb 2026 13:07:18 +0000 (UTC)
From: Maud Spierings via B4 Relay <devnull+maudspierings.gocontroll.com@kernel.org>
Subject: [PATCH v8 0/5] arm64: dts: freescale: add support for the
 GOcontroll Moduline IV/Mini
Date: Mon, 16 Feb 2026 14:07:07 +0100
Message-Id: <20260216-mini_iv-v8-0-8d528e7cb454@gocontroll.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/23Qy2rDMBAF0F8JWtdlZvTOqv9RSlH1SASJVeRgW
 oL/vXKgyBAvr5hzmdGdTbHmOLHj4c5qnPOUy9iCeTkwf3bjKQ45tMwISCKAHa55zJ95HhzIKD1
 5JOKsTX/XmPLPo+n9o+Vznm6l/j6KZ1xfnztmHGBI3BjrhSUh9dup+DLearlcXn25srVopg0m6
 pgaJnDJJOucR7GL+QZz6Jg3HJNUXgSbCO0uFh0j6o5Fw9I5xQ2nJNHtYvmPFSDxjuW6tv2KCQQ
 k4moXq44JZMdq/TDtQzDJGBT7N+sNxs3NumHHXTBRh5AgPOFlWf4A6PFuDxECAAA=
X-Change-ID: 20251009-mini_iv-a05e5c2c1223
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Matti Vaittinen <mazziesaccount@gmail.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Frank Li <Frank.Li@nxp.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Maud Spierings <maudspierings@gocontroll.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1771247236; l=3121;
 i=maudspierings@gocontroll.com; s=20250214; h=from:subject:message-id;
 bh=yVLlRPm6vATEXsxQUpcRC7wOFSzgIFI3POyiJ1X8Kfo=;
 b=2VE5cTSrRYdlJJKo02/IphlM2mbd9f00/g2fyO4nXIsSOdieGumXvF6xHmlCw2R2NlL10TqwD
 NK62OQDNnFSBCg6vXCd0kC3cA/EVr+j4pyCtSCaqTWUu6S+uKXrPB+t
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
Changes in v8:
- Change the Ka-Ro TX8M compatible to line up with the previously added
  TX8P karo,imx8mm-tx8m-1610 -> karo,tx8m-1610
- Link to v7: https://lore.kernel.org/r/20260210-mini_iv-v7-0-a3ad8e7ddf0d@gocontroll.com

Changes in v7:
- Fix order in Makefile (Frank)
- Link to v6: https://lore.kernel.org/r/20260205-mini_iv-v6-0-f7cdd8f88144@gocontroll.com

Changes in v6:
- Update trailers
- Fix includes in the mini/iv dts patches (Frank)
- Rebased on latest next
- Link to v5: https://lore.kernel.org/r/20260123-mini_iv-v5-0-29bef040f236@gocontroll.com

Changes in v5:
- Fixup aliases (remove usb ones) (Shawn)
- Link to v4: https://lore.kernel.org/r/20251117-mini_iv-v4-0-5aa63832f51a@gocontroll.com

Changes in v4:
- Fix BUCK6 property order
- Change the BUCK6 min/max voltage to match the dram specs (Lothar)
- Make it clear that the two systems are based on a SoM in commit
  message of the dt-bindings (Conor)
- Drop merged PMIC fix (Matti, Mark)
- Link to v3: https://lore.kernel.org/r/20251030-mini_iv-v3-0-ef56c4d9f219@gocontroll.com

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
Maud Spierings (5):
      dt-bindings: arm: fsl: Add GOcontroll Moduline IV/Mini
      arm64: dts: imx8mm: Add pinctrl config definitions
      arm64: dts: freescale: add Ka-Ro Electronics tx8m-1610 COM
      arm64: dts: freescale: Add the GOcontroll Moduline IV
      arm64: dts: freescale: Add the GOcontroll Moduline Mini

 Documentation/devicetree/bindings/arm/fsl.yaml     |   8 +
 arch/arm64/boot/dts/freescale/Makefile             |   2 +
 arch/arm64/boot/dts/freescale/imx8mm-pinfunc.h     |  33 +
 .../imx8mm-tx8m-1610-moduline-iv-306-d.dts         | 799 +++++++++++++++++++++
 .../imx8mm-tx8m-1610-moduline-mini-111.dts         | 687 ++++++++++++++++++
 .../arm64/boot/dts/freescale/imx8mm-tx8m-1610.dtsi | 444 ++++++++++++
 6 files changed, 1973 insertions(+)
---
base-commit: 0f8a890c4524d6e4013ff225e70de2aed7e6d726
change-id: 20251009-mini_iv-a05e5c2c1223

Best regards,
-- 
Maud Spierings <maudspierings@gocontroll.com>



