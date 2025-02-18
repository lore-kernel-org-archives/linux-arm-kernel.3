Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EAD9C021AA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Feb 2025 18:46:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=pY0UW7G0o8GrRehqTq0pQa/8mGwIypQxsKKpscfOXso=; b=MNFVnr2a0urlJF
	QdQhbg6kNk03+um+pxaaBaxqd0SBULxbqdM6/7dLQniU109I8OHLdALEWoOZuSuioo1kVy1vc2Vbz
	B91tPOKiQ9fjitYg5rId3WK63cTUb5eHg0ResK13d3RArot0JK6fUMa4qT1L++mcxBf3rZmqbZMd5
	h87d5bLd8qmoRmE6MN59AnrM5rgvFNK+bvaD9jm2VD+1A5dtQMWSg/6kGm9fPPcluou09+03h9FZJ
	8NWwDVkSGdxidHqreu8VUz3Hd/nf5gyhGn1IoTxpUkkdQXrS0bXVXOrsYRW6YAVhguHoo5vY5EE9Q
	H6+YXUZh6cXvQO9nDSBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkSbs-00000009Pr9-3bAS;
	Tue, 18 Feb 2025 18:46:20 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkSU4-00000009Nvw-19ip
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Feb 2025 18:38:18 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1tkSU2-0000Gu-QH; Tue, 18 Feb 2025 19:38:14 +0100
Received: from dude05.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::54])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1tkSU2-001dai-1H;
	Tue, 18 Feb 2025 19:38:14 +0100
Received: from localhost ([::1] helo=dude05.red.stw.pengutronix.de)
	by dude05.red.stw.pengutronix.de with esmtp (Exim 4.96)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1tkSU2-00AL9G-10;
	Tue, 18 Feb 2025 19:38:14 +0100
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
Subject: [PATCH v2 0/6] arm64: dts: imx8mp-skov: add new variants
Date: Tue, 18 Feb 2025 19:38:12 +0100
Message-Id: <20250218-skov-imx8mp-new-boards-v2-0-4040379742ea@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJTTtGcC/3WNyw6CMBBFf4XM2jFt5VFd+R+GBdgBJoaWtFgxh
 H+3Ercuz0nuuSsE8kwBLtkKniIHdjaBOmRwHxrbE7JJDEqoQkhRYni4iDwuepzQ0gtb13gTsG0
 brUSe07nsII0nTx0ve/hWJx44zM6/958ov/aXlKd/yShRYFUorQ11UlXyOpHtn7N3lpejIai3b
 fsABBI/g8EAAAA=
X-Change-ID: 20250106-skov-imx8mp-new-boards-bba82044e96f
To: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Conor Dooley <conor.dooley@microchip.com>, 
 Ahmad Fatoum <a.fatoum@pengutronix.de>, 
 Oleksij Rempel <o.rempel@pengutronix.de>
X-Mailer: b4 0.14.2
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_103816_342430_6B1DD0B1 
X-CRM114-Status: GOOD (  11.05  )
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

The Skov i.MX8MP boards are a family of climate controllers.

There are already device trees for three board variants and this series
adds support for three more:

- Basic: Barebones DT for use as bootloader device tree and as fallback
    when a device is unknown
  - BD500: No touch screen, but a few LEDs on the front plate
  - TIAN G07017: with a 7" touch screen

---
Changes in v2:
- Added Conor's Acked-by (Thanks!)
- Fix comment typo in binding document
- Rebased on top of Shawn's for-next to resolve a trivial conflict
  around the RTC I2C frequency
- Link to v1: https://lore.kernel.org/r/20250113-skov-imx8mp-new-boards-v1-0-75288def1271@pengutronix.de

---
Ahmad Fatoum (5):
      dt-bindings: arm: fsl: add more compatibles for Skov i.MX8MP variants
      arm64: dts: imx8mp-skov: move I2C2 pin control group into DTSI
      arm64: dts: imx8mp-skov: describe I2C bus recovery for all controllers
      arm64: dts: imx8mp-skov: add revC BD500 board
      arm64: dts: imx8mp-skov: support new 7" panel board

Oleksij Rempel (1):
      arm64: dts: imx8mp-skov: add basic board as fallback

 Documentation/devicetree/bindings/arm/fsl.yaml     |  3 +
 arch/arm64/boot/dts/freescale/Makefile             |  3 +
 .../arm64/boot/dts/freescale/imx8mp-skov-basic.dts | 10 +++
 .../arm64/boot/dts/freescale/imx8mp-skov-reva.dtsi | 58 +++++++++++++-
 .../freescale/imx8mp-skov-revb-mi1010ait-1cp1.dts  | 11 ---
 .../boot/dts/freescale/imx8mp-skov-revc-bd500.dts  | 91 ++++++++++++++++++++++
 .../dts/freescale/imx8mp-skov-revc-tian-g07017.dts | 81 +++++++++++++++++++
 7 files changed, 243 insertions(+), 14 deletions(-)
---
base-commit: a8fd7fa3f9846eba45c3fd0390e2f6ee2ed2d22a
change-id: 20250106-skov-imx8mp-new-boards-bba82044e96f

Best regards,
-- 
Ahmad Fatoum <a.fatoum@pengutronix.de>


