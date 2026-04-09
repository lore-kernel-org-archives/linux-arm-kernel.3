Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08A5AE9DE5B
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Apr 2026 07:30:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BT4K2Zf/nxxoglAtguOwCkdFi7MIc2xLvXbL9RRrrX4=; b=lriOHn+LuS4UYC434S8NybkFnz
	Mqyx9fDJRUmxxOHgDUNgx7vh0NWc5xwdb2KQaEMyZSFmqM5RJikXAzedoWwZHikMBuwBEtFJCi/cI
	VKwDh8VPy3VOKleALBOoW2plmzCgH1TzNlNwTfqw+X+p24WCrtngZMIxTY4UIsjW1Nfv5mLHgYLWd
	PYjE9yvRdgJiJV8ormi3/SSRqxXs8k72oUz5FtAfvyABe/GgjCiTUzTPgKtHvzXa9zHwa6JkAVzEE
	JulyYJFsbnA3AQLmoSfjKJ8531ru2uq8DRFsEqqvOZvPv2CmeDc10hVrCZf26E2TxEgScPDCoZhwo
	kbohwfwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAjqQ-00000009qzg-0hkk;
	Thu, 09 Apr 2026 07:30:30 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAjqL-00000009qzL-3WJm;
	Thu, 09 Apr 2026 07:30:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2443D600AD;
	Thu,  9 Apr 2026 07:30:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4827EC4CEF7;
	Thu,  9 Apr 2026 07:30:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775719824;
	bh=vwghWor8OZe17SmQaOpkWmuy9YBmg+3I3XnkIV/bOig=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ubxdOzeyBTj+xJL5QphQ13nGFi9Y7uZlWAPeqOQVhIbTssTm5eLVRQfZGM0zCNBP2
	 CuRqfybrbijyPd2NCt9JaXYmSRYiI+ObSkFP89QOPazz6ZKGRlwC2BRRg2LiIaUaUZ
	 vArBk2OpZRCUFWnWxD69y3CShwa7If0gChD47f9b59ibWotr1kowXE7gOoXaP96ymj
	 54R8bO/ZzzCjyDS9y8Rz+ge2M0HXiDnncQGdtibon+vRkHEb4oU3l/o8DpRgUrUWHc
	 D8dbVIw99xyu5lXojtVjYkysEKG+/bjMk4o1ND4HSjv200ODdMIcbC6ixGTeiVhdRs
	 2NXKxf8/6xyoA==
Date: Thu, 9 Apr 2026 09:30:22 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Dawid Glazik <dawid.glazik@linux.intel.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
	Andrew Jeffery <andrew@codeconstruct.com.au>, linux-aspeed@lists.ozlabs.org, linux-i3c@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Frank Li <Frank.Li@nxp.com>, Maciej Lawniczak <maciej.lawniczak@intel.com>, 
	Jeremy Kerr <jk@codeconstruct.com.au>
Subject: Re: [PATCH v3 2/3] ARM: dts: aspeed-g6: Add nodes for i3c controllers
Message-ID: <20260409-massive-natural-crayfish-c1cf2f@quoll>
References: <cover.1775679285.git.dawid.glazik@linux.intel.com>
 <51c4bdc02b45f67a0e32610a228091e137c135a6.1775679285.git.dawid.glazik@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <51c4bdc02b45f67a0e32610a228091e137c135a6.1775679285.git.dawid.glazik@linux.intel.com>
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

On Wed, Apr 08, 2026 at 10:34:34PM +0200, Dawid Glazik wrote:
> Add the i3c controller devices to the ast2600 g6 common dts. We add all
> 6 busses to the common g6 definition, but leave disabled through the
> status property, to be enabled per-platform.
> 
> Originally-by: Jeremy Kerr <jk@codeconstruct.com.au>

Don't invent tags. This is not used outside of TIP.

> Signed-off-by: Dawid Glazik <dawid.glazik@linux.intel.com>
> ---
> v3:
>  - add i3c aliases
>  - rebase on top of latest tree and solve conflicts
>  - as agreed with Jeremy off-list, he said I can take authorship of this going forward
> v2:
>  - use inline bus representation, without the i3c: label
> ---
>  arch/arm/boot/dts/aspeed/aspeed-g6.dtsi | 97 +++++++++++++++++++++++++
>  1 file changed, 97 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi b/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
> index f5641128614f..f986fcbed604 100644
> --- a/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
> +++ b/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
> @@ -29,6 +29,12 @@ aliases {
>  		i2c13 = &i2c13;
>  		i2c14 = &i2c14;
>  		i2c15 = &i2c15;
> +		i3c0 = &i3c0;
> +		i3c1 = &i3c1;
> +		i3c2 = &i3c2;
> +		i3c3 = &i3c3;
> +		i3c4 = &i3c4;
> +		i3c5 = &i3c5;

Bus aliases are not properties of SoC DTSI.

>  		serial0 = &uart1;
>  		serial1 = &uart2;
>  		serial2 = &uart3;
> @@ -1066,6 +1072,97 @@ i2c15: i2c@800 {
>  				};
>  			};
>  
> +			bus@1e7a0000 {
> +				compatible = "simple-bus";
> +				#address-cells = <1>;
> +				#size-cells = <1>;
> +				ranges = <0 0x1e7a0000 0x8000>;
> +
> +				i3c_global: i3c-global@0 {

Node names should be generic. See also an explanation and list of
examples (not exhaustive) in DT specification:
https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation
If you cannot find a name matching your device, please check in kernel
sources for similar cases or you can grow the spec (via pull request to
DT spec repo).

Best regards,
Krzysztof


