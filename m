Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62792CCA470
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Sep 2025 09:40:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/fB4Ad2uGsqHlgilKaqvcHiIigYHlEhPGeATmqt61rk=; b=MZusxz7iQPEN534dGgAv2QBhHa
	WxLTrtII7UtKBrNhl7d+DegLDLXraBZzeXb3fJ8A/a6khSawgmHE+iifxp3hFHOjuN75pAORPlEuo
	/ameDocyl0uzoJfRUJmTG9MKjPa1cNfeZGjUi4UlRY127OMO2H7QBg0KRokV/S8VAEfF3+kyRT4nN
	H0hLyHMkB9lwntF1tfBDBl4VdfuE/CnP/ZAw9jMFqLpSWN9PNYF1YPPmd/tQpxSUYNCNZld/n8Ft8
	zzWcWaZ9SvpBv5V16McN4kYTBYCmlg5NhSEpuXRdri747ytR10dzL3AQmqmERXpn5pmwB8mnyF9ea
	ZQO0Wirg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3Wpp-00000004rwc-16pY;
	Tue, 30 Sep 2025 09:39:49 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3Wng-00000004q2N-0I7q;
	Tue, 30 Sep 2025 09:37:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id BDD444586E;
	Tue, 30 Sep 2025 09:37:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8DB8DC2BCB0;
	Tue, 30 Sep 2025 09:37:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759225052;
	bh=GhazWRbsOSZcBLYhB/FQbhXm3/61sthie18NPBjHd0g=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=qCpPidns8gn/ylXUskUqdeKTTDpZdsjVzfg7KuSY9msPWwcCeN+Sh3AW4TrNPv1eq
	 Thr4/au1PgLNQsHbtQyOKfz7fBFdu2DUagoip9SYKa7i9KBuuPIKx51Myf4x0qYQKG
	 k8IgUM2rO+vfaau406VBs2hRUfNHsEzf1AGjrm8P5nh4ukeTbgBZUkuC7NLyTLOtVY
	 qm3yHwzjobe4BJCg9WjJhDqCVW7Sloqr+fpL7DTRZ/QUw5QtOYxrCuH4Tz/cBFHi4X
	 03XgM5t0Wk+2FtPonQf/8mt8BI48yHRr2ahyP6MlnbcTXIJdd2Y8Hm/XBZMrkOQJt0
	 DPGLi+dRznQRQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75BE4CCA470;
	Tue, 30 Sep 2025 09:37:32 +0000 (UTC)
From: Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org>
Date: Tue, 30 Sep 2025 17:37:32 +0800
Subject: [PATCH 19/19] arm64: dts: amlogic: A5: Add peripheral clock
 controller node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250930-a4_a5_add_clock_driver-v1-19-a9acf7951589@amlogic.com>
References: <20250930-a4_a5_add_clock_driver-v1-0-a9acf7951589@amlogic.com>
In-Reply-To: <20250930-a4_a5_add_clock_driver-v1-0-a9acf7951589@amlogic.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>, Chuan Liu <chuan.liu@amlogic.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1759225047; l=2041;
 i=chuan.liu@amlogic.com; s=20240902; h=from:subject:message-id;
 bh=819hwcypvLPkK6zGwB1cqKbMQOi/dUvVkIknKgOKBPA=;
 b=Yxou6e6o7eYaQX7ea8PxyQS46pJ+jtcK7m1onlU0UwXsX3ttMyz3/Ts2jBPl6HRVxH7dcdASr
 d+p/EnVQbr/DBmqr7SkjrupsjApzN85QilFbyXdufDKtY5IGcEaCJDv
X-Developer-Key: i=chuan.liu@amlogic.com; a=ed25519;
 pk=fnKDB+81SoWGKW2GJNFkKy/ULvsDmJZRGBE7pR5Xcpo=
X-Endpoint-Received: by B4 Relay for chuan.liu@amlogic.com/20240902 with
 auth_id=203
X-Original-From: Chuan Liu <chuan.liu@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250930_023736_227086_724D5AD6 
X-CRM114-Status: UNSURE (   8.92  )
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
Reply-To: chuan.liu@amlogic.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Chuan Liu <chuan.liu@amlogic.com>

Add peripheral clock controller node for A5 SoC family.

Signed-off-by: Chuan Liu <chuan.liu@amlogic.com>
---
 arch/arm64/boot/dts/amlogic/amlogic-a5.dtsi | 43 +++++++++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-a5.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-a5.dtsi
index 89f7b5ff4ea3..406cd52a6474 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-a5.dtsi
+++ b/arch/arm64/boot/dts/amlogic/amlogic-a5.dtsi
@@ -8,6 +8,7 @@
 #include <dt-bindings/power/amlogic,a5-pwrc.h>
 #include <dt-bindings/clock/amlogic,a5-scmi-clkc.h>
 #include <dt-bindings/clock/amlogic,a5-pll-clkc.h>
+#include <dt-bindings/clock/amlogic,a5-peripherals-clkc.h>
 
 / {
 	cpus {
@@ -83,6 +84,48 @@ scmi_clk: protocol@14 {
 };
 
 &apb {
+	clkc_periphs: clock-controller@0 {
+		compatible = "amlogic,a5-peripherals-clkc";
+		reg = <0x0 0x0 0x0 0x224>;
+		#clock-cells = <1>;
+		clocks = <&xtal>,
+			 <&scmi_clk CLKID_OSC>,
+			 <&scmi_clk CLKID_FIXED_PLL>,
+			 <&scmi_clk CLKID_FCLK_DIV2>,
+			 <&scmi_clk CLKID_FCLK_DIV2P5>,
+			 <&scmi_clk CLKID_FCLK_DIV3>,
+			 <&scmi_clk CLKID_FCLK_DIV4>,
+			 <&scmi_clk CLKID_FCLK_DIV5>,
+			 <&scmi_clk CLKID_FCLK_DIV7>,
+			 <&clkc_pll CLKID_MPLL2>,
+			 <&clkc_pll CLKID_MPLL3>,
+			 <&clkc_pll CLKID_GP0_PLL>,
+			 <&scmi_clk CLKID_GP1_PLL>,
+			 <&clkc_pll CLKID_HIFI_PLL>,
+			 <&scmi_clk CLKID_SYS_CLK>,
+			 <&scmi_clk CLKID_AXI_CLK>,
+			 <&scmi_clk CLKID_SYS_PLL_DIV16>,
+			 <&scmi_clk CLKID_CPU_CLK_DIV16>;
+		clock-names = "xtal",
+			      "oscin",
+			      "fix",
+			      "fdiv2",
+			      "fdiv2p5",
+			      "fdiv3",
+			      "fdiv4",
+			      "fdiv5",
+			      "fdiv7",
+			      "mpll2",
+			      "mpll3",
+			      "gp0",
+			      "gp1",
+			      "hifi",
+			      "sysclk",
+			      "axiclk",
+			      "sysplldiv16",
+			      "cpudiv16";
+	};
+
 	reset: reset-controller@2000 {
 		compatible = "amlogic,a5-reset",
 			     "amlogic,meson-s4-reset";

-- 
2.42.0



