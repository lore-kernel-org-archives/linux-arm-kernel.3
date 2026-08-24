Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFD8BC61CE2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Aug 2026 22:51:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eVgJpTkwEbcwWgNGbcQgLPoVz9aODaMiBF7bSyMrtPM=; b=Tq7pG1/3flQ3Nvv0WwBYxejUPt
	1KGUtXXFlApCtWOg6VB0h6ZfD+ZxmWAHLj5rmQbW6Db416qJcHr0YLBNtJ/S7sK0fQd0wM3tHLdcO
	ZZ2BQRxLW6dwOPWT4WOBorNes2nONcQr7gLRB9X4CQAeVCNLAedvDI/Xs+lJKE8IfGq0FjFPVSa45
	o2RmFdOmyc3FplTvx4Gz3ZUqih0U4auk9P95/rIAhRgmpOTJIPOwVF3zdtn6BLbwphhXCG3YxloWb
	HNk05BJ1qNR16mbZAf0TzkJrxg/Bdaiq2waKX+XXPshzDK30cRhq357FrfwSR022ymo9ovIgqSEcc
	KgDFcYRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wydVh-0000000HSwX-1V4D;
	Mon, 24 Aug 2026 22:51:21 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wydVY-0000000HSvG-3biO
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Aug 2026 22:51:14 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 4F39343686
	for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Aug 2026 22:51:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 014E61F000E9;
	Mon, 24 Aug 2026 22:51:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787611872;
	bh=eVgJpTkwEbcwWgNGbcQgLPoVz9aODaMiBF7bSyMrtPM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=TxuIIXMeWQBB/0kKmZu927VGgyBMnpxbnavBFpfGXIHjZFbXkI1OV1XVN9h/XOFmR
	 1B3LmUyAzC6FLyaXCsAMiENv+gcKd9/p7wpO88eV/h/F1XNh/1OQtYft6KNE3a7CAa
	 79xLKK+e9smMzGtN+hEsaj7k5KdGQuA5K2tzH2rgP/lcls6aahp8ChPs9jNGuXDvgh
	 qjVdZ+MBKKcfYzrcepGT5tuAAIMMmTWhiToy5+ucu+cGQ96F3NLFNVoF7yXB86pE5v
	 98+BzZ2NbQd6WlGncoOrixp6F4Re+sesBn40r9iC4Kkhc++Xp3oMLswQuYNTJNV+0a
	 uOu3ez/ULjeQg==
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 25 Aug 2026 00:51:04 +0200
Subject: [PATCH 2/2] ARM: dts: ux500: Add the Imagis ISA to Gavini DTS
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260825-ux500-dts-add-imagis-img1200-v1-2-6319ac50e3a3@kernel.org>
References: <20260825-ux500-dts-add-imagis-img1200-v1-0-6319ac50e3a3@kernel.org>
In-Reply-To: <20260825-ux500-dts-add-imagis-img1200-v1-0-6319ac50e3a3@kernel.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 Linus Walleij <linusw@kernel.org>
X-Mailer: b4 0.14.3
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

This adds the Imagis ISA1200 haptic feedback chip to the
Gavini device tree.

Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 arch/arm/boot/dts/st/ste-ux500-samsung-gavini.dts | 56 ++++++++++++++++++++++-
 1 file changed, 55 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/st/ste-ux500-samsung-gavini.dts b/arch/arm/boot/dts/st/ste-ux500-samsung-gavini.dts
index 0c3eef7a294a..3d1c31a709e0 100644
--- a/arch/arm/boot/dts/st/ste-ux500-samsung-gavini.dts
+++ b/arch/arm/boot/dts/st/ste-ux500-samsung-gavini.dts
@@ -329,7 +329,38 @@ i2c-gpio-2 {
 		pinctrl-0 = <&i2c_gpio_2_default>;
 		#address-cells = <1>;
 		#size-cells = <0>;
-		/* TODO: add the Immersion ISA1200 I2C device here */
+
+		/* Haptic feedback unit Imagis ISA1200 */
+		haptic-engine@49 {
+			compatible = "imagis,isa1200";
+			reg = <0x49>;
+
+			/*
+			 * GPIO194 pin HEN (motor hardware enable)
+			 * GPIO195 pin LEN (motor LDO enable)
+			 */
+			control-gpios = <&gpio6 2 GPIO_ACTIVE_HIGH>, <&gpio6 3 GPIO_ACTIVE_HIGH>;
+
+			/* clkout1 from ACLK divided by 8 */
+			clocks = <&clkout_clk DB8500_CLKOUT_1 DB8500_CLKOUT_SRC_ACLK 8>;
+
+			imagis,clk-div = <256>;
+			imagis,pll-div = <2>;
+
+			imagis,mode = <0>; /* LRA_MODE */
+
+			imagis,period-ns = <13400>;
+			imagis,duty-cycle-ns = <100>;
+
+			pinctrl-names = "default";
+			pinctrl-0 = <&isa1200_gavini_default>;
+
+			ldo {
+				regulator-name = "vdd_vib";
+				regulator-min-microvolt = <3000000>;
+				regulator-max-microvolt = <3000000>;
+			};
+		};
 	};
 
 	/* Bit-banged I2C on GPIO196 and GPIO197 also called "MPR_I2C" */
@@ -884,4 +915,27 @@ gavini_cfg1 {
 			};
 		};
 	};
+	isa1200 {
+		isa1200_gavini_default: isa1200_gavini {
+			/* Bring out clkout1 on pin GPIO227 pin AH7 */
+			gavini_mux {
+				function = "clkout";
+				groups = "clkout1_a_1";
+			};
+			gavini_cfg1 {
+				pins = "GPIO227_AH7";
+				ste,config = <&out_lo>;
+			};
+			/* HEN GPIO */
+			gavini_cfg2 {
+				pins = "GPIO194_AF27";
+				ste,config = <&gpio_out_lo>;
+			};
+			/* LEN GPIO */
+			gavini_cfg3 {
+				pins = "GPIO195_AG28";
+				ste,config = <&gpio_out_lo>;
+			};
+		};
+	};
 };

-- 
2.55.0


