Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44ACFE68955
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Oct 2024 11:38:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZuWrsLJtPcmZQ9woEaoazqyXauP/qZYvFRoBoc86F4g=; b=V5aqx5lz1YkVom/MehbwqQvm9W
	8IiCk4yX5DW6yIqv2pndIv9BhW7Qrg9bRpC3nTxMoGld3FHV5Q5ompjLMJU4pox0TtBUQPPZfMz3I
	1wAY9gZY77t9+cOIOkBk4zj7f0m2v4LjGzinXdvdtK0Qvj7yWlpgbrSB8KW7uolBWRvpn0yyNBhoh
	W8AHby2RH68DY/VQJL3B33vq3juHY+aEBzzMa2pmlRgantyPja46XlUKJdU7Lunq02ZM4UVF8noAD
	M1LpqquSS3J4Bk6Z+DaI8T56za593FaEt/xc7Eytgus4/mNefsIO0m+yqxVizJOT4Hl3q5/7nMF21
	SaSns9Gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6TVi-00000003PiO-09UL;
	Thu, 31 Oct 2024 11:38:42 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6TU3-00000003PPj-1A3O;
	Thu, 31 Oct 2024 11:37:00 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D78D11063;
	Thu, 31 Oct 2024 04:37:27 -0700 (PDT)
Received: from donnerap.manchester.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 276883F73B;
	Thu, 31 Oct 2024 04:36:54 -0700 (PDT)
Date: Thu, 31 Oct 2024 11:36:51 +0000
From: Andre Przywara <andre.przywara@arm.com>
To: Cody Eksal <masterr3c0rd@epochal.quest>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I
 <kishon@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai
 <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland
 <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, Michael Turquette
 <mturquette@baylibre.com>, Nishanth Menon <nm@ti.com>, "Rafael J. Wysocki"
 <rafael@kernel.org>, Stephen Boyd <sboyd@kernel.org>, Viresh Kumar
 <vireshk@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>, Yangtao Li
 <tiny.windzz@gmail.com>, Parthiban <parthiban@linumiz.com>,
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 03/13] dt-bindings: phy: sun50i-a64: add a100
 compatible
Message-ID: <20241031113651.4ab4f8c7@donnerap.manchester.arm.com>
In-Reply-To: <20241031070232.1793078-4-masterr3c0rd@epochal.quest>
References: <20241031070232.1793078-1-masterr3c0rd@epochal.quest>
	<20241031070232.1793078-4-masterr3c0rd@epochal.quest>
Organization: ARM
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; aarch64-unknown-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241031_043659_416669_B1124E63 
X-CRM114-Status: GOOD (  16.14  )
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

On Thu, 31 Oct 2024 04:02:16 -0300
Cody Eksal <masterr3c0rd@epochal.quest> wrote:

> The USB PHY found in the A100 is similar to that found in the D1. Add a
> compatible for the A100.
> 
> Signed-off-by: Cody Eksal <masterr3c0rd@epochal.quest>

Reviewed-by: Andre Przywara <andre.przywara@arm.com>

> Acked-by: Rob Herring (Arm) <robh@kernel.org>

Careful with that: you made quite some changes compared to v1, which Rob
ACKed, so I wouldn't carry over his tag here.

Cheers,
Andre

> ---
> Changes in V2:
>  - Update binding to allow using the D1 as a compatible.
> 
>  .../bindings/phy/allwinner,sun50i-a64-usb-phy.yaml     | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/phy/allwinner,sun50i-a64-usb-phy.yaml b/Documentation/devicetree/bindings/phy/allwinner,sun50i-a64-usb-phy.yaml
> index f557feca9763..21209126ed00 100644
> --- a/Documentation/devicetree/bindings/phy/allwinner,sun50i-a64-usb-phy.yaml
> +++ b/Documentation/devicetree/bindings/phy/allwinner,sun50i-a64-usb-phy.yaml
> @@ -15,9 +15,13 @@ properties:
>      const: 1
>  
>    compatible:
> -    enum:
> -      - allwinner,sun20i-d1-usb-phy
> -      - allwinner,sun50i-a64-usb-phy
> +    oneOf:
> +      - enum:
> +          - allwinner,sun20i-d1-usb-phy
> +          - allwinner,sun50i-a64-usb-phy
> +      - items:
> +          - const: allwinner,sun50i-a100-usb-phy
> +          - const: allwinner,sun20i-d1-usb-phy
>  
>    reg:
>      items:


