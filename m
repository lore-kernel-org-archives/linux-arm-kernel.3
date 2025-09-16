Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE4ECCAC59F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Sep 2025 20:25:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ALTZ4QuQxxo/1zFQ7x334/yIJ3V8hnW3OypZ6bvtG90=; b=jLTMQ2o3ryoFiqmDKR7hQNXX7f
	ciFKQDliiicKNxWOQxoV5FO8QOL8b7835u3qERISz3YS5DO9dq3jB3pOHbAXnVzSDkCr/LgWP6fHM
	WTLTGOVbCd2llTtkdLwXRQuMAWJDLa0FsiMx7k71sZBRnYOhO0MOCE1qB0QbHWjDvnFV5REWKYmAZ
	ckQf8CIWj7MtxkWjsITGoT/G5WOL0zHvTZ4XID1TUf2GLgJ/DXgLrc1+o5ogu8INifWfYATLtcBiB
	zzLo7iCK/PWyLuO3IzEkqvury6YOKHmIieA1zisH5C3kyW+vmjrn3/G7zYbR30jnzk6SWp0eQ4ekr
	FflpUxWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uycF6-000000090uH-3fYB;
	Tue, 16 Sep 2025 20:25:36 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uycEw-000000090ip-2Uab;
	Tue, 16 Sep 2025 20:25:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D787260232;
	Tue, 16 Sep 2025 20:25:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 67AB2C116C6;
	Tue, 16 Sep 2025 20:25:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758054325;
	bh=e/qC+sVxQ9TrDHhG0wtazM84HxOMKYeszZU0EuODGJs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=JQK0nw9SBa2eVYYGvCy8nmx53sGgdLx/FyORN5DzspfPQt24tLYQaFsC0MlDud1S2
	 gIqO9nWVRE7MYLVeiI6LJTf5FbkB0ApYljJ1zvIGfwRTLJPEaxiPzTgsEHcEA5+i5C
	 hOnnQENAY9wP8qMtTl9iyauSoX280tEPoDukO3TsmW+mw58CCW5/2kHl+QZ47IPoFf
	 18lavy+cYon26CUGzTIpIOuny0U7Q9DCsvLl9N2C8Q5vTLX2Tpkdw2BdV7R7ugEyjC
	 OPScv0AHz21XahXWoff39Uiin5vexBF9oDsNfFcuf7h8e5nCrLxpkS/oQd3oUqmh4A
	 Wz1x4ynN10zRw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F238CAC592;
	Tue, 16 Sep 2025 20:25:25 +0000 (UTC)
From: Dang Huynh via B4 Relay <devnull+dang.huynh.mainlining.org@kernel.org>
Date: Wed, 17 Sep 2025 03:25:05 +0700
Subject: [PATCH 08/25] ARM: dts: unisoc: rda8810pl: Enable ARM PMU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250917-rda8810pl-drivers-v1-8-9ca9184ca977@mainlining.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758054322; l=907;
 i=dang.huynh@mainlining.org; s=20250917; h=from:subject:message-id;
 bh=YAW/bGAZr0vX0B6I3xTMN5lJP76jY17Qpzu5kruaYow=;
 b=Xx4eEf+AW3RfI/PbEY5JiaKmRAPppuTYEIz3HyHrxewzcQWqWGWhkO1ddTilsHUwqfkZstlrk
 2wL45PEan/qADgsP0ddnn6WAkTtuRkV+QW9c5fDgsFPwxfxBZIgttWj
X-Developer-Key: i=dang.huynh@mainlining.org; a=ed25519;
 pk=RyzH4CL4YU/ItXYUurA51EVBidfx4lIy8/E4EKRJCUk=
X-Endpoint-Received: by B4 Relay for dang.huynh@mainlining.org/20250917
 with auth_id=526
X-Original-From: Dang Huynh <dang.huynh@mainlining.org>
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

The SoC uses a standard ARM PMU, enable it.

Signed-off-by: Dang Huynh <dang.huynh@mainlining.org>
---
 arch/arm/boot/dts/unisoc/rda8810pl.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm/boot/dts/unisoc/rda8810pl.dtsi b/arch/arm/boot/dts/unisoc/rda8810pl.dtsi
index 609359aa91537168435934077e736b216adf50f4..45a2fd3e04cea5aac4fb6b40a6b332ce3eee4f2c 100644
--- a/arch/arm/boot/dts/unisoc/rda8810pl.dtsi
+++ b/arch/arm/boot/dts/unisoc/rda8810pl.dtsi
@@ -6,6 +6,7 @@
  * Copyright (c) 2018 Manivannan Sadhasivam
  */
 
+#include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/interrupt-controller/irq.h>
 
 / {
@@ -25,6 +26,11 @@ cpu@0 {
 		};
 	};
 
+	pmu {
+		compatible = "arm,cortex-a5-pmu";
+		interrupts = <21 IRQ_TYPE_LEVEL_HIGH>;
+	};
+
 	sram@100000 {
 		compatible = "mmio-sram";
 		reg = <0x100000 0x10000>;

-- 
2.51.0



