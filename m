Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5118AE7718B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Dec 2024 08:40:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=3cmWRqL9U4CV5o0F4kqF4XZ9/xwZgplwVk8ZbiaTW6E=; b=ORiA5jSn33hi3Q
	Xihl7c+XEWf2ik3KQy0vweIKv/NsVonhv/Gd7jNgREppbKkuuMuLJZ3YHhriKt0Mh+c7+kf36BS6I
	i8v4T6XGjacdwPFQIFaE5bPO3be6t9IeWVCFZDcUbpx7plAzVMxCWVTUkP9IxOQH0Foh7bIvkuxme
	FZjrNUDCJNVNBjXLgGjcCu8qJTxeq86YhA0BIBGIwdaKdDXSOunn6Ecg/a3v2FWusA1zJYU4e5Su7
	KHfSIsDreg08ABfIYkMx3rjQiK42zXQRE29Buv5X+HEBIIrOBgXArfy3gdNe8jEOg1ZwngZpoIHRh
	WdD/wbmDH29BVqvXUWxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOC4v-00000001J1d-36Z7;
	Thu, 19 Dec 2024 08:40:17 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOAv3-000000014tH-2vHt
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Dec 2024 07:26:02 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1tOAuc-00064I-OQ; Thu, 19 Dec 2024 08:25:34 +0100
Received: from dude05.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::54])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1tOAua-004AOA-2i;
	Thu, 19 Dec 2024 08:25:33 +0100
Received: from localhost ([::1] helo=dude05.red.stw.pengutronix.de)
	by dude05.red.stw.pengutronix.de with esmtp (Exim 4.96)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1tOAub-00GenW-1d;
	Thu, 19 Dec 2024 08:25:33 +0100
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
Subject: [PATCH 00/10] arm64: dts: imx8mp-skov: flesh out device trees
Date: Thu, 19 Dec 2024 08:25:24 +0100
Message-Id: <20241219-skov-dt-updates-v1-0-38bf80dc22df@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGTKY2cC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxNDI0ML3eLs/DLdlBLd0oKUxJLUYt3UJIskc+NkM0vjFEMloK6CotS0zAq
 widGxtbUAB2qK5GEAAAA=
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Oleksij Rempel <o.rempel@pengutronix.de>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kernel@pengutronix.de, Ahmad Fatoum <a.fatoum@pengutronix.de>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>
X-Mailer: b4 0.13-dev
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241218_232601_726391_29C0044B 
X-CRM114-Status: UNSURE (   9.86  )
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

When the Skov device trees were added a year ago, there were no
upstream bindings yet for many parts of the display pipeline.

This has changed now, so this series fleshes the display pipeline parts
out and adds some more fixes/enhancements that have accrued in the
meantime.

---
Ahmad Fatoum (5):
      arm64: dts: imx8mp-skov: correct PMIC board limits
      arm64: dts: imx8mp-skov: operate CPU at 850 mV by default
      arm64: dts: imx8mp-skov: use I2C5 for DDC
      dt-bindings: display/lvds-codec: add ti,sn65lvds822
      arm64: dts: imx8mp-skov: configure uart1 for RS485

Oleksij Rempel (5):
      arm64: dts: imx8mp-skov: describe HDMI display pipeline
      arm64: dts: imx8mp-skov: describe LVDS display pipeline
      arm64: dts: imx8mp-skov: describe mains fail detection
      arm64: dts: imx8mp-skov: fix phy-mode
      arm64: dts: imx8mp-skov: increase I2C clock frequency for RTC

 .../bindings/display/bridge/lvds-codec.yaml        |  1 +
 .../arm64/boot/dts/freescale/imx8mp-skov-reva.dtsi | 63 ++++++++++++++++------
 .../boot/dts/freescale/imx8mp-skov-revb-hdmi.dts   | 45 +++++++++++++++-
 .../boot/dts/freescale/imx8mp-skov-revb-lt6.dts    | 60 +++++++++++++++++++++
 4 files changed, 152 insertions(+), 17 deletions(-)
---
base-commit: 78d4f34e2115b517bcbfe7ec0d018bbbb6f9b0b8
change-id: 20241218-skov-dt-updates-eb8b73c693d1

Best regards,
-- 
Ahmad Fatoum <a.fatoum@pengutronix.de>


