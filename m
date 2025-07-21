Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E30FEC83F26
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Jul 2025 11:39:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G6t649V1EzrZ/HP6mEg0Xb/fiQdeIFETtkrsh9N4wsQ=; b=ZXUiqTDU/OwinpUaS4omyLWAox
	Qsq8fBLrWFODgYbs7OAGCS3xehCJRP+AJMz/OKvBVW1oDwiRjTSJAl0xTyLm3Fl9FhYpE6NbbtGip
	0F6nd49oNptNEya5r3n7DvEbZJwByeqe9Hz96G4ybJRm//reIszzk2kj66Oyd+i9RToNCaPgMlTmJ
	O1VU87d7Uoz1r11fmRY2gi5g47Y3xhZnQtWaHmC7slgI9D61sVg2FPyAf5dBBg2s1p8osPGx9rFKU
	xxNiplKzajq1uUo+8oQ4MlSbLULLgdwlgtB8uhqCNKVrGyg20dxr6/7v7SJsvUYQdHV8xrakoOIY6
	225VIHtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udorN-0000000H7DW-0z2B;
	Mon, 21 Jul 2025 11:39:09 +0000
Received: from mail.fris.de ([2a01:4f8:c2c:390b::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udnRk-0000000Gupk-3MZn
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Jul 2025 10:08:38 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4F3BEC75FD;
	Mon, 21 Jul 2025 12:08:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fris.de; s=dkim;
	t=1753092512; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=G6t649V1EzrZ/HP6mEg0Xb/fiQdeIFETtkrsh9N4wsQ=;
	b=rGiSV8bSE//KClQUGVH00FIpD29OIIppuf94nldIor2qJQf6POkkVsT/+Ud2t92fpdLvVh
	4hifYR24p/EzCkMj3/eI/h8E3yvbMWGGWQJmQL/f2d/LxBM8W62vBva0fTtYZjwmPu6Eh2
	m8LUD5h0W9Y5AFYdF+iNdigARckHT73lGd0bQmsOO2ZkiioUiTF9rXsR7qfDootIu+NgJG
	DdgabyI/Wfr+gKBXkx1qzkaVJ12sKbihQULF1qr55MA3NKqqJaDi94WT8rP3K248JX0+vq
	JatLmETUU6ErU5a4VFgpuu4Tyj3bNBAEXDFt0rMvsORNQsK3P7fkqIn2SDNBjA==
From: Frieder Schrempf <frieder@fris.de>
To: linux-arm-kernel@lists.infradead.org,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>
Cc: Frieder Schrempf <frieder.schrempf@kontron.de>,
	Fabio Estevam <festevam@gmail.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: [PATCH v2 02/12] arm64: dts: imx8mm-kontron: Remove unused regulator
Date: Mon, 21 Jul 2025 12:05:36 +0200
Message-ID: <20250721100701.115548-3-frieder@fris.de>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250721100701.115548-1-frieder@fris.de>
References: <20250721100701.115548-1-frieder@fris.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250721_030837_284173_B86F7B8A 
X-CRM114-Status: UNSURE (   8.51  )
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

From: Frieder Schrempf <frieder.schrempf@kontron.de>

This regulator is not used anywhere and is not available in hardware.
Remove it.

Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
---
 arch/arm64/boot/dts/freescale/imx8mm-kontron-bl-osm-s.dts | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-kontron-bl-osm-s.dts b/arch/arm64/boot/dts/freescale/imx8mm-kontron-bl-osm-s.dts
index 33f8d7d1970e0..3a166cf0afcb7 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-kontron-bl-osm-s.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mm-kontron-bl-osm-s.dts
@@ -48,14 +48,6 @@ pwm-beeper {
 		pwms = <&pwm2 0 5000 0>;
 	};
 
-	reg_rst_eth2: regulator-rst-eth2 {
-		compatible = "regulator-fixed";
-		gpio = <&gpio1 1 GPIO_ACTIVE_HIGH>;
-		enable-active-high;
-		regulator-always-on;
-		regulator-name = "rst-usb-eth2";
-	};
-
 	reg_vdd_5v: regulator-5v {
 		compatible = "regulator-fixed";
 		regulator-always-on;
-- 
2.50.1


