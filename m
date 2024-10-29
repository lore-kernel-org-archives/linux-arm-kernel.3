Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A19DDD5B845
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Oct 2024 00:23:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pa7F/vUvrn4cS13peqpoEOrrLHgGBeJ8P7o1ocNJ7DE=; b=B1NalEo4oxsyeSjkHGJbdAKJdH
	KvOc32ZwvTpgM5fdHFtF/NRFUwuZGHxgVOq68umagzlQ+8h+1ituSm1BNhYuZFfQuWxOsBBbsZxBk
	+6pdNEZw+wjikGXWasio8ps4spPigEkr/G6RPZon8jgx0B8jTLAIzVCLUtNL99i0119xun8l6DlAJ
	difxk5d9VZ+saDHG1v3EET2ks/pAy0JjsjqhDeTcxKGlSNWJEjkPqQaQCabkRVw5flyow6SayqFmS
	VzIKTr6Eki8kOacQSSuDMofF2zkUIAMb8CEP4bvQ3zoARmrp43CcBe4yLP9JPNalCoXkK/kh9+on2
	WfF8vzOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5a16-0000000CjxO-3PTa;
	Tue, 29 Oct 2024 00:23:24 +0000
Received: from mail11.truemail.it ([217.194.8.81])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5ZzS-0000000CjcD-2lLd
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Oct 2024 00:21:45 +0000
Received: from francesco-nb (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 2E4951FB51;
	Tue, 29 Oct 2024 01:21:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1730161295;
	bh=pa7F/vUvrn4cS13peqpoEOrrLHgGBeJ8P7o1ocNJ7DE=; h=From:To:Subject;
	b=jCgcceB5HSLOBpEBB7R/TjUpQ1RpZeVNeJXKsVFTtzFcoLi6FUxcDKEJ9kf7S7MWX
	 8y66rOLrTNaS359sWo6MvBDcTbM+8NBKb3y45GYgvQJ1BXb+dwNBtXDMTMO2FKGTvw
	 tyj17FT6M0pRralD89hYsxNTZkP2amGmaOAgOGqAfi0X6sNIbv88ET+dNd8T5vXstf
	 0riM9j1aQ8LVQmmdEQHDZYE/ay0Cl7GEWUcDIUu1kHgaCWk5+Hx0vAOaP7SQJisWMR
	 H58MR7b/mtMh37rN2o678RHEebdqRtfuKIDxuGe/ngspeKxJI+yhbyp/cGYiNFjEtO
	 c1C9diqdVU3lw==
Date: Tue, 29 Oct 2024 01:21:31 +0100
From: Francesco Dolcini <francesco@dolcini.it>
To: Frank Li <Frank.Li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	"open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>,
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/1] arm64: dts: imx8qm-mek: add audio-codec cs42888 and
 related nodes
Message-ID: <20241029002131.GA10307@francesco-nb>
References: <20241028220318.2047870-1-Frank.Li@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241028220318.2047870-1-Frank.Li@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_172143_628586_6C910CB1 
X-CRM114-Status: GOOD (  13.05  )
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

Hello Frank,

On Mon, Oct 28, 2024 at 06:03:18PM -0400, Frank Li wrote:
> Add audio-codec cs42888, enable esai0 and asrc0.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  arch/arm64/boot/dts/freescale/imx8qm-mek.dts | 82 ++++++++++++++++++++
>  1 file changed, 82 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/freescale/imx8qm-mek.dts b/arch/arm64/boot/dts/freescale/imx8qm-mek.dts
> index e983633a4bb31..31cf02275ca9e 100644
> --- a/arch/arm64/boot/dts/freescale/imx8qm-mek.dts
> +++ b/arch/arm64/boot/dts/freescale/imx8qm-mek.dts
> @@ -134,6 +134,13 @@ reg_usdhc2_vmmc: usdhc2-vmmc {
>  		enable-active-high;
>  	};
>  
> +	reg_audio: regulator-audio {
> +		compatible = "regulator-fixed";
> +		regulator-name = "cs42888_supply";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +	};
> +
>  	reg_fec2_supply: regulator-fec2-nvcc {
>  		compatible = "regulator-fixed";
>  		regulator-name = "fec2_nvcc";
> @@ -223,6 +230,27 @@ simple-audio-card,codec {
>  		};
>  	};
>  
> +	sound-cs42888 {
> +		compatible = "fsl,imx-audio-cs42888";
> +		model = "imx-cs42888";
> +		audio-cpu = <&esai0>;
> +		audio-codec = <&cs42888>;
> +		audio-asrc = <&asrc0>;
> +		audio-routing = "Line Out Jack", "AOUT1L",
> +				"Line Out Jack", "AOUT1R",
> +				"Line Out Jack", "AOUT2L",
> +				"Line Out Jack", "AOUT2R",
> +				"Line Out Jack", "AOUT3L",
> +				"Line Out Jack", "AOUT3R",
> +				"Line Out Jack", "AOUT4L",
> +				"Line Out Jack", "AOUT4R",
> +				"AIN1L", "Line In Jack",
> +				"AIN1R", "Line In Jack",
> +				"AIN2L", "Line In Jack",
> +				"AIN2R", "Line In Jack";
> +		status = "okay";
remove status=okay, not needed

> +	};
> +
>  	sound-wm8960 {
>  		compatible = "fsl,imx-audio-wm8960";
>  		model = "wm8960-audio";
> @@ -301,12 +329,45 @@ pca6416: gpio@20 {
>  		gpio-controller;
>  		#gpio-cells = <2>;
>  	};
> +
> +	cs42888: audio-codec@48 {
> +		compatible = "cirrus,cs42888";
> +		reg = <0x48>;
> +		clocks = <&mclkout0_lpcg IMX_LPCG_CLK_0>;
> +		clock-names = "mclk";
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pinctrl_cs42888_reset>;
> +		VA-supply = <&reg_audio>;
> +		VD-supply = <&reg_audio>;
> +		VLS-supply = <&reg_audio>;
> +		VLC-supply = <&reg_audio>;
> +		reset-gpios = <&lsio_gpio4 25 GPIO_ACTIVE_LOW>;
> +		assigned-clocks = <&clk IMX_SC_R_AUDIO_PLL_0 IMX_SC_PM_CLK_PLL>,
> +				  <&clk IMX_SC_R_AUDIO_PLL_0 IMX_SC_PM_CLK_SLV_BUS>,
> +				  <&clk IMX_SC_R_AUDIO_PLL_0 IMX_SC_PM_CLK_MST_BUS>,
> +				  <&mclkout0_lpcg IMX_LPCG_CLK_0>;
> +		assigned-clock-rates = <786432000>, <49152000>, <12288000>, <12288000>;
> +		status = "okay";

remove status=okay, not needed

