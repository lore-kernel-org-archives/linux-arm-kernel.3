Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71B40C282D3
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 08:31:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DbT3kbkvRYQewJ9m4Dt4HSNebJM2mP9OrWAooH6MeQA=; b=TdoPtUH21MIDQX5DkNfRKXb6Dk
	YgLfn30oleAYuQMyZqdU1GXP8pUDIR52lXTvPqikte3tsJIx4GR2+2/aTmcO6FoYdnwgoPkhDKj6D
	+ah/2QZGMkrghgoT+PllONuIzrDPPmgobgslMNX6LdBmgLDsdrvQP4cMjmkAg8I4+cQ1yYi1vdS9u
	60pxSqCOq/IhJ1JiEj7r7DIIkaKTT4hYHg8znw2GDDIruzsyE6J2F+zLQ43qtDF2AjJvuRrhIO96U
	3bZsmiz5lulqul+GfnThgrSOtzdzOJlcFJYlXRYTfMxKiYDh/1R40XG4S7746XIHEoSDFLJ8V7JKF
	nUCbJ5xQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpNgU-00000003edJ-1W5x;
	Tue, 04 Mar 2025 08:31:26 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpNa2-00000003ciO-1XR6
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Mar 2025 08:24:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id EB7255C5439;
	Tue,  4 Mar 2025 08:22:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 965A7C4CEE9;
	Tue,  4 Mar 2025 08:24:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741076685;
	bh=TAw6fNcNSg7YEvEqtiZRQve5lHtjiupPT421lnC+KgY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FH1AGMd8G1LRCF9lw6vdX7tGzR5edBc4ZLYek88tB93kOeyrHhacKB0a5T4MF/1XJ
	 qLOnmf2SAi4ZGkCxli6zkzeK7pRgFyVrWk+ZO+L1FcwqiRFCUFDRCu82m+zFyoXzF0
	 zHumQyHi27uzUh6slpVEc4pV8rhJR6xhAx4E3d0Ld8Z6SSfgN5zWPyRlWHAGxhfP74
	 p4xXpRekD0Wb/i7AqnlldQWvGQWG2Fgrv9487/gmQQDwy79VhFZ/xBtzbjLLogl2yt
	 nNqRQ8TgMtMn5a1AnFPkgll67VwUgYJ95m+amQ+poVrtLFwq+Y6NqmA9+UyFJc1vk2
	 zMkxoqBrjSZaw==
Date: Tue, 4 Mar 2025 09:24:41 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 05/15] dt-bindings: clk: sunxi-ng: add compatible for
 the A523 PRCM-CCU
Message-ID: <20250304-rare-hyrax-of-criticism-1c7b12@krzk-bin>
References: <20250304012805.28594-1-andre.przywara@arm.com>
 <20250304012805.28594-6-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250304012805.28594-6-andre.przywara@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_002446_444928_209CB590 
X-CRM114-Status: GOOD (  18.62  )
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

On Tue, Mar 04, 2025 at 01:27:55AM +0000, Andre Przywara wrote:
> The Allwinner A523/T527 SoCs have four CCUs, this adds the binding for
> the PRCM R_CCU.
> 
> Add the new compatible string, along with the required input clock
> lists. There is now an extra input clock (PLL_AUDIO), so add this to the
> list of allowed clocks and required it for the A523 PRCM CCU.
> Also add the DT binding headers, listing all the clocks with their ID
> numbers.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---
>  .../clock/allwinner,sun55i-a523-ccu.yaml      | 23 +++++++++++-
>  include/dt-bindings/clock/sun55i-a523-r-ccu.h | 37 +++++++++++++++++++
>  include/dt-bindings/reset/sun55i-a523-r-ccu.h | 25 +++++++++++++
>  3 files changed, 83 insertions(+), 2 deletions(-)
>  create mode 100644 include/dt-bindings/clock/sun55i-a523-r-ccu.h
>  create mode 100644 include/dt-bindings/reset/sun55i-a523-r-ccu.h
> 
> diff --git a/Documentation/devicetree/bindings/clock/allwinner,sun55i-a523-ccu.yaml b/Documentation/devicetree/bindings/clock/allwinner,sun55i-a523-ccu.yaml
> index 2eacaeaeabac7..a64a35b423736 100644
> --- a/Documentation/devicetree/bindings/clock/allwinner,sun55i-a523-ccu.yaml
> +++ b/Documentation/devicetree/bindings/clock/allwinner,sun55i-a523-ccu.yaml
> @@ -19,17 +19,18 @@ properties:
>    compatible:
>      enum:
>        - allwinner,sun55i-a523-ccu
> +      - allwinner,sun55i-a523-r-ccu
>  
>    reg:
>      maxItems: 1
>  
>    clocks:
>      minItems: 4
> -    maxItems: 4
> +    maxItems: 5

You just added these lines in previous patch, so squash these and make a
complete binding in one patch.

Otherwise you will get comment like:

>  
>    clock-names:
>      minItems: 4

This is not supposed to be here in previous patch...

> -    maxItems: 4
> +    maxItems: 5

Best regards,
Krzysztof


