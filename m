Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D366EFEE4EB
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Feb 2026 11:08:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5ExWkyQLFK03IPXTG2+JH18IxdJyFueVBjsFSqjjpZY=; b=zttMOgO8CE1RsNap/8ZmPhMsnP
	bhzJie2Z5Syg+2UW8a+nKvVesv238HJPYCur47/iptjyP0BGhQGtD8KtE+vyPRCBZo2LWyaizYBHa
	xnuPu7tfhQh7d2dFPA3gP+xdMTvyJMuCiolipHVsfkh4hJsWN9s8m5mbEj+CuYYqlExijsm4ZcMRH
	zeAf3cVAzxfbw2AbR5fYZEFREkgyW1owiiZWX22reuQihDR93t2buF+lPPp2a+x7bI/38xBJK9R+h
	x/4uwsm4Uh/6lx1Da27AcKf5fkSVSl4KJpvP04kYn3B9fxN/1cfBpiWohZs48MPUPF4+x2Fo01c3Z
	JlQuWEsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwIBP-00000009lSA-2hMK;
	Sat, 28 Feb 2026 11:08:27 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwIBM-00000009lRr-2yRw
	for linux-arm-kernel@lists.infradead.org;
	Sat, 28 Feb 2026 11:08:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 02615435F1;
	Sat, 28 Feb 2026 11:08:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 563BCC116D0;
	Sat, 28 Feb 2026 11:08:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772276903;
	bh=4eFm3+ZhAflcr0B/p2fB4fUvTsRfI8pwZ4uxvPYQN1I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=R0FDuV1iw3VCDtvEZ2b9wIT3qceXjfYvFTLme9GSLFqWi4B1O8dtMWI8INRZYX7Js
	 SRs6HT2D+v6dzoRczH3JkAVHFdNU696A3OfSI467XJUPsL9zl7ndITjj3P1UePhefD
	 PhQf3H0FMIqA/CEOH0XBoHc+zirPd2D/D4jT8iWSW8x19v3EIRISTM/4cfQqOKYERF
	 an7jWPuSkpnesbbQh7Z4ljNj6LxmqQxmjXhnS5wCmJmsTFI8ne2OysiHhoQ2y2f+Bh
	 mn0Tw8SrWk+yjwtPDcH/oPqCM3wBxeEka2Fzvj8P5rT6/dS42gy1ctDAsPDENx+3vy
	 V33sOTjhN9cug==
Date: Sat, 28 Feb 2026 12:08:21 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Chen-Yu Tsai <wens@kernel.org>
Cc: Jernej Skrabec <jernej@kernel.org>, 
	Samuel Holland <samuel@sholland.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Mark Brown <broonie@kernel.org>, linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] spi: dt-bindings: sun6i: Allow Dual SPI and Quad SPI
 for newer SoCs
Message-ID: <20260228-ultra-hyena-of-ecstasy-fdb006@quoll>
References: <20260227175157.2339758-1-wens@kernel.org>
 <20260227175157.2339758-2-wens@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260227175157.2339758-2-wens@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260228_030824_775724_595076D4 
X-CRM114-Status: UNSURE (   9.48  )
X-CRM114-Notice: Please train this message.
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

On Sat, Feb 28, 2026 at 01:51:53AM +0800, Chen-Yu Tsai wrote:
>  maintainers:
>    - Chen-Yu Tsai <wens@csie.org>
>    - Maxime Ripard <mripard@kernel.org>
> @@ -82,11 +79,35 @@ patternProperties:
>  
>        spi-rx-bus-width:
>          items:
> -          - const: 1
> +          enum: [0, 1, 2, 4]
>  
>        spi-tx-bus-width:
>          items:
> -          - const: 1
> +          enum: [0, 1, 2, 4]
> +
> +allOf:

Please place the allOf after required: block.

> +  - $ref: spi-controller.yaml
> +  - if:
> +      not:
> +        properties:
> +          compatible:
> +            contains:
> +              enum:
> +                - allwinner,sun50i-r329-spi
> +                - allwinner,sun55i-a523-spi
> +    then:
> +      patternProperties:
> +        "^.*@[0-9a-f]+":
> +          type: object

type is not needed here, already defined in top-level.

With these two changes:

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


