Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC3E6CD6E4A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 May 2026 10:44:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ah0BAmd+lwHuZO6zRBiL0+MEQYrEVAKIQyjvoixgNRI=; b=dUm8eRZfywbKsO+wl/1/4fQWWd
	wacWMRuY9JotaD87oEmSGLWx6N5QlrX6eLaw2gi6G9+SCvUOXVTK17Mu0ugAEw2yeZVvz+hVlFGix
	gY8xQ6KwvWXKHxdsKGD30Wdg/SQcHUYn62WEjMtftwEETsK77eMsOSk0M42rT3/fhcJbRwRtrXS/F
	4Eyy/nF9KgXwNaNqyh7SyVPv1vVbNADqgMsA968B6F2kTrk9VjHyw71NSQbMlz8kUwDVqUZL617iK
	LWCX0HizPoYE63xj24NrLfAzmIeb2fkKlBRoGE4zisRl6hcu9+MmHQS/ncW0ksHGSCBg4u0kSZW2q
	BkIgY+kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTHBT-00000008eDl-0vLp;
	Sat, 30 May 2026 10:44:51 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTHBS-00000008eDa-15Eg;
	Sat, 30 May 2026 10:44:50 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 5FCE1600BB;
	Sat, 30 May 2026 10:44:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81BC41F00893;
	Sat, 30 May 2026 10:44:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780137889;
	bh=Ah0BAmd+lwHuZO6zRBiL0+MEQYrEVAKIQyjvoixgNRI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=c/Mwva5Hzm5FVkloKcxpDPjbejs7gN/gCXj04ZWIkg4crNYrhY5SkWrpmG1XHjKLH
	 qvCFZq10iibjzf7jSgKqQFJCWC1k55O4CVETgqY0IEYrFg5+gvmh8T0YrOQPsfkYyy
	 kyIGnovk2EbYY4BZZTiUhEL7gYUFYVlIW7r3C2xYDXfK4L9GrUXVMPDMj6YYe8rYcR
	 wyz8uTDD16ZMGu6f+QkNa+N94p8+egLsOVdqcWWEyoDLo17hKQI1qyVFbfUj1zXhJj
	 NVzqWz8o6VTYjadhwKUzBTrep3hP1QLVy0Lris/dT790L+Qz4KIFiCL7gTNHteglom
	 X0ZTBGk6NIMdA==
Date: Sat, 30 May 2026 12:44:46 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: phucduc.bui@gmail.com
Cc: broonie@kernel.org, lgirdwood@gmail.com, perex@perex.cz, 
	tiwai@suse.com, heiko@sntech.de, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	devicetree@vger.kernel.org
Subject: Re: [PATCH 1/3] ASoC: dt-bindings: rockchip-spdif: Correct SPDIF
 clock descriptions
Message-ID: <20260530-adventurous-basilisk-of-happiness-def6fa@quoll>
References: <20260522100318.73474-1-phucduc.bui@gmail.com>
 <20260522100318.73474-2-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260522100318.73474-2-phucduc.bui@gmail.com>
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

On Fri, May 22, 2026 at 05:03:16PM +0700, phucduc.bui@gmail.com wrote:
> From: bui duc phuc <phucduc.bui@gmail.com>
> 
> The clock descriptions are currently swapped relative to the
> clock names used by the driver.

Why would order of clock names in the driver matter here? I do not
understand that explanation.

> 
> Update the binding descriptions to match the actual clock
> usage, where 'mclk' is the controller clock and 'hclk' is
> the bus clock.

Please wrap commit message according to Linux coding style / submission
process (neither too early nor over the limit):
https://elixir.bootlin.com/linux/v6.4-rc1/source/Documentation/process/submitting-patches.rst#L597

> 
> Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
> ---
>  Documentation/devicetree/bindings/sound/rockchip-spdif.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/sound/rockchip-spdif.yaml b/Documentation/devicetree/bindings/sound/rockchip-spdif.yaml
> index 502907dd28b3..b174d7498029 100644
> --- a/Documentation/devicetree/bindings/sound/rockchip-spdif.yaml
> +++ b/Documentation/devicetree/bindings/sound/rockchip-spdif.yaml
> @@ -45,8 +45,8 @@ properties:
>  
>    clocks:
>      items:
> -      - description: clock for SPDIF bus
>        - description: clock for SPDIF controller
> +      - description: clock for SPDIF bus

So example is wrong?

What about all the users?

Best regards,
Krzysztof


