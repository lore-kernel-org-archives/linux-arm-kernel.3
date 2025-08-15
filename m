Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E0DACA0EE6
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Aug 2025 09:12:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XNOZP3ue1iO4sF3L+L+FCH9AYhA2iK+1RJeCUvnfwM0=; b=aYF9MvDzCLt28bZbDoq2BjZqy1
	JcVlOF0Br9vb5g2nCw/02Rd0er3hqBdlSNP3ltS3mIgvULQghKxWhVWb7BLp7R5Dml0vwgkY6EaAD
	hvy3qq0pjkd6V5K4D77TlO/kNlsOV71z+Y9cQ5Pf0JczN0qnAlB6loSDrDIK+OOJxBXg1jTMpGe3R
	GYW4sQJ5q4dnN6wRsVD44tpL5l/SPQlPrbr5NcUutWcsV2Rp2us187Rr/bIGTZMf2uSCUbUygSiy5
	kve16qwUqH4GeWVI8YGQu2tltkpVAsMcGLzAtAC5YCbj8+Cmhe5+n1zp8f75XtQIFmOAV3YGupmQL
	u3aqsVrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umqUM-000000020pw-01FH;
	Fri, 15 Aug 2025 09:12:42 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umpwb-00000001sX7-2h9e;
	Fri, 15 Aug 2025 08:37:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Reply-To:Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Content-ID:Content-Description;
	bh=XNOZP3ue1iO4sF3L+L+FCH9AYhA2iK+1RJeCUvnfwM0=; b=aex0oq5FtD/2E5ftNbZM9ViLnJ
	PK2Cm6Hj88YBURwQppnQ0uurzXorGf81zWNZ2+r0/q1X+J7Smc/jtwwUb3e/he0jgaFGaNzGAgV84
	CoyGC5/ECpzsFnH10rEeLPorUHtzHGp3gVQn/GMP+WU/o/BkW0iaPC7aeg680OXNQYuUtUrDTiynm
	TlfU6hqhipXmD/aWDRYISK4tzPjoOv9wTDA07VZWgCqotf58HPTzj10c56eaKEZMpLdywCjoMljMV
	6M+wxqR3y5h7c5xunMEqWEJ5MUuJx6PPAW/2lOu9rg4raVHEV+pCnmjJIbMfqHjaFFuvbqidJ6A3W
	r4mAKkuA==;
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umpwX-0000000Gf3L-48lh;
	Fri, 15 Aug 2025 08:37:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4B7A65C5647;
	Fri, 15 Aug 2025 08:37:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id CABBDC4CEF6;
	Fri, 15 Aug 2025 08:37:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755247061;
	bh=4rHg6PbdWwvxur/Olkz+xdYjJwYQBoyJ/1e2IHkd5pE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Wgc1fmb19fj3lQCMGOnIlqh3QPjPJZgQ/Z6wwON00Gqg9XuOaWpWSlliLXna9Lva1
	 g3ePc+uHRYHptqlixdU5BGggUfoxCcKij+4ZuaezTa07gWZueQOzQXRv1Le6O9AY8B
	 Z2U6Mhjm/9kln9P4uNX+c2lnpUll8k+jbzlsx317xzzUHbqni4oiuxTQbLPG4d44O6
	 PYQImwzrQgLmX/UYRnV8FPrWxo7n9yz3PsfLufxo8MoVn1Php965sb7s2MOZyOdx4k
	 H80uN58/dMwn0TuVBPsfgMUPYMxYjl9HrJKrakbW5M5OS9tRiuA2G+Tf2NkLFoRGmX
	 IEY/bhbRmXfdg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2171CA0EE8;
	Fri, 15 Aug 2025 08:37:41 +0000 (UTC)
From: Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org>
Date: Fri, 15 Aug 2025 16:37:39 +0800
Subject: [PATCH 13/13] arm64: dts: amlogic: S6: Add clk-measure controller
 node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250815-add-more-socs-to-support-clk_measure-v1-13-59f04ba67457@amlogic.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755247057; l=7872;
 i=chuan.liu@amlogic.com; s=20240902; h=from:subject:message-id;
 bh=JGpYLHPu4HOmr+mDeiIXrC30j92VsgQpCg8JGdcHu0A=;
 b=sylv3HjOSOUxRyDdjkKPtqnqECv24/9zfray8sW2hRkH8c0a6IDZlEJc8fXAJVqS7Ler1D147
 0DzlafTi20JCRcJxAJIEXrj2sQN9uc9o53uCfGf6MD/8chNiiW+Kzc3
X-Developer-Key: i=chuan.liu@amlogic.com; a=ed25519;
 pk=fnKDB+81SoWGKW2GJNFkKy/ULvsDmJZRGBE7pR5Xcpo=
X-Endpoint-Received: by B4 Relay for chuan.liu@amlogic.com/20240902 with
 auth_id=203
X-Original-From: Chuan Liu <chuan.liu@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250815_093746_650633_6952DCDF 
X-CRM114-Status: UNSURE (   7.72  )
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

Add the clk-measure controller node for S6 SoC family.

Signed-off-by: Chuan Liu <chuan.liu@amlogic.com>
---
 arch/arm64/boot/dts/amlogic/amlogic-s6.dtsi | 312 ++++++++++++++++++++++++++++
 1 file changed, 312 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-s6.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-s6.dtsi
index 5f602f1170c0..b8dbdad91d79 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-s6.dtsi
+++ b/arch/arm64/boot/dts/amlogic/amlogic-s6.dtsi
@@ -189,6 +189,318 @@ gpiocc: gpio@300 {
 					gpio-ranges = <&periphs_pinctrl 0 (AMLOGIC_GPIO_CC<<8) 2>;
 				};
 			};
+
+			clk_msr: clock-measure@48000 {
+				compatible = "amlogic,clk-measure";
+				reg = <0x0 0x48000 0x0 0x1c>;
+				clkmsr-reg-v2;
+				clkmsr-indices = <0>,
+						 <1>,
+						 <2>,
+						 <3>,
+						 <4>,
+						 <5>,
+						 <6>,
+						 <7>,
+						 <8>,
+						 <9>,
+						 <10>,
+						 <11>,
+						 <12>,
+						 <13>,
+						 <15>,
+						 <18>,
+						 <19>,
+						 <20>,
+						 <21>,
+						 <22>,
+						 <23>,
+						 <24>,
+						 <25>,
+						 <26>,
+						 <27>,
+						 <28>,
+						 <29>,
+						 <30>,
+						 <32>,
+						 <33>,
+						 <34>,
+						 <36>,
+						 <37>,
+						 <38>,
+						 <39>,
+						 <40>,
+						 <49>,
+						 <50>,
+						 <51>,
+						 <52>,
+						 <53>,
+						 <54>,
+						 <55>,
+						 <57>,
+						 <58>,
+						 <59>,
+						 <60>,
+						 <61>,
+						 <62>,
+						 <63>,
+						 <64>,
+						 <65>,
+						 <66>,
+						 <67>,
+						 <70>,
+						 <71>,
+						 <72>,
+						 <73>,
+						 <74>,
+						 <75>,
+						 <76>,
+						 <77>,
+						 <78>,
+						 <79>,
+						 <80>,
+						 <81>,
+						 <82>,
+						 <84>,
+						 <85>,
+						 <86>,
+						 <87>,
+						 <88>,
+						 <89>,
+						 <93>,
+						 <99>,
+						 <106>,
+						 <108>,
+						 <109>,
+						 <110>,
+						 <111>,
+						 <113>,
+						 <114>,
+						 <115>,
+						 <116>,
+						 <117>,
+						 <118>,
+						 <121>,
+						 <130>,
+						 <132>,
+						 <133>,
+						 <134>,
+						 <135>,
+						 <136>,
+						 <137>,
+						 <138>,
+						 <139>,
+						 <140>,
+						 <141>,
+						 <142>,
+						 <143>,
+						 <144>,
+						 <145>,
+						 <147>,
+						 <148>,
+						 <149>,
+						 <150>,
+						 <151>,
+						 <152>,
+						 <153>,
+						 <154>,
+						 <160>,
+						 <161>,
+						 <162>,
+						 <163>,
+						 <164>,
+						 <165>,
+						 <166>,
+						 <167>,
+						 <168>,
+						 <169>,
+						 <175>,
+						 <176>,
+						 <177>,
+						 <178>,
+						 <179>,
+						 <180>,
+						 <181>,
+						 <182>,
+						 <183>,
+						 <184>,
+						 <185>,
+						 <186>,
+						 <187>,
+						 <188>,
+						 <189>,
+						 <190>,
+						 <191>,
+						 <192>,
+						 <193>,
+						 <194>,
+						 <195>,
+						 <196>,
+						 <197>,
+						 <198>,
+						 <199>,
+						 <201>,
+						 <204>,
+						 <205>,
+						 <206>,
+						 <207>,
+						 <208>,
+						 <209>,
+						 <210>;
+				clkmsr-names = "sys_clk",
+					       "axi_clk",
+					       "rtc_clk",
+					       "dspa",
+					       "mali_stack",
+					       "mali",
+					       "cpu_clk_div16",
+					       "mali_aclkm",
+					       "cecb_clk",
+					       "gp2_pll",
+					       "fclk_div5",
+					       "p21_usb2_ckout",
+					       "p20_usb2_ckout",
+					       "eth_mpll_test",
+					       "fclk_50m",
+					       "gp1_pll",
+					       "hifi_pll",
+					       "gp0_pll",
+					       "hifi1_pll",
+					       "eth_fclk_50m_ckout",
+					       "sys_pll_div16",
+					       "ddr_dpll_pt_clk",
+					       "mod_Tsin_A_CLK_IN",
+					       "ext_Tsin_B_CLK_IN",
+					       "mod_Tsin_C_CLK_IN",
+					       "mod_Tsin_D_CLK_IN",
+					       "dsi_pll_div_clk_out",
+					       "dsi_pll_clk",
+					       "eth_125m",
+					       "eth_rmii",
+					       "co_clkin_to_mac",
+					       "co_rx_clk",
+					       "co_tx_clk",
+					       "eth_phy_rxclk",
+					       "eth_phy_plltxclk",
+					       "ephy_test_clk",
+					       "hdmi_vx1_pix_clk",
+					       "vid_pll_div_clk_out",
+					       "enci",
+					       "encp",
+					       "encl",
+					       "vdac",
+					       "cdac",
+					       "lcd_an_ph2",
+					       "lcd_an_ph3",
+					       "hdmitx_pixel",
+					       "vdin_meas",
+					       "vpu",
+					       "vpu_clkb",
+					       "vpu_clkb_tmp",
+					       "vpu_clkc",
+					       "vid_lock",
+					       "vapb",
+					       "ge2d",
+					       "dsi_meas",
+					       "dsi_phy",
+					       "csi_phy",
+					       "cts_csi2_adapt_clk",
+					       "cts_csi2_data ",
+					       "csi_phy_out",
+					       "hdmitx_tmds",
+					       "hdmitx_sys",
+					       "hdmitx_fe",
+					       "rama_clk",
+					       "hdmitx_prif",
+					       "hdmitx_200m",
+					       "hdmitx_aud",
+					       "audio_tohdmitx_mclk",
+					       "audio_tohdmitx_bclk",
+					       "audio_tohdmitx_lrclk",
+					       "audio_tohdmitx_spdif_clk",
+					       "htx_aes_clk",
+					       "amfc",
+					       "vdec",
+					       "hevcf",
+					       "deskew_pll_clk_div32_out",
+					       "cmpr",
+					       "dewarpa",
+					       "sc",
+					       "aux_adc_clk",
+					       "sd_emmc_c",
+					       "sd_emmc_b",
+					       "sd_emmc_a",
+					       "gpio_msr_clk",
+					       "aux_clk_o",
+					       "spicc",
+					       "ts",
+					       "o_vad_clk",
+					       "audio_locker_in_clk",
+					       "audio_locker_out_clk",
+					       "audio_tdmout_c_sclk",
+					       "audio_tdmout_b_sclk",
+					       "audio_tdmout_a_sclk",
+					       "audio_tdmin_lb_sclk",
+					       "audio_tdmin_c_sclk",
+					       "audio_tdmin_b_sclk",
+					       "audio_tdmin_a_sclk",
+					       "audio_resamplea_clk",
+					       "audio_pdm_sysclk",
+					       "audio_spdifout_b_mst_clk",
+					       "audio_spdifout_mst_clk",
+					       "audio_spdifin_mst_clk",
+					       "audio_resampleb_clk",
+					       "pcie_pipe_clk",
+					       "pcie_ref_clk",
+					       "pcie_upcrx_cdrclk",
+					       "pcie_upcrx_clk_sync_b20",
+					       "pcie_u3p2pll1_clk_div16",
+					       "pcie_u3p2pll0_clkout",
+					       "pcie_ref_clk_p",
+					       "pwm_j",
+					       "pwm_i",
+					       "pwm_h",
+					       "pwm_g",
+					       "pwm_f",
+					       "pwm_e",
+					       "pwm_d",
+					       "pwm_c",
+					       "pwm_b",
+					       "pwm_a",
+					       "rng_ring_clk[0]",
+					       "rng_ring_clk[1]",
+					       "rng_ring_clk[2]",
+					       "rng_ring_clk[3]",
+					       "rng_ring_clk[4]",
+					       "am_ring_osc_clk_out[0]",
+					       "am_ring_osc_clk_out[1]",
+					       "am_ring_osc_clk_out[2]",
+					       "am_ring_osc_clk_out[3]",
+					       "am_ring_osc_clk_out[4]",
+					       "am_ring_osc_clk_out[5]",
+					       "am_ring_osc_clk_out[6]",
+					       "am_ring_osc_clk_out[7]",
+					       "am_ring_osc_clk_out[8]",
+					       "am_ring_osc_clk_out[9]",
+					       "am_ring_osc_clk_out[10]",
+					       "am_ring_osc_clk_out[11]",
+					       "am_ring_osc_clk_out[12]",
+					       "am_ring_osc_clk_out[13]",
+					       "am_ring_osc_clk_out[14]",
+					       "am_ring_osc_clk_out[15]",
+					       "am_ring_osc_clk_out[16]",
+					       "nna_core",
+					       "vc9000e_aclk",
+					       "vc9000e_core",
+					       "pcie_tl",
+					       "u3p2pll1_clk_div16",
+					       "u3p2pll0_clkout",
+					       "upctx_clk_sync_b20",
+					       "upcrx_carclk",
+					       "usb_pipe_clk",
+					       "earcrx_pll_out",
+					       "mclk_pll";
+			};
 		};
 	};
 };

-- 
2.42.0



