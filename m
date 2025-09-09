Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8ADBCA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 08:53:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p0QKUZR/RHMg6Am6FygWDCVl1JQhkWVjGfD3csu3Sq8=; b=CISR49D+BpvRnft6efzA1Z9ufX
	xwsqNzGmWb0RcBNNhDge0H/e4wFGw0pV+eTZKbtHV/YiDJybgqvbS2d4tmv+2eKmLmFQXVUELt5fx
	mZ69QrXt4cHG8mTQutszNAuySwaCoDQalF8x+gqLjMEhPmaC8l/yvtCEbeUjreoY4ptKEDCOaNQVF
	gaHmoJRnSksf7OqF8/pUCO+ykezjeJdkUjaoKqOWCmHx1sCqw+OeKX5BYBnRrNlyP2cFfRDGQHglI
	RLLD3mEhpUBi2WTUCkbkctYcLWlbbdozXxQ0QyZrmNt5oljeYBivolYAvInO9lMorUHYYTP/JYmhX
	70LBqlBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvu6R-00000005iAD-2yZc;
	Tue, 09 Sep 2025 08:53:27 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvsgk-0000000586J-1SdF;
	Tue, 09 Sep 2025 07:22:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id DB7C44421C;
	Tue,  9 Sep 2025 07:22:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3070AC4CEF8;
	Tue,  9 Sep 2025 07:22:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757402569;
	bh=o7ugIVkJo/aKAs4gBVOk2r95UE0mR+SIVxJvnGxthO8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EakU8L/Jq5POaXQsD0wfdo4YzZ/8nBG24jChwZwnvvp15g3V2xXZrgpmN0WZMiX6c
	 f5aXmEFo0VuZTs0dWH6UNww6ZlkDAX+Uwk+60HlOpjrKNKU9u/MK5nViQevDf3wctO
	 rQl+GLQ4QtgPokRfpsPy6y6EL+XvCk/PsSTUaema8dOt8oDZqyfVRC25TE79sS8yaj
	 3h9gq/Au7kJy2UitiT/RLUBchO6Vl+u5a0+i/uZsjBL4d4INVTPAmbXUsMu4erAWGN
	 encq7Xd3HnkYMYeUCgIw6gwaoxdXCOTJkaUgfXU6orTCe7i2Snb9woryfoqkWNUbAJ
	 Q3MxysQNGf/7w==
Date: Tue, 9 Sep 2025 09:22:47 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Kaison Deng <dkx@t-chip.com.cn>
Cc: Rob Herring <robh@kernel.org>, Jimmy Hon <honyuenkwun@gmail.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Wayne Chou <zxf@t-chip.com.cn>, 
	Quentin Schulz <quentin.schulz@cherry.de>, Dragan Simic <dsimic@manjaro.org>, 
	Jonas Karlman <jonas@kwiboo.se>, FUKAUMI Naoki <naoki@radxa.com>, 
	Peter Robinson <pbrobinson@gmail.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: arm: rockchip: Add Firefly
 ROC-RK3588-RT
Message-ID: <20250909-romantic-efficient-sambar-4fc38f@kuoka>
References: <cover.1757322046.git.dkx@t-chip.com.cn>
 <27b2ce7950fdbf28c6c8404c3f8be3c1c35d6b3c.1757322046.git.dkx@t-chip.com.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <27b2ce7950fdbf28c6c8404c3f8be3c1c35d6b3c.1757322046.git.dkx@t-chip.com.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_002250_411173_40CDDCA5 
X-CRM114-Status: GOOD (  13.71  )
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

On Tue, Sep 09, 2025 at 09:31:47AM +0800, Kaison Deng wrote:
> This documents Firefly ROC-RK3588-RT which is a SBC based on RK3588 SoC.
> 
> Link: https://en.t-firefly.com/product/industry/rocrk3588rt
> 
> Signed-off-by: Kaison Deng <dkx@t-chip.com.cn>
> ---
>  Documentation/devicetree/bindings/arm/rockchip.yaml | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
> index f9ee77f17ad7..6aceaa8acbb2 100644
> --- a/Documentation/devicetree/bindings/arm/rockchip.yaml
> +++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
> @@ -258,6 +258,11 @@ properties:
>            - const: firefly,roc-rk3576-pc
>            - const: rockchip,rk3576
>  
> +      - description: Firefly ROC-RK3588-RT
> +        items:
> +          - const: firefly,roc-rk3588-rt

That's just enum with ROC-RK3576-PC. BTW, all these descriptionis are
completely redundant. Actually getting harmful, because copy+paste of
the same is only obfuscating code.

Best regards,
Krzysztof


