Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86ADEC83F03
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  6 Jul 2025 23:43:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4Y/G3S13E5uNblb6tmlpSjFI6vk5a/dQgoMUTuqSvl4=; b=q7by8/tDbRmrp2eoAas+RH3tWH
	DRnMSU3kouYN7aeyg7rP6gDqSx0xTRaEQ+KHv+JK+rEodX/+bh5Vm1YwZUnTC7Gp5N0zJf2S+hezG
	n0lj0MAEml2YQ2ox9j3K8XkYh5U/ffvjdf6kmoEjCo6rXgsWZ2hPMLAJoyJ/ZEQte5v4MkQCD0PqR
	KKW3fQMR6nbVCuX4gcu5vrZKHG88N4xyGU97MWPZqxVVk+u4wHbeoiJL/ngo7Xhie28NAYwSExZfd
	0VDeN+SpJBPh4B7SIKG4USWw475vMiaSDqnTSos8eWc/oA+ZeAAfWypa9c8jk3n5WPEIaJlJaTj0A
	64ZqaYJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYZ0i-00000000yDc-0KMf;
	Sun, 06 Jul 2025 23:43:04 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYYwM-00000000xrS-0KEY
	for linux-arm-kernel@lists.infradead.org;
	Sun, 06 Jul 2025 23:38:35 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 42B281E8D;
	Sun,  6 Jul 2025 16:38:20 -0700 (PDT)
Received: from minigeek.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5F0F13F694;
	Sun,  6 Jul 2025 16:38:31 -0700 (PDT)
Date: Mon, 7 Jul 2025 00:37:00 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Chen-Yu Tsai <wens@kernel.org>
Cc: Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej@kernel.org>, Samuel
 Holland <samuel@sholland.org>, Ulf Hansson <ulf.hansson@linaro.org>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, linux-sunxi@lists.linux.dev,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
Subject: Re: [PATCH 2/4] pmdomain: sunxi: sun20i-ppu: add A523 support
Message-ID: <20250707003700.7c69ec68@minigeek.lan>
In-Reply-To: <20250627152918.2606728-3-wens@kernel.org>
References: <20250627152918.2606728-1-wens@kernel.org>
	<20250627152918.2606728-3-wens@kernel.org>
Organization: Arm Ltd.
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.31; x86_64-slackware-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250706_163834_164096_EDCCE2B9 
X-CRM114-Status: GOOD (  19.43  )
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

On Fri, 27 Jun 2025 23:29:16 +0800
Chen-Yu Tsai <wens@kernel.org> wrote:

> From: Chen-Yu Tsai <wens@csie.org>
> 
> A523 has a PPU like the one in the Allwinner D1 SoC.
> 
> Add a compatible entry and a list of power domain names for it.

The user manual does not describe this PPU, but the BSP code confirms
the order of the domains, so:

> Signed-off-by: Chen-Yu Tsai <wens@csie.org>

Reviewed-by: Andre Przywara <andre.przywara@arm.com>

One suggestion below, but only if you respin anyway:

> ---
>  drivers/pmdomain/sunxi/sun20i-ppu.c | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
> 
> diff --git a/drivers/pmdomain/sunxi/sun20i-ppu.c b/drivers/pmdomain/sunxi/sun20i-ppu.c
> index 9f002748d224..b65876a68cc1 100644
> --- a/drivers/pmdomain/sunxi/sun20i-ppu.c
> +++ b/drivers/pmdomain/sunxi/sun20i-ppu.c
> @@ -193,6 +193,19 @@ static const struct sun20i_ppu_desc sun8i_v853_ppu_desc = {
>  	.num_domains	= ARRAY_SIZE(sun8i_v853_ppu_pd_names),
>  };
>  
> +static const char *const sun55i_a523_ppu_pd_names[] = {
> +	"DSP",

I wonder if we should enforce the relation between the DT binding
symbols and the names here, like:

	[PD_DSP] = "DSP",
	[PD_NPU] = "NPU",
	...

Cheers,
Andre


> +	"NPU",
> +	"AUDIO",
> +	"SRAM",
> +	"RISCV",
> +};
> +
> +static const struct sun20i_ppu_desc sun55i_a523_ppu_desc = {
> +	.names		= sun55i_a523_ppu_pd_names,
> +	.num_domains	= ARRAY_SIZE(sun55i_a523_ppu_pd_names),
> +};
> +
>  static const struct of_device_id sun20i_ppu_of_match[] = {
>  	{
>  		.compatible	= "allwinner,sun20i-d1-ppu",
> @@ -202,6 +215,10 @@ static const struct of_device_id sun20i_ppu_of_match[] = {
>  		.compatible	= "allwinner,sun8i-v853-ppu",
>  		.data		= &sun8i_v853_ppu_desc,
>  	},
> +	{
> +		.compatible	= "allwinner,sun55i-a523-ppu",
> +		.data		= &sun55i_a523_ppu_desc,
> +	},
>  	{ }
>  };
>  MODULE_DEVICE_TABLE(of, sun20i_ppu_of_match);


