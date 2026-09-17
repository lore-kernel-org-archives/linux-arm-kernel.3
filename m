Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5615C982D6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 13:49:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BQW5AjUr1masli48MyMLrdQIq4y0YpLkeYUMzxv25+I=; b=mTkeN0HlBSQmo0ByaFYuccE3eL
	kgfZG/UzxgknBHbv2DIu2iq4nsfnNJ5Iwsp2OW0a4ujGVVVs3URdJa1x0rXae/8dqFQ4CxMZgULjj
	pqoJ4aMl6SrZAHXffLQYIwwfHrGXcMVMkm0DhxzKrWw4BZjgrr//z1rmYX0vewUQ94S8kdi9rkkDE
	xKcObVd//fzDzeWXHKYRWZUaNLYvJCKT3IyV5VKHInX/OWDcVuHBd7EmUtzUg23szjys6BI0//brz
	etTcZCDhTLINRv2VfTfBz1Dv9B7JSE51XxCS/oYNryRSvh0ZRiOEl66QsnFECdMwp8dEn2dMc+90h
	gHu5+3dQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7CUb-0000000BRTK-1OxP;
	Thu, 17 Sep 2026 13:49:37 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7CUT-0000000BRLI-1gHT;
	Thu, 17 Sep 2026 13:49:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1789652962;
	bh=kl8wn/r9EG1O9VsRBp0nZH0IjzQxh/DjmWyxpmzatK8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=IFnGPYjzhwfVNR8xr27wbsJgzCD9gWNDrYSbR/o0h6zoQKvVqhBdOLarLRSVLKGZ6
	 Z8IlpSi/KxNQFF0aJyYRF8xZuB/BccVQX6ma6tXN67wEtC06r0wMMoIX624kQ5qoPi
	 28HhpaDpqGObwUp6pfc3B21ZtRiVmw9DE9CJ3sMwpRaLUlaAAZ0DOADumsFa2KJlt2
	 0RvXJOkO1RB3bjXrPYVzCyM78yvSZwuXZyTOpRagM/gyU9KVUzk9IA45VUZuZ3ekYA
	 hBz6CwH7V+982fR6tGHeLuXTS0/SpXTFvF+IANH74bA4hVsz/yOuaCuaxYSmA9cKsM
	 3xbF5Xo2E+Csg==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 2C09817E0D69;
	Thu, 17 Sep 2026 15:49:22 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 867F948003D; Thu, 17 Sep 2026 15:49:21 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Thu, 17 Sep 2026 15:49:20 +0200
Subject: [PATCH 8/8] arm64: dts: rockchip: add dfi clocks on RK3588
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260917-rockchip-dfi-cleanup-v1-8-4f00a97a69a6@collabora.com>
References: <20260917-rockchip-dfi-cleanup-v1-0-4f00a97a69a6@collabora.com>
In-Reply-To: <20260917-rockchip-dfi-cleanup-v1-0-4f00a97a69a6@collabora.com>
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Chanwoo Choi <cw00.choi@samsung.com>, 
 MyungJoo Ham <myungjoo.ham@samsung.com>, 
 Kyungmin Park <kyungmin.park@samsung.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>
Cc: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
 kernel@collabora.com, Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1261;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=yJgBEAE3Q/LF6F94kFrvAOvvsqkDjVIE3joxTI9swgE=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGqr7+Fs6oVWlmCUxy/SGppCEfqqfLOqAQF9Z
 ExKxA3TWTkXf4kCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqq+/hAAoJENju1/PI
 O/qa9VcP+wSIaN4YPKWZp0R/dl6xsYEeoNVXQyw/zJl8MnnkGljfclPSjL56LnGE+6z6okczkcl
 CFSPYBpszqPJPVNAi8Y7iqPfZsbpeLjuLjlkzalMmlvZNx/tzKNMcgUi7ZjUCrziFMwDxfu2Nq/
 wlJAFWclDnWS3Ooxqt2IGOHmXEDcpD0GZZIaTT2fllQdn+XdlyeLSm7NjdHe6LfmzFIAP711Yau
 zsiFgwGR8DW5sacQGV16KSWgm5QNnqY9LuSGyfvHVgPvF6lg0wnzFZUuLpgK7wmUY5sLh2MonNR
 g4wQOY/RKir5p0LMDqcpF/dACQhRVv7ccoLpQktQAj3Jl8VAYlidl807XtkQ6ljJO0fbMh3QfWg
 TWOUed77Fj/Z6qEJYDFvla8s81KTDT7VrKs24t6gKUi44rUDWEzMNg9n8M3VCe17TGg6+e7hGTI
 bkoJKamZ74Sss2Z/Gvs+qoL6/Y4lFs7TrjtAoJMFFqBiCAZTm8dhgQ0gegF8Ca5zK5ZiI6+n8VW
 UVW9Ndc/IGUSuq7MomPjtvFvJRODtvc9ZUWd9E6w1pU//+CcoHdTCXyEAmTF3ERLRWhXUWHrihQ
 LAh5upVeK/6+IhUCfWrRcm+OcgJ/dA+aZQ6fmRUsQj3F1azJPPH35hozg0fjP/gLqoaUwzZXKZ0
 KOPn8ujipg5DR3e4iAA4o5g==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_064929_609906_DEF7C12E 
X-CRM114-Status: GOOD (  11.42  )
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

From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>

The DFI clocks weren't modelled before and the binding didn't know about
them either. That has changed though, and now we actually need to
specify these clocks.

Add all four clocks for all four channels of monitoring.

Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 arch/arm64/boot/dts/rockchip/rk3588-base.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
index 376ad04e0786..ac9299e1197b 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
@@ -2178,6 +2178,10 @@ qos_vop_m1: qos@fdf82200 {
 	dfi: dfi@fe060000 {
 		reg = <0x00 0xfe060000 0x00 0x10000>;
 		compatible = "rockchip,rk3588-dfi";
+		clocks = <&cru PCLK_DDR_MON_CH0>, <&cru PCLK_DDR_MON_CH1>,
+			 <&cru PCLK_DDR_MON_CH2>, <&cru PCLK_DDR_MON_CH3>;
+		clock-names = "pclk_ddr_mon_ch0", "pclk_ddr_mon_ch1",
+			      "pclk_ddr_mon_ch2", "pclk_ddr_mon_ch3";
 		interrupts = <GIC_SPI 28 IRQ_TYPE_LEVEL_HIGH 0>,
 			     <GIC_SPI 38 IRQ_TYPE_LEVEL_HIGH 0>,
 			     <GIC_SPI 48 IRQ_TYPE_LEVEL_HIGH 0>,

-- 
2.53.0


