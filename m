Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 868C3606A326
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Nov 2026 22:15:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=QU5azu62;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CHaOgXuE
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=S3lcyIX5M+D9oaMxMnqcLepq9hdIlj33lYjarpJr4ic=; b=QU5azu62q5m8sS
	v4i6uxoZfcPAg4C4WVekE2vxmsBusd6Kx6qEDvrEsmFNkNA2u6e0p1qdw0ybLDjM7mEnSMt/qT3Ic
	Ws9ZZUpKFSjLX86hR0osXJFrBAu+5t7x3EZHYSR1VYOkI/Fx5rT/eyqeIqQZuHJV5f+JXqd8yH2ay
	L0ksDy7sZRnGYsHA5Z18HfBK/hNmMcwItCH4I0/DQjIaT2sHzlMixMHiik7EcYhnPA75lQv6ONJd4
	BaQvo+9sAYZf9FrHyk8NH9XQAjKuCdDD7PYmcVAVvKUDs2RHLuwjM+qTZegRQLHx/USFc2G/ciVsl
	qk7LRbE/Q/JpG3grvJMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNdpn-0000000EyaE-2QLI;
	Sun, 01 Nov 2026 22:15:27 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNdpl-0000000EyYT-1bme
	for linux-arm-kernel@lists.infradead.org;
	Sun, 01 Nov 2026 22:15:25 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 04A1141921;
	Sun,  1 Nov 2026 22:15:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 780C31F000C1;
	Sun,  1 Nov 2026 22:15:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793571324;
	bh=S3lcyIX5M+D9oaMxMnqcLepq9hdIlj33lYjarpJr4ic=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=CHaOgXuEOszpcFCzgxWhOugudfo85K2qYm/UkvJds7hTV31/NTxkpEvX5k0lgLQlE
	 8IvflPjJkW7U6ZILo5XVKFue4NzP8sMsGDZgLmpYpPc1lUdZWRrxk6M6i+5slC1rck
	 EuteLDR0ogjJq+Zb4I1ODq1VKMZ/oQ1mq3KZb+kUNyh6J3BoR+UeUWUC5I4B5upvyl
	 YRAQzoDExynaG9vB9bfXdzNEjN8IfqH+sEwmcDXGFfbAutlrtkjSQT4eXa6WE0WYqj
	 P/P7vgeh2cGPCr+4UM45Sr7DGfq0sGnfy+uOBn4D60xD7f3tj3hGVHqS1zaKriBP1l
	 XFOoJuwtrAfXw==
From: Linus Walleij <linusw@kernel.org>
Date: Sun, 01 Nov 2026 23:14:40 +0100
Subject: [PATCH v2 7/7] ARM: dts: broadcom: Add BCM6846 PMB clocks and
 hardware monitoring
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261101-xg6846b-bcmbca-xrdp-reset-v2-7-455fe9eed5ee@kernel.org>
References: <20261101-xg6846b-bcmbca-xrdp-reset-v2-0-455fe9eed5ee@kernel.org>
In-Reply-To: <20261101-xg6846b-bcmbca-xrdp-reset-v2-0-455fe9eed5ee@kernel.org>
To: Linus Walleij <linusw@kernel.org>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 William Zhang <william.zhang@broadcom.com>, 
 Anand Gore <anand.gore@broadcom.com>, 
 Kursad Oney <kursad.oney@broadcom.com>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Guenter Roeck <linux@roeck-us.net>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Jonathan Corbet <corbet@lwn.net>, Randy Dunlap <rdunlap@infradead.org>, 
 Benjamin Larsson <benjamin.larsson@genexis.eu>
Cc: mfd@lists.linux.dev, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-hwmon@vger.kernel.org
X-Mailer: b4 0.16.0
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Describe the PMC complex and its PMB interface, including clock, reset
and hwmon child nodes. Supply the PMB clock controller with
its 50 MHz reference and connect PVTMON to its clock and reset
resources. Add a SoC thermal zone referencing the sensor child with a
one-second polling interval.

Leave trip points and cooling maps unspecified because the available
BCM6846 documentation does not establish suitable temperature limits.

Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 arch/arm/boot/dts/broadcom/bcm6846.dtsi | 47 +++++++++++++++++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/arch/arm/boot/dts/broadcom/bcm6846.dtsi b/arch/arm/boot/dts/broadcom/bcm6846.dtsi
index 47f177323c18..e9775dfc5d1b 100644
--- a/arch/arm/boot/dts/broadcom/bcm6846.dtsi
+++ b/arch/arm/boot/dts/broadcom/bcm6846.dtsi
@@ -3,8 +3,10 @@
  * Copyright 2022 Broadcom Ltd.
  */
 
+#include <dt-bindings/clock/brcm,bcm6846-pmb.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/reset/brcm,bcm6846-pmb.h>
 
 / {
 	compatible = "brcm,bcm6846", "brcm,bcmbca";
@@ -57,6 +59,12 @@ pmu: pmu {
 	};
 
 	clocks: clocks {
+		osc50m: clock-50mhz {
+			compatible = "fixed-clock";
+			#clock-cells = <0>;
+			clock-frequency = <50000000>;
+		};
+
 		periph_clk: periph-clk {
 			compatible = "fixed-clock";
 			#clock-cells = <0>;
@@ -75,6 +83,14 @@ psci {
 		method = "smc";
 	};
 
+	thermal-zones {
+		soc_thermal: soc-thermal {
+			polling-delay-passive = <1000>;
+			polling-delay = <1000>;
+			thermal-sensors = <&pvtmon>;
+		};
+	};
+
 	axi@81000000 {
 		compatible = "simple-bus";
 		#address-cells = <1>;
@@ -263,5 +279,36 @@ pl081_dma: dma-controller@59000 {
 			clock-names = "apb_pclk";
 			#dma-cells = <2>;
 		};
+
+		pmc: system-controller@300000 {
+			compatible = "brcm,bcm6846-pmc", "simple-mfd";
+			ranges = <0x0 0x300000 0x21000>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			pmb: bus@20100 {
+				compatible = "brcm,bcm6846-pmb";
+				reg = <0x20100 0x200>;
+
+				pmb_clk: clock-controller {
+					compatible = "brcm,bcm6846-pmb-clock";
+					clocks = <&osc50m>;
+					clock-names = "ref";
+					#clock-cells = <1>;
+				};
+
+				pmb_reset: reset-controller {
+					compatible = "brcm,bcm6846-pmb-reset";
+					#reset-cells = <1>;
+				};
+
+				pvtmon: hwmon {
+					compatible = "brcm,bcm6846-pmb-pvtmon";
+					clocks = <&pmb_clk BCM6846_CLK_PVTMON>;
+					resets = <&pmb_reset BCM6846_RESET_PVTMON>;
+					#thermal-sensor-cells = <0>;
+				};
+			};
+		};
 	};
 };

-- 
2.56.0


