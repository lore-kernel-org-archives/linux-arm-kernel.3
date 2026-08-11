Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8951AC5AC67
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Aug 2026 14:05:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5CMmNJw8xFbOYotNubdIBdGOFgRK52FMbuu+80aIZG0=; b=4UrHciphw2I64Az7l64n6jWDTT
	gOh7vzz0xIbttK4ZNo5sODsjHZTOd9zGet7yFX8/Xa3kLB5ubWATcuwuFG8TaERvmLIsksZGLXTQw
	waU35dGxvSvB7ha5jV3N4J0eJXMgGTxuineULIDCLV0U/x4Jui0oEnyMhUxiQiSSNdZWgVcXPQE+v
	dNGvNQZ+fc7IuaXdBUETNLcX6pFsZuNiiPuh7IqyY61mZrjqpTvYrR0WQ8hm7C+aza3h9LsTxcsuY
	31DzrHwHwkRZKedOpL9om+meFF2xfQQHCGYBaw7ES01Afto9fqsDhmhAJ1InIYs4R2XgBRxOQuRhK
	KARiGKUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtn6U-0000000EApW-2ol3;
	Tue, 11 Aug 2026 14:05:18 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtn6T-0000000EApJ-3irS;
	Tue, 11 Aug 2026 14:05:17 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A23E243C30;
	Tue, 11 Aug 2026 14:05:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50E651F00A3E;
	Tue, 11 Aug 2026 14:05:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786457117;
	bh=5CMmNJw8xFbOYotNubdIBdGOFgRK52FMbuu+80aIZG0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=M1URbrD1gMdJG5zlyokh+QQOnDsI/n7YqbM4QtIEp3ghle3Pzw6gUlcr5ITVnZQva
	 yx7HJ8OC+6kcFQSaEYf00wuGA96E+PTAKSBUHPtDfHfzM/enA38tNhmYYm+pcwPPt5
	 25Ze8FJf6DVLepBT6boyvz6RnEPXB89I8Qprnxi4imwSJD2wXtHO1mTUpUEXhHpQq5
	 mgksTZ7uSJ02gf+GMFFlP+FKm+hOAYI9PyVhikZ6adgOl4tpjSX1jpj41wtUBFc4PX
	 ydFgIb+ksRzINpTjBz43qoNxbTyI109utnJQNyQZ++OZZ9qzNywE/75t9a4+4+iNXl
	 SPWPUdIeM1d4Q==
Date: Tue, 11 Aug 2026 09:05:16 -0500
From: Rob Herring <robh@kernel.org>
To: Rosen Penev <rosenp@gmail.com>
Cc: devicetree@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Mailing List <devicetree-spec@vger.kernel.org>,
	"open list:NETWORKING DRIVERS" <netdev@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>,
	"moderated list:ARM/Mediatek SoC support:Keyword:mediatek" <linux-arm-kernel@lists.infradead.org>,
	"moderated list:ARM/Mediatek SoC support:Keyword:mediatek" <linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH] dt-bindings: net: add nvmem-consumer reference to
 network-class
Message-ID: <20260811140516.GA2090384-robh@kernel.org>
References: <20260802214354.490074-1-rosenp@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260802214354.490074-1-rosenp@gmail.com>
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

On Sun, Aug 02, 2026 at 02:43:54PM -0700, Rosen Penev wrote:
> The nvmem-cells and nvmem-cell-names properties are used to supply MAC
> addresses to both wired and wireless network controllers. The wired
> hierarchy already allows them through ethernet-controller.yaml, but the
> wireless hierarchy (wireless-controller.yaml -> network-class.yaml)
> does not. As a result, brcm,bcm4329-fmac nodes using nvmem (e.g.
> bcm4709-linksys-ea9200.dts) failed dtbs_check with:
> 
>     Unevaluated properties are not allowed ('nvmem-cell-names',
>     'nvmem-cells' were unexpected)
> 
> Each wireless driver otherwise has to add the nvmem-consumer reference
> individually (qca,ath9k and mediatek,mt76 already declare their own
> nvmem-cells/nvmem-cell-names).
> 
> Add the nvmem-consumer reference to network-class.yaml so all network
> nodes inherit the properties at once. Wired controllers keep the tighter
> single-cell, mac-address-only constraints via ethernet-controller.yaml,
> which still apply alongside the relaxed class-level properties.
> 
> Assisted-by: opencode:big-pickle
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---
>  Documentation/devicetree/bindings/net/network-class.yaml | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/net/network-class.yaml b/Documentation/devicetree/bindings/net/network-class.yaml
> index 06461fb92eb8..f7c8e24016f7 100644
> --- a/Documentation/devicetree/bindings/net/network-class.yaml
> +++ b/Documentation/devicetree/bindings/net/network-class.yaml
> @@ -43,4 +43,7 @@ properties:
>        maximum frame size (there\'s contradiction in the Devicetree
>        Specification).
>  
> +allOf:
> +  - $ref: /schemas/nvmem/nvmem-consumer.yaml#

This is not correct as I explained in the prior patch.

Rob

