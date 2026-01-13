Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B640CD2F338
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Jan 2026 15:33:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i9tPInbRYZ5DqbTROuvEuMqdg4B8OEQPATOSgbmxIds=; b=f4THdD0JwX32E/6NMUP6FIpl9v
	4fJLZFYplVDS2CmBeujpffLiJiQjqfYPxTBbFWTPhdjsG3zTcVMDGas2JSRx5kk+ad0wAuJ1IfXwH
	ACSq+S2cp22jR7r/d4jpCJRz4KVWjFIu5QwbIf2xJ002IhqZj4XrPz+jnO79gaZfkzJbfAvpTEowd
	uG8OhsfhYyQHROVRVkbAhoPNJEArwAyI+cpa0v98/Th6dj5cMp53YSPXLXckXKDKz+33YiDdKuoNd
	4JJdNofOquFU3B8LBDSVnh+XQYX+44XVmCvxPvUOcCJlhCjZM1skDf/eXqbUbsYCV0IujJk6rZygq
	X5AL4+Gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfgOd-00000007OBS-0f0N;
	Tue, 13 Jan 2026 15:33:27 +0000
Received: from mail.andi.de1.cc ([2a02:c205:3004:2154::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfgOb-00000007O9u-19ZA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Jan 2026 15:33:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=Cc:In-Reply-To:References:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=i9tPInbRYZ5DqbTROuvEuMqdg4B8OEQPATOSgbmxIds=; b=k3HqSlBr938lscRgQVFS8xsNdi
	xmMgvVMTEgZwVcJcOTQhGeSVC8TwGkzY2N0FEq7LbSUmFd+RVBqXiTz0iWeq+KWew7mcWm059YHrM
	h31T6HOdhyX67zko8iWztVbG9XgHgva5Xt3OTFgKREmgBED2QK6Jb/5Y6dXhANhAMSlb6g1stcKL/
	qvGbtzqryDEEtSBozJ/ELG/TvqO0sPqEobMcOB4kZDg9kzOIFuLf61PzhcT3jEVG1veujpBnl6uhw
	wTLZ5fGnaxlFErRFmHTHe34m5YIvSC34sflfqDroVjSPXhq/tlAE3LqnsZCvHIaoFc0O3wo+4Bbhl
	8C3kxFtg==;
From: Andreas Kemnade <andreas@kemnade.info>
Date: Tue, 13 Jan 2026 16:31:35 +0100
Subject: [PATCH 2/3] ARM: dts: imx50-kobo-aura: add epd pmic description
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260113-tps65185-dt-v1-2-66d376ba5f65@kemnade.info>
References: <20260113-tps65185-dt-v1-0-66d376ba5f65@kemnade.info>
In-Reply-To: <20260113-tps65185-dt-v1-0-66d376ba5f65@kemnade.info>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Andreas Kemnade <andreas@kemnade.info>, Josua Mayer <josua.mayer@jm0.eu>
X-Mailer: b4 0.15-dev-a6db3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2670; i=andreas@kemnade.info;
 h=from:subject:message-id; bh=jBmRxWjmO330uO2yWkvQ8CKi7YrP9xdjB0Sm7QHVf+4=;
 b=owGbwMvMwCUm/rzkS6lq2x3G02pJDJlpqbNKSvJUc9afqjI8YGTVybKqdP+kqha5ORLXHjwIe
 3pYYfrOjlIWBjEuBlkxRZZf1gpun1Se5QZPjbCHmcPKBDKEgYtTACbyVIyR4e0Fz3tKk0v49otb
 LZy2QTju5qGCc1PXxro55xk+jQ5LdGRk2Bd79/pHsy37O77WJiapswrvVNfSunm8bVVl6vQ0GR8
 ZZgA=
X-Developer-Key: i=andreas@kemnade.info; a=openpgp;
 fpr=EEC0DB858E66C0DA70620AC07DBD6AC74DE29324
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260113_073325_318854_F03C477E 
X-CRM114-Status: GOOD (  10.29  )
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

From: Josua Mayer <josua.mayer@jm0.eu>

Kobo Aura (N514) includes a TPS65185 PMIC for the epaper display.

Add description for this pmic and its vin power-supply.

Signed-off-by: Josua Mayer <josua.mayer@jm0.eu>
Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
---
 arch/arm/boot/dts/nxp/imx/imx50-kobo-aura.dts | 60 ++++++++++++++++++++++++++-
 1 file changed, 59 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx50-kobo-aura.dts b/arch/arm/boot/dts/nxp/imx/imx50-kobo-aura.dts
index b1a6a9c58ac3..4725ee241cb1 100644
--- a/arch/arm/boot/dts/nxp/imx/imx50-kobo-aura.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx50-kobo-aura.dts
@@ -58,6 +58,16 @@ event-frontlight {
 		};
 	};
 
+	epd_pmic_supply: regulator-epd-pmic-in {
+		compatible = "regulator-fixed";
+		regulator-name = "epd_pmic_supply";
+		gpio = <&gpio1 27 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		startup-delay-us = <20000>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_epd_pmic_supply>;
+	};
+
 	sd2_pwrseq: pwrseq {
 		compatible = "mmc-pwrseq-simple";
 		pinctrl-names = "default";
@@ -135,7 +145,34 @@ &i2c2 {
 	pinctrl-0 = <&pinctrl_i2c2>;
 	status = "okay";
 
-	/* TODO: TPS65185 PMIC for E Ink at 0x68 */
+	pmic@68 {
+		compatible = "ti,tps65185";
+		reg = <0x68>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_epd_pmic>;
+		pwr-good-gpios = <&gpio3 28 GPIO_ACTIVE_HIGH>;
+		vcom-ctrl-gpios = <&gpio4 21 GPIO_ACTIVE_HIGH>;
+		enable-gpios = <&gpio3 30 GPIO_ACTIVE_HIGH>;
+		wakeup-gpios = <&gpio3 29 GPIO_ACTIVE_HIGH>;
+		vin-supply = <&epd_pmic_supply>;
+		interrupts-extended = <&gpio4 15 IRQ_TYPE_LEVEL_LOW>;
+
+		regulators {
+			vcom {
+				regulator-name = "vcom";
+			};
+
+			vposneg {
+				regulator-name = "vposneg";
+				regulator-min-microvolt = <15000000>;
+				regulator-max-microvolt = <15000000>;
+			};
+
+			v3p3 {
+				regulator-name = "v3p3";
+			};
+		};
+	};
 };
 
 &i2c3 {
@@ -161,6 +198,27 @@ MX50_PAD_CSPI_SS0__GPIO4_11		0x0	/* INT */
 		>;
 	};
 
+	pinctrl_epd_pmic: epd-pmic-grp {
+		fsl,pins = <
+			/* PWRUP */
+			MX50_PAD_EPDC_PWRCTRL1__GPIO3_30	0x0
+			/* WAKEUP */
+			MX50_PAD_EPDC_PWRCTRL0__GPIO3_29	0x0
+			/* VCOMCTRL */
+			MX50_PAD_EPDC_VCOM0__GPIO4_21		0x0
+			/* PWRGOOD: enable internal 100k pull-up */
+			MX50_PAD_EPDC_PWRSTAT__GPIO3_28		0xe0
+			/* INT: enable internal 100k pull-up */
+			MX50_PAD_ECSPI1_SS0__GPIO4_15		0xe0
+		>;
+	};
+
+	pinctrl_epd_pmic_supply: epd-pmic-supply-grp {
+		fsl,pins = <
+			MX50_PAD_EIM_CRE__GPIO1_27		0x0
+		>;
+	};
+
 	pinctrl_gpiokeys: gpiokeysgrp {
 		fsl,pins = <
 			MX50_PAD_CSPI_MISO__GPIO4_10		0x0

-- 
2.47.3


