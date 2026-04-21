Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F28FF327B4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Apr 2026 07:13:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8Y0D3jaBnWCsLbtQTO3GiG49iAZd8M/wl+Vd+jEWykA=; b=AOB4+uQ2gLPT4E9vZDwvd4/Niv
	0NLbcnnedavecWWhMENcDGnVXLRvaoi8jOfywKYDE+DE3ZdAty9+ydvVx8VAN+dE7EJqMOcf643I3
	1ARVByHJqS2uEvp48unLGtS5LbmRNO+amBDYn/Mjnt4amgSeQ5jV9H7jByS57HdKTJ6xU23As+B4y
	+pUnnESet4zMZYeu5RpTp//OreSpYiKJ3XPn280WUjZQ92T0kVw1Cd7rIyCYu8WccrWII3HX3J/G8
	+YSM3ewoeIL9cFIe6xDvlH4K9il1CH7KWOg60FdvqJAAJ9+OoMQ87IhbEacjY+MWLUW1mjCIGRQhY
	3rqLZERA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wF5If-0000000895F-0hLJ;
	Tue, 21 Apr 2026 07:13:37 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wF5Id-0000000894m-1LGW;
	Tue, 21 Apr 2026 07:13:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5903B44517;
	Tue, 21 Apr 2026 07:13:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1872C2BCB0;
	Tue, 21 Apr 2026 07:13:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776755614;
	bh=FBWfjsIqM+7TuqnxYjhjiUQj1QqggKY45UCCbcTaQWs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Rk54KrE161LTqGHyDseDnQJW9W+VdRSX+EJ2x09B826Rm888eSnDOS65Ig+dvbr2U
	 M48YutSEbjzxtKF8DliJ9DYkjPxNv7U2xOZAyvzdfKzxLKMYamaehk6QIOd5gfumYp
	 IJpMwY2dnTATYIoGB3I/ncrVLTwVKcvY0ycF/HNKq5vBZ73vOXKmS+w3N2Cs7vgrue
	 im3cJtO4Jq8B7eAPaNx8d/rLJAN10ajV0wZYd6zy580tUCsJSRlO1lLsw0HL1dbcTg
	 iNIctkMIRQPn1nx34cpV6hRMZDGgm5YQU8JPq8rbt5P8D1qpCkEPSo9q/aFxJLhN1a
	 +8t7yT/JtC7jg==
Date: Tue, 21 Apr 2026 09:13:31 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Cc: linux-mediatek@lists.infradead.org, Fabien Parent <parent.f@gmail.com>, 
	Val Packett <val@packett.cool>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Sen Chu <sen.chu@mediatek.com>, 
	Sean Wang <sean.wang@mediatek.com>, Macpaul Lin <macpaul.lin@mediatek.com>, 
	Lee Jones <lee@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Linus Walleij <linusw@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Gary Bisson <bisson.gary@gmail.com>, Julien Massot <julien.massot@collabora.com>, 
	Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>, Akari Tsuyukusa <akkun11.open@gmail.com>, 
	Chen Zhong <chen.zhong@mediatek.com>, linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH v5 1/9] dt-bindings: mfd: mt6397: Add MT6392 PMIC
Message-ID: <20260421-sincere-cherry-waxbill-1aada6@quoll>
References: <20260420213529.1645560-1-l.scorcia@gmail.com>
 <20260420213529.1645560-2-l.scorcia@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260420213529.1645560-2-l.scorcia@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260421_001335_403425_28759C58 
X-CRM114-Status: GOOD (  17.20  )
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

On Mon, Apr 20, 2026 at 10:30:00PM +0100, Luca Leonardo Scorcia wrote:
> From: Fabien Parent <parent.f@gmail.com>
> 
> Add the currently supported bindings for the MT6392 PMIC. Its MFD driver
> does not use the compatible property to bind the regulator driver, so
> don't mark it as required.
> 
> Signed-off-by: Fabien Parent <parent.f@gmail.com>
> Signed-off-by: Val Packett <val@packett.cool>
> Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
> ---
>  .../bindings/mfd/mediatek,mt6397.yaml         | 27 ++++++++++++++++---
>  1 file changed, 24 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml b/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
> index 05c121b0cb3d..2866e95e338b 100644
> --- a/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
> +++ b/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
> @@ -40,6 +40,10 @@ properties:
>            - mediatek,mt6358
>            - mediatek,mt6359
>            - mediatek,mt6397
> +      - items:
> +          - enum:
> +              - mediatek,mt6392
> +          - const: mediatek,mt6323
>        - items:
>            - enum:
>                - mediatek,mt6366
> @@ -68,6 +72,10 @@ properties:
>                - mediatek,mt6331-rtc
>                - mediatek,mt6358-rtc
>                - mediatek,mt6397-rtc
> +          - items:
> +              - enum:
> +                  - mediatek,mt6392-rtc
> +              - const: mediatek,mt6323-rtc
>            - items:
>                - enum:
>                    - mediatek,mt6366-rtc
> @@ -99,9 +107,6 @@ properties:
>                    - mediatek,mt6366-regulator
>                - const: mediatek,mt6358-regulator
>  
> -    required:
> -      - compatible

Please create a new binding file for your device. Having two ways to
define child is not making this binding easier to follow.

The style of defining children with compatibles should be followed by
"requierd: compatible". I am rather against of exceptions, unless needed
and this is not such case where you need one.

Best regards,
Krzysztof


