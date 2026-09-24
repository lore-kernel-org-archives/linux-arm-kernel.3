Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4631C9830E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 12:06:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ft+OTCES8ugvjkrYuU/qZLvMsblsf5K47aGXq7gU7cU=; b=BGrOHfi1dK/CsEF5I1RzTBGN1F
	t0dupmCC/Ge9KjZDx2Uee2iL5p2DJQv7L1JBRlGRmYFya3B5rbTWV0ok0XUW7yxYMqVHXV19gpdxO
	DldTvM3UdQYkoK8HPG4vNBQ1YxvOtMztr6GkceXskv8TBN8rSpw8KQ4zM/qD9l+ibgqYAHVKTTVat
	+PaRWCDCSwvpfHRbTg/313IEgPw9peL1e7tH5pg/EXLfs9QJg3ZEsXgKCUv8yQ9xyrUQM7MmPJGzt
	3D71OEqVyTiNyV44uokf+8utv5Vuimy/sTQsIlSItuZvI61PDUhKS+qUFymjb+pQUr03gb5Y6nIdY
	m1xJKFjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9iDQ-0000000AvfG-34K8;
	Thu, 24 Sep 2026 12:06:16 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9iDO-0000000Avex-46IR;
	Thu, 24 Sep 2026 12:06:14 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 5AA05441F4;
	Thu, 24 Sep 2026 12:06:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78AB21F00893;
	Thu, 24 Sep 2026 12:06:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790251574;
	bh=ft+OTCES8ugvjkrYuU/qZLvMsblsf5K47aGXq7gU7cU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=RCwRACh+iJhhqvlt9Qar7j4l8eYQ15/7ck+6CFCU+l01gPu0DvkTsZO4xtegvyA+H
	 RGHM/E/UQeieIqmMplyK2wBpTmu2+Io2a7yw4mJNCFi9ZQXA0r67B6DEp9xNz4dqIC
	 s0738sWCmQdf/0vyD6TKMJp0u8V4hbzE3hy/uG19MMSUhs+EErpH9hD4P5WSuj3BUp
	 kpDwe2YXiXGTqH1g1yXWHb93SjMTyC6r424gjGTpTzuNjCpINfW1yyQLCf2DDCufYE
	 tRYjvH5wbE/7LcUda7FZr1t6ffzxBcKy3MGgKVnSXH0I1lJccXM4wpbVb0FFSuTChp
	 3BoCmqPwoEO0A==
Date: Thu, 24 Sep 2026 14:06:10 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ryan Brue <ryanbrue.dev@gmail.com>
Cc: Jonathan Cameron <jic23@kernel.org>, 
	David Lechner <dlechner@baylibre.com>, Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Lee Jones <lee@kernel.org>, linux-iio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, mfd@lists.linux.dev, 
	Roman Vivchar <rva333@protonmail.com>, Luca Leonardo Scorcia <l.scorcia@gmail.com>, 
	Andy Shevchenko <andriy.shevchenko@intel.com>
Subject: Re: [PATCH v3 1/3] dt-bindings: iio: adc: mediatek,mt6359-auxadc:
 add mt6397 PMIC AUXADC
Message-ID: <20260924-brass-kraken-from-uranus-cbbe5f@quoll>
References: <20260920-rbrue-suez-upstreaming-mt6397-auxadc-v3-0-c00edacbee64@gmail.com>
 <20260920-rbrue-suez-upstreaming-mt6397-auxadc-v3-1-c00edacbee64@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260920-rbrue-suez-upstreaming-mt6397-auxadc-v3-1-c00edacbee64@gmail.com>
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

On Sun, Sep 20, 2026 at 12:31:51AM -0500, Ryan Brue wrote:
> The MediaTek mt6397 PMIC includes a 10-bit AUXADC used for battery voltage
> and battery temperature measurements. It is not register compatible with
> mt6359: a conversion is requested by writing a channel number to a select
> field and pulsing an edge triggered start bit rather than by setting the
> channel's bit in a request register, and the results live elsewhere.
> It therefore gets its own compatible rather than a fallback.
> 
> Add the binding and the header naming the channels a consumer puts in
> io-channels. The battery channel is named for the input it measures,
> ISENSE, which is what mt6323-auxadc calls the same input.
> 
> Assisted-by: LLM
> Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>
> ---
>  .../devicetree/bindings/iio/adc/mediatek,mt6359-auxadc.yaml      | 1 +
>  MAINTAINERS                                                      | 6 ++++++
>  include/dt-bindings/iio/adc/mediatek,mt6397-auxadc.h             | 9 +++++++++
>  3 files changed, 16 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


