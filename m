Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABB80E77188
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Dec 2024 14:09:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1ose9tSE8yvsbvFIi2yn79f9i49/Qf0XcLiU/e1OScU=; b=0so+Spnvrg39ehJw8sS6P1eRfz
	LNJxHnwh0Ug7qdCSLV0UNASzyIxMXFlK179Mk7hd4cgjz5wVAWFtzxrxi85YbNL7g/XXOEpWLvWxD
	nwdcqgvo3izTwprDtTiL458WV7o6uULku7sPX64m/XO5d/qI8fUbEFHCdEDMd7rRpqOxdBMTQDQaF
	2wmj24wDBvTPH8l4Rkg801tdlVM1wvq3o8SIXByr97X76J2upxCSfDr9EVU0LHHIm+kBuM1+ohmDz
	E/sZyEV8JHaG3Jo6uZPYG83QVMfmwgFvU7EvdWdP8BPzWlUDjVQ4AILUp+sGzjR4wFJu428sxO99X
	4LDh9fWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tSGS2-00000005JzM-406b;
	Mon, 30 Dec 2024 14:08:58 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tSGQt-00000005Jt2-3ubz;
	Mon, 30 Dec 2024 14:07:49 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EDE42143D;
	Mon, 30 Dec 2024 06:08:11 -0800 (PST)
Received: from donnerap.manchester.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D758B3F59E;
	Mon, 30 Dec 2024 06:07:38 -0800 (PST)
Date: Mon, 30 Dec 2024 14:07:28 +0000
From: Andre Przywara <andre.przywara@arm.com>
To: Parthiban Nallathambi <parthiban@linumiz.com>
Cc: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, Robin
 Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Chen-Yu
 Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel
 Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Michael Turquette <mturquette@baylibre.com>, Stephen
 Boyd <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, Linus
 Walleij <linus.walleij@linaro.org>, Vinod Koul <vkoul@kernel.org>, Kishon
 Vijay Abraham I <kishon@kernel.org>, iommu@lists.linux.dev,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-clk@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-phy@lists.infradead.org
Subject: Re: [PATCH RESEND 04/22] dt-bindings: clock: sun8i de2 clock: Add
 a100/a133 compatible
Message-ID: <20241230140728.78629cd3@donnerap.manchester.arm.com>
In-Reply-To: <20241227-a133-display-support-v1-4-abad35b3579c@linumiz.com>
References: <20241227-a133-display-support-v1-0-abad35b3579c@linumiz.com>
	<20241227-a133-display-support-v1-4-abad35b3579c@linumiz.com>
Organization: ARM
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; aarch64-unknown-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241230_060748_053589_52FC3D2F 
X-CRM114-Status: GOOD (  19.78  )
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

On Fri, 27 Dec 2024 18:30:53 +0530
Parthiban Nallathambi <parthiban@linumiz.com> wrote:

Hi,

> A100/A133 uses one mixer without rotation support, which is same
> as sun8i v3s. Add it with fallback to v3s compatible.
> 
> Signed-off-by: Parthiban Nallathambi <parthiban@linumiz.com>
> ---
>  .../devicetree/bindings/clock/allwinner,sun8i-a83t-de2-clk.yaml       | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/clock/allwinner,sun8i-a83t-de2-clk.yaml b/Documentation/devicetree/bindings/clock/allwinner,sun8i-a83t-de2-clk.yaml
> index 3e00905b66ca..ed038967929b 100644
> --- a/Documentation/devicetree/bindings/clock/allwinner,sun8i-a83t-de2-clk.yaml
> +++ b/Documentation/devicetree/bindings/clock/allwinner,sun8i-a83t-de2-clk.yaml
> @@ -23,6 +23,7 @@ properties:
>        - const: allwinner,sun8i-h3-de2-clk
>        - const: allwinner,sun8i-v3s-de2-clk
>        - const: allwinner,sun50i-a64-de2-clk
> +      - const: allwinner,sun50i-a100-de2-clk
>        - const: allwinner,sun50i-h5-de2-clk
>        - const: allwinner,sun50i-h6-de3-clk
>        - items:
> @@ -31,6 +32,9 @@ properties:
>        - items:
>            - const: allwinner,sun20i-d1-de2-clk
>            - const: allwinner,sun50i-h5-de2-clk
> +      - items:
> +          - const: allwinner,sun50i-a100-de2-clk
> +          - const: allwinner,sun8i-v3s-de2-clk

Wait, does this add the same compatible string twice, once as a
standalone, once with a fallback? This doesn't look right.

If you positively know already about an incompatibility, just provide the
single string. If you suspect there *might* be something, use the fallback
version for now, and we can revisit that later.

Also please note that the semantics of the fallback is:
"Any driver supporting only the V3s can also support the A100 version of
the clock, as the new device is either fully compatible or a subset of the
old one."

So what would it be then here? The driver patch [16/22] suggests it's
compatible, but that might just cover the part that the Linux driver
implements? If it is compatible, you wouldn't need any change to the
driver code at all, the DT core code takes care of matching the driver
using the fallback.

Cheers,
Andre

>  
>    reg:
>      maxItems: 1
> 


