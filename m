Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3547BD62077
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Nov 2024 10:48:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lAjUlS5JbaArnSdax1frD2cSM1lQG0/O5spKHfzt9oM=; b=JEB/InELY/AUik
	EmTeIf3zqLTpEwfn0jw19PV19lHvi2tCyAuexN7I3/8idbD7ZiHkaFZUbleC/9aL0fokPbVbDHDMZ
	CLxVMn7VANHiZrt3hTGpRSbTRX5EB1RhEbJ4HVjH6a/xT5ukZz685v+zAs8qkZ7Sxk63yUg9bDLnF
	J963MlUacb5DHTx1mAO+zxXFs2jK7/kHEeJjLGdzWsLuS598FaU2PE0017dNUrQi+w+N/WI9ulu0z
	C/B9ctqJqHXytuGEWz3l0fRFxl3YWO5OyNpDQ/lo0fOrlUSFdFJq41ADCKcgVxQq8Breq7YBkOszX
	Wm6ciCs2u6Xkcg8DUClw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDLmD-0000000C6aH-2y0U;
	Tue, 19 Nov 2024 10:48:09 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDLlF-0000000C6KV-2qk8
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Nov 2024 10:47:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 70CCEA4203A;
	Tue, 19 Nov 2024 10:45:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98183C4CECF;
	Tue, 19 Nov 2024 10:47:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732013228;
	bh=h/pAvMzZtkBoYJwCP66IOV31rdv0Z6Es+G+aCCMOw64=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=V9HzU9CYql7KGeSek7R11mSaEv0hjU9jRp/299ieLXWFJlzaOZ/phdpLxdebviHBB
	 iwH314vBqtsnyrMwhTuyBks5wS0y2MxUAf6c9/KXqjfjD7MjY1O51hDr78UBlpkoxJ
	 yiMTjSNhyFgH68IMgL64apIpbbrkvG1fdRRbPU3LK+gr3N3AI00TxXXnkKbgxzWAdi
	 bkqPGLzJ/qM/PiG3eo8q0GdBrwPBfN3+eKJwIjAgA9fszmLCXpUZ7FF5/nkxzgfZfO
	 /vpGKC4qRp13Dxn2ObpOcznoN7HJqqpkYjrpqzixwRCd9jsASBJmgLvM3lgQGkzLdM
	 R0TVW+m2trUGg==
Message-ID: <8f3f0fac-d6f7-4962-b2ca-1b3186a74ebe@kernel.org>
Date: Tue, 19 Nov 2024 12:47:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] arm64: dts: ti: k3-am64-main: Switch ICSSG clock
 to core clock
To: MD Danish Anwar <danishanwar@ti.com>, conor+dt@kernel.org,
 krzk+dt@kernel.org, robh@kernel.org, ssantosh@kernel.org, nm@ti.com,
 Vignesh Raghavendra <vigneshr@ti.com>
References: <20241113110955.3876045-1-danishanwar@ti.com>
 <20241113110955.3876045-3-danishanwar@ti.com>
Content-Language: en-US
From: Roger Quadros <rogerq@kernel.org>
In-Reply-To: <20241113110955.3876045-3-danishanwar@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241119_024709_849765_FAB7E1BD 
X-CRM114-Status: GOOD (  16.68  )
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
Cc: srk@ti.com, devicetree@vger.kernel.org, kristo@kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org



On 13/11/2024 13:09, MD Danish Anwar wrote:
> ICSSG has 7 available clocks per instance. Add all the cloks to ICSSG
> nodes. ICSSG currently uses ICSSG_ICLK (clk id 20) which operates at
> 250MHz. Switch ICSSG clock to ICSSG_CORE clock (clk id 0) which operates at
> 333MHz.
> 
> ICSSG_CORE clock will help get the most out of ICSSG as more cycles are
> needed to fully support all ICSSG features.
> 
> This commit also changes assigned-clock-parents of coreclk-mux to
> ICSSG_CORE clock from ICSSG_ICLK.
> 
> Performance update in dual mac mode
>   With ICSSG_CORE Clk @ 333MHz
>     Tx throughput - 934 Mbps
>     Rx throughput - 914 Mbps,
> 
>   With ICSSG_ICLK clk @ 250MHz,
>     Tx throughput - 920 Mbps
>     Rx throughput - 706 Mbps
> 
> Signed-off-by: MD Danish Anwar <danishanwar@ti.com>
> ---
>  arch/arm64/boot/dts/ti/k3-am64-main.dtsi | 22 ++++++++++++++++++++--

What about other platforms that have ICSSG?
e.g. k3-am65-main.dtsi and k3-j721e-main.dtsi

>  1 file changed, 20 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/ti/k3-am64-main.dtsi b/arch/arm64/boot/dts/ti/k3-am64-main.dtsi
> index c66289a4362b..324eb44c258d 100644
> --- a/arch/arm64/boot/dts/ti/k3-am64-main.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-am64-main.dtsi
> @@ -1227,6 +1227,15 @@ icssg0: icssg@30000000 {
>  		#address-cells = <1>;
>  		#size-cells = <1>;
>  		ranges = <0x0 0x00 0x30000000 0x80000>;
> +		clocks = <&k3_clks 81 0>,  /* icssg0_core_clk */
> +			 <&k3_clks 81 3>,  /* icssg0_iep_clk */
> +			 <&k3_clks 81 16>, /* icssg0_rgmii_mhz_250_clk */
> +			 <&k3_clks 81 17>, /* icssg0_rgmii_mhz_50_clk */
> +			 <&k3_clks 81 18>, /* icssg0_rgmii_mhz_5_clk */
> +			 <&k3_clks 81 19>, /* icssg0_uart_clk */
> +			 <&k3_clks 81 20>; /* icssg0_iclk */
> +		assigned-clocks = <&k3_clks 81 0>;
> +		assigned-clock-parents = <&k3_clks 81 2>;
>  
>  		icssg0_mem: memories@0 {
>  			reg = <0x0 0x2000>,
> @@ -1252,7 +1261,7 @@ icssg0_coreclk_mux: coreclk-mux@3c {
>  					clocks = <&k3_clks 81 0>,  /* icssg0_core_clk */
>  						 <&k3_clks 81 20>; /* icssg0_iclk */
>  					assigned-clocks = <&icssg0_coreclk_mux>;
> -					assigned-clock-parents = <&k3_clks 81 20>;
> +					assigned-clock-parents = <&k3_clks 81 0>;
>  				};
>  
>  				icssg0_iepclk_mux: iepclk-mux@30 {
> @@ -1397,6 +1406,15 @@ icssg1: icssg@30080000 {
>  		#address-cells = <1>;
>  		#size-cells = <1>;
>  		ranges = <0x0 0x00 0x30080000 0x80000>;
> +		clocks = <&k3_clks 82 0>,  /* icssg1_core_clk */
> +			 <&k3_clks 82 3>,  /* icssg1_iep_clk */
> +			 <&k3_clks 82 16>, /* icssg1_rgmii_mhz_250_clk */
> +			 <&k3_clks 82 17>, /* icssg1_rgmii_mhz_50_clk */
> +			 <&k3_clks 82 18>, /* icssg1_rgmii_mhz_5_clk */
> +			 <&k3_clks 82 19>, /* icssg1_uart_clk */
> +			 <&k3_clks 82 20>; /* icssg1_iclk */
> +		assigned-clocks = <&k3_clks 82 0>;
> +		assigned-clock-parents = <&k3_clks 82 2>;
>  
>  		icssg1_mem: memories@0 {
>  			reg = <0x0 0x2000>,
> @@ -1422,7 +1440,7 @@ icssg1_coreclk_mux: coreclk-mux@3c {
>  					clocks = <&k3_clks 82 0>,   /* icssg1_core_clk */
>  						 <&k3_clks 82 20>;  /* icssg1_iclk */
>  					assigned-clocks = <&icssg1_coreclk_mux>;
> -					assigned-clock-parents = <&k3_clks 82 20>;
> +					assigned-clock-parents = <&k3_clks 82 0>;
>  				};
>  
>  				icssg1_iepclk_mux: iepclk-mux@30 {

-- 
cheers,
-roger


