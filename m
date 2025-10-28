Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 084FCCCF9F5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Oct 2025 09:52:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X0FgDrtg0GIKnvl9q+wMa8ATXVId+4FqzdJ9clkWT28=; b=ZKhrJuMSWTqsMrOHMpTI1vI0o0
	Nuol4/J7GVXTpXzlvbbjf2emgnbv9i2plMd+FU7dPOidI4w5qOHkfunjyNJqv01tRmlR8wzMmatB/
	W2au91NSTfJAn2KCNokHx8k2k3usEj7mz40n7aQwFlk4gxaX5922+1f5PnB0plVG+YLjA6XNBUGja
	l4qeeTnaMrMvg46f2y5ggHYMor0A5ggOTGFWbRX546zEWqZR1V+OXf2ofRf0js2XoEHu8o9XovgV4
	7if3+2rEPKBukkWrvHrYAnXpFiZ0GGqnBzJOYWZAt+/ctCE4sHGBflmOlOwJ8LWuM3vTCqxx/tXHr
	PhX8t1UQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDgNk-0000000FgAU-35BV;
	Tue, 28 Oct 2025 09:52:48 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDgNa-0000000Fg1K-1h4P;
	Tue, 28 Oct 2025 09:52:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E729748D0F;
	Tue, 28 Oct 2025 09:52:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C9DB0C2BCB1;
	Tue, 28 Oct 2025 09:52:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761645155;
	bh=cVF3ZGBxFw46Zm8/l8bHWG0RQpu+h0lasLVe7zXgkkM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=MZ5pvINlLVJSn6ZfjH57wmSF9QK9xvTgiD+vwWPq5azTKGyPBGZNjELKM0/uat6hM
	 ujmCmeQ3F3H+6oTPuAE+24PgXSFAjnBsiHl2klGSsMSUHXQPfj0Tlybh/EYTtQ7dkX
	 G47H2iNp8Zi8wWvbcB5OZnIfAZec0zzlXudqhc6/yGHK6/fQr2dj/ssgRb3gVWcXAa
	 Uvl0qqWxy8ItpHN8kQrXnZGHwkiq7kdb9tFXEXmZF3lVGDUY0ZiMPLBfgpbrA53rvY
	 tga1eKTUk8w8knqg++33kk4Qyc5t2zDEby1twftX7EYy7KyFItkh96WFCU9MWbX+v9
	 5tx8N9eEc7TNA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0923CCF9EE;
	Tue, 28 Oct 2025 09:52:35 +0000 (UTC)
From: Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org>
Date: Tue, 28 Oct 2025 17:52:34 +0800
Subject: [PATCH v4 8/8] arm64: dts: amlogic: A5: Add peripheral clock
 controller node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251028-a5-clk-v4-8-e62ca0aae243@amlogic.com>
References: <20251028-a5-clk-v4-0-e62ca0aae243@amlogic.com>
In-Reply-To: <20251028-a5-clk-v4-0-e62ca0aae243@amlogic.com>
To: Chuan Liu <chuan.liu@amlogic.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761645153; l=2041;
 i=chuan.liu@amlogic.com; s=20240902; h=from:subject:message-id;
 bh=YYbjhOqv9sLsKL9/6kFNdkCYIVZ6AE4KPrWobMyqnNo=;
 b=DoeEFqJNWBpzx0tOSYR8gEBcxicBskuvYLQGtd01Z114H7ZbIhZKnIz5tz0HrMXe+cYzQKes8
 1r2vICflcg9DNe+Vi2WNxfemF/EvYsC2b1LUoPNmBkr2nN8uRFH3H/B
X-Developer-Key: i=chuan.liu@amlogic.com; a=ed25519;
 pk=fnKDB+81SoWGKW2GJNFkKy/ULvsDmJZRGBE7pR5Xcpo=
X-Endpoint-Received: by B4 Relay for chuan.liu@amlogic.com/20240902 with
 auth_id=203
X-Original-From: Chuan Liu <chuan.liu@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251028_025238_491404_155E7983 
X-CRM114-Status: UNSURE (   8.16  )
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
index 70deeab220e0..7324e427ed39 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-a5.dtsi
+++ b/arch/arm64/boot/dts/amlogic/amlogic-a5.dtsi
@@ -9,6 +9,7 @@
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



