Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B06D9CD98E4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Jun 2026 10:55:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CzmyMfOjUoqFSrudEqB/8Bk4sn/k1QYEewnBQo+Bwnw=; b=3Si+YOctaogHBUh/MGEbeWv9W8
	2F7ve9EQpO7XJhBUCtHbjXwxVYVxIniZRensABmPdVIAICeXV6oKLWivcrTi/GYF2Vk5X/OCHPBs/
	TvtjJyQVqIBD9pmA/4ph4gBrn8wCwlUNeNwGbeC0wulgqJuk8yjPZcadHHJA6fbNfZdmifmGLDmR6
	p2h1UK0Js8ttyDKye3pCiLHnUUMRGEDg4pNVaCZ05egsrjFq5r6YzDCfNFwdRR/Zs3ptCXTVWKWIr
	rf6adiVnfu2C+D6f+KLpBLK13D5HIMxBfi82dHkcbeBLM7udDrlKHn1cta4zv2lq0gRZsZja5mJwJ
	kT1bwDvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZnvb-0000000HBdj-1FkK;
	Wed, 17 Jun 2026 10:55:27 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZnvZ-0000000HBdK-27mo;
	Wed, 17 Jun 2026 10:55:25 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 8C02E600BB;
	Wed, 17 Jun 2026 10:55:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49E151F00A3A;
	Wed, 17 Jun 2026 10:55:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781693724;
	bh=CzmyMfOjUoqFSrudEqB/8Bk4sn/k1QYEewnBQo+Bwnw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=E/T+qRmKeRe1xiQtXPb7xphBSvMbr2f/OBq7UwN5FbCxGgMLyE192XdQwWk+VEeM3
	 BaWFeI263quFZrVTRatYSxijDrOTQt66qQIRWQZoNLu8UL0G3DpqpQLjGrNbQUYjQT
	 bxhLVDPMR2g4yvldQtNO77w+9WQO7uaz9LXDPSkLp+Y6vprKOgP57sWbTEI3sACrgr
	 sVbDcE88lheO/X7gpoAfyByr/6hb3Y+OF89AMZcX8MRE1Q/7rQPr3esh3xzfyuUmlK
	 5Qkm44J7a4OrWhcBIJDPNCT76nb8mDQWNWQHlqQjLuR1uuLZ5o99xDQmS+YWY0NzOQ
	 3hg4dAC3PPdIQ==
Date: Wed, 17 Jun 2026 12:55:20 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Zakariya Hadrami <zkh1@proton.me>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Sean Wang <sean.wang@mediatek.com>, Wim Van Sebroeck <wim@linux-watchdog.org>, 
	Guenter Roeck <linux@roeck-us.net>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-watchdog@vger.kernel.org
Subject: Re: [PATCH 4/5] dt-bindings: arm: mediatek: Add MT8127 Amazon ford
Message-ID: <20260617-rigorous-refined-lion-f36a29@quoll>
References: <20260617-mt8127-amazon-ford-basic-v1-0-d02ad15ac359@proton.me>
 <20260617-mt8127-amazon-ford-basic-v1-4-d02ad15ac359@proton.me>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260617-mt8127-amazon-ford-basic-v1-4-d02ad15ac359@proton.me>
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

On Wed, Jun 17, 2026 at 11:20:13AM +0900, Zakariya Hadrami wrote:
> Add entry for the MT8127 based Amazon ford tablet.
> 
> Signed-off-by: Zakariya Hadrami <zkh1@proton.me>
> ---
>  Documentation/devicetree/bindings/arm/mediatek.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
> index 382d0eb4d0af..5ddc79689df9 100644
> --- a/Documentation/devicetree/bindings/arm/mediatek.yaml
> +++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
> @@ -124,6 +124,10 @@ properties:
>            - enum:
>                - mediatek,mt8127-moose
>            - const: mediatek,mt8127
> +      - items:
> +          - enum:
> +              - amazon,ford

And it is not part of existing enum because?

> +          - const: mediatek,mt8127

Best regards,
Krzysztof


