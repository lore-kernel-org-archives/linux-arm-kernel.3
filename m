Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36ADFC83F0F
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Jul 2025 09:28:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g6RyLnBoNpd7l3Wni2Uxw8Gsh0cZjWWCzcezP1JxfIg=; b=x8COUV3ac7QA7uOJZR8VnCyOo7
	DMA6RPsA93xp7HCTjEXTCIYrnCyLvexJMWQqykik7sdsz5r21rVL7o5QeQde0cz1d2eSwYtMs2L6k
	DE0uQcxu4vLfs+66j66Kllb/RUXYW+s/wSZGa8mmCzI6GsF7MCGhrK3B1QIeY2BnHXQEH0iztLetO
	ywVWTSnWLyRFYUeZBYg8DRK9CdqF9eggCqgxX+OpraCBBbMLALwGov8h2T42qvpmJrAFh3jYuAI/P
	8zE4QmvY8yQ0Y5lXiamH4TUHCpoj/RJttx8wdimM5Ya/stBFabs5Y7QsNOMemGuyHcnl7XF8+yRaW
	LJ3XfOLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ4ce-00000004tK7-3rHO;
	Tue, 08 Jul 2025 09:28:20 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ3zB-00000004nG3-32LH
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Jul 2025 08:47:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1263444F78;
	Tue,  8 Jul 2025 08:47:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66B14C4CEED;
	Tue,  8 Jul 2025 08:47:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751964452;
	bh=k+zfhW6ZJvXzA7urDGHSqxbfp1IKiol29GpPHOu53ik=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LhBy+/LRHkzOMGB2nHTqWWpOZ7AE7/BhmnFLXpVu8tCkHu7cHPUjaH292KTDHLqQp
	 4dI/1IpKz1xBP0EP1V+0BnsZzJJ9OA5SMVXJTWHfpH+/3LDTcT4icA0thJbNb0Mx3C
	 HKr0SxKXFpiUTo7NpMHgI+jBzoKl9gcXdUbM/jKU1GHte1SOqkafxr2IIRdBmatcPL
	 8yXUjgbJfYY5qsmOPlLC9Nbo8Rvv5RmQJjCAjJXve7p7lXPiqeLFB/JnzPWetTsCPH
	 QmuLXJKO6rVq2VWpZRVPXkuZD63veHbNwxVkarHCh/q/oR/zWhSVJiYLGl0QbnXBQ4
	 V1saidESCzsSA==
Date: Tue, 8 Jul 2025 10:47:30 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Chen-Yu Tsai <wens@kernel.org>
Cc: Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej@kernel.org>, 
	Samuel Holland <samuel@sholland.org>, Ulf Hansson <ulf.hansson@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Andre Przywara <andre.przywara@arm.com>, 
	linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
Subject: Re: [PATCH 1/4] dt-bindings: power: Add A523 PPU and PCK600 power
 controllers
Message-ID: <20250708-capable-caiman-of-feminism-9dfef2@krzk-bin>
References: <20250627152918.2606728-1-wens@kernel.org>
 <20250627152918.2606728-2-wens@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250627152918.2606728-2-wens@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_014733_816361_523E140C 
X-CRM114-Status: GOOD (  20.70  )
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

On Fri, Jun 27, 2025 at 11:29:15PM +0800, Chen-Yu Tsai wrote:
> From: Chen-Yu Tsai <wens@csie.org>
> 
> The A523 PPU is likely the same kind of hardware seen on previous SoCs.
> 
> The A523 PCK600, as the name suggests, is likely a customized version
> of ARM's PCK-600 power controller. Comparing the BSP driver against
> ARM's PPU datasheet shows that the basic registers line up, but
> Allwinner's hardware has some additional delay controls in the reserved
> register range. As such it is likely not fully compatible with the
> standard ARM version.
> 
> Document A523 PPU and PCK600 compatibles.
> 
> Signed-off-by: Chen-Yu Tsai <wens@csie.org>
> ---
>  .../bindings/power/allwinner,sun20i-d1-ppu.yaml   |  2 ++
>  .../power/allwinner,sun55i-a523-pck600.h          | 15 +++++++++++++++
>  .../dt-bindings/power/allwinner,sun55i-a523-ppu.h | 12 ++++++++++++
>  3 files changed, 29 insertions(+)
>  create mode 100644 include/dt-bindings/power/allwinner,sun55i-a523-pck600.h
>  create mode 100644 include/dt-bindings/power/allwinner,sun55i-a523-ppu.h
> 
> diff --git a/Documentation/devicetree/bindings/power/allwinner,sun20i-d1-ppu.yaml b/Documentation/devicetree/bindings/power/allwinner,sun20i-d1-ppu.yaml
> index f578be6a3bc8..b9f550994512 100644
> --- a/Documentation/devicetree/bindings/power/allwinner,sun20i-d1-ppu.yaml
> +++ b/Documentation/devicetree/bindings/power/allwinner,sun20i-d1-ppu.yaml
> @@ -18,6 +18,8 @@ properties:
>      enum:
>        - allwinner,sun20i-d1-ppu
>        - allwinner,sun8i-v853-ppu
> +      - allwinner,sun55i-a523-ppu
> +      - allwinner,sun55i-a523-pck-600

Don't add items at the end, but placed in alphabetical order. Could be
natural sort if you insist, but binding does not use it.

>  
>    reg:
>      maxItems: 1
> diff --git a/include/dt-bindings/power/allwinner,sun55i-a523-pck600.h b/include/dt-bindings/power/allwinner,sun55i-a523-pck600.h
> new file mode 100644
> index 000000000000..6b3d8ea7bb69
> --- /dev/null
> +++ b/include/dt-bindings/power/allwinner,sun55i-a523-pck600.h

Filename matching compatible (which ever one is correct).

Best regards,
Krzysztof


