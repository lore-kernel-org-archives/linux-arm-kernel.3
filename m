Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD9F7E6FE54
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Dec 2025 21:36:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q/b5Wv8KkPTKa0fsi8+phTwp7+2Ee7sd60DvAoOHJfk=; b=L1ZMsP3xMRC5un7epJNs8GwpNM
	K5EZvQTsiTLE6M55kAfFBVrMh8llm/Ps42aZ6ooVb+Bj46ELk9Sj6LjlUS4EUV4w0XJH3mhBatQBJ
	ZGr+aHDkWKOa43cHHK/3hIkD5zQLmpSmMi2hgz1P6Y/Amdi2bjj/4vLrOXsyRXNnsUda5vlSVjq1R
	kKD8OrA42nggyhIyagdO7TMxq0WkmmSlWr7PoWdM5Anzu3b+73oNbA5z+pYgSRUGWnjb1RhieafVl
	vGM1GtrUM1gwcF8Rrm7ffkQwCB1SbU786XQhQu4UV6AWZ0j29dF5lJEuaLzC1NAEylXMq+goS5xSk
	Fpat4r5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYA39-0000000G6X7-2hNn;
	Tue, 23 Dec 2025 21:36:11 +0000
Received: from mail.andi.de1.cc ([2a02:c205:3004:2154::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYA2X-0000000G6Uu-2kDX
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Dec 2025 21:36:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=Cc:In-Reply-To:References:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=q/b5Wv8KkPTKa0fsi8+phTwp7+2Ee7sd60DvAoOHJfk=; b=eVcP47gv26jr1RYTDBI4FcsqPn
	TCy76Kv9yY+J4Saqtoia3gYx1cAlN1stlsDxudwENaTcO2gbQOup4Nm2w+36EcaUx2m+pOWfKgdsy
	IVqqEEKdxpCLnduJOUagjqLCah3erFK7Fh9Y2OMfwLKJ92Oa4Foc+ZYesMxsRuA+0dLaKoTLGANlG
	OTlcixX4/E4mI03nZdjdYYYieYgcdRmQjacQeH7NLPlZ/GqbdC/bo/4rYZasbS3uyQ+teRwq2dzUu
	jenic5SC7AoDV8uGnILl3aXWNhF4cgpStbQelGDSs68HG8/uIXQC6d6nAiqsaEsAVMUmJIgtloXL2
	2brLA2SQ==;
From: Andreas Kemnade <andreas@kemnade.info>
Date: Tue, 23 Dec 2025 22:34:02 +0100
Subject: [PATCH 1/2] ARM: dts: imx: imx6sll-kobo-clara2e: add regulator for
 EPD.
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251223-fp9931-clara2e-v1-1-e5b1cb79330a@kemnade.info>
References: <20251223-fp9931-clara2e-v1-0-e5b1cb79330a@kemnade.info>
In-Reply-To: <20251223-fp9931-clara2e-v1-0-e5b1cb79330a@kemnade.info>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Russell King <linux@armlinux.org.uk>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Andreas Kemnade <andreas@kemnade.info>
X-Mailer: b4 0.15-dev-a6db3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2410; i=andreas@kemnade.info;
 h=from:subject:message-id; bh=BHNbAqff+cdDItirvWIczJy92NVcYnnRIx7j+hS8iJo=;
 b=owGbwMvMwCUm/rzkS6lq2x3G02pJDJneXH+endoya47Y4ksZtbn13yNa+Z66LTY49ljv8NQs7
 qTJJ3NndJSyMIhxMciKKbL8slZw+6TyLDd4aoQ9zBxWJpAhDFycAjARvjqGf2Y3u1aX9x+VfcDb
 7fbxyr9DJb+DS3cLXmAvlXuw687xFilGhgWbpL8dmDTdwGdDdNurJdPlr7xmS/bJqOpyyDzH1O+
 iwwEA
X-Developer-Key: i=andreas@kemnade.info; a=openpgp;
 fpr=EEC0DB858E66C0DA70620AC07DBD6AC74DE29324
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251223_133533_721581_860767C0 
X-CRM114-Status: GOOD (  10.86  )
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

Now there is a driver and binding for the JD9930, so add the information
to the devicetree for revision b.

Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
---
 .../boot/dts/nxp/imx/imx6sll-kobo-clara2e-b.dts    | 61 +++++++++++++++++++++-
 1 file changed, 60 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6sll-kobo-clara2e-b.dts b/arch/arm/boot/dts/nxp/imx/imx6sll-kobo-clara2e-b.dts
index f81aeacf5142..f5e88764a08c 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6sll-kobo-clara2e-b.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6sll-kobo-clara2e-b.dts
@@ -16,8 +16,67 @@
 / {
 	model = "Kobo Clara 2E";
 	compatible = "kobo,clara2e-b", "kobo,clara2e", "fsl,imx6sll";
+
+	epd_pmic_supply: regulator-epd-pmic-in {
+		compatible = "regulator-fixed";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_epd_pmic_supply>;
+		regulator-name = "epd_pmic_supply";
+		gpio = <&gpio2 14 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		startup-delay-us = <20000>;
+	};
 };
 
 &i2c2 {
-	/* EPD PMIC JD9930 at 0x18 */
+	jd9930: pmic@18 {
+		compatible = "fitipower,jd9930", "fitipower,fp9931";
+		reg = <0x18>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_jd9930_gpio>;
+		vin-supply = <&epd_pmic_supply>;
+		pg-gpios = <&gpio2 7 GPIO_ACTIVE_HIGH>;
+		en-ts-gpios = <&gpio2 9 GPIO_ACTIVE_HIGH>;
+		enable-gpios = <&gpio2 8 GPIO_ACTIVE_HIGH>;
+		fitipower,tdly-ms = <2 2 2 2>;
+
+		regulators {
+			vcom_reg: vcom {
+				regulator-name = "vcom";
+				/*
+				 * For optimal performance these should be
+				 * tuned on a per batch basis e.g. using
+				 * overlays.
+				 */
+				regulator-min-microvolt = <2352840>;
+				regulator-max-microvolt = <2352840>;
+			};
+
+			vposneg_reg: vposneg {
+				regulator-name = "vposneg";
+				regulator-min-microvolt = <15060000>;
+				regulator-max-microvolt = <15060000>;
+			};
+
+			v3p3_reg: v3p3 {
+				regulator-name = "v3p3";
+			};
+		};
+	};
+};
+
+&iomuxc {
+	pinctrl_jd9930_gpio: jd9930-gpiogrp {
+		fsl,pins = <
+			MX6SLL_PAD_EPDC_PWR_CTRL0__GPIO2_IO07	0x17059 /* PG */
+			MX6SLL_PAD_EPDC_PWR_CTRL1__GPIO2_IO08	0x40010059 /* EN */
+			MX6SLL_PAD_EPDC_PWR_CTRL2__GPIO2_IO09	0x40010059 /* EN_TS */
+		>;
+	};
+
+	pinctrl_epd_pmic_supply: epd-pmic-supplygrp {
+		fsl,pins = <
+			MX6SLL_PAD_EPDC_PWR_WAKE__GPIO2_IO14	0x40010059
+		>;
+	};
 };

-- 
2.47.3


