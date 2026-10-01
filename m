Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 950AACA5FC5
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 01:12:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=acsKLoL715zw971OMSfoId5cJwr49Nq1L5jIBYkpQCQ=; b=ubqgB4ouR8ShrHG+rKh4ODoFXI
	gvXc8eo3vGxRbcxcPOXnxWPzI3u5mWC472K1x0oR8k8mSUpffDgUzmABRXxGC+ihL7J6RQ1TbFmnm
	0HrAe8PAT9MTdgZOU6RLGeg/d4UlJtmFeZpdp2gJK83iiruLJ971dxm8Q/5DnEREYV4pxYKlrregI
	jv8YWKu9HcH+s1g7cEYz5Vng8fPk0LbpsnTZ4v8tI0nDmGex90gQ7jFpQGJndjHSWF1iLCOYwzXpU
	2uwsniKpdbtXFt2vQQtZkh2x5gH+mMhnU5sys3dPsbFAcpMd8O7jQJ/1QupfFchGXM0XNyBr85VYS
	lic8bjyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xC5Ln-00000007Xw6-254o;
	Thu, 01 Oct 2026 01:12:43 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xC5Lm-00000007Xw0-1H1G
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 01:12:42 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 6E98560142;
	Thu,  1 Oct 2026 01:12:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E42F71F000FF;
	Thu,  1 Oct 2026 01:12:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790817161;
	bh=acsKLoL715zw971OMSfoId5cJwr49Nq1L5jIBYkpQCQ=;
	h=From:To:Cc:Subject:Date;
	b=nM6RGH2vwmTbwEmc10UCR5TMq+4WNGGj7M05aBTv4oByfBZTWitBqvq04JEkawpY7
	 3Qvl9qmdRiJDCWXxPs/zdeRiDEZTIJO/jJ041/I/XOvOtV36sDttLhT5RULskbQMyd
	 w5rm4xHd2Gb90L/L3f1cfZp6SSS/Tt18jOqTt2J2Nc3OcKL/8/S8V4r59RecFNZ0gP
	 EJ+HiljYDteOdTGaS/S5cCCbUe8HR26lGK5u5oS0QYbwCHfWnj5IjgNjeVTZaeyzfN
	 oTN20rE355CWL7GpX+LJdr1/Lpxaaza7WQehyzuXUrdXVYjLHWZFXq0eIJa832g6o4
	 G9rNZLfCY5MOQ==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: freescale: Drop undocumented "hardware" root node properties
Date: Wed, 30 Sep 2026 20:12:31 -0500
Message-ID: <20261001011233.1306251-1-robh@kernel.org>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

The "hardware" property in the root node on some NXP i.MX8 boards is not
documented. We already have both compatible and model property to
describe the platform.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../boot/dts/freescale/imx8mm-tx8m-1610-moduline-iv-306-d.dts    | 1 -
 .../boot/dts/freescale/imx8mm-tx8m-1610-moduline-mini-111.dts    | 1 -
 .../boot/dts/freescale/imx8mp-tx8p-ml81-moduline-display-106.dts | 1 -
 3 files changed, 3 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-tx8m-1610-moduline-iv-306-d.dts b/arch/arm64/boot/dts/freescale/imx8mm-tx8m-1610-moduline-iv-306-d.dts
index 6cc04aa90f21..d15297a42d8f 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-tx8m-1610-moduline-iv-306-d.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mm-tx8m-1610-moduline-iv-306-d.dts
@@ -12,7 +12,6 @@
 / {
 	chassis-type = "embedded";
 	compatible = "gocontroll,moduline-iv-306-d", "karo,tx8m-1610", "fsl,imx8mm";
-	hardware = "Moduline IV V3.06-D";
 	model = "GOcontroll Moduline IV";
 
 	aliases {
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-tx8m-1610-moduline-mini-111.dts b/arch/arm64/boot/dts/freescale/imx8mm-tx8m-1610-moduline-mini-111.dts
index 39b7d9077e8e..9148ea7c6609 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-tx8m-1610-moduline-mini-111.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mm-tx8m-1610-moduline-mini-111.dts
@@ -12,7 +12,6 @@
 / {
 	chassis-type = "embedded";
 	compatible = "gocontroll,moduline-mini-111", "karo,tx8m-1610", "fsl,imx8mm";
-	hardware = "Moduline Mini V1.11";
 	model = "GOcontroll Moduline Mini";
 
 	aliases {
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81-moduline-display-106.dts b/arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81-moduline-display-106.dts
index 87b20b856458..206992ff9640 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81-moduline-display-106.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81-moduline-display-106.dts
@@ -11,7 +11,6 @@
 / {
 	compatible = "gocontroll,moduline-display-106", "karo,tx8p-ml81", "fsl,imx8mp";
 	chassis-type = "embedded";
-	hardware = "Moduline Display V1.06";
 	model = "GOcontroll Moduline Display baseboard";
 
 	aliases {
-- 
2.53.0


