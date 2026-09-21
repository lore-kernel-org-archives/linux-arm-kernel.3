Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43737C982FA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 20:33:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BQW5AjUr1masli48MyMLrdQIq4y0YpLkeYUMzxv25+I=; b=eKHfTn2+B4mGK15RCPzRzJaoOs
	jtmuIQw/UXy6OHhWfPwRBUrsDEcJbbLTlvHE/2Be9o7N3sO8fjB2vp1U24JU+cC/zYbwgQQEp1/5m
	k4nnqzbE2oWikvA5W3lphgrp2O7ZanOG5Y1kWHkqT9NqIa44rl+q2kPsCrazhKE+worGWNiC+KSo2
	OJ22/oCoHLMAQVI5UMBRcuHJer5CVv14XvBZi93bneAxdBzlmsPXIc6uvOUBEvhJcKYM0UXo6eTZ+
	Ii9Hy1T1jsFNFDG0+U65cXOLPXWfNd+S6YjXfmUa8mIS25KGPQI5+YboteoOyhfKBM2Yuy5baQSl3
	9qfu7cvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8khl-00000003M04-3M92;
	Mon, 21 Sep 2026 20:33:37 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8khU-00000003Llq-06uu;
	Mon, 21 Sep 2026 20:33:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1790022792;
	bh=kl8wn/r9EG1O9VsRBp0nZH0IjzQxh/DjmWyxpmzatK8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Rji7PbvHbdPfvL7M7W5xwKaK9dfM75OVFXx+/rumstL0S0jyqVBpfZU7Pz1a/Ng5j
	 5y7kRZHUvd0/B65aU4bGUTSWIS8bUHUn7iH8EuGskzxNuSA0uITsEORpjLNeng+eU1
	 tUlA+pFzx+6EUMyy+/4vvqX+Al+/VGdI/0kLjBtGfMSOxZYGe1ILgcD02uSeZx4kIo
	 f1T7LPyyKtRlKOqU7ttPhoTl39H2WCB0WA55q32GCqTGQ2NMaNpLtxRGDAUf/ZHYFy
	 kSkvA6wRr3qefsUplmonqiZ7hyVGlYyeIgr7LwrK18QcF0A1elj53+PhJd3wvXxvax
	 ZNKHuO6cxRVSQ==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 97E7917E0D69;
	Mon, 21 Sep 2026 22:33:12 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 0169D48003D; Mon, 21 Sep 2026 22:33:12 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Mon, 21 Sep 2026 22:32:51 +0200
Subject: [PATCH v2 8/8] arm64: dts: rockchip: add dfi clocks on RK3588
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260921-rockchip-dfi-cleanup-v2-8-43ff34ac8599@collabora.com>
References: <20260921-rockchip-dfi-cleanup-v2-0-43ff34ac8599@collabora.com>
In-Reply-To: <20260921-rockchip-dfi-cleanup-v2-0-43ff34ac8599@collabora.com>
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
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGqxlIdT7oBl7xnlQ8+qAoOVONj4+II2ywgJW
 yCDcKSJVEMM0okCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqsZSHAAoJENju1/PI
 O/qaKuoQAI141LAMUadx9gzf314SwZtTFWdETwiH4mdeam4VMwWKefPaQsfo/0eZLlTRoR3Rago
 r9xiQED2IliIVyGOy7irShUoOsEYjQL7OzT1SZqTvOw3paWsYVZzfgePk7nfGtkm+Gqsf4JlfpR
 2MvSm6XMJH4HZeAebkY6VIZUiVl/biFU9gVVL45Yl6a97GguuHdr69bGCmRvywtSRPT9Zn2fRCI
 AP0D3ZTTL9hRuRc1Wyz++t0fBHE4v1nJxcwTYLEuVbbB+JqwrW0P8abUb8w3XsDbpSYrr861dME
 TZ5xedtmnR/Qnkj0xBm32HFQEp/y1U7zdkgnMy7hZD6aS7ToTkS7dl7zvir0n42WwP2Pol7STPl
 3LxI+Pu2/jpb3WDJZhIv9zgiG9fnyBMuJ774rOh+VKGQ4qDZgKxAiiKhTuwIy9STEi8raZ43AjK
 lgvyMdsApVI+7uMcscZ0vqDhYRd97UwbTiqCCXWTpEbuDTBBlsB+bLGCQTojPDay7a2/kMt2iy9
 Mck1SSC0sz+IAf6OYpuaJaTP/1hQbxElRfjrDPM9mzdO/Rbp7qMUQDehWU47Vt/SVWHRpMpImtK
 AyExaoAHVhD96oAzEbBJNR77Pr2PhfAk4cfTFFri69eePxLhh0te8XJECDFOyDxhOZEcWp3W2SD
 yWdUTvFNBHT3Pgkk6aXsuVA==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_133320_235268_FA36007E 
X-CRM114-Status: GOOD (  11.57  )
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


