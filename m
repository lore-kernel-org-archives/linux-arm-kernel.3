Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CE8EC28B20
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 30 Mar 2025 12:24:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Fk2+WE9/QQiHjGgAj8JE2BzqYSdLo3nPWFWef91RhrM=; b=fiPAK8sdqZqlAv5l9cYsCbebIf
	5t3viI4EyT8WZDklPOJxh2hUZ143GJuYSxQyqHjjRNvPFMvFLcUVsxHcaS+V/+PTb1CleT4SAXlTm
	sOrYcQhP5n5bxwaZD+d/xzwZqS1MT+CLKIgn6crlr9Kr+ugIcRfP+R48+RYrC7qUMC2/QF85MfT1a
	wM7zFs0K5fiNa4VwJTWcLoGv1qT6HLv/V3CZMrhJwOJ/qMAnGq+pWVGPLGk1cHqep3Clb6jSlWhlE
	mM4RrshARyKxGV8l008HZObX7lOz84c0a3ySUCFuIHKjzzLwPgAumeM5weSliI+yDTJWoNJ7qnBTn
	BjIqczNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tyriQ-0000000GCFj-2ENF;
	Sun, 30 Mar 2025 12:24:38 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tyrYW-0000000GBCj-2fy8
	for linux-arm-kernel@lists.infradead.org;
	Sun, 30 Mar 2025 12:14:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=Fk2+WE9/QQiHjGgAj8JE2BzqYSdLo3nPWFWef91RhrM=; b=efXm5k
	Ms340Ycs8lkEc85yZcLOQqucHA3SgmhX5zGV6HTC2mQ//GJD6QuCKEffuz2AQJDy
	IJ10yDKCPofi7YlOsgsjGCHBLZ0Kv/g0WzQ/Lfa7pzp0MVYSkoVQEE9e7zibcJ/T
	Yxv0SM000dyObsSGYxNieguEwY0Qd/fMFVEmnvnaiMhXnIKf//aXcigz6b6uaO9Z
	i+I8YtP78s13xpa0MSE3WRp6DDY7fGJpTCKdkhZkF97p02ZbvbLYXXj63gpDlMnO
	LXnh5RRukR8qgAPzaGP3zYwLBzlpdVgKiRy1EZHJDcRz7XldYTkOP8AzKIhDc21w
	Ds2dacqWFQaikiNA==
Received: (qmail 855887 invoked from network); 30 Mar 2025 14:14:22 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 30 Mar 2025 14:14:22 +0200
X-UD-Smtp-Session: l3s3148p1@+qJmPo4xpDdtKjBa
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Tony Lindgren <tony@atomide.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-omap@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH 4/5] ARM: dts: ti: omap: fix faulty ohci/ehci node names
Date: Sun, 30 Mar 2025 14:13:27 +0200
Message-ID: <20250330121326.9069-11-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250330121326.9069-7-wsa+renesas@sang-engineering.com>
References: <20250330121326.9069-7-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250330_051424_948634_AA52B3A9 
X-CRM114-Status: UNSURE (   9.65  )
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

They should be named "usb@".

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 arch/arm/boot/dts/ti/omap/omap3.dtsi    | 4 ++--
 arch/arm/boot/dts/ti/omap/omap4-l4.dtsi | 4 ++--
 arch/arm/boot/dts/ti/omap/omap5-l4.dtsi | 4 ++--
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm/boot/dts/ti/omap/omap3.dtsi b/arch/arm/boot/dts/ti/omap/omap3.dtsi
index 92cd4c99dae7..817474ee2d13 100644
--- a/arch/arm/boot/dts/ti/omap/omap3.dtsi
+++ b/arch/arm/boot/dts/ti/omap/omap3.dtsi
@@ -862,14 +862,14 @@ usbhshost: usbhshost@48064000 {
 			#size-cells = <1>;
 			ranges;
 
-			usbhsohci: ohci@48064400 {
+			usbhsohci: usb@48064400 {
 				compatible = "ti,ohci-omap3";
 				reg = <0x48064400 0x400>;
 				interrupts = <76>;
 				remote-wakeup-connected;
 			};
 
-			usbhsehci: ehci@48064800 {
+			usbhsehci: usb@48064800 {
 				compatible = "ti,ehci-omap";
 				reg = <0x48064800 0x400>;
 				interrupts = <77>;
diff --git a/arch/arm/boot/dts/ti/omap/omap4-l4.dtsi b/arch/arm/boot/dts/ti/omap/omap4-l4.dtsi
index 150dd84c9e0f..4ee53dfb71b4 100644
--- a/arch/arm/boot/dts/ti/omap/omap4-l4.dtsi
+++ b/arch/arm/boot/dts/ti/omap/omap4-l4.dtsi
@@ -302,14 +302,14 @@ usbhshost: usbhshost@0 {
 					      "refclk_60m_ext_p1",
 					      "refclk_60m_ext_p2";
 
-				usbhsohci: ohci@800 {
+				usbhsohci: usb@800 {
 					compatible = "ti,ohci-omap3";
 					reg = <0x800 0x400>;
 					interrupts = <GIC_SPI 76 IRQ_TYPE_LEVEL_HIGH>;
 					remote-wakeup-connected;
 				};
 
-				usbhsehci: ehci@c00 {
+				usbhsehci: usb@c00 {
 					compatible = "ti,ehci-omap";
 					reg = <0xc00 0x400>;
 					interrupts = <GIC_SPI 77 IRQ_TYPE_LEVEL_HIGH>;
diff --git a/arch/arm/boot/dts/ti/omap/omap5-l4.dtsi b/arch/arm/boot/dts/ti/omap/omap5-l4.dtsi
index 3b505fe415ed..9f6100c7c34d 100644
--- a/arch/arm/boot/dts/ti/omap/omap5-l4.dtsi
+++ b/arch/arm/boot/dts/ti/omap/omap5-l4.dtsi
@@ -331,14 +331,14 @@ usbhshost: usbhshost@0 {
 					      "refclk_60m_ext_p1",
 					      "refclk_60m_ext_p2";
 
-				usbhsohci: ohci@800 {
+				usbhsohci: usb@800 {
 					compatible = "ti,ohci-omap3";
 					reg = <0x800 0x400>;
 					interrupts = <GIC_SPI 76 IRQ_TYPE_LEVEL_HIGH>;
 					remote-wakeup-connected;
 				};
 
-				usbhsehci: ehci@c00 {
+				usbhsehci: usb@c00 {
 					compatible = "ti,ehci-omap";
 					reg = <0xc00 0x400>;
 					interrupts = <GIC_SPI 77 IRQ_TYPE_LEVEL_HIGH>;
-- 
2.47.2


