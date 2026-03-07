Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67FC6FCB602
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Mar 2026 15:22:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wqv2hc4YMHLfHDNoHv0u83E2XAYS30+H4yJWOXRH1nY=; b=ry9rXEo3E2irqpq/hNfUeVC8yu
	0wMdD3dykWYHbm98vvvPGnB99QFX1Z9Vjf2u1AnhBAy/S4a253mgNeeb8h5Kq/F9GaoGXiyTtpgIm
	N90RYDUKAlb5D9zTygtZVkRCc3o2hugK/Ph5LiFdwfC+auAIyIjVLXVSsZOKfuLBFEfqp98qeQnyV
	/vfwD5vOT1qVec+IKjzpUuCQP2+2mVfIApRUeinKDA2RPvI3acfVKD0IDpgBv4xPcEwOr1iKmcRm4
	MMb7g6d96X5Y3dCfemKQ6e0sZq1gu5x+IW1ui4qSLgyZXpShPOM2xTK2DCv9uzEfTvLxZ8M6gpXQB
	I3dmD7+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vytUL-00000005IeH-0dXF;
	Sat, 07 Mar 2026 15:22:45 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vytUI-00000005IdX-3wbk
	for linux-arm-kernel@lists.infradead.org;
	Sat, 07 Mar 2026 15:22:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 87240435DE;
	Sat,  7 Mar 2026 15:22:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1808C19422;
	Sat,  7 Mar 2026 15:22:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772896962;
	bh=V4gJkObjDah6lfhZK4kMUJ5jS923Ftcsg+YsORY2fqE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bFSPckRdirXEZoprnvirmE+J4vPSBEGLeS/jigwnzsPrQTBxL9YaxgNdTwy7fjFMy
	 Gb8h8+O5EZ7uY/QhgAIjiNsoeTzD4ESeYIlIhndF69pDk6A6Z4aAtezxS7e0uEi14C
	 jh4FZjmGQJzmp08WlOb4hLuFeLyHDeFSJpTo8RgWPFCXZ0XrV1bWtl5+dhYnnNc1Jp
	 K/lkSnbpAK+Qmq707U+Ixa96Fi5WjqatwPpov5mygZGQqnOO4UaxUqtXM80U66Dvoe
	 b8ZyCGYx1e3t8b26GB0NtbGwzW+e1+2I75XxQwDSXglb2zJ1QeuBar6uspqis88oBE
	 Ppurrsmwk8HtA==
Date: Sat, 7 Mar 2026 16:22:39 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Zichar Zhang <zichar.zhang@cixtech.com>
Cc: linusw@kernel.org, brgl@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, peter.chen@cixtech.com, 
	fugang.duan@cixtech.com, jank@cadence.com, cix-kernel-upstream@cixtech.com, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/2] arm64: dts: cix: add FCH(S0)/S5 GPIO controllers for
 sky1
Message-ID: <20260307-efficient-fancy-gaur-db7df8@quoll>
References: <20260306093238.2715269-1-zichar.zhang@cixtech.com>
 <20260306093238.2715269-2-zichar.zhang@cixtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260306093238.2715269-2-zichar.zhang@cixtech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260307_072243_018173_BB96062A 
X-CRM114-Status: GOOD (  16.84  )
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

On Fri, Mar 06, 2026 at 05:32:38PM +0800, Zichar Zhang wrote:
> From: "Zichar.Zhang" <zichar.zhang@cixtech.com>
> 
> Add Cadence GPIO controller nodes for Sky1 FCH(S0) and S5 domains in
> sky1.dtsi, and enable those controllers on sky1-orion-o6.
> 
> Signed-off-by: Zichar Zhang <zichar.zhang@cixtech.com>
> ---
>  arch/arm64/boot/dts/cix/sky1-orion-o6.dts |  28 +++++
>  arch/arm64/boot/dts/cix/sky1.dtsi         | 123 ++++++++++++++++++++++
>  2 files changed, 151 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/cix/sky1-orion-o6.dts b/arch/arm64/boot/dts/cix/sky1-orion-o6.dts
> index 4dee8cd0b86d..4dc76e0135ee 100644
> --- a/arch/arm64/boot/dts/cix/sky1-orion-o6.dts
> +++ b/arch/arm64/boot/dts/cix/sky1-orion-o6.dts
> @@ -89,3 +89,31 @@ &pcie_x1_1_rc {
>  &uart2 {
>  	status = "okay";
>  };
> +
> +&s5_gpio0 {

I already asked cixtech contributors to read DTS coding style. More than
once. Does it mean I need to ask EACH contributor that? Maybe create
internal guideline to avoid trivial mistakes?

> +	status = "okay";
> +};
> +
> +&s5_gpio1 {
> +	status = "okay";
> +};
> +
> +&s5_gpio2 {
> +	status = "okay";
> +};
> +
> +&fch_gpio0 {
> +	status = "okay";
> +};
> +
> +&fch_gpio1 {
> +	status = "okay";
> +};
> +
> +&fch_gpio2 {
> +	status = "okay";
> +};
> +
> +&fch_gpio3 {
> +	status = "okay";
> +};
> diff --git a/arch/arm64/boot/dts/cix/sky1.dtsi b/arch/arm64/boot/dts/cix/sky1.dtsi
> index 72f3b195a927..9ceaf8f68e83 100644
> --- a/arch/arm64/boot/dts/cix/sky1.dtsi
> +++ b/arch/arm64/boot/dts/cix/sky1.dtsi
> @@ -185,6 +185,13 @@ psci {
>  		method = "smc";
>  	};
>  
> +	s5_gpio_apb_clk: s5-gpio-apb-clk {

Please use name for all fixed clocks which matches current format
recommendation: 'clock-<freq>' (see also the pattern in the binding for
any other options).
https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/clock/fixed-clock.yaml

> +		compatible = "fixed-clock";
> +		#clock-cells = <0>;
> +		clock-frequency = <100000000>;
> +		clock-output-names = "s5_gpio_apb_clk";
> +	};
> +
>  	soc@0 {
>  		compatible = "simple-bus";
>  		ranges = <0 0 0 0 0x20 0>;
> @@ -354,6 +361,74 @@ syscon: syscon@4160000 {
>  			#reset-cells = <1>;
>  		};
>  
> +		fch_gpio0: gpio-controller@4120000 {

Again, read DTS coding style.

> +			compatible = "cdns,gpio-r1p02";
> +			reg = <0x0 0x4120000 0x0 0x1000>;
> +			clocks = <&scmi_clk CLK_TREE_FCH_GPIO_APB>;
> +			clock-names = "fch_gpio_apb_clk";

This is pointless name. GPIO block does not take some "fch" input. You
just called the input clock based on clock output which is completely
misunderstanding of the DTS.

Best regards,
Krzysztof


