Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37498CA0ED1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Aug 2025 09:15:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JBMndwK1FVVI0b1VMQMfFg6niL+1ySMeOUT/OJc/8VY=; b=WYebGe23ckROAdQ5fgT/mDh1+P
	nksRPg7/wux3H9HLEMp79ASXS3iKGxbeSterriqz8+NiYPd7uCIVWJSY/vQgQPA8D+LCJYhdTLGtL
	gkMd2UjGsvHax4cFUlHCkCmTdezdbRBSVBsrxsvPYOJGoTR/+IeYZb3WY5BpgEEkRrgBcKTUV4uFP
	CaCGwrfI3vi1gTBq78s8Fzc0JpvTzos89m1hYT90nXUR9+I0G0TbTSjQDoRuQPX7Mc1SicEec3Twq
	Gyk2UHioBh7feylW3ln0FvTs2oGTem0WfLxQFjkI61yhkl4i61WySQD9yXEzo27f4kiwwuZZ9+4a4
	twaN9xlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umqWx-000000021Qk-3Fvd;
	Fri, 15 Aug 2025 09:15:23 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umpwb-00000001sX8-2h9A;
	Fri, 15 Aug 2025 08:37:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Reply-To:Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Content-ID:Content-Description;
	bh=JBMndwK1FVVI0b1VMQMfFg6niL+1ySMeOUT/OJc/8VY=; b=WXYKel7ZXbKT2d7ZQ7vQ0lMl85
	UgUkzkdgCi03g9GJ68VlKso/UmZ9NfexTQCmyUe11ufzUHQHya0G1vcZKGDOtBdbBL+TaCcAPrBjx
	VItX9WvxSl2x+57AAxzrnowRw4HZ3wzqrnbC4D3EPgY56xYHX5YzAsRZXG2mKg43qXsGKiHljKwmz
	/bN97siXMh/bmwW6bugfyZ5SGTuK1smMASVCdjahStnMT00iGucsEcrxuderVMnKKiYFVnSLUg58B
	t4MV62d2rh1tUQrOkQlK8krPsn/Io6uD8bH1YDuGXCMtra1FnCXYchCKV/w+zrdXhXOFgtIn/H41S
	HlKHvkIg==;
Received: from sea.source.kernel.org ([172.234.252.31])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umpwY-0000000Gf3M-0PAt;
	Fri, 15 Aug 2025 08:37:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id EB6D946326;
	Fri, 15 Aug 2025 08:37:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B86A1C4CEFF;
	Fri, 15 Aug 2025 08:37:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755247061;
	bh=w8PuFRxUJIBQ12aPBQSflZiYsOlXd4t/Q+krqWmUilk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=dRUY8i29gNTXApnwckckf+KVaTC7DU0W4GIErzmztOCaNWpMYTjDnYuofJzyP5XvM
	 wxCxRcsbCjPEJanHGlnuZK5TD8LOoADszZghp6P8nOqdOisjQczwSWdenGqK7Jv389
	 uB5cx3uHRygcoxSki7O4Ad5hg21HBrGXLAwkn2ib8lzv4gK0JPPXXh/UMK1p7HLE9A
	 rXAv/k9EtD/jw8WW3ZO7eDryAlEoQjCLyTeJIs8odJie46KYlh5ubMND2p9GWs2hAq
	 722cqAz0JU/GOczofhZi2SCzsMnnfqjU6fEtfM0EyHoLravbppeWr3p56qmueD+RP3
	 8IY7yqJNuwGeA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A99C8CA0EE9;
	Fri, 15 Aug 2025 08:37:41 +0000 (UTC)
From: Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org>
Date: Fri, 15 Aug 2025 16:37:37 +0800
Subject: [PATCH 11/13] arm64: dts: amlogic: S7: Add clk-measure controller
 node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250815-add-more-socs-to-support-clk_measure-v1-11-59f04ba67457@amlogic.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755247057; l=6696;
 i=chuan.liu@amlogic.com; s=20240902; h=from:subject:message-id;
 bh=PoSXtN4p9w7+3ZDjnmmafQk3tbymutEzrxBWWPNf4KQ=;
 b=BFSveRD3UTKVYfTKrMSrEV9ZMwR8xJv08Vqf3Za4QljmCsTJEo63bA1428WunmBhvVHzAYkBq
 r63tG7I+Zo5C5WaXthTNqXqXvDcTQja4pF5t4oZF8mHeoe6QrFIRPoV
X-Developer-Key: i=chuan.liu@amlogic.com; a=ed25519;
 pk=fnKDB+81SoWGKW2GJNFkKy/ULvsDmJZRGBE7pR5Xcpo=
X-Endpoint-Received: by B4 Relay for chuan.liu@amlogic.com/20240902 with
 auth_id=203
X-Original-From: Chuan Liu <chuan.liu@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250815_093746_665396_A7A64D59 
X-CRM114-Status: UNSURE (   7.45  )
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

Add the clk-measure controller node for S7 SoC family.

Signed-off-by: Chuan Liu <chuan.liu@amlogic.com>
---
 arch/arm64/boot/dts/amlogic/amlogic-s7.dtsi | 253 ++++++++++++++++++++++++++++
 1 file changed, 253 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-s7.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-s7.dtsi
index 260918b37b9a..f6b2dae3db39 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-s7.dtsi
+++ b/arch/arm64/boot/dts/amlogic/amlogic-s7.dtsi
@@ -175,6 +175,259 @@ gpiocc: gpio@300 {
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
+						 <5>,
+						 <6>,
+						 <8>,
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
+						 <93>,
+						 <99>,
+						 <106>,
+						 <110>,
+						 <111>,
+						 <113>,
+						 <114>,
+						 <115>,
+						 <116>,
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
+					       "mali",
+					       "cpu_clk_div16",
+					       "cecb_clk",
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
+					       "vdec",
+					       "hevcf",
+					       "deskew_pll_clk_div32_out",
+					       "sc",
+					       "saradc",
+					       "sd_emmc_c",
+					       "sd_emmc_b",
+					       "sd_emmc_a",
+					       "gpio_msr_clk",
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
+					       "osc_ring_clk[0](a55 core0 14_slvt)",
+					       "osc_ring_clk[1](a55 core1 14_slvt)",
+					       "osc_ring_clk[2](a55 core2 14_slvt)",
+					       "osc_ring_clk[3](a55 core3 14_slvt)",
+					       "osc_ring_clk[4](a55_pwr[0] 16_slvt)",
+					       "osc_ring_clk[5](a55_pwr[1] 14_lvt)",
+					       "osc_ring_clk[6](a55_pwr[2] 14_rvt)",
+					       "osc_ring_clk[7](mali[0] 14_lvt)",
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



