Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39529C61DB6
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Aug 2026 07:04:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Xu+B/RB1MRzg0mu5Ko2Z6+LTrXJRjxET82eLEIkNpB0=; b=df7227zZzYmw58cwLEbrUpIegq
	m7ZUmT4QHnQJYPrP0uZfgOn8xxDQ6wXVX+ZTrgV3gwiYQF61MMh7EgStaTBVgBDbNnd88lerRwOqc
	jWjF+w/DpkCg9xTiddvvX1Agb6sxJMRAGVTUCpGqBcMaMbif9y8jwlV39tIPtYxIE0KSSX6KjMSvh
	PoAL9s3BtS3SzOz1dmBmatHIROoRxBlkO+/YJEEFLpFStpBK/6f5zzfTBaIiYea8nKXi07FKbl1FW
	eNm3D++HSmUAogTOc2dt8mM0nftTdYYdIK3fuKnn+v4PitEEFXfUV6xTO6ZIS2ngR3/NDVRLnYzfL
	WM9E326A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wylCy-00000000GBj-0RNc;
	Tue, 25 Aug 2026 07:04:32 +0000
Received: from www537.your-server.de ([188.40.3.216])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wylCv-00000000GAb-0yFq
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Aug 2026 07:04:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=Xu+B/RB1MRzg0mu5Ko2Z6+LTrXJRjxET82eLEIkNpB0=; b=Jtt9fJxw5+1aAGBc6g1M8Dg0l4
	5e40E1q1m3XI4ZQ9VgbYrrD+khc8UT1k0p9CSGhgqp0zI4jSbdS3qDkeNdBisX4gknfdPGEE9ldd2
	HPAjAiCst2lkFpJhhyAzA0xITiKmHHLw3Vvyl9DUvnST1InOzB6dRSHVvTqWv0UurYrdVQtlOZZOm
	VVElrT7yk883PKcYddoF/IbWFz7BKc3M5+eHg2RNZG2cgBsF4bx5K3nYH2YE1RLb3rAqGxV/Lt9oQ
	wvKbXtvHpAtz98fiHxihY3neugFkhjyS7YHlqHmiweGSRwedaLXvXzys6kTxlW7HGm5aReht5UNvi
	EqY4ixFg==;
Received: from sslproxy07.your-server.de ([78.47.199.104])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1wylCo-000PC5-23;
	Tue, 25 Aug 2026 09:04:22 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy07.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1wylCo-000H2F-0G;
	Tue, 25 Aug 2026 09:04:22 +0200
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
Subject: [PATCH v2 2/2] ARM: dts: mba6ulx: Add USB hub node
Date: Tue, 25 Aug 2026 09:04:17 +0200
Message-ID: <20260825070418.2072708-3-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260825070418.2072708-1-alexander.stein@ew.tq-group.com>
References: <20260825070418.2072708-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: Clear (ClamAV 1.4.3/28102/Mon Aug 24 08:23:58 2026)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260825_000429_268196_9E47FF12 
X-CRM114-Status: GOOD (  11.30  )
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

Instead of handling the USB hub reset using a regulator, add a proper
on-board USB hub device with reset-gpios set.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
Changes in v2:
* None

 arch/arm/boot/dts/nxp/imx/mba6ulx.dtsi | 20 +++++++++-----------
 1 file changed, 9 insertions(+), 11 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/imx/mba6ulx.dtsi b/arch/arm/boot/dts/nxp/imx/mba6ulx.dtsi
index bec72dc6bab6c..ba79bb9760806 100644
--- a/arch/arm/boot/dts/nxp/imx/mba6ulx.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/mba6ulx.dtsi
@@ -133,16 +133,6 @@ reg_mpcie: regulator-mpcie-3v3 {
 		vin-supply = <&reg_mba6ul_3v3>;
 	};
 
-	reg_otg2vbus_5v0: regulator-otg2-vbus-5v0 {
-		compatible = "regulator-fixed";
-		gpio = <&expander_out1 0 GPIO_ACTIVE_HIGH>;
-		enable-active-high;
-		regulator-name = "otg2-vbus-supply-5v0";
-		regulator-min-microvolt = <5000000>;
-		regulator-max-microvolt = <5000000>;
-		vin-supply = <&reg_mpcie>;
-	};
-
 	reserved-memory {
 		#address-cells = <1>;
 		#size-cells = <1>;
@@ -395,10 +385,18 @@ &usbotg1 {
 /* 7-port usb hub */
 /* id, pwr, oc pins not connected */
 &usbotg2 {
+	#address-cells = <1>;
+	#size-cells = <0>;
 	disable-over-current;
-	vbus-supply = <&reg_otg2vbus_5v0>;
 	dr_mode = "host";
 	status = "okay";
+
+	hub_2_0: hub@1 {
+		compatible = "usb424,2517";
+		reg = <1>;
+		reset-gpios = <&expander_out1 0 GPIO_ACTIVE_LOW>;
+		vdd-supply = <&reg_mba6ul_3v3>;
+	};
 };
 
 &usdhc1 {
-- 
2.55.0


