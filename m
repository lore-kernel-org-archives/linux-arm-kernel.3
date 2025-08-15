Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FF1FCA0EE6
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Aug 2025 09:02:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ro7zx1/RvME+elOh5gYkX8JEniZhFIhC8NREx8DDFh0=; b=Zz16NYyrTe28ZSd81k/uts8KPl
	J1qqNUrJ6R4KeOT1ix6DsxF5utT7Awp65tgEySaEke7gEq08YcSxtwVCBLKcDqMZz/VMfuLWpxM61
	kiA9zTtN+QAGGQriqPeeIXYl0xU+S4Taz5h/HR3DCAcJBbysEkWmjFyDVntnSxbmBE9JPOiXgNbk1
	yNxg0axNPGwnLwmSXuL6OWv1edXHrCvdC8+pG/yZrF214RsMJ2XcL9shtIJpg0E9+71ckTnJt3jYf
	X/3e2X5E+8VKoLEvv7iRnpekwtmOJuwVYx5T6MIm+fZZVFyxKP8YVWc3KrCLgnttTEkratj+0auj+
	89dcl2Ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umqJu-00000001y9u-2FmC;
	Fri, 15 Aug 2025 09:01:54 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umpwV-00000001sUP-2xSG;
	Fri, 15 Aug 2025 08:37:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id ED75446327;
	Fri, 15 Aug 2025 08:37:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A4698C19425;
	Fri, 15 Aug 2025 08:37:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755247061;
	bh=ZE9QZXldOA2fAz/Jp9Rj+ACinn8pv88gC+RHGtrNOgc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=LipGcAHL3pQsOu63SdsbGhO2+N7EYeC/+86EeZeB+5r/wZ7TOg0/4CgAlpvEz179d
	 vBPCZo3SASzYwoK7tDFYoY5zdU+7dJtEOyDZ1ETvlgAQbpu14ica2cJcfDp2kgDQFB
	 jBxOzRY4PoV/zEb5oeCJGSSP4cNzIQ2O4sQJvHPqAXKfVvAqzjqKsP71IJsEBBYVWZ
	 /2STKpZvH5d0KB6xJPLkktJhxNTJE09R99Rm5F1+yciB1qzEcFkLKFWPz4M0V74KFx
	 H7R0ubFpMu7uhpkyhwjPgeRop8NgAQhwFihR/nuRFar3FYWhvOXAtx7Nb6v4hUaTT8
	 C22WH8yxA8mDQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D05ACA0EE4;
	Fri, 15 Aug 2025 08:37:41 +0000 (UTC)
From: Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org>
Date: Fri, 15 Aug 2025 16:37:36 +0800
Subject: [PATCH 10/13] arm64: dts: amlogic: A5: Add clk-measure controller
 node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250815-add-more-socs-to-support-clk_measure-v1-10-59f04ba67457@amlogic.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755247057; l=4959;
 i=chuan.liu@amlogic.com; s=20240902; h=from:subject:message-id;
 bh=+rNhxW5k+895xe8+dWTUbJTXjfJCo6DlrCn7/3Oc7eA=;
 b=3tf/QeTEs7Rnm4u+NO5CEpipA5qttEyM8fZzYxsaHoHpoc3j5zJngsaeFQ1MMnMExrV39Nl42
 14hJ8lqPF7EAXLtsjOXo9FZcfejmRqiZ9OFyOVq720u1UY8dTS0yGxW
X-Developer-Key: i=chuan.liu@amlogic.com; a=ed25519;
 pk=fnKDB+81SoWGKW2GJNFkKy/ULvsDmJZRGBE7pR5Xcpo=
X-Endpoint-Received: by B4 Relay for chuan.liu@amlogic.com/20240902 with
 auth_id=203
X-Original-From: Chuan Liu <chuan.liu@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250815_013743_813525_F6359967 
X-CRM114-Status: UNSURE (   7.34  )
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

Add the clk-measure controller node for A5 SoC family.

Signed-off-by: Chuan Liu <chuan.liu@amlogic.com>
---
 arch/arm64/boot/dts/amlogic/amlogic-a5.dtsi | 202 ++++++++++++++++++++++++++++
 1 file changed, 202 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-a5.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-a5.dtsi
index b1da8cbaa25a..4db3ff4a0522 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-a5.dtsi
+++ b/arch/arm64/boot/dts/amlogic/amlogic-a5.dtsi
@@ -67,4 +67,206 @@ gpio_intc: interrupt-controller@4080 {
 		amlogic,channel-interrupts =
 			<10 11 12 13 14 15 16 17 18 19 20 21>;
 	};
+
+	clk_msr: clock-measure@48000 {
+		compatible = "amlogic,clk-measure";
+		reg = <0x0 0x48000 0x0 0x1c>;
+		clkmsr-reg-v2;
+		clkmsr-indices = <0>,
+				 <1>,
+				 <2>,
+				 <3>,
+				 <6>,
+				 <10>,
+				 <11>,
+				 <12>,
+				 <13>,
+				 <14>,
+				 <15>,
+				 <16>,
+				 <17>,
+				 <18>,
+				 <19>,
+				 <20>,
+				 <21>,
+				 <23>,
+				 <24>,
+				 <25>,
+				 <26>,
+				 <27>,
+				 <28>,
+				 <30>,
+				 <31>,
+				 <35>,
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
+				 <186>,
+				 <187>,
+				 <188>,
+				 <189>;
+		clkmsr-names = "sys_clk",
+			       "axi_clk",
+			       "rtc_clk",
+			       "dspa",
+			       "cpu_clk_div16",
+			       "fclk_div5",
+			       "mpll0",
+			       "mpll1",
+			       "mpll2",
+			       "mpll3",
+			       "fclk_50m",
+			       "sys_oscin32k_i",
+			       "rtc_pll",
+			       "mpll_clk_test_out",
+			       "hifi_pll",
+			       "gp0_pll",
+			       "gp1_pll",
+			       "sys_pll_div16",
+			       "ddr_dpll_pt_clk",
+			       "nna_axi",
+			       "nna_core",
+			       "rtc_sec_pulse_out",
+			       "rtc_osc_clk_out",
+			       "mod_eth_phy_ref_clk",
+			       "mod_eth_tx_clk",
+			       "mod_eth_rx_clk_rmii",
+			       "rama_clk",
+			       "deskew_pll_clk_div32_out",
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
+			       "earctx_dmdc_clk",
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
+			       "dmc_osc_ring(LVT16)",
+			       "dsp_osc_ring(SVT16)",
+			       "axi_srama_osc_ring(SVT16)",
+			       "nna_osc_ring[0](ULVT20)",
+			       "nna_osc_ring[1](LVT16)",
+			       "sys_cpu_osc_ring[0](ULVT16)",
+			       "sys_cpu_osc_ring[1](ULVT20)",
+			       "sys_cpu_osc_ring[2](ULVT16)",
+			       "sys_cpu_osc_ring[3](LVT16)",
+			       "axi_sramb_osc_ring(SVT16)";
+	};
 };

-- 
2.42.0



