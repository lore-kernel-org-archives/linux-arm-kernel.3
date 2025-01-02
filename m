Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 893C7E77197
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jan 2025 21:54:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kv/gaN2ne5N2HIabakoKw/7lqdyiocEiEUp1K7PN3Qs=; b=GB0kC3KCpUNrjfJfGMrU0I0w3m
	HhLpxlsgsNX1Seegy94FFrXITy5qyEI2caeJxSYG6WxZu+vk23IZgK4ynyYO9QIMK83NLRSnl9O9w
	XYPwC0lOUbJZKw3qKnt71RwTIxpZbVOa5RSeFyJNa0stc9s4OlN+LFt8S7Tk38+pOG/xtHmVFXE+Z
	ojP4vkDnpPdp6rDWZYsooWZN+A4a8qYLStm6FvjHPC8tF68ReJNvswzWNjZ+4cHILTdDYJ7jvOa3Y
	MMZIWVFNYuJjv+jfyVGHbJhNTb/nNLumwY9bXsJfY6RsklUPmYUs+CcZ0Yhw7NzfVSJNCGyvEJl8y
	KzEeYxgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTT95-0000000BXxu-35nL;
	Thu, 02 Jan 2025 21:54:23 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTT7w-0000000BXtr-2bK4;
	Thu, 02 Jan 2025 21:53:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 73E1DA415D1;
	Thu,  2 Jan 2025 21:51:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EAFAEC4CED0;
	Thu,  2 Jan 2025 21:53:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735854791;
	bh=LKTc6/sATowwzTd72kbpfKRHreyAr4MLhR803zIVUD4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ko9Xe3+c2+oYnvo3KrLpFiKWwx5Teb2uSAo0DPzjtK6QNGW33BiFdLbWezqBGGAvq
	 CODqugAzl6lZzIB7HtZxVRoNiGUvBEgIiMMJQzediAOM2OgdB6c4reLyl0tq8e2LSS
	 MOdlZx6Djz2COKShZ8dHo4prMZCpgQkY2IrD+daSgE55S1U3pZ7gudZfW1oq3GjLoE
	 9kt5cctJ4GHt1hUm4HEgTbF88Z8GPFs/D1AWJzlqh/EiWKpdZunhF26vD32l6egRLK
	 cN1mkfZhvZWMvZ5kMSQfvQa1cziwtBsQVCbaxa84dZddTflz1cqtl3yK6ICFQ7wuE4
	 8prn0mt2mUSGw==
Date: Thu, 2 Jan 2025 15:53:08 -0600
From: Rob Herring <robh@kernel.org>
To: Jimmy Hon <honyuenkwun@gmail.com>
Cc: Heiko Stuebner <heiko@sntech.de>, Ondrej Jirman <megi@xff.cz>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: Re: [RFC 4/7] dt-bindings: arm: rockchip: Add Xunlong Orange Pi 5
 Ultra
Message-ID: <20250102215308.GA636148-robh@kernel.org>
References: <20241229184256.1870-2-honyuenkwun@gmail.com>
 <20241229184256.1870-8-honyuenkwun@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241229184256.1870-8-honyuenkwun@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250102_135312_719598_8B85BDFA 
X-CRM114-Status: GOOD (  16.59  )
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

On Sun, Dec 29, 2024 at 12:41:31PM -0600, Jimmy Hon wrote:
> Add devicetree binding for the Xunlong Orange Pi 5 Ultra board.

Why RFC? Looks fine to me.

However, you should have 'v4' on every patch in the series if this is 
v4.

> 
> The Orange Pi 5 Ultra is a single board computer powered by the Rockchip
> RK3588 with similar board layout as the 5 Max but with the HDMI0 swapped
> for HDMI IN.
> 
> Signed-off-by: Jimmy Hon <honyuenkwun@gmail.com>
> ---
>  Documentation/devicetree/bindings/arm/rockchip.yaml | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
> index 2a141d99c533..9dd424265826 100644
> --- a/Documentation/devicetree/bindings/arm/rockchip.yaml
> +++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
> @@ -1075,11 +1075,12 @@ properties:
>            - const: xunlong,orangepi-3b
>            - const: rockchip,rk3566
>  
> -      - description: Xunlong Orange Pi 5 Max/Plus
> +      - description: Xunlong Orange Pi 5 Max/Plus/Ultra
>          items:
>            - enum:
>                - xunlong,orangepi-5-max
>                - xunlong,orangepi-5-plus
> +              - xunlong,orangepi-5-ultra
>            - const: rockchip,rk3588
>  
>        - description: Xunlong Orange Pi R1 Plus / LTS
> -- 
> 2.47.1
> 

