Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D9FDF4BB9E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Feb 2026 11:07:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5iJ/hkmuKsgbXFAFoJxZVrbdgyj3Iof8l1X2KUAegic=; b=L34N9Hv1TD3RmLHyikT5PrgskD
	6E7h2ooWJlJB2+Bd1tGV1pA06hy6TDvGIvfQxkFmXYqf4BhNGgZc2lCf2fupa7SZLrG8O7zwRW4iI
	NHmEV0DVZYVryl6yDygzhJFgVKOWLTszStg1ZciV2A9682qb4VJRCHBCNEeN/kQ29cJ+sJpgsoZIZ
	rsz/Fk0eGNpOSlR7Hb+F7d2ebOolJuDl33dQk28HJ393FKT+uk49PQq8uPVdhasZCNXBRj0XnLSsx
	HPiPvO4u5UfF/aRS3dpEt0gw5XEHVV6uJ+5g6dmpz2s8QW9vwSh68Hue15FaslZMF8NLPOB7uPklE
	euwtcYng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvCjP-00000003t0I-0C7k;
	Wed, 25 Feb 2026 11:07:03 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvCjM-00000003szy-3lh7
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Feb 2026 11:07:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3622841942;
	Wed, 25 Feb 2026 11:07:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C11FC116D0;
	Wed, 25 Feb 2026 11:06:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772017620;
	bh=/vE7uvuaCXSs7YmOxiPnT+lQCznNjU9pP7qljs6QuPc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fMN5sQ7yP4uqqJVZf/sKJtP9eCukvfMRWRCAcmEQPku8ckfbYtaqNVVMQJ0pGikIy
	 6i+bEZErCpHVyCWFe9yqpkHt2dRFD0c0PccUGIJuprBTGlQ55cGMQJjs5QtDYl/7+E
	 pxs51vKFJDxhSE4lnC4xMQnCmRClQqPSYt0lmQz1SgoLymgtGVhq8wcY+Inv97KQod
	 oxXfhSd8I5PfZFH7qsqiX29NCUyXwXsOn3T66dU7GGvtmudg9ZL6fKzYnFTsjZPXJ2
	 QdUisfY+zuMSYPn0YEsovwQc8mbvC49ZA6ExEW9no1MjBwas2NvsE689Xvfp2rjWxn
	 4lW1bKFhczwLQ==
Date: Wed, 25 Feb 2026 12:06:56 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Antonios Christidis <a-christidis@ti.com>
Cc: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, 
	Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Frank Binns <frank.binns@imgtec.com>, Matt Coster <matt.coster@imgtec.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Santosh Shilimkar <ssantosh@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH 2/5] dt-bindings: gpu: img: Add J721e SoC specific
 compatible
Message-ID: <20260225-malamute-of-perpetual-typhoon-2f0f65@quoll>
References: <20260224-gpu_dts-v1-0-cc5ddffe140c@ti.com>
 <20260224-gpu_dts-v1-2-cc5ddffe140c@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260224-gpu_dts-v1-2-cc5ddffe140c@ti.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260225_030700_960006_10246A96 
X-CRM114-Status: GOOD (  15.26  )
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

On Tue, Feb 24, 2026 at 12:09:16PM -0600, Antonios Christidis wrote:
> Add J721e SoC specific compatible.
> 
> Signed-off-by: Antonios Christidis <a-christidis@ti.com>
> ---
>  Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
> index a1f54dbae3f3..56249d1e65aa 100644
> --- a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
> +++ b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
> @@ -44,7 +44,11 @@ properties:
>                - ti,j721s2-gpu
>            - const: img,img-bxs-4-64
>            - const: img,img-rogue
> -
> +      - items:
> +          - enum:
> +              - ti,j721e-gpu
> +          - const: img,img-ge8430
> +          - const: img,img-rogue
>        # This legacy combination of compatible strings was introduced early on
>        # before the more specific GPU identifiers were used.
>        - items:
> @@ -103,6 +107,7 @@ allOf:
>                - ti,am62-gpu
>                - ti,am62p-gpu
>                - ti,j721s2-gpu
> +              - ti,j721e-gpu

What about img,img-ge8430? Why this one does not have constraints?

What about all other constraints?

>      then:
>        properties:
>          clocks:

Best regards,
Krzysztof


