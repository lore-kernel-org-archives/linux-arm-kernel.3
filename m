Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49556CAC5A0
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Sep 2025 20:26:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P0G1nHwWvoBgVqHJJ8KDF0ih2q77m+pFh56iElgY1+M=; b=MeG1iRlglXpwmfRQkOcNfMjOy6
	aAvkIUOaTNbBiIz2X9ZyL1QsB6vHcwuxUbKhdydIIrZb1JitGYR1z71uLshRJCeW1sGeF18TVFj6s
	j0r6uYS9TO3n0kPncfUgGSleTG9bWLIRzJikePZQ8BTrdA/JVeAwsTW+qwMigJR4LHKOBL/FONcEf
	NK8zx8ML9TVdlCC0qFVYaLDRVZt+sZTEajQ21tFmjss96KvKOa1qw95l5LeeclIhTehEDHZtzxfdj
	YoWXftC4tk2O1QWMDhEJnpLrneueCiFBKLmzmQCba+XhyJPw28a5Uff5D3J9nbFXx52+DbR/6b4ws
	2YuZQGVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uycFV-000000091Qc-2G5H;
	Tue, 16 Sep 2025 20:26:01 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uycEz-000000090k6-43Yz;
	Tue, 16 Sep 2025 20:25:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9876244DF0;
	Tue, 16 Sep 2025 20:25:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 65186C4CEF0;
	Tue, 16 Sep 2025 20:25:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758054326;
	bh=cYZYP/uaZ0Z/omX0vz2UqaLnE+xmaYEf63AvynoutoE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=CdmlZ+qGcOngd+lvNpEen5lhbh/dTmK2Q3Ty/eYlIEcqgFL6xAzwa4W/LfX34Hfx5
	 3fBeqj5wi/oTkxuB+XEOsf+wr5Z5C3kDvwmAg/yySoVTPp1/wQFCi27WQye50Usgkv
	 +iImavWZdMfORAQ2UjB1I4wc38wiikTwi59q2bVpn4+YW9pUHGUE/AAwM62rVqn94E
	 WqlqiRZmqNjpFhUv/vr9EGKPedIsrCvfR5vRZB66wpqYcUT/+CzRRVuqprKSQpRlQZ
	 7DYFjspfjwwxdE/TMkSzgMHv1n6y+KiF/8uT6fRAqtQaJ6IVtB73DOR4NjrTzrNzC/
	 xw3Vv5VYA1S0A==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5229ACAC59F;
	Tue, 16 Sep 2025 20:25:26 +0000 (UTC)
From: Dang Huynh via B4 Relay <devnull+dang.huynh.mainlining.org@kernel.org>
Date: Wed, 17 Sep 2025 03:25:20 +0700
Subject: [PATCH 23/25] dts: unisoc: rda8810pl: Add SDMMC controllers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250917-rda8810pl-drivers-v1-23-9ca9184ca977@mainlining.org>
References: <20250917-rda8810pl-drivers-v1-0-9ca9184ca977@mainlining.org>
In-Reply-To: <20250917-rda8810pl-drivers-v1-0-9ca9184ca977@mainlining.org>
To: Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Sebastian Reichel <sre@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
 Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
 Ulf Hansson <ulf.hansson@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-unisoc@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-rtc@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-pm@vger.kernel.org, 
 dmaengine@vger.kernel.org, linux-hardening@vger.kernel.org, 
 linux-mmc@vger.kernel.org, Dang Huynh <dang.huynh@mainlining.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758054322; l=1669;
 i=dang.huynh@mainlining.org; s=20250917; h=from:subject:message-id;
 bh=+rjfqyC6diLcCcMZpXzmNwIY3Xd0ao4URhi7mY7MeOo=;
 b=g36+c8BMuiizyAkQU5g2SVhGELtdZOZL7VmLGm9NJ65TH2ylz89Z6tGkVFMsW4PUF6yXDm1fJ
 gSr5M9xIH80CvABquDEQg1EdtLnBDMt1j/TqnDGY86xGtT9UTnG1g4P
X-Developer-Key: i=dang.huynh@mainlining.org; a=ed25519;
 pk=RyzH4CL4YU/ItXYUurA51EVBidfx4lIy8/E4EKRJCUk=
X-Endpoint-Received: by B4 Relay for dang.huynh@mainlining.org/20250917
 with auth_id=526
X-Original-From: Dang Huynh <dang.huynh@mainlining.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250916_132530_273900_3CC84342 
X-CRM114-Status: UNSURE (   9.42  )
X-CRM114-Notice: Please train this message.
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
Reply-To: dang.huynh@mainlining.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Dang Huynh <dang.huynh@mainlining.org>

Add SDMMC1 and 2 controllers for the RDA8810PL platform.

Signed-off-by: Dang Huynh <dang.huynh@mainlining.org>
---
 arch/arm/boot/dts/unisoc/rda8810pl.dtsi | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/arch/arm/boot/dts/unisoc/rda8810pl.dtsi b/arch/arm/boot/dts/unisoc/rda8810pl.dtsi
index 4b3ae19e9da41ee9ffa76dd4fff01824c07ce045..e68f8330ce2c4750b6944612bee03b42694137e4 100644
--- a/arch/arm/boot/dts/unisoc/rda8810pl.dtsi
+++ b/arch/arm/boot/dts/unisoc/rda8810pl.dtsi
@@ -9,6 +9,7 @@
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/clock/rda,8810pl-apclk.h>
+#include <dt-bindings/dma/rda-ifc.h>
 
 / {
 	compatible = "rda,8810pl";
@@ -199,6 +200,30 @@ uart1: serial@0 {
 			status = "disabled";
 		};
 
+		mmc1: mmc@50000 {
+			compatible = "rda,8810pl-mmc";
+			reg = <0x50000 0x1000>;
+			interrupts = <3 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&ap_syscon CLK_APB2>;
+			clock-names = "apb";
+			resets = <&ap_syscon RST_APB2_SDMMC1>;
+			dmas = <&ifc IFC_SDMMC1_TX>, <&ifc IFC_SDMMC1_RX>;
+			dma-names = "tx", "rx";
+			status = "disabled";
+		};
+
+		mmc2: mmc@60000 {
+			compatible = "rda,8810pl-mmc";
+			reg = <0x60000 0x1000>;
+			interrupts = <4 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&ap_syscon CLK_APB2>;
+			clock-names = "apb";
+			resets = <&ap_syscon RST_APB2_SDMMC2>;
+			dmas = <&ifc IFC_SDMMC2_TX>, <&ifc IFC_SDMMC2_RX>;
+			dma-names = "tx", "rx";
+			status = "disabled";
+		};
+
 		uart2: serial@10000 {
 			compatible = "rda,8810pl-uart";
 			reg = <0x10000 0x1000>;

-- 
2.51.0



