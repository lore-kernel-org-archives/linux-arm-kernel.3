Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44DFEC021B8
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 08:33:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6U3xW6KGA45GadCYUOQf9uTOYOS5SGHDOkkRLxttvgU=; b=GaXOsc7jau9cqjp/7c9wf1Yc5L
	WHjRAGpfohjLQgDMX8K30BEaJtannZ3Dr/AVcnd+h0EDkd5P63k5iq5SM6R8gbyaYbqt39msD3MZC
	MvFmJbiMu3BH0+6+9P4r0Dv3eN5RH4mKqbeOwTEbBd070lnhpbiob1u2pZ4obmO/2Bqe4e+luxR1h
	y/xSOy5/iZGs3z0TiU2TrhzBSzWa5NJRvFpc3nKuTq9Xq181hgcPwnfXMZWZpW4EjoSwgEj2KoGOe
	fc3/N8ORC3UvWz5DKNl5gxm+bsrEY5shaQf4EXxHoxVOkYaBz1ZsKIrpPlmWn4BRNr3Va3Kt3eq5N
	D09prW1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpNi2-00000003f16-0OpD;
	Tue, 04 Mar 2025 08:33:02 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpNas-00000003cu8-0kTZ
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 04 Mar 2025 08:25:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=6U3xW6KGA45GadCYUOQf9uTOYOS5SGHDOkkRLxttvgU=; b=mif7fxcwU+AA1f1sdqj7kPJTxI
	iGUeQnqVfGYkeTc/84OYqpnJoKwh6XduC2XMTxyHDjZVaHZFyEuEuoKvXeBYQM5iX/9Tw6yOm0QuK
	rLn9JhCNNAg2Stj4AXgJcs+gEbanAA+shI0vaZHO2G1tQDB/YAHTYREGG5YPmJdymfyDOsrrft5sB
	0+Pcz/Eoy7OBmNsJjbVuMvsHx7fDvLTiY0p15pxnYuMYUKAGj90eTjVkF3GeT2C0V3V3MAobwC5Th
	F4QFvT5QQZ+gcx/fkJST5MFb9zoZA8IUfeoztOG/xWryfd8y3srUd3C+7SLzoEWyOdUhMNE/HMORi
	RF3tgrhw==;
Received: from nyc.source.kernel.org ([147.75.193.91])
	by casper.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpNap-00000000R9t-0IkX
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Mar 2025 08:25:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 4B20AA45343;
	Tue,  4 Mar 2025 08:19:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F116BC4CEE5;
	Tue,  4 Mar 2025 08:25:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741076727;
	bh=EjG1Ayc6WOrjJoENYUK2AAQIO5stxQf7QR9qv10BbjU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PpDGT4pl9OvTRcB3fq/ZOwLw8spKntrGFEwzLqPphNVifkDf/CruyEbhZQHgk/2P2
	 OaO/XH8YBr7vXXUzzAXb9MCxHwhS3Gv6Lw96scmHOli+H3nQsIXZDQDGC9W3emPS3N
	 nY3Dit1FlyI7es4f9fPs1wsEjQbPiYY11PCcNL82Y5z3/khVERpMwEhADig/jJn80Q
	 vxoAqgpGd+J/JtYDXZxRHPHA6yhMPJnjnhv1xxRiF8rjLhR7Ykgb7/Uf0tznDN5Gph
	 VGcFHF5LGIIO9dp4qig6fzhiykzDqDLh2TTUyPQxfH7e7pYRq0jETxtmR9wLg1j4SA
	 C5CHMLvKvr0yQ==
Date: Tue, 4 Mar 2025 09:25:24 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 04/15] dt-bindings: clk: sunxi-ng: document Allwinner
 A523 CCU
Message-ID: <20250304-resilient-spiritual-crane-30d4e1@krzk-bin>
References: <20250304012805.28594-1-andre.przywara@arm.com>
 <20250304012805.28594-5-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250304012805.28594-5-andre.przywara@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_082535_321086_F4C6F724 
X-CRM114-Status: GOOD (  16.83  )
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

On Tue, Mar 04, 2025 at 01:27:54AM +0000, Andre Przywara wrote:
> The Allwinner A523/T527 SoCs have four CCUs, this adds the binding for
> the main CCU.
> 
> The source clock list differs in some annoying details, and folding this
> into the existing Allwinner CCU clock binding document gets quite
> unwieldy, so create a new document for these CCUs.
> Add the new compatible string, along with the required input clock
> lists. This conditionally describes the input clock list, to make for
> an easier patch adding the other CCUs.
> 
> Also add the DT binding headers, listing all the clocks with their ID
> numbers.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---
>  .../clock/allwinner,sun55i-a523-ccu.yaml      |  77 +++++++
>  include/dt-bindings/clock/sun55i-a523-ccu.h   | 189 ++++++++++++++++++
>  include/dt-bindings/reset/sun55i-a523-ccu.h   |  88 ++++++++
>  3 files changed, 354 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/allwinner,sun55i-a523-ccu.yaml
>  create mode 100644 include/dt-bindings/clock/sun55i-a523-ccu.h
>  create mode 100644 include/dt-bindings/reset/sun55i-a523-ccu.h
> 
> diff --git a/Documentation/devicetree/bindings/clock/allwinner,sun55i-a523-ccu.yaml b/Documentation/devicetree/bindings/clock/allwinner,sun55i-a523-ccu.yaml
> new file mode 100644
> index 0000000000000..2eacaeaeabac7
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/allwinner,sun55i-a523-ccu.yaml
> @@ -0,0 +1,77 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/allwinner,sun55i-a523-ccu.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Allwinner A523 Clock Control Unit
> +
> +maintainers:
> +  - Andre Przywara <andre.przywara@arm.com>
> +
> +properties:
> +  "#clock-cells":
> +    const: 1
> +
> +  "#reset-cells":
> +    const: 1
> +
> +  compatible:
> +    enum:
> +      - allwinner,sun55i-a523-ccu
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    minItems: 4

Drop, redundant.

> +    maxItems: 4
> +
> +  clock-names:
> +    minItems: 4
> +    maxItems: 4

Drop both and instead you need to list the items.

> +
> +required:
> +  - "#clock-cells"
> +  - "#reset-cells"
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +
> +if:

Drop, you have here only one device, no need for if:then.

Best regards,
Krzysztof


