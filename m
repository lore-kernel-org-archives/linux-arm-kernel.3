Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1141CC369A2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Apr 2025 17:04:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H5yRYCR6WmAHXVd+1GJmlmHILhBuX7kiBJR6nB1Jql8=; b=BEMbXwKANZKB5O0Om3+dv0B8Hh
	xAAEEB8lKhfth9o44z0aLKjMC1s6lFkb7JdwM7c0Hi1uoaF96GXl3xsIQFaGVCje1qDq2KI7XiFye
	5Pao4fKrB7vGS+QtKrRpAUotMihgfPR568LgdFPR8HRe51Q0FQ+DpOyf+vt1RZcfvLoSQUKtX+lY6
	bDq4QnPZ65UprE0aRzL8pGIwqynErJ2wWpV3s7dkG+o5w3IZGziwLRPo1Gpf2qWs7vhPHAvnLfMH0
	cLWvDlJwRTWggjxcxSKAbOQdtMMbNb0TBNmDvWEI3+iIHDGzZHeC89/wzELdNcwkJBiF/KUA3+CLI
	ynidt3JQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2vJq-0000000BJ1M-0dNg;
	Thu, 10 Apr 2025 17:04:02 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2u8F-0000000B52X-1JgE;
	Thu, 10 Apr 2025 15:48:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 256CC44362;
	Thu, 10 Apr 2025 15:47:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F97AC4CEDD;
	Thu, 10 Apr 2025 15:47:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744300078;
	bh=rxpmdQ00QIobReD/bCkMksNDeC2yXxfKVAGTAYhvgkc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=iIQUvuA3gCshAauWH6zqRI+XnRTwwMXV9I3TGGqvy/FEER7QJ7uNg9cI44qlxasr5
	 R+ZaP9NiVZ34J1QGpo5SeLFChNsPeTgAxjM27nsqqT4e3WUqtyKOsQLY/aVPEunLoj
	 m/wI1Hh9QqYtsFJ6rwrqHfViwqaTpORKlJy6QsjVkjPiSww29Trsj7jmsrdWY+hlSg
	 MiLq+RXW8Pv/nuX92JbMAqgRxs026LTnIx1WqmLlezoEukSV6ShwHIzhAlypfoJq23
	 zgY8buBGUkvYk1b+aZru6NhR15CWbwZqMBVTjo/NhBVD9EaxYG/+4t0ydMjHFfl1S1
	 js7HvMT+iaIqQ==
From: "Rob Herring (Arm)" <robh@kernel.org>
Date: Thu, 10 Apr 2025 10:47:30 -0500
Subject: [PATCH v2 09/17] arm: dts: qcom: ipq4019: Drop redundant CPU
 "clock-latency"
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250410-dt-cpu-schema-v2-9-63d7dc9ddd0a@kernel.org>
References: <20250410-dt-cpu-schema-v2-0-63d7dc9ddd0a@kernel.org>
In-Reply-To: <20250410-dt-cpu-schema-v2-0-63d7dc9ddd0a@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Conor Dooley <conor@kernel.org>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Steen Hegelund <Steen.Hegelund@microchip.com>, 
 Daniel Machon <daniel.machon@microchip.com>, UNGLinuxDriver@microchip.com, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Heiko Stuebner <heiko@sntech.de>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Andy Gross <agross@kernel.org>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>, 
 Stephen Boyd <sboyd@kernel.org>, zhouyanjie@wanyeetech.com, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, imx@lists.linux.dev, 
 linux-rockchip@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-renesas-soc@vger.kernel.org, linux-mips@vger.kernel.org, 
 linux-pm@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250410_084759_420716_898C3618 
X-CRM114-Status: UNSURE (   9.15  )
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
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

The "clock-latency" property is part of the deprecated opp-v1 binding
and is redundant if the opp-v2 table has equal or larger values in any
"clock-latency-ns". The OPP table has values of 256000, so it can be
removed.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 arch/arm/boot/dts/qcom/qcom-ipq4019.dtsi | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/arm/boot/dts/qcom/qcom-ipq4019.dtsi b/arch/arm/boot/dts/qcom/qcom-ipq4019.dtsi
index 06b20c196faf..fceb2f5f5482 100644
--- a/arch/arm/boot/dts/qcom/qcom-ipq4019.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-ipq4019.dtsi
@@ -53,7 +53,6 @@ cpu@0 {
 			reg = <0x0>;
 			clocks = <&gcc GCC_APPS_CLK_SRC>;
 			clock-frequency = <0>;
-			clock-latency = <256000>;
 			operating-points-v2 = <&cpu0_opp_table>;
 		};
 
@@ -67,7 +66,6 @@ cpu@1 {
 			reg = <0x1>;
 			clocks = <&gcc GCC_APPS_CLK_SRC>;
 			clock-frequency = <0>;
-			clock-latency = <256000>;
 			operating-points-v2 = <&cpu0_opp_table>;
 		};
 
@@ -81,7 +79,6 @@ cpu@2 {
 			reg = <0x2>;
 			clocks = <&gcc GCC_APPS_CLK_SRC>;
 			clock-frequency = <0>;
-			clock-latency = <256000>;
 			operating-points-v2 = <&cpu0_opp_table>;
 		};
 
@@ -95,7 +92,6 @@ cpu@3 {
 			reg = <0x3>;
 			clocks = <&gcc GCC_APPS_CLK_SRC>;
 			clock-frequency = <0>;
-			clock-latency = <256000>;
 			operating-points-v2 = <&cpu0_opp_table>;
 		};
 

-- 
2.47.2


