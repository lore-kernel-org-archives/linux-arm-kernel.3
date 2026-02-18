Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E93EEE9A03B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Feb 2026 09:31:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OotIMiMrBZ/nv4lxL8V9WRPmjTez0Dvs0DUFfxQ6/r8=; b=xJtDyBkif4XVETatfjYDjv/njb
	J8VuZFw3UXuyEy+ISQa4blRY4Ng5UYGE3KYIUeplSgqxU9fXZn2aS1fkx8DFzpPRhML3M1tiR3m0T
	D2/UbpUHrdC7CTY+uFm2X7mhT1dy1Sadi5qOzZFvF3ccLTP9KV2VOjH9jG860W9c3hsKAgySr8c4T
	DzCPNzgMui1/1zA1EuoQV3skLWyGYZMdULaEUwCLsRegwZInbk0Dsq4nlCdEPi9EN++oRrhjL1YrF
	XoCM9VhwTSc1ZlfOZDHpoypNJ6+YsI5drZiay9S0oTIJ6KFmsRSW9mZWMTZ5qGs0qOH/aVBOrZX3P
	Gx7q5uTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsdtk-00000009YDG-2UsD;
	Wed, 18 Feb 2026 09:31:08 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsdth-00000009YAr-0XgA
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Feb 2026 09:31:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8E50B600AE;
	Wed, 18 Feb 2026 09:31:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A3D9C19421;
	Wed, 18 Feb 2026 09:31:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771407063;
	bh=IDP5Wn0Kme2KzU3xPb1Ng5ASKJPZ1EYLsGjH3tK0uNg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=lgoTlYXuyRLfBMjqq/sPrsmpoFsmfgsLmrl8EYUP8TwwU5qz6TaPc8hEsFw/NyREL
	 nFUbh6+oiDPjLQCiVHfXI9rRYL+Ln7xqwQJJ55LqhfyC0PIQX/GnZNXbIY2yXU9Dyw
	 gQAI8om8SsTA4Ly+C4BSF+C2+y6Thu6b7f8Tk9Z/wizv3bk/AyI8f11pbPT6ij0jGd
	 YqNLSR8rxcHDrhAeYMvlmUmkNMaUqdcsULLWqAqo11xZKB+B5TwxgbJ7zXpyLzzoS4
	 fIDNKMRcY8VYWP0Ezn5Pv8fVk/p63nin3f6QxPeOUbfTCh7H9wdT+abTH0vq5FibyR
	 ovvHLnxtojs9A==
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 18 Feb 2026 10:30:53 +0100
Subject: [PATCH v2 6/7] ARM: dts: bcm63138: Add I2C block
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260218-bcmbca-i2c-dts-v2-6-5373ef82c50c@kernel.org>
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

The BCM63138 has a brcmper I2C block.

The interrupt is at INTERRUPT_ID_I2C whic is
(ISR_TABLE3_OFFSET + 19) = 96+115, convert back
to SPI interrupt 115-32 = 83.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 arch/arm/boot/dts/broadcom/bcm63138.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm/boot/dts/broadcom/bcm63138.dtsi b/arch/arm/boot/dts/broadcom/bcm63138.dtsi
index 8e41c7130406..4ca4ec2ffed6 100644
--- a/arch/arm/boot/dts/broadcom/bcm63138.dtsi
+++ b/arch/arm/boot/dts/broadcom/bcm63138.dtsi
@@ -312,6 +312,15 @@ bootlut: bootlut@8000 {
 			reg = <0x8000 0x50>;
 		};
 
+		i2c0: i2c@be00 {
+			compatible = "brcm,brcmper-i2c";
+			reg = <0xbe00 0x60>;
+			interrupts = <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
 		pl081_dma: dma-controller@d000 {
 			compatible = "arm,pl081", "arm,primecell";
 			// The magic B105F00D info is missing

-- 
2.53.0


