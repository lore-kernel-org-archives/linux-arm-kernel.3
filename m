Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA989CA9EBE
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Oct 2026 20:45:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t7MbwgaqojIPAN2OelN9LWKctDUCH/tSK9JLFx3y0EU=; b=Na7f9sAGG7eUQPtZEnIAKvCbFm
	+JxxihuYMI3uF8CAItxhv+Mm1uuAd2cuqad5rPLs99vMxBIYHRKZwEMs0AxbQOe8mpCgU4JDlv2xS
	XQDmgG6qNrJA3yIKXwO/a+DGhQbryMi1YBBQE7E7G4unYs1AxfCQxVTwEs9zqQ3JLEZq0x+vh2WKw
	tBSFXeNw8UJg3hRatIc0mz0iDw2/ASpfZ0gTohUB6TEwn/oSY5ZwXuryK2klI4SMyzhzzzOk6oTug
	8y1T6hvnOScxjhWiRTpJuRvYvytOlNe1LZgs3rCcaSrvCOyiZuiohOz1SmN24bRJ8NU/U32LMPJoW
	vESEuYzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFHTL-00000007CRo-2nVZ;
	Fri, 09 Oct 2026 20:45:43 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFHTJ-00000007CRD-3gdv;
	Fri, 09 Oct 2026 20:45:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 38E0C43FF2;
	Fri,  9 Oct 2026 20:45:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id BB838C2BCF5;
	Fri,  9 Oct 2026 20:45:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1791578740;
	bh=8Dh3/kTrrUzopsVDi24w70drLr5YK5nQYk6yCKgYsfU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=BCN84LD4RVj0r5m99SObb1+WkeSuEGZdqnyaUvbgXbsN8ZqxxO6pGDqI38JcmfB5Y
	 d8FOOZleAja8EpKiJelsOmyYsVFjVcqwHtVul32XSjxBpsjkH6+PlNnPNiPAqqwz9Y
	 Ghh5m2f/EsAPhme8GhRmQgUL1NBRSbqDAmAH5683JxudOT5kkltap9h3DS45yKDDLk
	 xcQ1hjqWcPiJtuFB4mJFbU2/wiZkL65ZWeIAgJ/KfvINu0TUF61HuXX6/YkwvuV5T5
	 qIFrGFtaoX3KwEHxkXdSqS7c962LGJHfPCGel+rm7sar+WLdX8jUaPpbRO5azDGg5g
	 HV3Hu/hn6OUmA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B40FCA9EBE;
	Fri,  9 Oct 2026 20:45:40 +0000 (UTC)
From: Igor Velkov via B4 Relay <devnull+iav.iav.lv@kernel.org>
Date: Fri, 09 Oct 2026 20:45:37 +0000
Subject: [PATCH 2/2] arm64: dts: rockchip: Add the GPIO expander to Kobol
 Helios64
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261009-helios64-pca9655-v1-2-673ee4432650@iav.lv>
References: <20261009-helios64-pca9655-v1-0-673ee4432650@iav.lv>
In-Reply-To: <20261009-helios64-pca9655-v1-0-673ee4432650@iav.lv>
To: Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: Rosen Penev <rosenp@gmail.com>, 
 Gregory Clement <gregory.clement@bootlin.com>, Andrew Lunn <andrew@lunn.ch>, 
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Igor Velkov <iav@iav.lv>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1651; i=iav@iav.lv;
 h=from:subject:message-id;
 bh=yiECMN73jBgrYRCL1OT9sV1tguqxvNtakL0UezggRNg=;
 b=owGbwMvMwCVmNH1q96v4SmbG02pJDFkng4rNuqN2vtj0ip27NpNHZpv0rKlJs64mMa2QvXl+q
 dAE7qMGHaUsDGJcDLJiiiwTDmncylhy9a+/h/kDmDmsTCBDGLg4BWAibSaMDB8UfsZ80Ghxj1V3
 j0l50nfjx1yJtQv5Z2qIfu7MsqoKr2JkOBLnInwscmvL1C2p98trnmfur1ZdE6xwMf91R1Xtm2d
 u/AA=
X-Developer-Key: i=iav@iav.lv; a=openpgp;
 fpr=90C228DA68A4D5FD4F4837E03297958BEA5F7903
X-Endpoint-Received: by B4 Relay for iav@iav.lv/default with auth_id=1060
X-Original-From: Igor Velkov <iav@iav.lv>
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
Reply-To: iav@iav.lv
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Igor Velkov <iav@iav.lv>

Helios64 has an ON Semiconductor PCA9655E 16-bit GPIO expander at 0x20
on I2C2, powered from VCC3V3_SYS_S3, with its lines on the P5 GPIO
header. Its INT# output goes to GPIO0_B1 with an external pull-up (R59
to 1V8_S3), so the pin has no internal bias. Schematic, sheet 34:
https://wiki.kobol.io/helios64/files/schematics/Helios64_Schematics_Rev1.2.pdf

Assisted-by: LLM
Signed-off-by: Igor Velkov <iav@iav.lv>
---
 .../boot/dts/rockchip/rk3399-kobol-helios64.dts      | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399-kobol-helios64.dts b/arch/arm64/boot/dts/rockchip/rk3399-kobol-helios64.dts
index d146e5075b4f..a860bd2b3afc 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-kobol-helios64.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3399-kobol-helios64.dts
@@ -453,6 +453,20 @@ &i2c2 {
 	i2c-scl-falling-time-ns = <30>;
 	status = "okay";
 
+	gpio@20 {
+		compatible = "onnn,pca9655", "nxp,pca9555";
+		reg = <0x20>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+		interrupt-parent = <&gpio0>;
+		interrupts = <RK_PB1 IRQ_TYPE_LEVEL_LOW>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&exp16_int_l>;
+		vcc-supply = <&vcc3v3_sys_s3>;
+	};
+
 	temp@4c {
 		compatible = "national,lm75";
 		reg = <0x4c>;
@@ -493,6 +507,12 @@ user1_btn: user1-btn {
 		};
 	};
 
+	expander {
+		exp16_int_l: exp16-int-l {
+			rockchip,pins = <0 RK_PB1 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+
 	gmac {
 		gphy_reset: gphy-reset {
 			rockchip,pins = <3 RK_PB7 RK_FUNC_GPIO &pcfg_output_low>;

-- 
2.43.0



