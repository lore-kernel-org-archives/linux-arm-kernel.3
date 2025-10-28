Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7597CCCD1BF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Oct 2025 09:52:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fWYmcjhvg9y3N/u/OOKx04aj1aGuI0a8sXoAGDiMrKs=; b=vIwvQbokmG2m633B82YXjtbwmt
	yvjzRmMbVxeYaU3XzUNFG3a1luESUVgGRvXX/WQQ+CYDh3ZSLPvX3YNjMC6z6dC5w+QjYoBt/AyyY
	6Xv3JkwuuUq+FMT9J0kK2eToZeEHnvg92GifEIr0iVIfq2SWhjhF/sH0bCXXy2v+S/igxi99FpCEA
	5vZzyMPAmHKoFcvE1wwQKuLCCMZXrcNKy1SCbqDgBhXbIpr4DpTPinBhc5FULhv29nLJ5lrx1zLIV
	xO2jO+jaXqvaeog3L0YshVhwOCEZWTxeC2QYe2oVsSQ1YicGpmksIuKQec73zsPpRAdtg/oTZYFYs
	8u3gugVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDgNh-0000000Fg5g-3Pri;
	Tue, 28 Oct 2025 09:52:45 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDgNY-0000000Ffzt-3pW2;
	Tue, 28 Oct 2025 09:52:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id ED87D61EE3;
	Tue, 28 Oct 2025 09:52:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id BC6E1C2BC87;
	Tue, 28 Oct 2025 09:52:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761645155;
	bh=X2LgKGxvc+yiUAPkHyPMwzAGhXvItiDTlNdNw6TQWqo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=t4JFRL1LHezh+pDEOavRzpciy6ukDQRspmubAEvFpihyHageE4WYTV8JKVXzDWVpI
	 wTed7pttMW895m7ygAsnBk5WeVdn3+s4soHmOL33s1kTnMPjTE07D0XofQeGmz9dGX
	 CAL97CfJvWV1tvAEF5njYYhr8qCUw3DJBe35LqG3gcowwcsdPTTqs7dBI5DDoAZVC7
	 8gf850h6XS2M8kpmI2KC8q4yj/JHE6IgEltVTbGgg23smsXjoPSUHv3In2CvGT7/Ob
	 fck8qQQtxS2PVsoTuwL0zMPRDWnbCjiuVDek+Ya5ePJfMg2SpTMdzM5HjbxMEEP5LS
	 fCeGSjWyyKK7A==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B248CCCF9E0;
	Tue, 28 Oct 2025 09:52:35 +0000 (UTC)
From: Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org>
Date: Tue, 28 Oct 2025 17:52:33 +0800
Subject: [PATCH v4 7/8] arm64: dts: amlogic: A5: Add PLL controller node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251028-a5-clk-v4-7-e62ca0aae243@amlogic.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761645153; l=1163;
 i=chuan.liu@amlogic.com; s=20240902; h=from:subject:message-id;
 bh=W8yE0gYMnw2TeYIsOkbQZ2yJTdvcybUThyiQBa5vAa4=;
 b=aEsMXHrLZog7rahKISm0rdVZl/eWN5ue3go4FB7W+uwpAjdcEEr35iq9s+5Qb3lzPijMXPAVv
 RuPggJTaf4gANchCoZf33G9GtybQvpexOciXvyTsMogxEMMOSgA+pQ9
X-Developer-Key: i=chuan.liu@amlogic.com; a=ed25519;
 pk=fnKDB+81SoWGKW2GJNFkKy/ULvsDmJZRGBE7pR5Xcpo=
X-Endpoint-Received: by B4 Relay for chuan.liu@amlogic.com/20240902 with
 auth_id=203
X-Original-From: Chuan Liu <chuan.liu@amlogic.com>
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

Add PLL controller node for A5 SoC family.

Signed-off-by: Chuan Liu <chuan.liu@amlogic.com>
---
 arch/arm64/boot/dts/amlogic/amlogic-a5.dtsi | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-a5.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-a5.dtsi
index a6625508893d..70deeab220e0 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-a5.dtsi
+++ b/arch/arm64/boot/dts/amlogic/amlogic-a5.dtsi
@@ -8,6 +8,7 @@
 #include <dt-bindings/pinctrl/amlogic,pinctrl.h>
 #include <dt-bindings/power/amlogic,a5-pwrc.h>
 #include <dt-bindings/clock/amlogic,a5-scmi-clkc.h>
+#include <dt-bindings/clock/amlogic,a5-pll-clkc.h>
 
 / {
 	cpus {
@@ -187,4 +188,16 @@ gpio_intc: interrupt-controller@4080 {
 		amlogic,channel-interrupts =
 			<10 11 12 13 14 15 16 17 18 19 20 21>;
 	};
+
+	clkc_pll: clock-controller@8000 {
+		compatible = "amlogic,a5-pll-clkc";
+		reg = <0x0 0x8000 0x0 0x1a4>;
+		#clock-cells = <1>;
+		clocks = <&xtal>,
+			 <&scmi_clk CLKID_FIXED_PLL_DCO>,
+			 <&scmi_clk CLKID_FIXED_PLL>;
+		clock-names = "xtal",
+			      "fix_dco",
+			      "fix";
+	};
 };

-- 
2.42.0



