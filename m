Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24E93CA100F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Sep 2025 17:32:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GnavpgAUnwaZa9m8GCLwbn+1odYWzFqA+4yW1BVx5QI=; b=Mx3ASutxNydiL4UlVYGAZGfWvc
	XwdJTDR62DxrAuN6Nz2BcrJOn9SFjAhZUrLAkSX9djq9NKefiXHDkdXoyeLUsIlVDgoJUee4Riaxc
	XnBzDXdYw564ZnW5qsNrVbPcahv43wMxaDV/UEAp6SaiS/j3nIDGDJ6SCzomR9uGZmyt+2LIiLcjM
	hC/3Q6qM9Z3N0MnJRfHMDevUmE/ikbq0WdTyJlCBkm/9kNNhD2ihkqLQ+w7Q+/Uvrwz67aFROjFv9
	tA2EcmH4OMol3Y2G9mFdSKIyuc5U+n/Dhe0MSN7kP5y5uvv7hIpykhagDbp7Dt8FmXjLyEv6/B2uT
	67er9uDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0kOJ-0000000B8Md-04Gg;
	Mon, 22 Sep 2025 17:31:55 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0kOH-0000000B8Lm-0mj3
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Sep 2025 17:31:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D28AE43D15;
	Mon, 22 Sep 2025 17:31:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35B62C4CEF0;
	Mon, 22 Sep 2025 17:31:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758562312;
	bh=0Jaq62/wsiDis5Kxr3Xf68gcAS73LxwxMmQQZHfINbQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CknZkEfHsiB9PDl/Uko3MtMWJ4EMHoFDksYXfhYYMy2fJ2n30DT1HiZ8qqEVeiqEi
	 otM3gxMX6XyzuO1ZfMe8/JVVhKCoBq6aQtqfxKr1wMGdJhhDCtZ4LSUxphtSoGjswk
	 CphNBZPq4D6O+c+PJWHGjxXu2CidHdrh0kmB5IHxOX8iHZ5PR8YPNXqNc95BdMdSBn
	 SX4lvB9zhR5z6vdjpOfAymwdOV66fzvZkCPdeiwi2nvP9CcQD6bqm2Aoa9+QzbMi9C
	 JBoF5q5VFPiBnr6U6rirqTPkToA6VttjBbUj1ZMg3N9qAUFzJaXuKfgJ1/WxQowea6
	 dsAMq3pTQzArQ==
Date: Mon, 22 Sep 2025 12:31:50 -0500
From: Rob Herring <robh@kernel.org>
To: "Sheetal ." <sheetal@nvidia.com>
Cc: Vinod Koul <vkoul@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sameer Pujar <spujar@nvidia.com>, dmaengine@vger.kernel.org,
	devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH 2/4] dt-bindings: sound: Update ADMAIF bindings for
 tegra264
Message-ID: <20250922173150.GA506813-robh@kernel.org>
References: <20250918102009.1519588-1-sheetal@nvidia.com>
 <20250918102009.1519588-3-sheetal@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250918102009.1519588-3-sheetal@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250922_103153_270405_54553121 
X-CRM114-Status: GOOD (  15.37  )
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

On Thu, Sep 18, 2025 at 03:50:07PM +0530, Sheetal . wrote:
> From: sheetal <sheetal@nvidia.com>
> 
> Update the ADMAIF bindings as tegra264 supports 64 channels, which includes
> 32 RX and 32 TX channels.
> 
> Signed-off-by: sheetal <sheetal@nvidia.com>
> ---
>  .../sound/nvidia,tegra210-admaif.yaml         | 49 +++++++++++++------
>  1 file changed, 35 insertions(+), 14 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra210-admaif.yaml b/Documentation/devicetree/bindings/sound/nvidia,tegra210-admaif.yaml
> index b32f33214ba6..f53ecef379b3 100644
> --- a/Documentation/devicetree/bindings/sound/nvidia,tegra210-admaif.yaml
> +++ b/Documentation/devicetree/bindings/sound/nvidia,tegra210-admaif.yaml
> @@ -93,20 +93,41 @@ then:
>      iommus: false
>  
>  else:
> -  properties:
> -    dmas:
> -      description:
> -        DMA channel specifiers, equally divided for Tx and Rx.
> -      minItems: 1
> -      maxItems: 40
> -    dma-names:
> -      items:
> -        pattern: "^[rt]x(1[0-9]|[1-9]|20)$"
> -      description:
> -        Should be "rx1", "rx2" ... "rx20" for DMA Rx channel
> -        Should be "tx1", "tx2" ... "tx20" for DMA Tx channel
> -      minItems: 1
> -      maxItems: 40
> +  if:

Try to avoid nested if/then/else if possible and put independent if/then 
schemas under 'allOf'.

> +    properties:
> +      compatible:
> +        contains:
> +          const: nvidia,tegra264-admaif
> +  then:
> +    properties:
> +      dmas:
> +        description:
> +          DMA channel specifiers, equally divided for Tx and Rx.
> +        minItems: 1
> +        maxItems: 64
> +      dma-names:
> +        items:
> +          pattern: "^[rt]x(3[0-2]|[1-2][0-9]|[1-9])$"
> +        description:
> +          Should be "rx1", "rx2" ... "rx32" for DMA Rx channel
> +          Should be "tx1", "tx2" ... "tx32" for DMA Tx channel
> +        minItems: 1
> +        maxItems: 64
> +  else:
> +    properties:
> +      dmas:
> +        description:
> +          DMA channel specifiers, equally divided for Tx and Rx.
> +        minItems: 1
> +        maxItems: 40
> +      dma-names:
> +        items:
> +          pattern: "^[rt]x(1[0-9]|[1-9]|20)$"
> +        description:
> +          Should be "rx1", "rx2" ... "rx20" for DMA Rx channel
> +          Should be "tx1", "tx2" ... "tx20" for DMA Tx channel
> +        minItems: 1
> +        maxItems: 40
>  
>  required:
>    - compatible
> -- 
> 2.34.1
> 

