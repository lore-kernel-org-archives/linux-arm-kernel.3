Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A09DCCAC59D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Sep 2025 20:26:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Sk/DqyjMv0A3UVVYvJ/yeNt4S3pqiSnmbsaC9Y94afI=; b=kUTQtvGF4ZNzNoiVLilkqFo69g
	99uw3dSsqX2nltmJh6pK86O6ELmTlZiyz285lsw+qbEmbZ4Egw99uIpaTCtSLOmSGIb7YoA6Wcma2
	tRZuJyIlYWKadQ9nh32hoJ5/p6NRud4mgs9tG8m6Z6BQddK7rpxeA1HibgMgp27qhikKXHpvdnL5X
	FQszuDaNwTgsrtVMYxQbjbM/+VkqLPV2HxuuKeLHzZ77M6oD6jU3ot+EJODrtkG1pSxPwgUcdT6QH
	YEiGm1h0qSmeqwHh+6XQNkrxNbH99pqcwKUxXf1aowieKUg3jTCC5K+ps55H7ONsudLHT1iX8A+vd
	sytfL0EQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uycFY-000000091WY-2pkE;
	Tue, 16 Sep 2025 20:26:04 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uycF0-000000090lw-3Wqs;
	Tue, 16 Sep 2025 20:25:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A2E1644DFC;
	Tue, 16 Sep 2025 20:25:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 71FE2C4AF4D;
	Tue, 16 Sep 2025 20:25:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758054326;
	bh=egTQGUBp0zFp2qNCGSUCro/O1z1FHKCYNAt7sLfWf4g=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=PN8jXzDiDi9RozSEc6nSjwEzFHkYUrxdOnlOCyBKdZRd3FeqaHOj7f9TSeGhDbDPQ
	 Bh+pruy+oFlyn8G66wx9fSMwzO3BB+TsMB1T/9ciN9wjtWYhURBu5oJ/ncynx4l4up
	 GTXS36TSR0vmOTjHOo+AMpbGkL42nXNg5hK1n9q9mIc5qwtlQlHbpqUWPLThUsix5w
	 MF5bqD6KbunnstwbY91QvngVbXPdwSBbTjFMBCf64FdwFNunRQMBm5M9If9iZmMPmr
	 FBoeEHUqRWxzic7nngnRXOFUyf3NKkh5Y+HraPxrIF/9jR5Kre2Rs7pbkdgfhpDA5n
	 5aZBo5+WDL+9w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63D2BCAC5A0;
	Tue, 16 Sep 2025 20:25:26 +0000 (UTC)
From: Dang Huynh via B4 Relay <devnull+dang.huynh.mainlining.org@kernel.org>
Date: Wed, 17 Sep 2025 03:25:21 +0700
Subject: [PATCH 24/25] dts: unisoc: orangepi-2g: Enable SD Card
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250917-rda8810pl-drivers-v1-24-9ca9184ca977@mainlining.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758054322; l=1448;
 i=dang.huynh@mainlining.org; s=20250917; h=from:subject:message-id;
 bh=iqvLAp/eBqg4tchfSTl6yDHm7EVu5zj7yTK/oizm9Es=;
 b=QXCXdxinmO64Z8OEcHD6iLAWXpR3hIxrGFI6QsUVZCxUpj/VSQLgKvdaeJIkNysS7nwTiLnj9
 xsF1lHezVDzAWUeqcnf8tySkrThcdRIcADq/RFZ6wAUb/o0O+FlLD6O
X-Developer-Key: i=dang.huynh@mainlining.org; a=ed25519;
 pk=RyzH4CL4YU/ItXYUurA51EVBidfx4lIy8/E4EKRJCUk=
X-Endpoint-Received: by B4 Relay for dang.huynh@mainlining.org/20250917
 with auth_id=526
X-Original-From: Dang Huynh <dang.huynh@mainlining.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250916_132531_016631_1E809287 
X-CRM114-Status: UNSURE (   9.31  )
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

Since we have a SDMMC controller, we can use the SD card slot on the
Orange Pi 2G-IOT.

Signed-off-by: Dang Huynh <dang.huynh@mainlining.org>
---
 .../boot/dts/unisoc/rda8810pl-orangepi-2g-iot.dts    | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm/boot/dts/unisoc/rda8810pl-orangepi-2g-iot.dts b/arch/arm/boot/dts/unisoc/rda8810pl-orangepi-2g-iot.dts
index 46ccb9ad510c0df142b845d6fc5633b69c2298dd..f6b1a1485645f5714cdf14447cbee50e28e3c076 100644
--- a/arch/arm/boot/dts/unisoc/rda8810pl-orangepi-2g-iot.dts
+++ b/arch/arm/boot/dts/unisoc/rda8810pl-orangepi-2g-iot.dts
@@ -6,6 +6,7 @@
 
 /dts-v1/;
 
+#include <dt-bindings/gpio/gpio.h>
 #include "rda8810pl.dtsi"
 
 / {
@@ -27,6 +28,13 @@ memory@80000000 {
 		reg = <0x80000000 0x10000000>;
 	};
 
+	vdd_sdmmc: regulator-fixed {
+		compatible = "regulator-fixed";
+		regulator-name = "vdd_sdmmc";
+		regulator-min-microvolt = <2800000>;
+		regulator-max-microvolt = <2800000>;
+	};
+
 	uart_clk: uart-clk {
 		compatible = "fixed-clock";
 		clock-frequency = <921600>;
@@ -34,6 +42,18 @@ uart_clk: uart-clk {
 	};
 };
 
+&mmc1 {
+	status = "okay";
+	no-sdio;
+	no-mmc;
+	bus-width = <4>;
+	max-frequency = <30000000>;
+	cd-gpios = <&gpiob 4 GPIO_ACTIVE_LOW>;
+	vmmc-supply = <&vdd_sdmmc>;
+	rda,mclk-adj = /bits/ 8 <1>;
+	rda,mclk-inv;
+};
+
 &uart3 {
 	status = "okay";
 	clocks = <&uart_clk>;

-- 
2.51.0



