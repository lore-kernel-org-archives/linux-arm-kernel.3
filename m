Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20D2CC43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jul 2026 06:24:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XBY9rp8EKn144/cyQOvwrADc4v44FFdbbkw6wB5GINE=; b=iT93DVOdf0CE1x1lrN5MDZ53ki
	2syYceBJjKygHMeAVkx7hBIc4bxiQ9EJWdFbX9PL2hOqisE0aLlOmudyg8eAN/z1av/qzK5SrgkD9
	tkyscMPh/exieqG7TIVjDFnlzrS1+kOLtnVPCxUgJh2R01GW/1qT1zhuYj9yhTGKkpFrGOO1CjsaG
	9VJm4LQ2aC+syncEN/MBgOg04mUw57u/hSpL+smxdXSp/ByxjAdZsLVTuqbeFmRho7bnudn8tzylK
	TziGBBIAILZJH/EUK3nyjBj6r837huvpncPTEE8ubwRxio3SVoBHPkPkWzpAKIg4KAQt52KgMUYgd
	JmdQHOtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfAq3-00000003dtQ-0FCv;
	Thu, 02 Jul 2026 06:23:55 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfAq1-00000003dtD-19OF;
	Thu, 02 Jul 2026 06:23:53 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 98FBB40B11;
	Thu,  2 Jul 2026 06:23:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2A461F00A3A;
	Thu,  2 Jul 2026 06:23:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782973432;
	bh=XBY9rp8EKn144/cyQOvwrADc4v44FFdbbkw6wB5GINE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=PIY+TDJ9mIq+2AAkVUcRIH3+kgPxcQ19xY0Vy6FujkiGNDF8Ycrm1OolKflvB1fV3
	 dR7OXB5XdaKe1mabHIfTkhmDGLGDwqtxRG1GD2tCJUeMSuPkYARraNDvTuBK372hjy
	 lzcpiUVmRhNAvJZx40iq1fkzFpDWUYde3P/ZzFI0PLMp4x+HoQz/vDHC9AvMIgwtXw
	 zuYqqfPT1990a7f1Tp2d/v4F0oFKkB7VuItO0DeWilhJghQKgpuFzhO2UQlk/h7ber
	 lMy6QcuplEePpZAolAYBFEGuYFFZ3weDRUU3kJ2EWNvt+uASb4NzjKLUlunCWkLF8f
	 7IjInO1PavoxQ==
Date: Thu, 2 Jul 2026 08:23:48 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Gokul Praveen <g-praveen@ti.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, krzk+dt@kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, 
	neil.armstrong@linaro.org, nm@ti.com, robh@kernel.org, sjakhade@cadence.com, 
	kristo@kernel.org, vigneshr@ti.com, vkoul@kernel.org, yamonkar@cadence.com
Subject: Re: [PATCH v4 net-next 1/2] dt-bindings: phy: cadence-torrent:
 Update property values to support 3 clocks
Message-ID: <20260702-vigilant-tody-of-inquire-ffbede@quoll>
References: <20260701142457.81874-1-g-praveen@ti.com>
 <20260701142457.81874-2-g-praveen@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260701142457.81874-2-g-praveen@ti.com>
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

On Wed, Jul 01, 2026 at 07:54:56PM +0530, Gokul Praveen wrote:
> Update maxItems value of "clocks" property to 3 as description of
> this parameter already indicates 3 clocks(refclk,pll1_refclk(optional)
> and phy_en_refclk(optional)).

But what if description is wrong? You need to provide rationale why you
are doing it and you cannot use existing code alone as that rationale,
because as you pointed out - existing code is not fully correct.

> 
> Update the maxItems and items value of "clock-names" property with multiple
> combination of clock-names possible since pll1_refclk and phy_en_refclk are
> optional clocks.

Why? You need to describe why you are doing this, not what you are
doing.

> 
> Signed-off-by: Gokul Praveen <g-praveen@ti.com>
> ---
>  .../bindings/phy/phy-cadence-torrent.yaml        | 16 ++++++++++++----
>  1 file changed, 12 insertions(+), 4 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/phy/phy-cadence-torrent.yaml b/Documentation/devicetree/bindings/phy/phy-cadence-torrent.yaml
> index 9af39b33646a..96c664d50629 100644
> --- a/Documentation/devicetree/bindings/phy/phy-cadence-torrent.yaml
> +++ b/Documentation/devicetree/bindings/phy/phy-cadence-torrent.yaml
> @@ -34,7 +34,7 @@ properties:
>  
>    clocks:
>      minItems: 1
> -    maxItems: 2
> +    maxItems: 3
>      description:
>        PHY input reference clocks - refclk (for PLL0) & pll1_refclk (for PLL1).
>        pll1_refclk is optional and used for multi-protocol configurations requiring
> @@ -45,9 +45,17 @@ properties:
>  
>    clock-names:
>      minItems: 1
> -    items:
> -      - const: refclk
> -      - enum: [ pll1_refclk, phy_en_refclk ]
> +    maxItems: 3

Drop

> +    oneOf:
> +      - items:
> +          - const: refclk
> +      - items:
> +          - const: refclk
> +          - enum: [ pll1_refclk, phy_en_refclk ]

Drop these, pointless. You were supposed to grow existing syntax.

> +      - items:
> +          - const: refclk
> +          - const: pll1_refclk

So here is the enum.

> +          - const: phy_en_refclk

And this stays.

You make changes which do not make the binding better and are not
explained in commit msg. Focus on WHY you are doing things and also
explain WHY you did such complicated syntax (if you insist on rewriting
correct code into something odd we do not expect).

Best regards,
Krzysztof


