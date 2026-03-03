Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBCE8EDA6BE
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Mar 2026 17:39:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ufIzwaNjj0ilI3qaPmP9e1Hi0EpUA2HQbbQRITslibI=; b=23maU7dL3FiUu3VwXUPr8JrTAU
	uJKSuYk+n+SZfckHH0aNmcVBE2j5EW7UL7Dk4iy7qy17O6eeSTDX4Ho1RQjidhqSdTKG2yCQc5hw3
	JiXYCOuoi3NhUEGJticbjNdbxqpCABuQn8UDddlF/6rxpm846v8Jx3D2nZn0uhgPTIiVy/Qky7Vbz
	t+ob56RrR9geU4q1Y+wu5G76pWiEpC2dB9+w+NZ9JmxskSiyS+auBVX1rdJo7I1lxWwv2KzAPQ0IP
	jeGrIR8e5gB95RzUyBitOH39l+rr0kD64zyve/ZoR7U21wfCD1x8Py/WNGd2RTgqb6cq7BuV2mFNT
	hn/xARLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxTi8-0000000FfLT-1NQi;
	Tue, 03 Mar 2026 17:39:08 +0000
Received: from mout02.posteo.de ([185.67.36.66])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxTi4-0000000FfKg-36DZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Mar 2026 17:39:06 +0000
Received: from submission (posteo.de [185.67.36.169]) 
	by mout02.posteo.de (Postfix) with ESMTPS id 39A3C240101
	for <linux-arm-kernel@lists.infradead.org>; Tue,  3 Mar 2026 18:38:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posteo.net; s=2017;
	t=1772559539; bh=ufIzwaNjj0ilI3qaPmP9e1Hi0EpUA2HQbbQRITslibI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type:
	 From;
	b=IzF2HjsZLnjvVVlGH1V4oNNmGGMvU9WpKmKO+i9W9S5AQyqIpGYYkYw/tifS5V93Q
	 0jpDsEnd40W30TmJ35wAuoH403RVpg/RowDbPVb805Ct9hZb+tnnA7beSEnUrpFKdd
	 d2lnLm9Fwai7cZD0hJ2e89I02kCRIQ9hTQgM/eYiPYT2PFYWLnZNtU7xItNvtGerP0
	 1PSg2x3z2IncAFLubvrVGwt+uWxKrGdS4n6Wfjyl6x59hMHe/gX9H+tMtVqICr1ZeN
	 ApO5G9g79SEKpo2BIHtoumrqK+VBZXLvWe0D6uLNW1np0ChnrP1YsUa9mciHsgboZo
	 GIWDHIGimd6Cg==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4fQNMN5rPmz9rxL;
	Tue,  3 Mar 2026 18:38:56 +0100 (CET)
From: Charalampos Mitrodimas <charmitro@posteo.net>
To: david@ixit.cz
Cc: Rob Herring <robh@kernel.org>,  Krzysztof Kozlowski
 <krzk+dt@kernel.org>,  Conor Dooley <conor+dt@kernel.org>,  Heiko Stuebner
 <heiko@sntech.de>,  Martin Filla <freebsd@sysctl.cz>,
  devicetree@vger.kernel.org,  linux-arm-kernel@lists.infradead.org,
  linux-rockchip@lists.infradead.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] arm64: dts: rockchip: Use reference PCIe clock
 generator for BPI-R2-Pro
In-Reply-To: <20260303-rk3568-bri-r2-pro-fix-pcie-v2-2-04665e55d5a8@ixit.cz>
References: <20260303-rk3568-bri-r2-pro-fix-pcie-v2-0-04665e55d5a8@ixit.cz>
	<20260303-rk3568-bri-r2-pro-fix-pcie-v2-2-04665e55d5a8@ixit.cz>
Date: Tue, 03 Mar 2026 17:38:58 +0000
Message-ID: <87fr6gn780.fsf@posteo.net>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260303_093905_057760_5F68B606 
X-CRM114-Status: GOOD (  19.31  )
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
> toplogy (removing the vcc3v3-{minipcie,ngff} dependency on pi6c as
> supply) and adding the clock dependency in the PCIe nodes.
>
> Suggested-by: Heiko Stuebner <heiko@sntech.de>
> Tested-by: Martin Filla <freebsd@sysctl.cz>
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  arch/arm64/boot/dts/rockchip/rk3568-bpi-r2-pro.dts | 45 +++++++++++++++-------
>  1 file changed, 31 insertions(+), 14 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/rockchip/rk3568-bpi-r2-pro.dts b/arch/arm64/boot/dts/rockchip/rk3568-bpi-r2-pro.dts
> index d02b82c5f979a..a071cb67579c4 100644
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
> @@ -586,12 +580,23 @@ rgmii_phy1: ethernet-phy@0 {
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
> +		 <&pcie_refclk>;
> +	clock-names = "aclk_mst", "aclk_slv",
> +		      "aclk_dbi", "pclk", "aux",
> +		      "ref";

Hi,

The DT binding in rockchip-dw-pcie-common.yaml defines clock-names as a
positional array:

    items:
      - const: aclk_mst
      - const: aclk_slv
      - const: aclk_dbi
      - const: pclk
      - const: aux
      - const: pipe   <-- position 5
      - const: ref    <-- position 6

With "ref" at position 5, this would fail dtbs_check because the schema
expects "pipe" there.

Other boards that include the ref clock (rk3588-rock-5-itx,
rk3588-jaguar) include "pipe" at position 5 and "ref" at position 6. The
rk3568 has CLK_PCIE30X1_PIPE_DFT available in the CRU header.

Should the pipe clock be included before ref to match the binding
schema?

>  	num-lanes = <1>;
>  	pinctrl-names = "default";
>  	pinctrl-0 = <&ngffpcie_reset_h>;
> @@ -602,6 +607,18 @@ &pcie3x1 {
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
> +		 <&pcie_refclk>;
> +	clock-names = "aclk_mst", "aclk_slv",
> +		      "aclk_dbi", "pclk", "aux",
> +		      "ref";
> +

Same clock-names ordering issue I believe here for pci3c2, with
CLK_PCIE30X2_PIPE_DFT available.


>  	num-lanes = <1>;
>  	pinctrl-names = "default";
>  	pinctrl-0 = <&minipcie_reset_h>;

