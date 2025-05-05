Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 243F7C3ABB0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 May 2025 13:37:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=w40Df+PAF66z8xEiLdg7zkLMONnSrSI47hQzN386eyc=; b=QziH+kd9cl7HlqnjPbzMGOtbVC
	ig5HBiUicNTLPunRUQPLtPkm2B+y9kykcVhvGu9StIbTI+B4wxoRT3yGnePj/9v4Ye7t0mFh5aZuR
	hVzS3hSiiLrcB9LLdgpS5pXZ9TypJkFqoefhueM3GePzBR96QWsxmCe0qBhkRLJsF7UF9YfEidLOE
	lwp1Cl4vNdvtR3D1zWN+w6AZiQ8TcCP3XRzcVkJXaPKtmL9+DrWxByos0uBhcsCz3mKLrefjCycuL
	1saGk00xKICIawbGkbyYKDYFSyR+4vEuLqpwsC4LD4udFhKUOol/rMX8VhHJivAAW7+Se6syTQmWw
	h3qjtcgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBw0c-00000007W0m-3ujX;
	Mon, 05 May 2025 13:37:26 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBvo8-00000007UE8-3f98
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 May 2025 13:24:34 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <s.hauer@pengutronix.de>)
	id 1uBvo7-0000dt-Kd; Mon, 05 May 2025 15:24:31 +0200
Received: from dude02.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::28])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <s.hauer@pengutronix.de>)
	id 1uBvo6-001ElS-37;
	Mon, 05 May 2025 15:24:30 +0200
Received: from localhost ([::1] helo=dude02.red.stw.pengutronix.de)
	by dude02.red.stw.pengutronix.de with esmtp (Exim 4.96)
	(envelope-from <s.hauer@pengutronix.de>)
	id 1uBvo6-00Ce6n-2o;
	Mon, 05 May 2025 15:24:30 +0200
From: Sascha Hauer <s.hauer@pengutronix.de>
Date: Mon, 05 May 2025 15:24:24 +0200
Subject: [PATCH] arm64: dts: ti: k3-am625-sk: Add power/temperature sensors
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250505-am625-sk-sensors-v1-1-688fb928b390@pengutronix.de>
X-B4-Tracking: v=1; b=H4sIAAe8GGgC/x2MQQqAMAzAviI9W5jFKfgV8bBp1SJusoIIsr87J
 KcckheUk7DCUL2Q+BaVGIo0dQXz7sLGKEtxIEPWFNCdHVnUA5WDxqToPVnL5J1reyjZlXiV51+
 OU84fngVTXmIAAAA=
X-Change-ID: 20250505-am625-sk-sensors-bb255e2baa47
To: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746451470; l=2443;
 i=s.hauer@pengutronix.de; s=20230412; h=from:subject:message-id;
 bh=y77X37gAugX91JrGBbDc9vema3Ytb2kMk2Zu6xzLV/8=;
 b=kHuheosHNgMn75rW9pnvt3xs2K4Lnln8qgA5qFhk2utGwFiN33cb+Gr6UfNBBHalVJ2x1enMi
 R02UGWmyz2EDvENq1aDh7qV3X9tJCZ64/vB1fgIe50zT9i+ts7Reka6
X-Developer-Key: i=s.hauer@pengutronix.de; a=ed25519;
 pk=4kuc9ocmECiBJKWxYgqyhtZOHj5AWi7+d0n/UjhkwTg=
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: s.hauer@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250505_062432_913817_1BC94223 
X-CRM114-Status: UNSURE (   9.92  )
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

The AM625-SK has six power sensors and two temperature sensors connected
to I2C. Add them to the device tree.

Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
---
The AM625-SK has six power sensors and two temperature sensors connected
to I2C. Add them to the device tree.
---
 arch/arm64/boot/dts/ti/k3-am625-sk.dts | 68 ++++++++++++++++++++++++++++++++++
 1 file changed, 68 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am625-sk.dts b/arch/arm64/boot/dts/ti/k3-am625-sk.dts
index 2fbfa371934575efc4e9118a705f062bdea55f4f..e900d3134c72dc2616e3820b273d84b0db64bed5 100644
--- a/arch/arm64/boot/dts/ti/k3-am625-sk.dts
+++ b/arch/arm64/boot/dts/ti/k3-am625-sk.dts
@@ -193,6 +193,74 @@ exp1: gpio@22 {
 		pinctrl-names = "default";
 		pinctrl-0 = <&main_gpio1_ioexp_intr_pins_default>;
 	};
+
+	power-sensor@40 {
+		compatible = "ti,ina231";
+		reg = <0x40>;
+		#io-channel-cells = <1>;
+		label = "vdd_core";
+		shunt-resistor = <10000>;
+		vs-supply = <&vcc_3v3_sys>;
+	};
+
+	power-sensor@41 {
+		compatible = "ti,ina231";
+		reg = <0x41>;
+		#io-channel-cells = <1>;
+		label = "vddr_core";
+		shunt-resistor = <10000>;
+		vs-supply = <&vcc_3v3_sys>;
+	};
+
+	power-sensor@45 {
+		compatible = "ti,ina231";
+		reg = <0x45>;
+		#io-channel-cells = <1>;
+		label = "dvdd_1v8";
+		shunt-resistor = <10000>;
+		vs-supply = <&vcc_3v3_sys>;
+	};
+
+	power-sensor@47 {
+		compatible = "ti,ina231";
+		reg = <0x47>;
+		#io-channel-cells = <1>;
+		label = "vdd_ddr";
+		shunt-resistor = <10000>;
+		vs-supply = <&vcc_3v3_sys>;
+	};
+
+	temperature-sensor@48 {
+		compatible = "ti,tmp100";
+		reg = <0x48>;
+		label = "soc";
+		vs-supply = <&vcc_3v3_sys>;
+	};
+
+	temperature-sensor@49 {
+		compatible = "ti,tmp100";
+		reg = <0x49>;
+		label = "ddr";
+		vs-supply = <&vcc_3v3_sys>;
+	};
+
+	power-sensor@4c {
+		compatible = "ti,ina231";
+		reg = <0x4c>;
+		#io-channel-cells = <1>;
+		label = "dvdd_3v3";
+		shunt-resistor = <10000>;
+		vs-supply = <&vcc_3v3_sys>;
+	};
+
+	power-sensor@4d {
+		compatible = "ti,ina231";
+		reg = <0x4d>;
+		#io-channel-cells = <1>;
+		label = "vdda_1v8";
+		shunt-resistor = <10000>;
+		vs-supply = <&vcc_3v3_sys>;
+	};
 };
 
 &sdhci1 {

---
base-commit: 92a09c47464d040866cf2b4cd052bc60555185fb
change-id: 20250505-am625-sk-sensors-bb255e2baa47

Best regards,
-- 
Sascha Hauer <s.hauer@pengutronix.de>


