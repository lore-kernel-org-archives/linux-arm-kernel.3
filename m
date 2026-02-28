Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C916FEE4EB
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Feb 2026 11:19:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oUx1n+bvR9o97kNIkOM1WaFTrrw55T5ySStqmMv0Jz8=; b=Himr0c3KMmy/03ai6d8JZYnjV7
	qUP5JV9QFbclJK/bDSfxXgOcbGSpHqMX266zgIqPlEpCBsKjs7cBDjFQMTi/OmBVD9hziQBUIUJIS
	4At+TOGm4mNuKeiisoQgAGnCyvMLPFItEOYH1gw44OHGloc/DmzYBfyFlqg8BPQ6FhcnA97hSGtny
	iGiH8mFcdiuXYdjhPIdnyf4FfTVborG2ntOvO0FjOinmA/ZKdakuLo+llbeqwg7BjhnuEH4AdOU02
	UTA6Y2c4jBw2H7Ydr2OUxDs4reUTXuO+mT5/x8VmAm9hE7VRp0jvzYkkr599/HoZzxbK9MaT0jHs7
	qoXQyT3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwILc-00000009mYP-0bn4;
	Sat, 28 Feb 2026 11:19:00 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwILZ-00000009mY2-3nv4;
	Sat, 28 Feb 2026 11:18:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 56E816001D;
	Sat, 28 Feb 2026 11:18:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78FA0C116D0;
	Sat, 28 Feb 2026 11:18:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772277537;
	bh=9WvqtL0XRV/J/pFOTM/obGeTWs649hf3DIq3OlXX5TQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=O8aOAgZdcBT0lhMCNjBtv4dov7hucHpzamAk3cZZDONjkSHwTTMu99ppcHbajMMlN
	 qu15pRxP74PXrh+pgClDDR0SWY3MRbuswvqii29p3QHupChnjHJs3FYW1sZJbit7qP
	 Szr4qGs2pBWJ3SKaP+WoszMEW8+B/ZX339Qh+ctDjRgk9WX/XQxtOdA9xXqYtcBrjc
	 rbEsMU8o8qVs0WA71SlY8y6tDgYKTtYge2hrx0nARpgWTWD0d94RMTPyPhysmN9ovY
	 Q7ZjQGSuQHV/mqk7wjLLeC5W4PnDb/p2sGwlxfNNmw7LG9heLuRcs3ur+JViltGbDS
	 3z5ufnKh0lQ1w==
Date: Sat, 28 Feb 2026 12:18:54 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Nick Xie <nick@khadas.com>
Cc: neil.armstrong@linaro.org, khilman@baylibre.com, 
	martin.blumenstingl@googlemail.com, jbrunet@baylibre.com, krzk+dt@kernel.org, jic23@kernel.org, 
	dlechner@baylibre.com, nuno.sa@analog.com, andy@kernel.org, linux-iio@vger.kernel.org, 
	robh@kernel.org, conor+dt@kernel.org, linux-amlogic@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	xieqinick@gmail.com
Subject: Re: [PATCH v1 1/4] dt-bindings: iio: adc: amlogic,meson-saradc: add
 S4 compatible
Message-ID: <20260228-quirky-lemon-reindeer-1045f6@quoll>
References: <20260228065840.702651-1-nick@khadas.com>
 <20260228065840.702651-2-nick@khadas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260228065840.702651-2-nick@khadas.com>
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

On Sat, Feb 28, 2026 at 02:58:37PM +0800, Nick Xie wrote:
> Add the compatible string for the SARADC (Successive Approximation
> Register ADC) IP block found in the Amlogic Meson S4 SoC.

... which is fully compatible with g12a?

Write proper explanations.

> 
> Signed-off-by: Nick Xie <nick@khadas.com>
> ---
>  .../devicetree/bindings/iio/adc/amlogic,meson-saradc.yaml        | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/iio/adc/amlogic,meson-saradc.yaml b/Documentation/devicetree/bindings/iio/adc/amlogic,meson-saradc.yaml
> index bb9825e7346dd..5496a0dc714aa 100644
> --- a/Documentation/devicetree/bindings/iio/adc/amlogic,meson-saradc.yaml
> +++ b/Documentation/devicetree/bindings/iio/adc/amlogic,meson-saradc.yaml
> @@ -27,6 +27,7 @@ properties:
>                - amlogic,meson-gxm-saradc
>                - amlogic,meson-axg-saradc
>                - amlogic,meson-g12a-saradc
> +              - amlogic,meson-s4-saradc

If this is compatible with other device, you need proper fallback.

>            - const: amlogic,meson-saradc

And this one is now kind of fake - how does this device use it?

Best regards,
Krzysztof


