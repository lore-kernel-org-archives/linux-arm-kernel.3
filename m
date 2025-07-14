Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD4A2C83F1B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Jul 2025 15:33:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1/bZceTz7f5S3mR9djxZojIdPvF+101cbNdjGmMV7JI=; b=UQEPpwBEL3fF+sH+iif7f//rxT
	1JGKXJJOiQNWml9UavbhGZdaXGb8UojZsIyiN/pfI9qYy6JsxzsKrRtsoBfQ2ffR6tIxO/ClTn8QU
	h0DvCel9SydIn9ICUSAVdn7LNCvM8nzn/gJYk/QhTHvAKfpBET3o9YoUij+mD428UBZU0hrn8Jfvg
	t/SmBLEn+YjHLIk1cZIfMAL5D/s1AJVu6cTSGsroQp79crtfYTO7xnWv2duzDR+fFu30uV2WOKWmx
	FCanaD0iqeu+B9MeZybzsIwM0VUsEU3iDhtk0mnzcXVLYFUPcxK6Z32kP8/i8H2lkOG9WX7Ur+JOe
	uGDmkCLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubLBU-00000002guo-2mY5;
	Mon, 14 Jul 2025 15:33:40 +0000
Received: from mail.fris.de ([2a01:4f8:c2c:390b::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubK2Y-00000002SJK-3unm
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Jul 2025 14:20:24 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id DBBACC753B;
	Mon, 14 Jul 2025 16:20:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fris.de; s=dkim;
	t=1752502821; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=1/bZceTz7f5S3mR9djxZojIdPvF+101cbNdjGmMV7JI=;
	b=pWVpG8bLFH3q8xSpCwxCxkqtZbNS1oQeTZut+C281nf3TZZaK4IK+IiT2TNCreodUcrSPw
	aURvp+w91CxPUXyy1GSrh1HM6ZQBZ+yB1xTdoThHrWd7lycKzPZPfEFhvLbjRB1AGdbhL4
	EWGm31P114MH5GVdz6TWNj/2P3ikAP1/TLXnWK++38/eiPujOH5b3SXH6V6hxF99S6vI7s
	bsT6GHUs6x920gdIULhzsF3ykW3BCwIkvw7qxiT1G+lS0t6wQhTQ0KujatVkLDzRHx/DHf
	dFcfxXDk4vgkfDVU4SrWKqEY7MK4WKdhRBY7UcQMq0+2Z4fsQYDKjo1KTZt8ow==
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
Subject: [PATCH 05/12] arm64: dts: imx8mm-kontron: Sort reg nodes alphabetically
Date: Mon, 14 Jul 2025 16:17:31 +0200
Message-ID: <20250714141852.116455-6-frieder@fris.de>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250714141852.116455-1-frieder@fris.de>
References: <20250714141852.116455-1-frieder@fris.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250714_072023_150822_08B30666 
X-CRM114-Status: UNSURE (   7.93  )
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

Sort the regulator nodes alphabetically.

Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
---
 .../dts/freescale/imx8mm-kontron-osm-s.dtsi   | 46 +++++++++----------
 1 file changed, 23 insertions(+), 23 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-kontron-osm-s.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-kontron-osm-s.dtsi
index d455429652305..264553248d5cc 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-kontron-osm-s.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm-kontron-osm-s.dtsi
@@ -30,29 +30,6 @@ chosen {
 		stdout-path = &uart3;
 	};
 
-	reg_vdd_carrier: regulator-vdd-carrier {
-		compatible = "regulator-fixed";
-		pinctrl-names = "default";
-		pinctrl-0 = <&pinctrl_reg_vdd_carrier>;
-		gpio = <&gpio3 16 GPIO_ACTIVE_HIGH>;
-		enable-active-high;
-		regulator-always-on;
-		regulator-boot-on;
-		regulator-name = "VDD_CARRIER";
-
-		regulator-state-standby {
-			regulator-on-in-suspend;
-		};
-
-		regulator-state-mem {
-			regulator-off-in-suspend;
-		};
-
-		regulator-state-disk {
-			regulator-off-in-suspend;
-		};
-	};
-
 	reg_usb1_vbus: regulator-usb1-vbus {
 		compatible = "regulator-fixed";
 		pinctrl-names = "default";
@@ -96,6 +73,29 @@ reg_usdhc3_vcc: regulator-usdhc3-vcc {
 		regulator-max-microvolt = <3300000>;
 		regulator-name = "VCC_SDIO_B";
 	};
+
+	reg_vdd_carrier: regulator-vdd-carrier {
+		compatible = "regulator-fixed";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_reg_vdd_carrier>;
+		gpio = <&gpio3 16 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-name = "VDD_CARRIER";
+
+		regulator-state-standby {
+			regulator-on-in-suspend;
+		};
+
+		regulator-state-mem {
+			regulator-off-in-suspend;
+		};
+
+		regulator-state-disk {
+			regulator-off-in-suspend;
+		};
+	};
 };
 
 &A53_0 {
-- 
2.50.1


