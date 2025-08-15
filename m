Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3DEDCA0EE9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Aug 2025 09:04:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YY5Dx0L9OQ4na5C4qwf0Epa1IciyjlmeRAFoxxHamSI=; b=SzIfAnhAUP6XqXrSvkEjRGlwIC
	+gcd8o1PwxrO5xYU0ztzvpgliQ8A7soHDgRJlzT8aiuHU7EvMZU8Nz6OCq3HUSBSIUwljyxZpXull
	6V3PrRAVBtz4Pt+Y3WQosFcNgeKHdxUsiZPkI79AaTzpqqzPQYtEyGBX0ffWbdy+ZcGXWlqHLMvXD
	WU5wEQJlwOipEtK052V2HszfBxzEMYSFhFbllCZjunMSMBsGoJFZR43g78sSchcotcYeAduO4o3WJ
	VgX0HqUtyOA8mLneATVZE4tIrz23xmyBAU08ZwqJ7/crob7q8XNaSQKVgXbLSjBDQzViQni57vhHq
	vladtwPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umqMV-00000001yoA-2t1J;
	Fri, 15 Aug 2025 09:04:35 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umpwW-00000001sUp-0STg;
	Fri, 15 Aug 2025 08:37:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0057F4632D;
	Fri, 15 Aug 2025 08:37:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id BDD5FC4CEEB;
	Fri, 15 Aug 2025 08:37:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755247061;
	bh=zHm9FDgn4q6/xxPLyj5fLKXqr5ss/Uk6/ql8RR2vJxs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=nCaoseksLGQ42FqntIfyukpMp95F70Ks6gg2tVLDjMTkEVkQZH8XB6WC0F7vu4xQY
	 yf7VtUDeHLLTsRXI0o64ERlcAf9401Az7G9MT+sjuJr0IuF96r9DoD21yafnQ2URSy
	 EoVy6I22o6dkyAUjnQ7/PspAf8JWcF/RZyd0+/dTtJ47egh7SvL7Eu+1p+RtUyDM+U
	 e7zFfbhQsZXK4YuzVM7IT3buzBb6Kcr3uPlJJ3e2SD6S9EZrrJtTdnq04HUp66Giyg
	 Ju6Tv39tv8rd22WDhCVoA6Kzx7zQ+xwi6XsndPb/FbVzNA3aPI2NiDA2iKUFm1X+3M
	 r0yvwYP8RSXeg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B62ACCA0EE6;
	Fri, 15 Aug 2025 08:37:41 +0000 (UTC)
From: Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org>
Date: Fri, 15 Aug 2025 16:37:38 +0800
Subject: [PATCH 12/13] arm64: dts: amlogic: S7D: Add clk-measure controller
 node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250815-add-more-socs-to-support-clk_measure-v1-12-59f04ba67457@amlogic.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755247057; l=6399;
 i=chuan.liu@amlogic.com; s=20240902; h=from:subject:message-id;
 bh=Vv1XnmhYWT2bsyKCicoFjDp0lmFh6QrlHLuGDXvx8XI=;
 b=JVTdbUXHo0i01T7e5acBX+rmguv7bUz3qeR6KpGdWPBzXBe3X/bijI6wn2BQ9RWIn0aNIWQ2k
 QM94obZUizJAf1UnQX/YGPACOeLuWpyCOAz0W/BHKhxynCqIWbPWxol
X-Developer-Key: i=chuan.liu@amlogic.com; a=ed25519;
 pk=fnKDB+81SoWGKW2GJNFkKy/ULvsDmJZRGBE7pR5Xcpo=
X-Endpoint-Received: by B4 Relay for chuan.liu@amlogic.com/20240902 with
 auth_id=203
X-Original-From: Chuan Liu <chuan.liu@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250815_013744_228640_163327DB 
X-CRM114-Status: UNSURE (   7.51  )
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

Add the clk-measure controller node for S7D SoC family.

Signed-off-by: Chuan Liu <chuan.liu@amlogic.com>
---
 arch/arm64/boot/dts/amlogic/amlogic-s7d.dtsi | 243 +++++++++++++++++++++++++++
 1 file changed, 243 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-s7d.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-s7d.dtsi
index c4d260d5bb58..a958cde53fa1 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-s7d.dtsi
+++ b/arch/arm64/boot/dts/amlogic/amlogic-s7d.dtsi
@@ -184,6 +184,249 @@ gpiocc: gpio@300 {
 					gpio-ranges = <&periphs_pinctrl 0 (AMLOGIC_GPIO_CC<<8) 2>;
 				};
 			};
+			clk_msr: clock-measure@48000 {
+				compatible = "amlogic,clk-measure";
+				reg = <0x0 0x48000 0x0 0x1c>;
+				clkmsr-reg-v2;
+				clkmsr-indices = <0>,
+						 <1>,
+						 <2>,
+						 <4>,
+						 <5>,
+						 <6>,
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
+						 <31>,
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
+						 <76>,
+						 <77>,
+						 <78>,
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
+						 <97>,
+						 <99>,
+						 <106>,
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
+						 <131>,
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
+						 <146>,
+						 <147>,
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
+						 <192>;
+				clkmsr-names = "sys_clk",
+					       "axi_clk",
+					       "rtc_clk",
+					       "mali_stack",
+					       "mali",
+					       "cpu_clk_div16",
+					       "cecb_clk",
+					       "mali_aclkm",
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
+					       "mod_Tsin_B_CLK_IN",
+					       "earcrx_pll_clk_out",
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
+					       "hdmitx_tmds",
+					       "hdmitx_sys",
+					       "hdmitx_fe",
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
+					       "hcodec",
+					       "hevcf",
+					       "deskew_pll_clk_div32_out",
+					       "sc",
+					       "saradc",
+					       "sd_emmc_c",
+					       "sd_emmc_b",
+					       "sd_emmc_a",
+					       "gpio_msr_clk",
+					       "aux_clk_o",
+					       "spicc",
+					       "ts",
+					       "o_vad_clk",
+					       "au_dac_clk_x128",
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
+					       "mod_audio_pdm_dclk_o",
+					       "audio_resampleb_clk",
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
+					       "osc_ring_clk[0](a55 core0 14_slvt)",
+					       "osc_ring_clk[1](a55 core1 14_slvt)",
+					       "osc_ring_clk[2](a55 core1 14_slvt)",
+					       "osc_ring_clk[3](a55 core1 14_slvt)",
+					       "osc_ring_clk[4](a55_pwr[0] 16_slvt)",
+					       "osc_ring_clk[5](a55_pwr[1] 14_lvt)",
+					       "osc_ring_clk[6](a55_pwr[2] 14_rvt)",
+					       "osc_ring_clk[7](mali[1] 14_lvt)",
+					       "osc_ring_clk[8](mali[1] 14_rvt)",
+					       "osc_ring_clk[9](dos[0] 16_lvt)",
+					       "osc_ring_clk[10](dos[1] 14_rvt)",
+					       "osc_ring_clk[11](ddr[0] 9t_14_lvt)",
+					       "osc_ring_clk[12](top[0] 16_rvt)";
+			};
 		};
 	};
 };

-- 
2.42.0



