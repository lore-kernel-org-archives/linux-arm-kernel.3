Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B89D8C5DF81
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Aug 2026 22:51:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ei5Fyz86MWeIapWv6dEee0OMFSzsg21D3RKFdJFLZyc=; b=q2cBxOvCeY4S8yp9JB61ErNREZ
	C9quoAeLUVOAOkASiD7Jd1dI7Du1k1JOQq0geAlhqTVFaQxJjM18EJOTqX2L4DqIYuqcJ2UGYxWY/
	u9dv5LOnuSpppc1FqMglbcxao3SR60ut4vA90903DdsyQ9uJQjjKMalvABrt0SpLSfJ2KANEFqtCC
	ajdj/rmLCIoh6Jmob176sykSqUzfNsIvB2HHo4sCmM5I6s9XiR0RcZPw96dqxNozJqzGMzgnUWiO8
	o41K3A31mlJkfwJFz9GkJHzQ7Q13C89eX6u8RpvbJHSHariJfmBSEvSHkD4Yomm1PeIXznqE5eByn
	X9KqHnXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wydVe-0000000HSw5-3bcn;
	Mon, 24 Aug 2026 22:51:21 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wydVX-0000000HSv0-3oZ1
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Aug 2026 22:51:11 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id D02DE6013A
	for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Aug 2026 22:51:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 556361F00A3A;
	Mon, 24 Aug 2026 22:51:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787611870;
	bh=Ei5Fyz86MWeIapWv6dEee0OMFSzsg21D3RKFdJFLZyc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=T3pZpdOmoQ0bgEWTdJ7Q2yrEagsWEk6U4nWyaUPPtWOEZqHCv43JIZU+oD+QNmB4h
	 JQht7oRU0AL/id0lb5m2QSqyOuxqZDNS2ojpf18PdgWbrBXn8x6gUgQNgAlquc1V5N
	 ZvT2ga00L7TUj4zg3fN6XaZJ7+QYWZWh0stiafjahxnuByBcLwfSlLSFdLfO+3zYYp
	 u4W97IYh93N7RcRyV6H6SBuS+IrR+1I8Z4enDBbhQszfs7IG1jCXS6EH5/spGC2as3
	 cwrwjUO+dTcqj+AceDA/PWToF0y20TFkgHtHB0v/C5Mnr/BG0IeZk5BGOiCsJ9Lfzh
	 QRGF7SyjxZpCw==
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 25 Aug 2026 00:51:03 +0200
Subject: [PATCH 1/2] ARM: dts: ux500: Add the Imagis ISA to Janice DTS
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260825-ux500-dts-add-imagis-img1200-v1-1-6319ac50e3a3@kernel.org>
References: <20260825-ux500-dts-add-imagis-img1200-v1-0-6319ac50e3a3@kernel.org>
In-Reply-To: <20260825-ux500-dts-add-imagis-img1200-v1-0-6319ac50e3a3@kernel.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 Linus Walleij <linusw@kernel.org>, Linus Walleij <linusw@kernel.org>
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
Janice device tree.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 arch/arm/boot/dts/st/ste-ux500-samsung-janice.dts | 56 ++++++++++++++++++++++-
 1 file changed, 55 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/st/ste-ux500-samsung-janice.dts b/arch/arm/boot/dts/st/ste-ux500-samsung-janice.dts
index 18fb7263058e..1f47d5910c9a 100644
--- a/arch/arm/boot/dts/st/ste-ux500-samsung-janice.dts
+++ b/arch/arm/boot/dts/st/ste-ux500-samsung-janice.dts
@@ -360,7 +360,38 @@ i2c-gpio-2 {
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
+			pinctrl-0 = <&isa1200_janice_default>;
+
+			ldo {
+				regulator-name = "vdd_vib";
+				regulator-min-microvolt = <3000000>;
+				regulator-max-microvolt = <3000000>;
+			};
+		};
 	};
 
 	/* Bit-banged I2C on GPIO151 and GPIO152 also called "NFC_I2C" */
@@ -996,4 +1027,27 @@ janice_cfg3 {
 			};
 		};
 	};
+	isa1200 {
+		isa1200_janice_default: isa1200_janice {
+			/* Bring out clkout1 on pin GPIO227 pin AH7 */
+			janice_mux {
+				function = "clkout";
+				groups = "clkout1_a_1";
+			};
+			janice_cfg1 {
+				pins = "GPIO227_AH7";
+				ste,config = <&out_lo>;
+			};
+			/* HEN GPIO */
+			janice_cfg2 {
+				pins = "GPIO194_AF27";
+				ste,config = <&gpio_out_lo>;
+			};
+			/* LEN GPIO */
+			janice_cfg3 {
+				pins = "GPIO195_AG28";
+				ste,config = <&gpio_out_lo>;
+			};
+		};
+	};
 };

-- 
2.55.0


