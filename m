Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB6A2C87FD2
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Aug 2025 07:40:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3IJ+jGZN2UE6QDpHhRABCB32DUe4kvemkfLmXr7lvFg=; b=iMbokG3INqOBbx/VOQ1SyTCci7
	V0fLw6aW6RUCiFlpBPc/A+2HQyyKwgkc+XXxCE9I0f8zHnHxCkMgRXNczC9o7wU/HdxrZCW0EezW2
	2mbImNp82WN7s14ad9Ui2ql7fUwdmw0n6ZTdbvrx+fCcLIG1LHvyrDzg2urIw2bmoQeopIftYPPtS
	MwJE+4rq2H6GTDftCwuZy0uimxHWO7/5UnffF0TXzPzGrjD65Y0irArC8eKwus8hvl0ZXBpLlrlqb
	RzESMIFB3FFkDVRvtSA9D8JB91DUnLKvSu58AvdYYhsEIDexbLVGgkO2/PZcbGmSUp6z/64c7DibF
	BN9RjpMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujvEC-0000000HTxC-38mJ;
	Thu, 07 Aug 2025 07:39:56 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujv6L-0000000HTKh-44mt
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 Aug 2025 07:31:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4AC3F613F0;
	Thu,  7 Aug 2025 07:31:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B22AC4CEEB;
	Thu,  7 Aug 2025 07:31:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754551909;
	bh=4THJ8Z+Q9mlw0DN/9Ry88kfBt+XVJ3Smmy5qShyVwkY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=coaz+St/3IS8hCIwa8TQ+vz4/c+RH9vUh8a046Yo+8zvm0nGdai47maL19XNycBee
	 2Kkf0fVgxnFgmbdv3J2/jU/Nu5mtYcPgAjvC+PLC+zghYSbyXEnzau09n9rUy1f6qJ
	 8FRAX2EWv+mLVwuerfUtKhmZ5YKZuj0YaFzG/ffbAdHFLxA1uS+uvqGTxFo1323dbb
	 TYTGMKdk1bZB2gZCpQ+wfb1ruTwmhPjzvkyxaanHPF9I7n37SRnsohybwfT8rlEf9g
	 3F5yTCl2uyEaDxT4cA4Jiu0fpKd6rAwOTjIabN9l5JPw4k4mQULoCLgKSa9D0AdJJJ
	 Uy2ATNJmGqzjg==
Date: Thu, 7 Aug 2025 09:31:46 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
Cc: imx@lists.linux.dev, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Frank Li <frank.li@nxp.com>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 7/9] arm64: dts: imx943: Add display pipeline nodes
Message-ID: <20250807-illustrious-cuckoo-of-management-dacca0@kuoka>
References: <20250806150521.2174797-1-laurentiu.palcu@oss.nxp.com>
 <20250806150521.2174797-8-laurentiu.palcu@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250806150521.2174797-8-laurentiu.palcu@oss.nxp.com>
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

On Wed, Aug 06, 2025 at 06:05:14PM +0300, Laurentiu Palcu wrote:
> Add display controller and LDB support in imx943.
> 
> Signed-off-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
> ---
>  arch/arm64/boot/dts/freescale/imx943.dtsi | 55 ++++++++++++++++++++++-
>  1 file changed, 54 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/freescale/imx943.dtsi b/arch/arm64/boot/dts/freescale/imx943.dtsi
> index 657c81b6016f2..70dec03c5608e 100644
> --- a/arch/arm64/boot/dts/freescale/imx943.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx943.dtsi
> @@ -148,7 +148,7 @@ l3_cache: l3-cache {
>  		};
>  	};
>  
> -	clock-ldb-pll-div7 {
> +	clock_ldb_pll_div7: clock-ldb-pll-div7 {
>  		compatible = "fixed-factor-clock";
>  		#clock-cells = <0>;
>  		clocks = <&scmi_clk IMX94_CLK_LDBPLL>;
> @@ -174,9 +174,62 @@ dispmix_csr: syscon@4b010000 {
>  		lvds_csr: syscon@4b0c0000 {
>  			compatible = "nxp,imx94-lvds-csr", "syscon";
>  			reg = <0x0 0x4b0c0000 0x0 0x10000>;
> +			#address-cells = <1>;
> +			#size-cells = <1>;
>  			clocks = <&scmi_clk IMX94_CLK_DISPAPB>;
>  			#clock-cells = <1>;
>  			power-domains = <&scmi_devpd IMX94_PD_DISPLAY>;
> +
> +			ldb: ldb@4 {
> +				compatible = "fsl,imx94-ldb";
> +				reg = <0x4 0x4>, <0x8 0x4>;
> +				#address-cells = <1>;
> +				#size-cells = <0>;

Why? There are no children with addressing. You never tested it because
this would easily be flagged by tools.

> +				reg-names = "ldb", "lvds";

Follow DTS coding style.

Best regards,
Krzysztof


