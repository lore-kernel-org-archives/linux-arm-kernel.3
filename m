Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82815C5CFDB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Aug 2026 08:18:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6lKhAtdX6ajxLRq78OZCtHKqt/EMngZfRfG821+Ysrs=; b=igvuOrQaMO7e8r1eSC1Ez91Ndx
	EKlCXlgiZsGsPnDek8WmDFl6+ANNCgcb5CHKNUxe18v6w6aYs5F50uW+Y5q0A+tqe4iFg+gW04H1E
	aivamT7TDUe7EsWzE9lrK4OxmBJ5kGWmwga020xZb6wC/RoX50UDeFlmhuBmlJx4yH2C6K460GGzA
	laseGC+T1kkAKITy9mLOSImdVqD7B0/iImWKRV4IkwMTWTbWlSgRVnl+kADVV9EKYDRjwh25egxI7
	2Q9fBmCiZWkGi6la24o0wXodQWZlf+gdfQo4Kg9aIWc63dsj2xrX/gcl/k8yWeP8l13rf5UY6kjfX
	6dYB6JDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuQe3-000000006yi-2XIJ;
	Thu, 13 Aug 2026 08:18:35 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuQe1-000000006yJ-3cSe
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Aug 2026 08:18:33 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 5D9894128B;
	Thu, 13 Aug 2026 08:18:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 360AD1F000E9;
	Thu, 13 Aug 2026 08:18:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786609113;
	bh=6lKhAtdX6ajxLRq78OZCtHKqt/EMngZfRfG821+Ysrs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Xe+RHaTAqmXrzjW+inuEbx9ggFBmtrC7kMsdWYLnQeY7kPHsrPEHMiA3GVmHLICEw
	 NJtP5+nxrDnnOeX3BCueZ/tHPYpcAiDZB8zRdgp56++qdGBNPP0e+tHrXJIqHX4Aq9
	 ZfLsPu9o6A/5ht2IJJrPC7j+aSr0HYHPHtRd9JCzfyIt1fBxEuj1w6QdSzT0jI7+CN
	 b+L8b/WeyA01CfIRr+tEfWs1inWPxtZ2wWrXf64WsFaCiHFM7qECGghB0U+4C2++EW
	 FvHtvdXIEJjvdAG0p0aKk6cDiy+u0qplLORiV6muNSpkIewgSH3mB9TPMn6NAXDiJp
	 QJ6kubQEZ2PDg==
Date: Thu, 13 Aug 2026 10:18:26 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Mehmet Fide <mehmet.fide@gmail.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Stefan Agner <stefan@agner.ch>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Francesco Dolcini <francesco@dolcini.it>, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/4] dt-bindings: arm: fsl: add the Colibri VF50 and
 VF61 on Iris
Message-ID: <20260813-gaur-of-authentic-will-3cdcdd@quoll>
References: <20260810140053.2793495-1-mehmet.fide@gmail.com>
 <20260810142047.2811230-1-mehmet.fide@gmail.com>
 <20260810142047.2811230-4-mehmet.fide@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260810142047.2811230-4-mehmet.fide@gmail.com>
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

On Mon, Aug 10, 2026 at 04:20:46PM +0200, Mehmet Fide wrote:
> From: Mehmet Fide <mehmet.fide@screeningeagle.com>
> 
> The Vybrid Colibri modules are documented on the evaluation board only.
> Add the Iris carrier, as the i.MX Colibri modules already have it.
> 
> Signed-off-by: Mehmet Fide <mehmet.fide@screeningeagle.com>
> ---
>  Documentation/devicetree/bindings/arm/fsl.yaml | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 

Thank you for your patch. There is something to discuss/improve.

> diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
> index 8687631..d58343f 100644
> --- a/Documentation/devicetree/bindings/arm/fsl.yaml
> +++ b/Documentation/devicetree/bindings/arm/fsl.yaml
> @@ -1711,6 +1711,12 @@ properties:
>            - const: toradex,vf500-colibri_vf50
>            - const: fsl,vf500
>  
> +      - description: Toradex Colibri VF50 Module on Iris Carrier Board
> +        items:
> +          - const: toradex,vf500-colibri_vf50-on-iris

This should be just part of the enum with
toradex,vf500-colibri_vf50-on-eval.

And use hyphens, not underscores for every newly introduced compatible
even if it is inconsistent with old code.


> +          - const: toradex,vf500-colibri_vf50
> +          - const: fsl,vf500
> +
>        - description: VF610 based Boards
>          items:
>            - enum:
> @@ -1725,6 +1731,12 @@ properties:
>            - const: toradex,vf610-colibri_vf61
>            - const: fsl,vf610
>  
> +      - description: Toradex Colibri VF61 Module on Iris Carrier Board
> +        items:
> +          - const: toradex,vf610-colibri_vf61-on-iris

Same here.

Also, Do not attach (thread) your patchsets to some other threads (unrelated
or older versions). This buries them deep in the mailbox and might
interfere with applying entire sets. See also:
https://elixir.bootlin.com/linux/v6.16-rc2/source/Documentation/process/submitting-patches.rst#L830

Best regards,
Krzysztof


