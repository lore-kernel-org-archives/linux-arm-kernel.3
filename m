Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69CFACD4F39
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 May 2026 12:57:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nVJtoJwHA1qaK/rVte5qaXvlJbiset/mhzA6ephutU0=; b=nCufalsVhgdxJttsVNfVEUcnNT
	1DCgfSI40KHa9l9mK5Yss0ft62gkO7XUfusHnZBzRpQON4JOmcx1Ec+x29Rq6Ml42uJRBu9jxLa9U
	ziwAfnYyhzzX6c9ASnRf90MEDrLJoGrsuO5ujbPO+QqMnnu4xWnfc2VqZbYZt8hnk5tcWDcivO5oz
	GSb3hR7U6VCj1erqoP9LKCFz+KFOaGF1esErjRGP8JiawWMaNdT+YBcHIuEdofRv9RytgPyrwNNdT
	VDKD9S+gOIhs0oz241IbYdCF3SRbwhV7a0f0aosZ4rxCLSN/K24zPC/EWZ+w+TXPqAVafUGy0obOh
	o7Dpqt+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNVd4-00000005X3U-2JlO;
	Thu, 14 May 2026 12:57:30 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNVd2-00000005X3B-2TK3;
	Thu, 14 May 2026 12:57:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9C9246013B;
	Thu, 14 May 2026 12:57:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C39F1C2BCB3;
	Thu, 14 May 2026 12:57:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778763447;
	bh=AKwZQs2wlVU5d66RzEN5Yeb4ReFmnHAO0+173C7d698=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JWHqLlK/wIwM/uCBb2Q7orVLvYK+1zY65FUJExviSdXrbpFG3rZp2RkmRNGEA9xLy
	 vUlzRSt2sjt4Omv2vT3nHOZV4QLnETOk8XwsbcrTVjjIHjMiAkdzNX9nAHPIZAPvBZ
	 fvFTsNC2+etSzMbeMG1XqkGkCbeDivxa2L5MMOMvUYoEjqkk/4tNS0yh/BxO61h5WT
	 jFYVylaVULZdpPU46QKFfiAn6jH7lantX+Qte39+kTFwjApgi+zhy9i2EAqPP7seqG
	 4GbFfz+2ly06YxzppyjZ7D2JBdjUfgsOaS+fwyH84bFJaF1a8FXlUfUufs6zDZf5Qv
	 aFSS24mrSXWlg==
Date: Thu, 14 May 2026 14:57:25 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Roman Vivchar <rva333@protonmail.com>
Cc: Jonathan Cameron <jic23@kernel.org>, 
	David Lechner <dlechner@baylibre.com>, Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Sen Chu <sen.chu@mediatek.com>, 
	Sean Wang <sean.wang@mediatek.com>, Macpaul Lin <macpaul.lin@mediatek.com>, 
	Lee Jones <lee@kernel.org>, Srinivas Kandagatla <srini@kernel.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@kernel.org>, 
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, linux-iio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-pm@vger.kernel.org, 
	Ben Grisdale <bengris32@protonmail.ch>
Subject: Re: [PATCH v2 01/16] dt-bindings: iio: adc: mt6359: generalize
 description for mt63xx series
Message-ID: <20260514-abiding-honored-mammoth-78dda0@quoll>
References: <20260512-mt6323-v2-0-3efcba579e88@protonmail.com>
 <20260512-mt6323-v2-1-3efcba579e88@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260512-mt6323-v2-1-3efcba579e88@protonmail.com>
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

On Tue, May 12, 2026 at 08:18:15AM +0300, Roman Vivchar wrote:
> Update binding title to the MT63xx, since the list of compatibles already
> includes mt6363 and mt6373 which don't belong to the mt6350 family.
> 
> Signed-off-by: Roman Vivchar <rva333@protonmail.com>
> ---
>  Documentation/devicetree/bindings/iio/adc/mediatek,mt6359-auxadc.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/iio/adc/mediatek,mt6359-auxadc.yaml b/Documentation/devicetree/bindings/iio/adc/mediatek,mt6359-auxadc.yaml
> index 5d4ab701f51a..2e8857e104f5 100644
> --- a/Documentation/devicetree/bindings/iio/adc/mediatek,mt6359-auxadc.yaml
> +++ b/Documentation/devicetree/bindings/iio/adc/mediatek,mt6359-auxadc.yaml
> @@ -4,7 +4,7 @@
>  $id: http://devicetree.org/schemas/iio/adc/mediatek,mt6359-auxadc.yaml#
>  $schema: http://devicetree.org/meta-schemas/core.yaml#
>  
> -title: MediaTek MT6350 series PMIC AUXADC
> +title: MediaTek MT63xx series PMIC AUXADC

Honestly that's close to churn... Do it while adding new compatibles.

Best regards,
Krzysztof


