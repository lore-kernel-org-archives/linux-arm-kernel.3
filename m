Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1991BCCD1A5
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Oct 2025 12:00:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lF04kU9+cydK5EQl054wj/CrdCQvah+BDlS+OYalLDE=; b=lt7y0vQYHRkGH/p72oY7SQjjqr
	br59soSOMHQFgpvrfyF9+6mUTTo4Rntv6qkjkMiBz0140NZS/7Ma4+zdAEioqf/+btg+F2fIJlZf0
	sO/Wl4A+Nh4v9LKeQ3UtUqTeiBdxQickpk0kXxDF5KPahC0eo7Jk5rDS0Nzy8Af5It9QGCM/MnCEy
	HNBbzBQtWuBhd+mvuQ71TXe0y428a0Gifp5GM1H7hOAPuicT9X5tM2qf5fLYkUz6stXVCCNJPtA7K
	JzzhtEDBMZxpKzoG1Y7IgnNqGmUsUnruL1TdYtp3WNRgNiZFvIkG99J6yIqKEhFc/xF+/R1RUZFUj
	Fy/gGHsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCGTM-00000009IQt-2PkZ;
	Fri, 24 Oct 2025 12:00:44 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCGTI-00000009IPk-3Ijv
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Oct 2025 12:00:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id BCB9D48875;
	Fri, 24 Oct 2025 12:00:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 551EAC4CEF1;
	Fri, 24 Oct 2025 12:00:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761307238;
	bh=mY0NKPFfmhr1T63HdffWMpcsFE4SlVTte2OxJPJe5q0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=GA6beHVk0T7eqma9TD1yfynJIZUzmhZWrQSGs2EbMYvTG0m96tG7jC1m+Z5Ic+igt
	 29PmR2o/pGmZVtNu9HPB6Ye8/TIOIVlUq69IzYMuAOnOYK+YS4b4MKqlqMf37byeTh
	 etMlzJbKT4JMLQN/4UCOOX+FpomsE8Sqpyf5/b4hIbPph51zoQc7tJ72o/dNRKvuUw
	 d4SEjXTs9sB6ct0+ynRY0O/vMa26IBbUAUzzdmrsOPm8v1+9mhjyA/b+/OCH1tPqeg
	 4aASNTRFCdlPi6DdWTdbxv4LbxaaRnI51ukDWFbj5KzDebv7Yk8PxrpM437HHEbHCk
	 jnt3Lz5egnOmw==
Message-ID: <b486bb52-7e95-44d3-ac65-1c28d4d0e40e@kernel.org>
Date: Fri, 24 Oct 2025 07:00:36 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 06/10] arm64: dts: socfpga: agilex5: add dwxgmac
 compatible
To: Steffen Trumtrar <s.trumtrar@pengutronix.de>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Matthew Gerlach <matthew.gerlach@altera.com>
Cc: kernel@pengutronix.de, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
References: <20251024-v6-12-topic-socfpga-agilex5-v5-0-4c4a51159eeb@pengutronix.de>
 <20251024-v6-12-topic-socfpga-agilex5-v5-6-4c4a51159eeb@pengutronix.de>
Content-Language: en-US
From: Dinh Nguyen <dinguyen@kernel.org>
In-Reply-To: <20251024-v6-12-topic-socfpga-agilex5-v5-6-4c4a51159eeb@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251024_050040_866883_6D304997 
X-CRM114-Status: GOOD (  14.97  )
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

Hi Steffen,

On 10/24/25 06:49, Steffen Trumtrar wrote:
> The gmac0/1/2 are also compatible to the more generic "snps,dwxgmac"
> compatible. The platform code checks this to decide if it is a GMAC or
> GMAC4 compatible IP core.
> 
> Signed-off-by: Steffen Trumtrar <s.trumtrar@pengutronix.de>
> ---
>   arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi | 9 ++++++---
>   1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi b/arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi
> index 4ccfebfd9d322..d0c139f03541e 100644
> --- a/arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi
> +++ b/arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi
> @@ -536,7 +536,8 @@ qspi: spi@108d2000 {
>   
>   		gmac0: ethernet@10810000 {
>   			compatible = "altr,socfpga-stmmac-agilex5",
> -				     "snps,dwxgmac-2.10";
> +				     "snps,dwxgmac-2.10",
> +				     "snps,dwxgmac";
>   			reg = <0x10810000 0x3500>;
>   			interrupts = <GIC_SPI 190 IRQ_TYPE_LEVEL_HIGH>;
>   			interrupt-names = "macirq";
> @@ -649,7 +650,8 @@ queue7 {
>   
>   		gmac1: ethernet@10820000 {
>   			compatible = "altr,socfpga-stmmac-agilex5",
> -				     "snps,dwxgmac-2.10";
> +				     "snps,dwxgmac-2.10",
> +				     "snps,dwxgmac";
>   			reg = <0x10820000 0x3500>;
>   			interrupts = <GIC_SPI 207 IRQ_TYPE_LEVEL_HIGH>;
>   			interrupt-names = "macirq";
> @@ -762,7 +764,8 @@ queue7 {
>   
>   		gmac2: ethernet@10830000 {
>   			compatible = "altr,socfpga-stmmac-agilex5",
> -				     "snps,dwxgmac-2.10";
> +				     "snps,dwxgmac-2.10",
> +				     "snps,dwxgmac";
>   			reg = <0x10830000 0x3500>;
>   			interrupts = <GIC_SPI 224 IRQ_TYPE_LEVEL_HIGH>;
>   			interrupt-names = "macirq";
> 

I just sent a patch for this yesterday:

https://lore.kernel.org/all/20251023214012.283600-1-dinguyen@kernel.org/

I'll make sure to include you on future submissions.

I didn't add it to the bindings document though.

Dinh

