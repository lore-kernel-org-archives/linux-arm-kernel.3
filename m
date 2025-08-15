Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 441BBCA0ED1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Aug 2025 08:51:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y9gU9TZXVh4tVGEhfOav08RFt2N0nyqBeVfuHryfK9U=; b=d1RtLYg9JBu/n1kfXQQNg30/Zl
	YfpRs7dIcrcQT5ApCcebwor37/R+t21vwaBTLhttJaj5YEI7jqNdbnliraftSkS94HPjfMAp+3reY
	saAiA0K5zOv+gav7xqPd0n3M69knkMeRhvZcLN9jZ/0lbOKzLpgdqkaq1yp+ePyMoqyiWdceGTYFy
	KL/LWoXgMtSWseFzloRx3R9lSDNESVt6AIgNgR/0bRE4ClegD+bDfeMcrGilJxXahRVxkfu5uVooh
	MnNtnXVMq249v+SdXPp7vEt/NYrLT17Z/PyshlBw/yr95vuP9vM7jAwuCs+1269nOlR6braRr7MQS
	3bFh0mBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umq9W-00000001uhz-0Ycm;
	Fri, 15 Aug 2025 08:51:10 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umpwU-00000001sS9-2FPD;
	Fri, 15 Aug 2025 08:37:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8241F447EA;
	Fri, 15 Aug 2025 08:37:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 53C51C4CEF8;
	Fri, 15 Aug 2025 08:37:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755247061;
	bh=Vag6wGtu+suGJmuhRU5XEAgwSSUZw7icX5H63EyrARo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=KIQskRPgr6ey4+Awv/m0V64oz39jwPYMPXd1XTv6HGMo5WEpP8w85zi1I2oj9plPH
	 J5rsm1lujvG0oD8qFCDli1psAJfGj+Ka48zYGTKJYxO2ydYUN8NXJca3XtY1Qpnmtu
	 cSESLT6PA84R449Wp9s10ozeMHgfw19Gjf743SFcS1Fr0PEH6oJhOsZXZkJvOhHbyK
	 biDfQuk5YNf8xzrK7fqhF9XB/LLx0w9soSmzUULL8UvtfS2R9/bML2a877ok2TV/n0
	 01PDMryhqYi5Kcls1LB+JXgPwQX1Iai7nzyu8xgMZHf2w2ac53wHsTypor4fzPZtw1
	 8+gn0jdj/bl2Q==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47018CA0EE0;
	Fri, 15 Aug 2025 08:37:41 +0000 (UTC)
From: Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org>
Date: Fri, 15 Aug 2025 16:37:29 +0800
Subject: [PATCH 03/13] ARM: dts: amlogic: add clk-measure IDs and names for
 meson SoC family
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250815-add-more-socs-to-support-clk_measure-v1-3-59f04ba67457@amlogic.com>
References: <20250815-add-more-socs-to-support-clk_measure-v1-0-59f04ba67457@amlogic.com>
In-Reply-To: <20250815-add-more-socs-to-support-clk_measure-v1-0-59f04ba67457@amlogic.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Chuan Liu <chuan.liu@amlogic.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755247057; l=4791;
 i=chuan.liu@amlogic.com; s=20240902; h=from:subject:message-id;
 bh=l3K7Yyi1QbVnRco0ODiFhzNHVuFGmS+WerLaTtYEH3c=;
 b=TrZmR2cg/qIqhAS3j+OceUmOc0G8xq6bmRF+Evy0oSHZU1h9Vjc2E1+VmdaPFXyyHZ4HCSZov
 /hyPeKpDH24CCDnFx0uECIES85Ac/7fJn4dTJFn+lMSTbVaj3RbnT2I
X-Developer-Key: i=chuan.liu@amlogic.com; a=ed25519;
 pk=fnKDB+81SoWGKW2GJNFkKy/ULvsDmJZRGBE7pR5Xcpo=
X-Endpoint-Received: by B4 Relay for chuan.liu@amlogic.com/20240902 with
 auth_id=203
X-Original-From: Chuan Liu <chuan.liu@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250815_013742_667315_BC5DA191 
X-CRM114-Status: UNSURE (   8.54  )
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

In the clk-measure driver, the method has been changed to obtain the
supported IDs and their corresponding names for SoC clk-measure through
DTS, adding support for mes8 and mes8b here.

Signed-off-by: Chuan Liu <chuan.liu@amlogic.com>
---
 arch/arm/boot/dts/amlogic/meson8.dtsi  | 92 ++++++++++++++++++++++++++++++++++
 arch/arm/boot/dts/amlogic/meson8b.dtsi | 92 ++++++++++++++++++++++++++++++++++
 2 files changed, 184 insertions(+)

diff --git a/arch/arm/boot/dts/amlogic/meson8.dtsi b/arch/arm/boot/dts/amlogic/meson8.dtsi
index a609b5a0fda4..2f9ecd2eb4cf 100644
--- a/arch/arm/boot/dts/amlogic/meson8.dtsi
+++ b/arch/arm/boot/dts/amlogic/meson8.dtsi
@@ -462,6 +462,98 @@ pwm_ef: pwm@86c0 {
 	clock-measure@8758 {
 		compatible = "amlogic,meson8-clk-measure";
 		reg = <0x8758 0x1c>;
+		clkmsr-indices = <0>,
+				 <1>,
+				 <2>,
+				 <3>,
+				 <6>,
+				 <7>,
+				 <8>,
+				 <9>,
+				 <11>,
+				 <13>,
+				 <14>,
+				 <15>,
+				 <16>,
+				 <18>,
+				 <19>,
+				 <20>,
+				 <21>,
+				 <22>,
+				 <23>,
+				 <24>,
+				 <26>,
+				 <28>,
+				 <30>,
+				 <31>,
+				 <32>,
+				 <33>,
+				 <34>,
+				 <35>,
+				 <36>,
+				 <38>,
+				 <39>,
+				 <40>,
+				 <41>,
+				 <42>,
+				 <43>,
+				 <44>,
+				 <45>,
+				 <46>,
+				 <47>,
+				 <48>,
+				 <49>,
+				 <59>,
+				 <60>,
+				 <61>,
+				 <62>,
+				 <63>;
+		clkmsr-names = "ring_osc_out_ee0",
+			       "ring_osc_out_ee1",
+			       "ring_osc_out_ee2",
+			       "a9_ring_osck",
+			       "vid_pll",
+			       "clk81",
+			       "encp",
+			       "encl",
+			       "eth_rmii",
+			       "amclk",
+			       "fec_clk_0",
+			       "fec_clk_1",
+			       "fec_clk_2",
+			       "a9_clk_div16",
+			       "hdmi_sys",
+			       "rtc_osc_clk_out",
+			       "i2s_clk_in_src0",
+			       "clk_rmii_from_pad",
+			       "hdmi_ch0_tmds",
+			       "lvds_fifo",
+			       "sc_clk_int",
+			       "sar_adc",
+			       "mpll_clk_test_out",
+			       "audac_clkpi",
+			       "vdac",
+			       "sdhc_rx",
+			       "sdhc_sd",
+			       "mali",
+			       "hdmi_tx_pixel",
+			       "vdin_meas",
+			       "pcm_sclk",
+			       "pcm_mclk",
+			       "eth_rx_tx",
+			       "pwm_d",
+			       "pwm_c",
+			       "pwm_b",
+			       "pwm_a",
+			       "pcm2_sclk",
+			       "ddr_dpll_pt",
+			       "pwm_f",
+			       "pwm_e",
+			       "hcodec",
+			       "usb_32k_alt",
+			       "gpio",
+			       "vid2_pll",
+			       "mipi_csi_cfg";
 	};
 
 	pinctrl_cbus: pinctrl@8030 {
diff --git a/arch/arm/boot/dts/amlogic/meson8b.dtsi b/arch/arm/boot/dts/amlogic/meson8b.dtsi
index 2d77b9876bf4..74fd000569a2 100644
--- a/arch/arm/boot/dts/amlogic/meson8b.dtsi
+++ b/arch/arm/boot/dts/amlogic/meson8b.dtsi
@@ -416,6 +416,98 @@ pwm_ef: pwm@86c0 {
 	clock-measure@8758 {
 		compatible = "amlogic,meson8b-clk-measure";
 		reg = <0x8758 0x1c>;
+		clkmsr-indices = <0>,
+				 <1>,
+				 <2>,
+				 <3>,
+				 <6>,
+				 <7>,
+				 <8>,
+				 <9>,
+				 <11>,
+				 <13>,
+				 <14>,
+				 <15>,
+				 <16>,
+				 <18>,
+				 <19>,
+				 <20>,
+				 <21>,
+				 <22>,
+				 <23>,
+				 <24>,
+				 <26>,
+				 <28>,
+				 <30>,
+				 <31>,
+				 <32>,
+				 <33>,
+				 <34>,
+				 <35>,
+				 <36>,
+				 <38>,
+				 <39>,
+				 <40>,
+				 <41>,
+				 <42>,
+				 <43>,
+				 <44>,
+				 <45>,
+				 <46>,
+				 <47>,
+				 <48>,
+				 <49>,
+				 <59>,
+				 <60>,
+				 <61>,
+				 <62>,
+				 <63>;
+		clkmsr-names = "ring_osc_out_ee0",
+			       "ring_osc_out_ee1",
+			       "ring_osc_out_ee2",
+			       "a9_ring_osck",
+			       "vid_pll",
+			       "clk81",
+			       "encp",
+			       "encl",
+			       "eth_rmii",
+			       "amclk",
+			       "fec_clk_0",
+			       "fec_clk_1",
+			       "fec_clk_2",
+			       "a9_clk_div16",
+			       "hdmi_sys",
+			       "rtc_osc_clk_out",
+			       "i2s_clk_in_src0",
+			       "clk_rmii_from_pad",
+			       "hdmi_ch0_tmds",
+			       "lvds_fifo",
+			       "sc_clk_int",
+			       "sar_adc",
+			       "mpll_clk_test_out",
+			       "audac_clkpi",
+			       "vdac",
+			       "sdhc_rx",
+			       "sdhc_sd",
+			       "mali",
+			       "hdmi_tx_pixel",
+			       "vdin_meas",
+			       "pcm_sclk",
+			       "pcm_mclk",
+			       "eth_rx_tx",
+			       "pwm_d",
+			       "pwm_c",
+			       "pwm_b",
+			       "pwm_a",
+			       "pcm2_sclk",
+			       "ddr_dpll_pt",
+			       "pwm_f",
+			       "pwm_e",
+			       "hcodec",
+			       "usb_32k_alt",
+			       "gpio",
+			       "vid2_pll",
+			       "mipi_csi_cfg";
 	};
 
 	pinctrl_cbus: pinctrl@8030 {

-- 
2.42.0



