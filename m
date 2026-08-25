Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05F68C5DF94
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Aug 2026 07:04:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yxVf1ZlFRAOlJwl6qpRF+rnH1dAXdUxZVv/8DjKqI6g=; b=DhWWKiAX9kaanliZE2dJghcYGJ
	HUMwstrb11AP61aUC+t5avqJiibX2IvVfodJ4490AXce+b6fSMLzGJdKexbx7U+auu0J3MbD62+wD
	0J1pVGJpRGwGzAhODaD5+Tqkydt7ARDC9mCv0+zYyYh3UNdgidd6088mKYKOb+rR8ThRLfY+AS8kj
	Gb+Xszp+M073hRu8/mNyH+ZPb8DRBZyXWiLlOLiwlA6b9tth2RBBezSjQ2WLNPnJi0Bd4BYWvfMU0
	v2zH+vT5vjbgEDVav+hzJIyEtBfYdfbbnCb3Ijw2CNDRIkMSmhIkYqdKKehaBHkym0cV9iYGAnhyx
	4+4bnbJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wylCy-00000000GBq-0pcB;
	Tue, 25 Aug 2026 07:04:32 +0000
Received: from www537.your-server.de ([188.40.3.216])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wylCv-00000000GAY-0Sko
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Aug 2026 07:04:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=yxVf1ZlFRAOlJwl6qpRF+rnH1dAXdUxZVv/8DjKqI6g=; b=ih+qqdOZdY5rYrKVZltsioMnap
	FHgg445KMLFcmSwpzs8oMWMIpsVVgZ7DHUntc/YMMiGFs+lIj8qwzqUSfJIDCAA3jBBzkuDLTxrGn
	PDt6CDDVgelvnx4VWAWYXdHlY9XxHHTDgdES9Xlm5e7jhMND3doHlcN7bg5CP689QE2dcYOU/zse2
	pPsEQgynI4BqSY/jWessUVgZKYAZAes+G7Z+Tj9v3b9J80vQvCK8zg7sav75Hu76laKwReODDFhEC
	rMGKEv8/Fc6yCJ5dAVFMnfQQ/GQdSY7L/S2hknWgEB876WQs6a71V9wKzxxOIn3Pe/fxf2M3smM3f
	WjsZXZ8g==;
Received: from sslproxy07.your-server.de ([78.47.199.104])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1wylCo-000PBz-0f;
	Tue, 25 Aug 2026 09:04:22 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy07.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1wylCn-000H2F-2H;
	Tue, 25 Aug 2026 09:04:21 +0200
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	linux@ew.tq-group.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] ARM: dts: mba6ulx: Add Ethernet PHY interrupt support
Date: Tue, 25 Aug 2026 09:04:16 +0200
Message-ID: <20260825070418.2072708-2-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260825070418.2072708-1-alexander.stein@ew.tq-group.com>
References: <20260825070418.2072708-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: Clear (ClamAV 1.4.3/28102/Mon Aug 24 08:23:58 2026)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260825_000429_260214_C6BDD86B 
X-CRM114-Status: GOOD (  10.26  )
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

With commit 417b0f8d08f87 ("gpio: pca953x: Add support for level-triggered
interrupts") the GPIO expander gained support for level-low interrupts
required for Ethernet PHYs

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
Changes in v2:
* Remove superfluous gpio-hogs

 arch/arm/boot/dts/nxp/imx/mba6ulx.dtsi | 16 ++++------------
 1 file changed, 4 insertions(+), 12 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/imx/mba6ulx.dtsi b/arch/arm/boot/dts/nxp/imx/mba6ulx.dtsi
index f0f886f2b8cfd..bec72dc6bab6c 100644
--- a/arch/arm/boot/dts/nxp/imx/mba6ulx.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/mba6ulx.dtsi
@@ -230,6 +230,8 @@ ethphy0: ethernet-phy@0 {
 			clocks = <&clks IMX6UL_CLK_ENET_REF>;
 			reg = <0>;
 			max-speed = <100>;
+			interrupt-parent = <&expander_in0>;
+			interrupts = <6 IRQ_TYPE_LEVEL_LOW>;
 		};
 
 		ethphy1: ethernet-phy@1 {
@@ -237,6 +239,8 @@ ethphy1: ethernet-phy@1 {
 			clocks = <&clks IMX6UL_CLK_ENET2_REF_125M>;
 			reg = <1>;
 			max-speed = <100>;
+			interrupt-parent = <&expander_in0>;
+			interrupts = <7 IRQ_TYPE_LEVEL_LOW>;
 		};
 	};
 };
@@ -276,18 +280,6 @@ expander_in0: gpio-expander@21 {
 		gpio-controller;
 		#gpio-cells = <2>;
 		vcc-supply = <&reg_mba6ul_3v3>;
-
-		enet1_int-hog {
-			gpio-hog;
-			gpios = <6 0>;
-			input;
-		};
-
-		enet2_int-hog {
-			gpio-hog;
-			gpios = <7 0>;
-			input;
-		};
 	};
 
 	expander_out1: gpio-expander@22 {
-- 
2.55.0


