Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5E47E9A03E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Feb 2026 09:31:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lQ/O09RyaG0MbKktDQOE6RN40NhlMtMVFP215SnREkE=; b=pDHaSx9pQUfsJMZmr8CK3n7RXZ
	xqd6Aci//76+5wJ9X/GUDI7vwaM80E+g1o8efXdnw1ZrtpkZL9fDJZFJUwTqc1xTAmpksfkWUgypN
	5hoyIgD0n/fKMco5u0xXUAZdDdFOHh/d2mdjhS8/8Ctuxzs2tG8vIxK4T34BSa0AtsYeCPZy6oN0u
	UYC2G2l0JOVfCynlZmbpoTm4HuOJIDsg4bDKNdALf3QnfmUobdmT43UKM5ixaJpV+FtqB600rnDjq
	bT/nVmS4NclqzQ7Q/CfQeGbfREp1iP3E/lEqzYv4eSNmqJkJ1bMgRbc5tEGt6TTBid44Wo7sT+jln
	SjytMOZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsdtf-00000009Y9s-44mV;
	Wed, 18 Feb 2026 09:31:03 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsdtc-00000009Y7e-2DYA
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Feb 2026 09:31:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3BE9F40A8D;
	Wed, 18 Feb 2026 09:31:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B80CC19422;
	Wed, 18 Feb 2026 09:30:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771407060;
	bh=dT9HuQriYYVmB2DGLDdDK7r/1nUzQ5yjDBppIExCeio=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=uL/LIVstKgpprinH5oGmJqYqcULnY13YSPfQNoAIHhz6+XM0xN/UCpG2D0Imt8JT7
	 wa7OaEfkYG/lT9Wr3jYy5UARwQidL6mhrGrulspHRlBwwvCRlBeX5i2UCVbXOSgVRR
	 92eow5+EFNW/G3vJyvK6Wv2kt8fyk3fOgvTjwLRjhyzJtCfO2DKMIHoKeZ5oVr+IkR
	 /DuMmUNLIzI0FGqr61NDf3IWoclZkKr8/V2pRx5zREqYyU4tioGhHyOGXTLNaTA5fv
	 ANAMcC8cZJ6TSWodEuTfKOryYtrPCJS2DfWpEAW0D/S/AeYCfew4wv/x3EGcnGeX7q
	 vvqN2mTs/Apyg==
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 18 Feb 2026 10:30:51 +0100
Subject: [PATCH v2 4/7] ARM: dts: bcm6855: Add I2C bus blocks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260218-bcmbca-i2c-dts-v2-4-5373ef82c50c@kernel.org>
References: <20260218-bcmbca-i2c-dts-v2-0-5373ef82c50c@kernel.org>
In-Reply-To: <20260218-bcmbca-i2c-dts-v2-0-5373ef82c50c@kernel.org>
To: William Zhang <william.zhang@broadcom.com>, 
 Anand Gore <anand.gore@broadcom.com>, 
 Kursad Oney <kursad.oney@broadcom.com>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: linux-arm-kernel@lists.infradead.org, Linus Walleij <linusw@kernel.org>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260218_013100_612362_30CDCD87 
X-CRM114-Status: GOOD (  10.38  )
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

The BCM6855 has two brcmper I2C blocks, the second one in
the PERF1 area at 0xff85a800, this is covered by the
current bus range.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 arch/arm/boot/dts/broadcom/bcm6855.dtsi | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm/boot/dts/broadcom/bcm6855.dtsi b/arch/arm/boot/dts/broadcom/bcm6855.dtsi
index a88c3f0fbcb0..b3c4cd24ce53 100644
--- a/arch/arm/boot/dts/broadcom/bcm6855.dtsi
+++ b/arch/arm/boot/dts/broadcom/bcm6855.dtsi
@@ -240,6 +240,15 @@ nandcs: nand@0 {
 			};
 		};
 
+		i2c0: i2c@2100 {
+			compatible = "brcm,brcmper-i2c";
+			reg = <0x2100 0x60>;
+			interrupts = <GIC_SPI 77 IRQ_TYPE_LEVEL_HIGH>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
 		leds: led-controller@3000 {
 			#address-cells = <1>;
 			#size-cells = <0>;
@@ -278,5 +287,14 @@ uart1: serial@13000 {
 			clock-names = "uartclk", "apb_pclk";
 			status = "disabled";
 		};
+
+		i2c1: i2c@5a800 {
+			compatible = "brcm,brcmper-i2c";
+			reg = <0x5a800 0x60>;
+			interrupts = <GIC_SPI 87 IRQ_TYPE_LEVEL_HIGH>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
 	};
 };

-- 
2.53.0


