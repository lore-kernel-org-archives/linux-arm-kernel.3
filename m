Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A940DC3601A
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Apr 2025 03:09:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oI93c8vtvKq/f6xKPOGxHNoKo3jsXJD6nIF8l8Nuxus=; b=L+AS3o2AIn99BBsvIP/1SodKx1
	RMtbzZIvR1fcRt+Nin0byO6r7EUCX2aittjAY2VJgfKNYGsQGw5CS5OFSH31WgyEJWNOieRJe/lcY
	LAiuvNMBRei97ywAhnUV/DV3uDjdRktXVGnFGmaF3kASJUCORe6VBmrPd+A5VNSnsRAgqRIP0oP5+
	3CDVmmY0ROcGe8iefya3W1MMv2ZlfN73OkESJcfHSTVNM94hFwrN8G9IIkcXDk5d18F3ZlJtVpgjC
	1VuStFjJLwrP/xdv0tUtQlrl0tJXFmD97ZN6/C6XhW4bSvU5dzuBAbl9A/LfY9s7O7REN+q+jNE0h
	93iJkIkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0XQQ-0000000AehG-1X5I;
	Fri, 04 Apr 2025 03:08:58 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0XHX-0000000Acv1-2Rwn;
	Fri, 04 Apr 2025 02:59:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C04AD44F26;
	Fri,  4 Apr 2025 02:59:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7AC8C4CEE3;
	Fri,  4 Apr 2025 02:59:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743735587;
	bh=6GCFc3TOy1LAHhIH0FHC3IwyJd+TMm/GWKIlM1Cgt/k=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ngLHJxNxnM7sSXQ/6PRU0/L8GowkeGVz0Ortjzfu1yG8wov4Gpm+9CtRA4A+TLiG4
	 bCFnTdm7eePjs27Jwo2iOOLCf9C0vJc14qGDQxWUpH51Jzq2AntWhJ5ymBtGZvNQM5
	 UOVBRJCOirbMZ6VBEwvR5DJnz4mNMbLs2JgfUfC+cZRb4F0YYVCbJoAPB2Z7qSiVhj
	 h7Ov7J5cOOmAEVS9IgbJr/thA2JvOUu8QffoaJQlg7noZ4NdGuPX9mhxF/OmZReIaP
	 N/HEf3FZg5HDKq2z+hCE1TRDsJW1iYSq+Hc0EkC+HchK0tEXoPYfIBHDYWOcRUnDsn
	 hraIn9sJZ6Tvw==
From: "Rob Herring (Arm)" <robh@kernel.org>
Date: Thu, 03 Apr 2025 21:59:26 -0500
Subject: [PATCH 05/19] arm64: dts: qcom: qdu1000: Fix qcom,freq-domain
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250403-dt-cpu-schema-v1-5-076be7171a85@kernel.org>
References: <20250403-dt-cpu-schema-v1-0-076be7171a85@kernel.org>
In-Reply-To: <20250403-dt-cpu-schema-v1-0-076be7171a85@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Viresh Kumar <viresh.kumar@linaro.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>, 
 Liviu Dudau <liviu.dudau@arm.com>, Sudeep Holla <sudeep.holla@arm.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>, 
 Stephen Boyd <sboyd@kernel.org>, zhouyanjie@wanyeetech.com, 
 Conor Dooley <conor@kernel.org>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Steen Hegelund <Steen.Hegelund@microchip.com>, 
 Daniel Machon <daniel.machon@microchip.com>, UNGLinuxDriver@microchip.com, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Heiko Stuebner <heiko@sntech.de>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-arm-msm@vger.kernel.org, linux-mips@vger.kernel.org, 
 imx@lists.linux.dev, linux-rockchip@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-renesas-soc@vger.kernel.org
X-Mailer: b4 0.15-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250403_195947_677851_A6B462C2 
X-CRM114-Status: GOOD (  10.08  )
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

The correct property name is 'qcom,freq-domain', not
'qcom,freq-domains'.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 arch/arm64/boot/dts/qcom/qdu1000.dtsi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/qdu1000.dtsi b/arch/arm64/boot/dts/qcom/qdu1000.dtsi
index f973aa8f7477..7c8d78fd7ebf 100644
--- a/arch/arm64/boot/dts/qcom/qdu1000.dtsi
+++ b/arch/arm64/boot/dts/qcom/qdu1000.dtsi
@@ -47,7 +47,7 @@ cpu0: cpu@0 {
 			enable-method = "psci";
 			power-domains = <&cpu_pd0>;
 			power-domain-names = "psci";
-			qcom,freq-domains = <&cpufreq_hw 0>;
+			qcom,freq-domain = <&cpufreq_hw 0>;
 			next-level-cache = <&l2_0>;
 			l2_0: l2-cache {
 				compatible = "cache";
@@ -70,7 +70,7 @@ cpu1: cpu@100 {
 			enable-method = "psci";
 			power-domains = <&cpu_pd1>;
 			power-domain-names = "psci";
-			qcom,freq-domains = <&cpufreq_hw 0>;
+			qcom,freq-domain = <&cpufreq_hw 0>;
 			next-level-cache = <&l2_100>;
 			l2_100: l2-cache {
 				compatible = "cache";
@@ -88,7 +88,7 @@ cpu2: cpu@200 {
 			enable-method = "psci";
 			power-domains = <&cpu_pd2>;
 			power-domain-names = "psci";
-			qcom,freq-domains = <&cpufreq_hw 0>;
+			qcom,freq-domain = <&cpufreq_hw 0>;
 			next-level-cache = <&l2_200>;
 			l2_200: l2-cache {
 				compatible = "cache";
@@ -106,7 +106,7 @@ cpu3: cpu@300 {
 			enable-method = "psci";
 			power-domains = <&cpu_pd3>;
 			power-domain-names = "psci";
-			qcom,freq-domains = <&cpufreq_hw 0>;
+			qcom,freq-domain = <&cpufreq_hw 0>;
 			next-level-cache = <&l2_300>;
 			l2_300: l2-cache {
 				compatible = "cache";

-- 
2.47.2


