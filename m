Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 769CFC02180
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jan 2025 22:30:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=loQ2o6oEiCn7wCTUwnotsvXsE1G+HS8xL9vjbkkJsTg=; b=C4yi3Kr1PUaWSa
	VWlvzSj+DgPvUsbc8/i/OHwbD6eSe0kfYaO6SBG+uHk5HmoQOzfnOJ4xqpudzO3fW7om3kbFDwyWq
	rStWZDKPWmZG06ZubvtUildFPQEYpSGC7YOvGtdeu6rxov7AuqwZV0uPETzN7Tf6vMa77vIEntMEU
	qvZIhEpRivXyh4Os470MONlPgB1h5Hdy7yhtpp1+v54zXZltwbZroyLQ19wktTTAgpuEtRhcgblyE
	JXChtKASjo8C+zJTkeJ0SVGRYnjxUY1KKELjVxsNNyexPlHWwVZk9UFbrVSNzCaPsyh33ihza+HKk
	l6WTlZgG++9bmQ42bX6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXSxE-00000006pl0-2HQy;
	Mon, 13 Jan 2025 22:30:40 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXSw0-00000006pML-0Ybq
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jan 2025 22:29:25 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1tXSvv-0006ts-5k; Mon, 13 Jan 2025 23:29:19 +0100
Received: from dude05.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::54])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1tXSvu-000KaE-0m;
	Mon, 13 Jan 2025 23:29:18 +0100
Received: from localhost ([::1] helo=dude05.red.stw.pengutronix.de)
	by dude05.red.stw.pengutronix.de with esmtp (Exim 4.96)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1tXSvv-008syM-1G;
	Mon, 13 Jan 2025 23:29:18 +0100
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
Subject: [PATCH 0/6] arm64: dts: imx8mp-skov: add new variants
Date: Mon, 13 Jan 2025 23:29:04 +0100
Message-Id: <20250113-skov-imx8mp-new-boards-v1-0-75288def1271@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALCThWcC/x3MQQqAIBBA0avErBswKamuEi20xhoiDQcqiO6et
 HyL/x8QSkwCffFAopOFY8ioygKm1YaFkOds0Eo3qlIGZYsn8n63+4GBLnTRplnQOdtqVdfUGQ8
 5PhJ5vv/xML7vB6pXCVFoAAAA
X-Change-ID: 20250106-skov-imx8mp-new-boards-bba82044e96f
To: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Ahmad Fatoum <a.fatoum@pengutronix.de>, 
 Oleksij Rempel <o.rempel@pengutronix.de>
X-Mailer: b4 0.14.2
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_142924_172761_4851B091 
X-CRM114-Status: GOOD (  10.15  )
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
base-commit: 37136bf5c3a6f6b686d74f41837a6406bec6b7bc
change-id: 20250106-skov-imx8mp-new-boards-bba82044e96f

Best regards,
-- 
Ahmad Fatoum <a.fatoum@pengutronix.de>


