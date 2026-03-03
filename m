Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75861EDEBF0
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Mar 2026 20:13:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ykS3/lznPJiRskJY6N2rHy/zaG2snZkqc0focCUoyGs=; b=BanVCzqEMagnMtJJnc0JTISAxI
	tcoqu5+P+5wGgpW9ZBD7wfjJvanH/ccsW3IvA84H8lJQkYWfeJQcfXu/9JV6cdPX9EMSnyucwGPOU
	+gF/h7cph38Mz7Ol5GWjg+1+6XxJIQveXn5NasivNFrqKP/egOCK3IT+c+016HvQmbtNQQAJlnZbE
	XO6nLQM5TyVgXVBHLSOARxZhTU99/dFS7ejky8P9IIxRBc/WY7luJXD8MuQt6j8COYk7ycV+pOBKj
	ocPnkOhuUwdkH7UsDUI7C8ILNnH0Rp6+ixlnZDeL/Qd9fp5nn8brHya0uDza3VF8vYQ1WxVFgB6I5
	pQjD6l/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxW7B-0000000FtFM-1gq2;
	Tue, 03 Mar 2026 20:13:09 +0000
Received: from mout01.posteo.de ([185.67.36.65])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxW79-0000000FtEE-02Ah
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Mar 2026 20:13:08 +0000
Received: from submission (posteo.de [185.67.36.169]) 
	by mout01.posteo.de (Postfix) with ESMTPS id 421AB240027
	for <linux-arm-kernel@lists.infradead.org>; Tue,  3 Mar 2026 21:13:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posteo.net; s=2017;
	t=1772568783; bh=ykS3/lznPJiRskJY6N2rHy/zaG2snZkqc0focCUoyGs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type:
	 From;
	b=kp/dXh3uoSk32b2of+OCxT2R5BvpNr6bwVWBIn0QQOXgqDPM0eoAyjnKjgwtu36vv
	 VDuDBjZ0frxNEY/SG1uRVh6r8xvlyNM92VL7Qvp+Ndm4CCnACduKz5BkgzpXYi3lCD
	 p8scdwyyoJgRDKAHvsh/9SuHEmDOlXD9wpIQIG96fBokL4GT4HrtFlRSnP3fZ3eJYg
	 arisVW7FFMa6aiZk9gXUbKUlUJF593AYS67zfDOkJqVVlGhC7hSOx9m0Mw89S4K1gR
	 gom6qJ5pUJf+wP6risHjBEQuZX2fVWjq0zyVJdTogw1m78Jfc0RCfRHiQ/PEOS/lpN
	 UBDcuGfyGZECA==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4fQRn30ZMsz6txc;
	Tue,  3 Mar 2026 21:12:54 +0100 (CET)
From: Charalampos Mitrodimas <charmitro@posteo.net>
To: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Cc: Rob Herring <robh@kernel.org>,  Krzysztof Kozlowski
 <krzk+dt@kernel.org>,  Conor Dooley <conor+dt@kernel.org>,  Heiko Stuebner
 <heiko@sntech.de>,  Frank Wunderlich <frank-w@public-files.de>,
  david@ixit.cz,  Martin Filla <freebsd@sysctl.cz>,
  devicetree@vger.kernel.org,  linux-arm-kernel@lists.infradead.org,
  linux-rockchip@lists.infradead.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/4] arm64: dts: rockchip: Use reference PCIe clock
 generator for BPI-R2-Pro
In-Reply-To: <20260303-rk3568-bri-r2-pro-fix-pcie-v3-3-af5a5207b0a1@ixit.cz>
References: <20260303-rk3568-bri-r2-pro-fix-pcie-v3-0-af5a5207b0a1@ixit.cz>
	<20260303-rk3568-bri-r2-pro-fix-pcie-v3-3-af5a5207b0a1@ixit.cz>
Date: Tue, 03 Mar 2026 20:13:01 +0000
Message-ID: <m24imwd649.fsf@posteo.net>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260303_121307_361850_8B599F6A 
X-CRM114-Status: GOOD (  16.91  )
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

David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org> writes:

> From: David Heidelberg <david@ixit.cz>
>
> Describe properly PCIe clock, which allows us correct the

                                      ^^^^^^ ^^
Typo/missing words?

> toplogy (removing the vcc3v3-{minipcie,ngff} dependency on pi6c as

  ^^^^^^
Typo?

> supply) and adding the clock dependency in the PCIe nodes.
>
> Suggested-by: Heiko Stuebner <heiko@sntech.de>
> Tested-by: Martin Filla <freebsd@sysctl.cz>
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  arch/arm64/boot/dts/rockchip/rk3568-bpi-r2-pro.dts | 47 +++++++++++++++-------
>  1 file changed, 33 insertions(+), 14 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/rockchip/rk3568-bpi-r2-pro.dts b/arch/arm64/boot/dts/rockchip/rk3568-bpi-r2-pro.dts
> index d02b82c5f979a..3cdea9456a28c 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3568-bpi-r2-pro.dts
> +++ b/arch/arm64/boot/dts/rockchip/rk3568-bpi-r2-pro.dts
> @@ -120,18 +120,13 @@ pcie_refclk_gen: pcie-refclk-gen-clock {
>  		clock-frequency = <100000000>;
>  	};
>  
> -	vcc3v3_pi6c_05: regulator-vcc3v3-pi6c-05 {
> -		compatible = "regulator-fixed";
> -		regulator-name = "vcc3v3_pcie";
> -		regulator-min-microvolt = <3300000>;
> -		regulator-max-microvolt = <3300000>;
> -		enable-active-high;
> -		gpios = <&gpio0 RK_PD4 GPIO_ACTIVE_HIGH>;
> -		startup-delay-us = <200000>;
> -		vin-supply = <&vcc5v0_sys>;
> +	pcie_refclk: pcie-refclk-clock {
> +		compatible = "gpio-gate-clock";
> +		clocks = <&pcie_refclk_gen>;
> +		#clock-cells = <0>;
> +		enable-gpios = <&gpio0 RK_PD4 GPIO_ACTIVE_HIGH>;
>  	};
>  
> -	/* actually fed by vcc3v3_sys, dependent on pi6c clock generator */
>  	vcc3v3_minipcie: regulator-vcc3v3-minipcie {
>  		compatible = "regulator-fixed";
>  		regulator-name = "vcc3v3_minipcie";
> @@ -142,10 +137,9 @@ vcc3v3_minipcie: regulator-vcc3v3-minipcie {
>  		pinctrl-names = "default";
>  		pinctrl-0 = <&minipcie_enable_h>;
>  		startup-delay-us = <50000>;
> -		vin-supply = <&vcc3v3_pi6c_05>;
> +		vin-supply = <&vcc3v3_sys>;
>  	};
>  
> -	/* actually fed by vcc3v3_sys, dependent on pi6c clock generator */
>  	vcc3v3_ngff: regulator-vcc3v3-ngff {
>  		compatible = "regulator-fixed";
>  		regulator-name = "vcc3v3_ngff";
> @@ -156,7 +150,7 @@ vcc3v3_ngff: regulator-vcc3v3-ngff {
>  		pinctrl-names = "default";
>  		pinctrl-0 = <&ngffpcie_enable_h>;
>  		startup-delay-us = <50000>;
> -		vin-supply = <&vcc3v3_pi6c_05>;
> +		vin-supply = <&vcc3v3_sys>;
>  	};
>  
>  	vcc5v0_usb: regulator-vcc5v0-usb {
> @@ -586,12 +580,24 @@ rgmii_phy1: ethernet-phy@0 {
>  
>  &pcie30phy {
>  	data-lanes = <1 2>;
> -	phy-supply = <&vcc3v3_pi6c_05>;
> +
>  	status = "okay";
>  };
>  
>  &pcie3x1 {
>  	/* M.2 slot */
> +	/*
> +	 * The board has a gpio-controlled "pcie_refclk" generator,
> +	 * so add it to the list of clocks.
> +	 */
> +	clocks = <&cru ACLK_PCIE30X1_MST>, <&cru ACLK_PCIE30X1_SLV>,
> +		 <&cru ACLK_PCIE30X1_DBI>, <&cru PCLK_PCIE30X1>,
> +		 <&cru CLK_PCIE30X1_AUX_NDFT>,
> +		 <&cru CLK_PCIE30X1_PIPE_DFT>,
> +		 <&pcie_refclk>;
> +	clock-names = "aclk_mst", "aclk_slv",
> +		      "aclk_dbi", "pclk", "aux",
> +		      "pipe", "ref";
>  	num-lanes = <1>;
>  	pinctrl-names = "default";
>  	pinctrl-0 = <&ngffpcie_reset_h>;
> @@ -602,6 +608,19 @@ &pcie3x1 {
>  
>  &pcie3x2 {
>  	/* mPCIe slot */
> +	/*
> +	 * The board has a gpio-controlled "pcie_refclk" generator,
> +	 * so add it to the list of clocks.
> +	 */
> +	clocks = <&cru ACLK_PCIE30X2_MST>, <&cru ACLK_PCIE30X2_SLV>,
> +		 <&cru ACLK_PCIE30X2_DBI>, <&cru PCLK_PCIE30X2>,
> +		 <&cru CLK_PCIE30X2_AUX_NDFT>,
> +		 <&cru CLK_PCIE30X2_PIPE_DFT>,
> +		 <&pcie_refclk>;
> +	clock-names = "aclk_mst", "aclk_slv",
> +		      "aclk_dbi", "pclk", "aux",
> +		      "pipe", "ref";
> +
>  	num-lanes = <1>;
>  	pinctrl-names = "default";
>  	pinctrl-0 = <&minipcie_reset_h>;

