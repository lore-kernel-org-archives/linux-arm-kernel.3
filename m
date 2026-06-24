Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBAF0CDB47F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Jun 2026 07:59:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QkYKCgxQU6KvSyvLLWfg45WEOY2XnUCNPzXVNmKvy+o=; b=YYag1+OyHGrSEAHMXD9qmPj9rm
	ushvQVnmIB5jmtjp4NqbObwm9MAf0bj8nWRTEgivr+Z4jk9M8kWdIb61AUX+3gHp/riqShVjrLHpG
	VexGBAJCjT3oHidRom3zTolMS4Wzppx1VPbgkDxk25Fi3rdwTS9KygSKZtwPK9ujokVlsQPtJAnG1
	SBBEeUZocZWKwPJfEbgIvHizDnBfYk9dr9R8gS2ANg7cVIG06g1YUP6NPveRQMagW6znMvAnFXw/z
	KQd0NVTGoauRKfTt18DOOLYyaqIJFNSG20mXUAAEgWHcg507zUR5onXUmkLMRhXlQLXOGydFpeRBD
	gCoPDsaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcIVl-00000007MSA-1lUc;
	Wed, 24 Jun 2026 07:59:05 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcIVj-00000007MRx-40u2;
	Wed, 24 Jun 2026 07:59:03 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 543A844038;
	Wed, 24 Jun 2026 07:59:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37A051F000E9;
	Wed, 24 Jun 2026 07:59:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782287943;
	bh=QkYKCgxQU6KvSyvLLWfg45WEOY2XnUCNPzXVNmKvy+o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=n8HFwZ7y/8Sy63L+oepv4OUd/GA8G/porNz4CZTiKCED9Cx1oudWaG+jczBNhs6x4
	 GpEHfC42VPs1qeEyHJuUVNeNWC1ObC9oVt7KjI9OwpYzHV31gcSUNmfHGVdMqNSPH8
	 dEXVqkXojMHTaCY9SgsnEQ00l2Z46UE2dx1H82Cfz9oL77fd5WhDwCoSvAnD8U31ah
	 wyrAbV3xew9llyf8uY8tHB5obCpkbVIb55fQ9c5Zy8oTG7AETkjf4rndJ44w5qXz5P
	 Y9W3jb6HgAdln6ai54HN3AWrj7YBsKAxJg9QbflMUoEedQUw0XnGP1m1J/vL4XapYe
	 LPKafPkow5eqg==
Date: Wed, 24 Jun 2026 09:58:59 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Cc: linux-mediatek@lists.infradead.org, 
	Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, CK Hu <ck.hu@mediatek.com>, Jitao shi <jitao.shi@mediatek.com>, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] dt-bindings: mediatek: cec: Correct the compatibles for
 mt7623-mt8167
Message-ID: <20260624-silent-judicious-impala-56b20c@quoll>
References: <20260623135757.5111-1-l.scorcia@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260623135757.5111-1-l.scorcia@gmail.com>
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

On Tue, Jun 23, 2026 at 03:57:53PM +0200, Luca Leonardo Scorcia wrote:
> The HDMI CEC driver for both mt7623 and mt8167 is actually the same as
> mt8173-cec and the mt7623n.dtsi board include file already uses mt8173-cec
> compatible as a fallback, but the documentation lists them as separate
> entries. Correct the binding by adding the correct fallback.
> 
> This change fixes a dtbs_check error.

which one? here you paste it (can be trimmed a bit)


> 
> Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
> ---
>  .../bindings/display/mediatek/mediatek,cec.yaml       | 11 +++++++----
>  1 file changed, 7 insertions(+), 4 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,cec.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,cec.yaml
> index 080cf321209e..4d741ba415e8 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,cec.yaml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,cec.yaml
> @@ -15,10 +15,13 @@ description: |
>  
>  properties:
>    compatible:
> -    enum:
> -      - mediatek,mt7623-cec
> -      - mediatek,mt8167-cec
> -      - mediatek,mt8173-cec
> +    oneOf:
> +      - const: mediatek,mt8173-cec
> +      - items:
> +        - enum:

"This change fixes a dtbs_check error."
... and introduces new other errors, so error count stays the same. Not
great.

It does not look like you tested the bindings, at least after quick
look. Please run 'make dt_binding_check' (see
Documentation/devicetree/bindings/writing-schema.rst for instructions).
Maybe you need to update your dtschema and yamllint. Don't rely on
distro packages for dtschema and be sure you are using the latest
released dtschema.

Best regards,
Krzysztof


