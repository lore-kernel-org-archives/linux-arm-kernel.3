Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E580BC0218F
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  2 Feb 2025 14:01:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4FLDSEYAG/gfMFfhnDYUv88ck+vE5i8SXA7uTUmKNGc=; b=ONItS+/LG6TYzyhE67jZd9xJ8x
	C7iXW6klH8L9/GQ4yEkRVMFTv9e9i+45VDqxrO1VrenaPIKEH/El/kaxOsjkyPNx87ujHCKlHlDJ2
	bvxrk5lv4OKtRcGYFlTNCI1Ew6qYaiSppJfvExlxzl/auU+cMzpm9MEYBdNS907M3pXlm8fom3G7e
	QSLduoWcflTlBWwNwGDGmgbxJb4zMZeQ3N4JPXPJuwdMvBrT2cCuVEV0gS7WAxyHiYzhrEEKHc8nV
	ieHJZpuWQE5J5kqGz2uRCJ/yXTvsJ5HNgdIvjZOrbYBvHCpZRTFAcfHX+ZbbRo4B2Zq0Mph4aVvj6
	ZjfBA7kQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1teaXj-0000000Dq6q-49mS;
	Sun, 02 Feb 2025 14:01:48 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1teaWR-0000000Dq2B-11oQ
	for linux-arm-kernel@lists.infradead.org;
	Sun, 02 Feb 2025 14:00:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B421E5C6077;
	Sun,  2 Feb 2025 13:59:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9FCB6C4CEE0;
	Sun,  2 Feb 2025 14:00:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738504826;
	bh=DzXPrddsd4/HbbCoDn4tV8Jh6qWf2J/+UIS1+YGvWRw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ux7XG2JY1yFhXPOjhSFRAGl71XuD+jOnSkt48yjYzqkvJcpFu5jYLWMs3mphJCzY8
	 Dc1RBihb5PwpJa9Q5zMitb2KB4D1JRdM60QaD8c9SM6lDEEGMxbg7p7jPIzBp5/EBB
	 EmnLX+yZB1bOP/PvcuOwD82ej+g8BEsFDbxjTXHYiLBZLXrlcR4q3AFScAxNX7YpWM
	 IgND4zHpyMCLRdwv/xyWhyVnJD4+ciC0SnoFTZAGTs5cgMI6HF+oXKLjW3+QRhoNQs
	 D6aUT4b+bQVggR56YoOkzKzErzF595ldroM+hUWJecTwQMopZjgDBoN8gSN+GSfWQo
	 5x9ADaH81cobw==
Date: Sun, 2 Feb 2025 15:00:23 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: Re: [PATCH] dt-bindings: clocks: atmel,at91rm9200-pmc: add missing
 compatibles
Message-ID: <20250202-fragrant-radical-fulmar-77ccae@krzk-bin>
References: <20250131162845.33637-2-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250131162845.33637-2-wsa+renesas@sang-engineering.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250202_060027_332912_98C0D5A8 
X-CRM114-Status: GOOD (  12.85  )
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
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Alexandre Belloni <alexandre.belloni@bootlin.com>, devicetree@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Fri, Jan 31, 2025 at 05:28:45PM +0100, Wolfram Sang wrote:
> The driver support more SoCs. Add the missing ones.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>  .../devicetree/bindings/clock/atmel,at91rm9200-pmc.yaml         | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/clock/atmel,at91rm9200-pmc.yaml b/Documentation/devicetree/bindings/clock/atmel,at91rm9200-pmc.yaml
> index 885d47dd5724..8b65390d2d54 100644
> --- a/Documentation/devicetree/bindings/clock/atmel,at91rm9200-pmc.yaml
> +++ b/Documentation/devicetree/bindings/clock/atmel,at91rm9200-pmc.yaml
> @@ -34,6 +34,8 @@ properties:
>            - enum:
>                - atmel,at91rm9200-pmc
>                - atmel,at91sam9260-pmc
> +              - atmel,at91sam9261-pmc
> +              - atmel,at91sam9263-pmc
>                - atmel,at91sam9g45-pmc
>                - atmel,at91sam9n12-pmc

Please update also respective if:then: part with constraint for clocks.

Best regards,
Krzysztof


