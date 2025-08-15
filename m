Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7572CA0EE9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Aug 2025 08:43:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D00m2/0miWeBX3BsT3zYJFbYBJrSAPQvjnRSG84ur2A=; b=eH0qfXokdwkXBrg6k5uuIf5Wgp
	r/T5tTKexVmnVjiuIbc2Ond7YTHjgalUs+jRmO6+YolrgZ9CwOgvIGWD7G4ASHBjE6uHsf/+91J3U
	noqbiIXlb6usDAFw8rsMEQuLDRVZk0c0Gfrv1AIWcRO04acesZ3gWVmxavrLCD7mneV2ecTHKcLFU
	zSV9R/Co2zEdWfpCeqom3TdzPVZJjGQgkBhDIxKEhkVbfUCGLmubP7LeJeNvzmprw1aNMC8YuKaak
	aDcaEZ6njGqLSmlpgM9eCK2wvdrChZmXIlDhT1yGqX5aoTmjEuTtIrb5pi7Tkr3rSwA10Tfvst7KJ
	6n7L7fmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umq1i-00000001tT7-1DzM;
	Fri, 15 Aug 2025 08:43:06 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umpwU-00000001sSJ-1P1e;
	Fri, 15 Aug 2025 08:37:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D84AB4631E;
	Fri, 15 Aug 2025 08:37:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 982DDC19424;
	Fri, 15 Aug 2025 08:37:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755247061;
	bh=VFGd5hRIkRHvzlQy80MpxiKKkC07jgnJaMdRjA7K6w4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=GG1Ie9jTwDKhOS4SsBEhMfLscvhIJRDyDLL6yAHAg45liuMjDsPHKalqlOBylHAGv
	 r5pVn3ok9JF5z0OhCQ2i/ZNScsvTne7c2xkZAhy8hhqxQV5no3xjcE+EF4zF/pTxmP
	 mBrxyRmMshfFpROvSNZ/gmNNlezod3xJcpHxdD+MSoh/BoDTYy1C8/Ysw8/RkPtWq8
	 p/7+YN8f78/sCrsMJWZ3g6hv+9FbpjNfXtpfazTVt8uZSgCDHvKtHjuAAAyEb+GzWw
	 4/Mqb3/zgXGt51FjmJ0ADIfuOrKUlbn9vpmbAVdB55BOtfUV6j8r25xrbLTOCniBI0
	 a497iJbNsG7KA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9196DCA0EE8;
	Fri, 15 Aug 2025 08:37:41 +0000 (UTC)
From: Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org>
Date: Fri, 15 Aug 2025 16:37:35 +0800
Subject: [PATCH 09/13] arm64: dts: amlogic: A4: Add clk-measure controller
 node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250815-add-more-socs-to-support-clk_measure-v1-9-59f04ba67457@amlogic.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755247057; l=5269;
 i=chuan.liu@amlogic.com; s=20240902; h=from:subject:message-id;
 bh=X0XY9aZjdMBy/BejERaULKB1+6dEiqZglq+Tq7M/WTk=;
 b=r7nrSwjawPgfJtx0VHM0LteREbh/rLUqECbuzDuRObH93zlbrdxKoHYaVrS33WF3uPmy86T+3
 tAQjLfMTPz9CuYpGDyRCoMp91fHSeBCv0ATINdpo3wpoBmJQBrSvH5m
X-Developer-Key: i=chuan.liu@amlogic.com; a=ed25519;
 pk=fnKDB+81SoWGKW2GJNFkKy/ULvsDmJZRGBE7pR5Xcpo=
X-Endpoint-Received: by B4 Relay for chuan.liu@amlogic.com/20240902 with
 auth_id=203
X-Original-From: Chuan Liu <chuan.liu@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250815_013742_422147_FB697457 
X-CRM114-Status: UNSURE (   7.50  )
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

Add the clk-measure controller node for A4 SoC family.

Signed-off-by: Chuan Liu <chuan.liu@amlogic.com>
---
 arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi | 212 ++++++++++++++++++++++++++++
 1 file changed, 212 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi
index 563bc2e662fa..471a4bd24bfb 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi
+++ b/arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi
@@ -170,6 +170,218 @@ gpio_intc: interrupt-controller@4080 {
 			<10 11 12 13 14 15 16 17 18 19 20 21>;
 	};
 
+	clk_msr: clock-measure@48000 {
+		compatible = "amlogic,clk-measure";
+		reg = <0x0 0x48000 0x0 0x1c>;
+		clkmsr-reg-v2;
+		clkmsr-indices = <0>,
+				 <1>,
+				 <2>,
+				 <3>,
+				 <4>,
+				 <5>,
+				 <6>,
+				 <8>,
+				 <10>,
+				 <15>,
+				 <16>,
+				 <17>,
+				 <19>,
+				 <20>,
+				 <21>,
+				 <22>,
+				 <23>,
+				 <24>,
+				 <27>,
+				 <28>,
+				 <30>,
+				 <31>,
+				 <32>,
+				 <33>,
+				 <34>,
+				 <35>,
+				 <36>,
+				 <37>,
+				 <38>,
+				 <39>,
+				 <40>,
+				 <41>,
+				 <51>,
+				 <52>,
+				 <79>,
+				 <106>,
+				 <111>,
+				 <112>,
+				 <113>,
+				 <115>,
+				 <116>,
+				 <117>,
+				 <118>,
+				 <119>,
+				 <120>,
+				 <121>,
+				 <122>,
+				 <123>,
+				 <124>,
+				 <125>,
+				 <126>,
+				 <127>,
+				 <128>,
+				 <129>,
+				 <130>,
+				 <131>,
+				 <132>,
+				 <133>,
+				 <134>,
+				 <135>,
+				 <136>,
+				 <137>,
+				 <138>,
+				 <139>,
+				 <140>,
+				 <141>,
+				 <142>,
+				 <143>,
+				 <144>,
+				 <145>,
+				 <146>,
+				 <147>,
+				 <148>,
+				 <149>,
+				 <150>,
+				 <151>,
+				 <152>,
+				 <153>,
+				 <154>,
+				 <155>,
+				 <156>,
+				 <157>,
+				 <158>,
+				 <159>,
+				 <162>,
+				 <163>,
+				 <164>,
+				 <165>,
+				 <166>,
+				 <167>,
+				 <168>,
+				 <169>,
+				 <176>,
+				 <177>,
+				 <178>,
+				 <179>,
+				 <180>,
+				 <181>,
+				 <182>,
+				 <183>,
+				 <184>,
+				 <185>,
+				 <186>;
+		clkmsr-names = "sys_clk",
+			       "axi_clk",
+			       "rtc_clk",
+			       "p22_usb2_ckout",
+			       "p21_usb2_ckout",
+			       "p20_usb2_ckout",
+			       "cpu_clk_div16",
+			       "eth_mpll_test",
+			       "fclk_div5",
+			       "fclk_50m",
+			       "sys_oscin32k_i",
+			       "rtc_pll",
+			       "hifi_pll",
+			       "gp0_pll",
+			       "gp1_pll",
+			       "eth_fclk_50m_clkout",
+			       "sys_pll_div16",
+			       "ddr_dpll_pt_clk",
+			       "rtc_sec_pulse_out",
+			       "rtc_osc_clk_out",
+			       "mod_eth_phy_ref_clk",
+			       "mod_eth_tx_clk",
+			       "eth_125m",
+			       "eth_rmii",
+			       "co_clkin_to_mac",
+			       "mod_eth_rx_clk_rmii",
+			       "co_rx_clk",
+			       "co_tx_clk",
+			       "eth_phy_rxclk",
+			       "eth_phy_plltxclk",
+			       "ephy_test_clk",
+			       "audio_core_clk",
+			       "vout_venc_clk_ph",
+			       "vout_venc_clk",
+			       "rama_clk",
+			       "deskew_pll_test_clk",
+			       "saradc",
+			       "ts",
+			       "sd_emmc_c",
+			       "sd_emmc_a",
+			       "gpio_msr_clk",
+			       "spicc_1",
+			       "spicc_0",
+			       "o_mst_sclk_vad",
+			       "o_mst_mclk_vad",
+			       "o_pdm_sysclk",
+			       "mod_audio_pdm_dclk_o",
+			       "o_vad_clk",
+			       "earcrx_dmac_clk",
+			       "earcrx_cmdc_clk",
+			       "earctx_dmac_clk",
+			       "earctx_cmdc_clk",
+			       "tohdmitx_bclk",
+			       "tohdmitx_mclk",
+			       "tohdmitx_spdif_clk",
+			       "toacodec_bclk",
+			       "toacodec_mclk",
+			       "spdifout_b_mst_clk",
+			       "spdifout_mst_clk",
+			       "spdifin_mst_clk",
+			       "audio_mclk",
+			       "vad_clk",
+			       "tdmout_d_sclk",
+			       "tdmout_c_sclk",
+			       "tdmout_b_sclk",
+			       "tdmout_a_sclk",
+			       "tdminb_lb_sclk",
+			       "tdmin_lb_sclk",
+			       "tdmin_d_sclk",
+			       "tdmin_c_sclk",
+			       "tdmin_b_sclk",
+			       "tdmin_a_sclk",
+			       "resampleb_clk",
+			       "resamplea_clk",
+			       "pdmb_sysclk",
+			       "pdmb_dclk",
+			       "pdm_sysclk",
+			       "pdm_dclk",
+			       "alockerb_out_clk",
+			       "alockerb_in_clk",
+			       "alocker_out_clk",
+			       "alocker_in_clk",
+			       "audio_mst_clk[34]",
+			       "audio_mst_clk[35]",
+			       "pwm_h",
+			       "pwm_g",
+			       "pwm_f",
+			       "pwm_e",
+			       "pwm_d",
+			       "pwm_c",
+			       "pwm_b",
+			       "pwm_a",
+			       "rng_ring_osc_clk[0]",
+			       "rng_ring_osc_clk[1]",
+			       "rng_ring_osc_clk[2]",
+			       "rng_ring_osc_clk[3]",
+			       "sys_cpu_osc_ring[0](ULVT16)",
+			       "sys_cpu_osc_ring[1](ULVT20)",
+			       "sys_cpu_osc_ring[2](ULVT16)",
+			       "sys_cpu_osc_ring[3](ULVT16)",
+			       "sys_cpu_osc_ring[4](ULVT16)",
+			       "am_ring_osc_clk_out_top[0](SVT16)",
+			       "am_ring_osc_clk_out_top[1](LVT20)";
+	};
+
 	ao_pinctrl: pinctrl@8e700 {
 		compatible = "amlogic,pinctrl-a4";
 		#address-cells = <2>;

-- 
2.42.0



