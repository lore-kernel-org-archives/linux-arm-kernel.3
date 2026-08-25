Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D0BBC61DBC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Aug 2026 05:18:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sRFDSdPDr425uuq5umbh8K4+AEn5jgh345Ji4Y24bbE=; b=UsSTVvBHx8vuu9VtVDfZqSSSQi
	tjKFhtRQa3BXGYdAlcyo+UixQFoUC2aokSwvQu6sHp9u8vjN+/4PKMV4+aYDQKgt3HBS/Cr3lumTF
	BM90jSmD1PyQO+s0f8PRBSVw+qxnIgSmwvSR/IbTsaQ5YZ2zGRkt/T7lBXNJgTKsnDlQsxhgVQ7Sx
	NLCcPk+wAuQYhV8MhdsMOgJxf63YOJLhGNYw2epcpj4ihTPiwa2ZiqhUVjpyrHyrhut6MPETwPy6S
	q2dvPQw34NW1hYMV0Iin4HXvuY4C8zk/WHd3XjyxO49DEfDHKyeFr+vFw6qnKaZN1ZHRpn2NXlrkJ
	hOv9cF2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyjYD-00000000AWU-1EX5;
	Tue, 25 Aug 2026 05:18:21 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyjYA-00000000AVL-1LM8;
	Tue, 25 Aug 2026 05:18:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B27CF43AC9;
	Tue, 25 Aug 2026 05:18:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 869E5C2BCF4;
	Tue, 25 Aug 2026 05:18:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1787635097;
	bh=BneTF6Xp5rmyFqyxHB08Ui4BQSkX5TS6o9LZKizGA58=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Xo47GiyGhMkdCipCKnOTrjdRaYBT1T/wWO/QvSfALphPWrzex6DcYWTs+Vt2nOjq9
	 Xa2vtj02c3W107E3vmCbJNAVf5auPLa1ADwTrSdNRuH/svFJA+YptsFejhMrV2sf5O
	 pUOHLEplU3aq5jIAu8WwodeXKpGSIQbBMHR+AfpNMX1HToAJX/B0YOLrF+ZIwiLv4t
	 XPtw7YkbPHu6igsNd5XmpFHQeXnaHhICbthZ7FOm4CIfLu7I4OKPAZmFJHelL2fQjO
	 dVKYcpiL1BQOQPTt58iaQCVla/a1656cCHyQY+M6DgHKS0PSMB0BzDme/Z9ylJEHTv
	 kjSMHQQFsEdwA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 741ECC5DF94;
	Tue, 25 Aug 2026 05:18:17 +0000 (UTC)
From: Rudraksha Gupta via B4 Relay <devnull+guptarud.gmail.com@kernel.org>
Date: Mon, 24 Aug 2026 22:18:16 -0700
Subject: [PATCH v2 1/2] arm64: dts: rockchip: Enable the EG25-G modem on
 the Pinephone Pro
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260824-ppp_connectivity-v2-1-a4b0e11cd62c@gmail.com>
References: <20260824-ppp_connectivity-v2-0-a4b0e11cd62c@gmail.com>
In-Reply-To: <20260824-ppp_connectivity-v2-0-a4b0e11cd62c@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Lee Jones <lee@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Rudraksha Gupta <guptarud@gmail.com>, linux-clk@vger.kernel.org, 
 mfd@lists.linux.dev, Martijn Braam <martijn@brixit.nl>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787635096; l=3686;
 i=guptarud@gmail.com; s=20240916; h=from:subject:message-id;
 bh=BKJ8ewE7fSzmNjTVUblEb/3+hReBdcpXwAlKzQmJ6A0=;
 b=JfLuqZDAAFi4RexAkel6rjPxl7Ab5EWlSrS/LXNb9jOehBe8iOvV5AQVjfdUL7x/lasiDV5iu
 R8unLNmd0Z6D/Or9z5ISDXintJ2aTYSBlEXJcMEiUDgmot8YG/DQ+xQ
X-Developer-Key: i=guptarud@gmail.com; a=ed25519;
 pk=ETrudRugWAtOpr0OhRiheQ1lXM4Kk4KGFnBySlKDi2I=
X-Endpoint-Received: by B4 Relay for guptarud@gmail.com/20240916 with
 auth_id=211
X-Original-From: Rudraksha Gupta <guptarud@gmail.com>
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
Reply-To: guptarud@gmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Martijn Braam <martijn@brixit.nl>

The Quectel EG25-G modem is soldered to the board. It sits on the USB 2.0
host controller behind u2phy1, with uart3 as its AT command port, and
draws from two switched rails: vcc_4g_5v off the RK818 boost, and vcc_4g
off vcc_sys.

Neither rail supplies anything but the modem, which has to stay powered
for the board to work as a phone, so both are always-on.

The modem itself has no binding and no in-kernel driver, so it is not
described here; its control lines are driven from userspace.

Based on work by Martijn Braam, Kamil Trzciński, Ondrej Jirman and Dang
Huynh.

Signed-off-by: Martijn Braam <martijn@brixit.nl>
Signed-off-by: Rudraksha Gupta <guptarud@gmail.com>
---
 .../boot/dts/rockchip/rk3399-pinephone-pro.dts     | 69 ++++++++++++++++++++++
 1 file changed, 69 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts b/arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts
index 8d26bd9b7500..8d2b6a46b39d 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts
@@ -134,6 +134,32 @@ vcca1v8_s3: regulator-vcc1v8-s3 {
 		regulator-boot-on;
 	};
 
+	vcc_4g: regulator-vcc-4g {
+		compatible = "regulator-fixed";
+		enable-active-high;
+		gpio = <&gpio4 RK_PC7 GPIO_ACTIVE_HIGH>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&vcc_4g_en>;
+		regulator-name = "vcc_4g";
+		regulator-min-microvolt = <3800000>;
+		regulator-max-microvolt = <3800000>;
+		vin-supply = <&vcc_sys>;
+		regulator-always-on;
+	};
+
+	vcc_4g_5v: regulator-vcc-4g-5v {
+		compatible = "regulator-fixed";
+		enable-active-high;
+		gpio = <&gpio1 RK_PC7 GPIO_ACTIVE_HIGH>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&vcc_4g_5v_en>;
+		regulator-name = "vcc_4g_5v";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		vin-supply = <&vcc5v0_sys>;
+		regulator-always-on;
+	};
+
 	vcc1v8_codec: regulator-vcc1v8-codec {
 		compatible = "regulator-fixed";
 		enable-active-high;
@@ -264,6 +290,7 @@ rk818: pmic@1c {
 		system-power-controller;
 		wakeup-source;
 
+		boost-supply = <&vcc_sys>;
 		vcc1-supply = <&vcc_sys>;
 		vcc2-supply = <&vcc_sys>;
 		vcc3-supply = <&vcc_sys>;
@@ -318,6 +345,17 @@ regulator-state-mem {
 				};
 			};
 
+			vcc5v0_sys: DCDC_BOOST {
+				regulator-name = "vcc5v0_sys";
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-min-microvolt = <5000000>;
+				regulator-max-microvolt = <5000000>;
+				regulator-state-mem {
+					regulator-on-in-suspend;
+				};
+			};
+
 			vcca3v0_codec: LDO_REG1 {
 				regulator-name = "vcca3v0_codec";
 				regulator-min-microvolt = <3000000>;
@@ -702,6 +740,16 @@ blue_led_pin: blue-led-pin {
 		};
 	};
 
+	modem {
+		vcc_4g_5v_en: vcc-4g-5v-en-pin {
+			rockchip,pins = <1 RK_PC7 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+
+		vcc_4g_en: vcc-4g-en-pin {
+			rockchip,pins = <4 RK_PC7 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+
 	pmic {
 		pmic_int_l: pmic-int-l {
 			rockchip,pins = <1 RK_PC5 RK_FUNC_GPIO &pcfg_pull_up>;
@@ -827,6 +875,15 @@ &tsadc {
 	status = "okay";
 };
 
+&u2phy1 {
+	status = "okay";
+};
+
+&u2phy1_host {
+	phy-supply = <&vcc5v0_sys>;
+	status = "okay";
+};
+
 &uart0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&uart0_xfer &uart0_cts &uart0_rts>;
@@ -852,6 +909,18 @@ &uart2 {
 	status = "okay";
 };
 
+&uart3 {
+	status = "okay";
+};
+
+&usb_host1_ehci {
+	status = "okay";
+};
+
+&usb_host1_ohci {
+	status = "okay";
+};
+
 &vopb {
 	status = "okay";
 	assigned-clocks = <&cru DCLK_VOP0_DIV>, <&cru DCLK_VOP0>,

-- 
2.55.0



