Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C963AD767F6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Oct 2024 18:19:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h3pPQ3tejVCVHa+QZlQpAlRvOg+J7/0KyAT5AISqOkE=; b=IhaHtehhxbmXZPCLoVsP7qvilm
	Phxpot7+HLx2w3OwfI3kcSmCAgfGGYNu9rUcysA0uUROCE9oKMHDQ3AEQYBsJRnxNvBuMCTd5gq/r
	oaFmH81RC27RaqiZvsQ8NAmg3WzaMmZCza2xciXzDSrugC2sxsc7Otsoxx94wVt5xxbbA4SXGb64F
	qhEAmY4OTsYikb7XgN+NEhYg5953seFQQfjB7iIctpWjaW+bSTHp1Wb0f6pLZy752IZBj4cFxhals
	o6Ineb3Bs/nDc8yT8lrFO54JkUvZrxOUf+0+8jHxC6weJBBXU5ljpG6fbrVv4Y3H2hFK5/Wamb3Rk
	zs994z+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6Zli-00000004U5Y-2zPi;
	Thu, 31 Oct 2024 18:19:38 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6Zk0-00000004TqS-1i5k
	for linux-arm-kernel@lists.infradead.org;
	Thu, 31 Oct 2024 18:17:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id B43FEA44509;
	Thu, 31 Oct 2024 18:15:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA272C4CEC3;
	Thu, 31 Oct 2024 18:17:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730398671;
	bh=jvJJQy15udztSTe+99Lr2COkQGC4eOLwJnRCW9vATlo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BxPbeWLzN8gyS/+5v78ZHxhq1BwhPcdXIdT4Zh5A5OZv6ls+g6zM4mR4On+uD+uu4
	 9XPOu/aAqFS1Uuk8AVpPQ9nAOhOjxWx7I0sDwciNmFELDhT7Lao/VWdDNT+DAc+L1O
	 JSxHBHu0f7Cmk4kBAsZJUnZDAge1+hi+gUIg5ikZ44p3i6DJ/OV30uwnsMZPClNlyJ
	 h+doGxdIEZ5kMZKDFMUOC16cY3J2NfYZutofNqo45IKZDL2ke9Lm3FTLqEDQBso6gs
	 z2lYxXJI4d5msee6FirCMB7hZUtQYMFcRBoz6LVps4NRym3XvqMUNMsjGyxrz0qjwO
	 m6B0zuKX4ZL3w==
Date: Thu, 31 Oct 2024 13:17:49 -0500
From: Rob Herring <robh@kernel.org>
To: =?iso-8859-1?B?Q3Pza+FzLA==?= Bence <csokas.bence@prolan.hu>
Cc: Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <mripard@kernel.org>,
	dmaengine@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Vinod Koul <vkoul@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Subject: Re: [PATCH v4 03/10] dt-bindings: dmaengine: Add Allwinner suniv
 F1C100s DMA
Message-ID: <20241031181749.GA1260045-robh@kernel.org>
References: <20241031123538.2582675-1-csokas.bence@prolan.hu>
 <20241031123538.2582675-3-csokas.bence@prolan.hu>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241031123538.2582675-3-csokas.bence@prolan.hu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241031_111752_537580_3CFA62C5 
X-CRM114-Status: GOOD (  13.57  )
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

On Thu, Oct 31, 2024 at 01:35:29PM +0100, Csókás, Bence wrote:
> Add compatible string for Allwinner suniv F1C100s DMA.
> 
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Link: https://lore.kernel.org/linux-kernel/20241024-recycler-borrowing-5d4296fd4a56@spud/

You don't need a link to Conor's ack.

> [ csokas.bence: Reimplemented Mesih Kilinc's binding in YAML ]
> Signed-off-by: Csókás, Bence <csokas.bence@prolan.hu>
> ---
>  .../devicetree/bindings/dma/allwinner,sun4i-a10-dma.yaml      | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/dma/allwinner,sun4i-a10-dma.yaml b/Documentation/devicetree/bindings/dma/allwinner,sun4i-a10-dma.yaml
> index 02d5bd035409..9b5180c0a7c4 100644
> --- a/Documentation/devicetree/bindings/dma/allwinner,sun4i-a10-dma.yaml
> +++ b/Documentation/devicetree/bindings/dma/allwinner,sun4i-a10-dma.yaml
> @@ -22,7 +22,9 @@ properties:
>        number.
>  
>    compatible:
> -    const: allwinner,sun4i-a10-dma
> +    enum:
> +      - allwinner,sun4i-a10-dma
> +      - allwinner,suniv-f1c100s-dma
>  
>    reg:
>      maxItems: 1
> -- 
> 2.34.1
> 
> 

