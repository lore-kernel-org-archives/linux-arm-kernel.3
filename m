Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D94CEE9A03E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Feb 2026 09:31:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=30zvnd36xqMdEjSZRfnbwRxyKlkio/WNS24HY6r8vm0=; b=lYhLzVYUUNht6NAEaGeADvHwWK
	gNfPYa8Jmnn9KK0V/Y/hiflaJejHzpooDusNBc+XqpCsy8jdtwUb5nBKxmogYJe66ipcD+yINgKUc
	mmZ7k0hsMk7llYH10H5d5GisPZwJ/s3UQPc+FTnxhaSIeyLI4SZcl+YEmCqKpKXY4Jm8uMLyuXBXu
	LFIriYqYElzElxf8G+NKuP393bJiSV0mZUqWQp7wTpuoSoMLoV+2M7nAWdmwFIej5jdFsQwMDzwIs
	OxlsPi/m+xQs2tscdywE31yKU7OBQhQ/tc37uj/+z3c0pWb1lEjI6mJagdkBo+x6xvQXs2CmlWhf+
	a4iYf73w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsdtk-00000009YE4-3l0j;
	Wed, 18 Feb 2026 09:31:08 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsdti-00000009YBt-2wGl
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Feb 2026 09:31:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1E7D961336;
	Wed, 18 Feb 2026 09:31:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51D7BC19422;
	Wed, 18 Feb 2026 09:31:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771407065;
	bh=Atvq4+dGTxYCFauncK4FXroGGSadofZUIEtXzQ2LcDw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=HUfyi0sAxCFffBPpkKCHQhxs7iS6xgHu9NkG2xMV8/CxaG504c5sYoC3UHTIAJDTg
	 JF+NpPS3fBT/QZKUphS60dXyeFC0sH5cTjUfNRjGdXHZz3HOZNjFgShzKtvtXj/qDw
	 VkLKDsbodRSCVwPnH5GURRQpweRPfcz/eJYJNzZF3GsiBL+tED/HGkjfMMxWWKifqa
	 IKk4tbFU+XmpSaMpep0LWCz+7BobcqFjS8owQJvyLX0rsoOEFy0+CGsg/jxS8gA90h
	 urecMkPAOO/rS3jIeIiz3TBsNpj1eKb/vGgyAgiUxjLkLZNF/m0eXkC4cgetxS6P63
	 ek4908W2ozoZw==
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 18 Feb 2026 10:30:54 +0100
Subject: [PATCH v2 7/7] ARM: dts: bcm63148: Add I2C block
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260218-bcmbca-i2c-dts-v2-7-5373ef82c50c@kernel.org>
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

The BCM63148 has a brcmper I2C block.

The peripheral range needs to be extended to accommodate
it. The Boot LUT is at offset + 0x10000 so extend it to
cover at least that too, 128 KB.

INTERRUPT_ID_I2C is at (ISR_TABLE3_OFFSET + 19) = 96+19 = 115,
convert back to SPI IRQ 115-32 = 83.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 arch/arm/boot/dts/broadcom/bcm63148.dtsi | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/broadcom/bcm63148.dtsi b/arch/arm/boot/dts/broadcom/bcm63148.dtsi
index e071cddb28fc..52aea853095c 100644
--- a/arch/arm/boot/dts/broadcom/bcm63148.dtsi
+++ b/arch/arm/boot/dts/broadcom/bcm63148.dtsi
@@ -97,7 +97,7 @@ bus@ff800000 {
 		compatible = "simple-bus";
 		#address-cells = <1>;
 		#size-cells = <1>;
-		ranges = <0 0xfffe8000 0x8000>;
+		ranges = <0 0xfffe8000 0x20000>;
 
 		/* GPIOs 0 .. 31 */
 		gpio0: gpio@100 {
@@ -197,5 +197,14 @@ nandcs: nand@0 {
 				reg = <0>;
 			};
 		};
+
+		i2c0: i2c@be00 {
+			compatible = "brcm,brcmper-i2c";
+			reg = <0xbe00 0x60>;
+			interrupts = <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
 	};
 };

-- 
2.53.0


