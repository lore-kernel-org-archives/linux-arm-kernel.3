Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A434CC6B2A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Oct 2026 12:57:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XK6JRULEEQS0QFoOXSZ/Y2S3hUUnJazwERTb7LZ/0M4=; b=IMy1wkncAtqFse4uFM1KBE+LR1
	5N7MSaOuPPU1bRT6eEine+TWSSaJbRsp8W6hETfpgtn0BgBhHSeg6oqa9dimJGCjsc6ppGW7fVhH+
	9D+5A3eA9r6wH/ps2u0P2RPqbOfWFP2ZVmoj2jP2ACHnoB4Gu0WLzKFCKypzoDYBcIdeB/Bp7M3dK
	ov3t9i1xXZl6i7sK2FnhLP1VJZ0lPxPiEK9X8Zm3H+PWk6DEFHz8hXqR+AcLkWbyWCQmQHEWcwUHH
	Sr8z9DFfnbVWAJILUsK826Z8JdCEXPuef4JqY3dGySdubHolIQ1S4q3STyKPwRnF6jeBahBMNPjp4
	eIn+kG3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGyY5-0000000FVs3-1obL;
	Wed, 14 Oct 2026 12:57:37 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGyY1-0000000FVqc-0BUs
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Oct 2026 12:57:33 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 3EFC460416
	for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Oct 2026 12:57:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85F151F00898;
	Wed, 14 Oct 2026 12:57:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791982652;
	bh=XK6JRULEEQS0QFoOXSZ/Y2S3hUUnJazwERTb7LZ/0M4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=df1kxSupHmz42lxiT28tel3pI40ayRTHsFr9H3mY82zQ9MR9h9j7lPl3NtqLqz2A0
	 9OKKb/qSSX8LCSVIYdx94F1V3zoOAf17Va9ZxefLM6nNbBl9g/8y3edGzK+/jkeBHI
	 kahpwsCXysZ621dRK3qVx7E8f5fVtZaqvNvUZzg9AZ0e7630BobkzVdl2qZ6E7OGxe
	 2rdS2WbBdF+d1IiF+LOBXsEPAuw5I0NIKK+g2v30+sUJCYcFGGHY1qQapc6GGV+oj9
	 zPASUjSUvO7/JE8amCdoWmFX/tRZxALVlpZncr1GpydLJp0BIAA8ebXWIgpeQLQLor
	 /dLu+ua8hW3kw==
From: Dinh Nguyen <dinguyen@kernel.org>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: dinguyen@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 2/2] arm64: dts: altera: Add support for the Agilex27 SoCDK
Date: Wed, 14 Oct 2026 07:57:09 -0500
Message-ID: <20261014125709.2106261-2-dinguyen@kernel.org>
X-Mailer: git-send-email 2.42.0.411.g813d9a9188
In-Reply-To: <20261014125709.2106261-1-dinguyen@kernel.org>
References: <20261014125709.2106261-1-dinguyen@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

The SoCFPGA Agilex72 platform is being renamed to Agilex27.

Remove the agilex72 base DTSI and agilex72 devkit dts and replace them with
an Agilex27 base DTSI and Agilex27 devkit dts.

Signed-off-by: Dinh Nguyen <dinguyen@kernel.org>
---
 arch/arm64/boot/dts/altera/Makefile                         | 2 +-
 .../altera/{socfpga_agilex72.dtsi => socfpga_agilex27.dtsi} | 2 +-
 ...ocfpga_agilex72_socdk.dts => socfpga_agilex27_socdk.dts} | 6 +++---
 3 files changed, 5 insertions(+), 5 deletions(-)
 rename arch/arm64/boot/dts/altera/{socfpga_agilex72.dtsi => socfpga_agilex27.dtsi} (98%)
 rename arch/arm64/boot/dts/altera/{socfpga_agilex72_socdk.dts => socfpga_agilex27_socdk.dts} (67%)

diff --git a/arch/arm64/boot/dts/altera/Makefile b/arch/arm64/boot/dts/altera/Makefile
index 8f41349103b80..40248dbb5abad 100644
--- a/arch/arm64/boot/dts/altera/Makefile
+++ b/arch/arm64/boot/dts/altera/Makefile
@@ -3,12 +3,12 @@ dtb-$(CONFIG_ARCH_INTEL_SOCFPGA) += socfpga_agilex_n6000.dtb \
 				socfpga_agilex_socdk.dtb \
 				socfpga_agilex_socdk_emmc.dtb \
 				socfpga_agilex_socdk_nand.dtb \
+				socfpga_agilex27_socdk.dtb \
 				socfpga_agilex3_socdk.dtb \
 				socfpga_agilex5_socdk.dtb \
 				socfpga_agilex5_socdk_013b.dtb \
 				socfpga_agilex5_socdk_modular.dtb \
 				socfpga_agilex5_socdk_nand.dtb \
-				socfpga_agilex72_socdk.dtb \
 				socfpga_agilex7m_socdk.dtb \
 				socfpga_n5x_socdk.dtb \
 				socfpga_stratix10_socdk.dtb \
diff --git a/arch/arm64/boot/dts/altera/socfpga_agilex72.dtsi b/arch/arm64/boot/dts/altera/socfpga_agilex27.dtsi
similarity index 98%
rename from arch/arm64/boot/dts/altera/socfpga_agilex72.dtsi
rename to arch/arm64/boot/dts/altera/socfpga_agilex27.dtsi
index c29c2afcaab70..369981fe85e38 100644
--- a/arch/arm64/boot/dts/altera/socfpga_agilex72.dtsi
+++ b/arch/arm64/boot/dts/altera/socfpga_agilex27.dtsi
@@ -7,7 +7,7 @@
 #include <dt-bindings/interrupt-controller/irq.h>
 
 / {
-	compatible = "intel,socfpga-agilex72";
+	compatible = "altr,socfpga-agilex27";
 	#address-cells = <2>;
 	#size-cells = <2>;
 
diff --git a/arch/arm64/boot/dts/altera/socfpga_agilex72_socdk.dts b/arch/arm64/boot/dts/altera/socfpga_agilex27_socdk.dts
similarity index 67%
rename from arch/arm64/boot/dts/altera/socfpga_agilex72_socdk.dts
rename to arch/arm64/boot/dts/altera/socfpga_agilex27_socdk.dts
index 998f19f492b36..15d331cdeeb47 100644
--- a/arch/arm64/boot/dts/altera/socfpga_agilex72_socdk.dts
+++ b/arch/arm64/boot/dts/altera/socfpga_agilex27_socdk.dts
@@ -2,11 +2,11 @@
 /*
  * Copyright (C) 2026, Altera Corporation
  */
-#include "socfpga_agilex72.dtsi"
+#include "socfpga_agilex27.dtsi"
 
 / {
-	model = "Altera SoCFPGA Agilex72 SoCDK";
-	compatible = "intel,socfpga-agilex72-socdk", "intel,socfpga-agilex72";
+	model = "Altera SoCFPGA Agilex27 SoCDK";
+	compatible = "altr,socfpga-agilex27-socdk", "altr,socfpga-agilex27";
 
 	aliases {
 		serial0 = &uart0;
-- 
2.42.0.411.g813d9a9188


