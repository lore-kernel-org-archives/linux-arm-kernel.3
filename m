Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F370CD4F3D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 May 2026 17:48:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ncla7FvYPtza5aCB3BUSkvlbEemNpfdLkwizWTauvXo=; b=N4YBG8gjR7kMqyBKsLUFoVSnEA
	PmQT9Q6Mo4PkjCYFOEAqJe9wWyJXnZ5DbXACO5gxd3fWbMGCEkzXs3wWAOJKEmeaYmTjIs1eM/hxP
	WMbPGUcV4cd+epCw+PBMRrR9l6pslnzMIG15GPhABpOZ/yDOXXmFDjKyaYfxZkMgbagff7HEVevxk
	rAAB2Mvqw4IaY3ihA5Rg9srnxxuL2yQV0439ah8BbxYWDPG/cuTp01d6cE08LiXNdPI5KeRvTBWhj
	Eb2lekoQFMUDu6ugIfvR+YE2+m+D/SrnJycV30+ydirYM4z2ffV19l08V6aGOeA4Wep3hJfhfrcfP
	0ivMGMUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMrDT-0000000HaSn-2sCv;
	Tue, 12 May 2026 17:48:23 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMrDR-0000000HaRp-2kci;
	Tue, 12 May 2026 17:48:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 210BE6013B;
	Tue, 12 May 2026 17:48:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C83E3C2BCFA;
	Tue, 12 May 2026 17:48:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778608100;
	bh=fcW13kjSD93mQbIhQzCZ6BHO6+uiUNMkiFo3/S9zFOI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=jvQNT6kOjZDRDJgCV6PO9c//cQO9AL1lHVvtGDkV813udL+7TtbTsoNnCTKXPuD64
	 1/QeVBEMwll15/TS+agJkqctRn0+iWcBB873BfnLsObv6NoI++QZ4J5oyBD+g08tvM
	 oDQUrOB39ZBO4d1SVA8lIDNO6Yd7BK8k5hJVOAVJ8i32b+7M5TLx37muNx8Rex1YG2
	 KDF8vRaVP1OY8l1jnD4eNGl3UcKCGEz6lOvqE0U+p35VnQEqK3Hhay0V3DpNpsNrG9
	 VMC9zVo8yLJYH3EoWNtF7qnV6fIV6Mq5FLgEu6I9coB4pXe3B5LrpEcJUJTB105VoI
	 Oam6nTFxDaGMA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB9E1CD4F24;
	Tue, 12 May 2026 17:48:20 +0000 (UTC)
From: Ronald Claveau via B4 Relay <devnull+linux-kernel-dev.aliel.fr@kernel.org>
Date: Tue, 12 May 2026 19:47:29 +0200
Subject: [PATCH 2/2] arm64: dts: amlogic: t7: khadas-vim4: add PWM-driven
 status LED
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260512-add-kvim4-sysled-v1-2-7178719a43e7@aliel.fr>
References: <20260512-add-kvim4-sysled-v1-0-7178719a43e7@aliel.fr>
In-Reply-To: <20260512-add-kvim4-sysled-v1-0-7178719a43e7@aliel.fr>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ronald Claveau <linux-kernel-dev@aliel.fr>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1966;
 i=linux-kernel-dev@aliel.fr; h=from:subject:message-id;
 bh=ljQWRXfzQQh8+VfKgDXENiNlXKLzV1x0O1tJjws741c=;
 b=owGbwMvMwCWm1SvKXP3cUInxtFoSQxZz+iOTDNUAxlZuft2cj74q23NnBk7RKjZxtJpo1iuW5
 vWhqr+jlIVBjItBVkyRpX+u5Yl3l4+e+bpHPQVmDisTyBAGLk4BmIjOf4Z/RlOWnGoRnP0j7dAi
 190me1fo61VWLg7R+zvjztvgysq8LkaGaXu+2JwO5FQ6nr7i+4N6I9G19zji5roJWQsZqE8KuXC
 SGQA=
X-Developer-Key: i=linux-kernel-dev@aliel.fr; a=openpgp;
 fpr=DFD863F61375BF917F0012173953305EF1D0EC3E
X-Endpoint-Received: by B4 Relay for linux-kernel-dev@aliel.fr/default with
 auth_id=744
X-Original-From: Ronald Claveau <linux-kernel-dev@aliel.fr>
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
Reply-To: linux-kernel-dev@aliel.fr
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Ronald Claveau <linux-kernel-dev@aliel.fr>

The VIM4 board exposes a status LED wired to the PWM_AO_C_D output.
Enable the pwm_ao_cd controller with its pinmux, and declare a
pwm-leds node with a heartbeat trigger.

Also, move the xtal-clk node to restore alphabetical ordering.

Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
---
 .../dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts  | 30 +++++++++++++++++-----
 1 file changed, 23 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
index 69d6118ba57e7..c41525a34b721 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
+++ b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
@@ -45,13 +45,6 @@ secmon_reserved_bl32: secmon@5300000 {
 		};
 	};
 
-	xtal: xtal-clk {
-		compatible = "fixed-clock";
-		clock-frequency = <24000000>;
-		clock-output-names = "xtal";
-		#clock-cells = <0>;
-	};
-
 	dc_in: regulator-dc-in {
 		compatible = "regulator-fixed";
 		regulator-name = "DC_IN";
@@ -60,6 +53,16 @@ dc_in: regulator-dc-in {
 		regulator-always-on;
 	};
 
+	pwm-leds {
+		compatible = "pwm-leds";
+
+		status {
+			linux,default-trigger="heartbeat";
+			max-brightness = <255>;
+			pwms = <&pwm_ao_cd 0 30040 0>;
+		};
+	};
+
 	sd_3v3: regulator-sdcard-3v3 {
 		compatible = "regulator-fixed";
 		regulator-name = "SD_3V3";
@@ -155,6 +158,13 @@ wifi32k: wifi32k {
 		clock-frequency = <32768>;
 			pwms = <&pwm_ab 0 30518 0>;
 	};
+
+	xtal: xtal-clk {
+		compatible = "fixed-clock";
+		clock-frequency = <24000000>;
+		clock-output-names = "xtal";
+		#clock-cells = <0>;
+	};
 };
 
 &pwm_ab {
@@ -163,6 +173,12 @@ &pwm_ab {
 	pinctrl-names = "default";
 };
 
+&pwm_ao_cd {
+	status = "okay";
+	pinctrl-0 = <&pwm_ao_c_d_pins>;
+	pinctrl-names = "default";
+};
+
 /* SDIO */
 &sd_emmc_a {
 	status = "okay";

-- 
2.49.0



