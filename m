Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CAC4C83F03
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Jul 2025 22:44:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kQ6yPJYUYT3xof6dZrMiEOZz0ejozEE0hvQXyJUsoSs=; b=K9onC5Q/J6TEbcTv+kjW+C7BGw
	i6+dp4Mo3C7Y+YPtSkn28Q3C7d/4zAJiCRkXPbkqnL4w/04o6lWl0EbZvwK5TI5PGNzcqRP4eWkvW
	WRrXNCP+zCLFL3T0rT54MaBQKIRVEq7TVQPsufW1Y3aaiF1DAEoZ3hy59uuVzOSgMzVfdu/tJ9TEz
	tFsXGO6un0nttzfyalCLI8MjUy5tGRpvE+yrb+G5+8OUhonKsmAVx8GC152VoiGl8MgH9OGxp26Cj
	5u4AXevtEIG9XtKXo8LB2Dzj/YpgAqr6sZ6YQsKgHBDBJsj14ICV7uMnnmjhm/rhhgeIF5oLjamqD
	9ZoS1KyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXp93-0000000Fcfg-2aGA;
	Fri, 04 Jul 2025 22:44:37 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXp6h-0000000FcQB-0QmI
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Jul 2025 22:42:12 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6B2BF1C0A;
	Fri,  4 Jul 2025 15:41:56 -0700 (PDT)
Received: from minigeek.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AC7763F63F;
	Fri,  4 Jul 2025 15:42:07 -0700 (PDT)
Date: Fri, 4 Jul 2025 23:40:40 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Paul Kocialkowski <paulk@sys-base.io>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, Andrew Lunn
 <andrew+netdev@lunn.ch>, "David S . Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo
 Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Chen-Yu
 Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel
 Holland <samuel@sholland.org>, Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 3/5] dt-bindings: net: sun8i-emac: Add A100 EMAC
 compatible
Message-ID: <20250704234040.5021c468@minigeek.lan>
In-Reply-To: <20250626080923.632789-4-paulk@sys-base.io>
References: <20250626080923.632789-1-paulk@sys-base.io>
	<20250626080923.632789-4-paulk@sys-base.io>
Organization: Arm Ltd.
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.31; x86_64-slackware-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250704_154211_191304_12FDC120 
X-CRM114-Status: GOOD (  17.58  )
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

On Thu, 26 Jun 2025 10:09:21 +0200
Paul Kocialkowski <paulk@sys-base.io> wrote:

Hi,

> The Allwinner A100/A133 has an Ethernet MAC (EMAC) controller that is
> compatible with the A64 one. It features the same syscon registers for
> control of the top-level integration of the unit.

As mentioned, the A133 has two Ethernet MACs on its die. Both look
compatible to the A64, but EMAC1 uses a separate syscon register
(@+0x34), so needs a separate compatible string for that one. We don't
seem to have an example of any board (or even SoC package) that uses
the 2nd EMAC, but I suggest to not slam the door on that possibility,
and use a name suffixed by "0": allwinner,sun50i-a100-emac0. There is
precedence for that in the H616 case.

Otherwise I can confirm that the EMAC is indeed compatible to the A64,
so with that fixed:

Reviewed-by: Andre Przywara <andre.przywara@arm.com>

Cheers,
Andre


> 
> Signed-off-by: Paul Kocialkowski <paulk@sys-base.io>
> ---
>  .../devicetree/bindings/net/allwinner,sun8i-a83t-emac.yaml       | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/net/allwinner,sun8i-a83t-emac.yaml b/Documentation/devicetree/bindings/net/allwinner,sun8i-a83t-emac.yaml
> index 7b6a2fde8175..0ae415f1e69c 100644
> --- a/Documentation/devicetree/bindings/net/allwinner,sun8i-a83t-emac.yaml
> +++ b/Documentation/devicetree/bindings/net/allwinner,sun8i-a83t-emac.yaml
> @@ -21,6 +21,7 @@ properties:
>        - items:
>            - enum:
>                - allwinner,sun20i-d1-emac
> +              - allwinner,sun50i-a100-emac
>                - allwinner,sun50i-h6-emac
>                - allwinner,sun50i-h616-emac0
>                - allwinner,sun55i-a523-emac0


