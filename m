Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CDAFC87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Aug 2025 18:37:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hcfd22pQxFOTG8lOh54/cMb4goHCqNww6R6RMNAjSO4=; b=4PC6ZsKbqyl+PAATyk1PHS/o76
	TW68j9HnYFmSAKpLgiNTX3+V+amcmdKymk9bI19V33eso9RV58tUt3FDnju4GYexTVDBScifn3Ma8
	anGkRJQuSjxXpa/rG3C6EBiemV+RyUXHlaamij3oSUhN4LcdzSIgas5Gw5XN4YiozAzJK/S8joWjj
	H2PMaN24EaWa7/uB0gcQhGBWdcljIt0a6TbI1U70D4Z+RSfrczs9CeMI5tguujQvapBt21fzG8paM
	xbGnwwNGbVzLK2C5h9wVSEWdGo4XAAs5rMT217j83y8Ba5T4IRLlBa53nXo7NAz6lq4oke20McZFA
	UdUnHuhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujMX3-0000000DYXm-39GY;
	Tue, 05 Aug 2025 18:37:05 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujLrH-0000000DTma-3TwB;
	Tue, 05 Aug 2025 17:53:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 426E843A6A;
	Tue,  5 Aug 2025 17:53:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 096A5C4CEF0;
	Tue,  5 Aug 2025 17:53:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754416435;
	bh=MioYAhNotFZUh9CEi5VyuJwmmwIaFoi439ziNU1/xZ8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=G0iIvbdpeFbfMCoUWOUNU6swI/EliSO8PLGjxXx+2FqXmmPipOCslpqGmJ+l8jyB2
	 A+aDpXNCe0HKve5SYckNe3zMxD3rBB/7wLlwSN7vaqQfth8M91o0slwsy/Bi5GtykL
	 LXBLRw071Lwk9PTvI6aAvbjIyCbFUIvlAWlk7UdUst6+i3nwnv76RM4fVdqPQH9BgK
	 fiYR07U4n20ZLUIh2s/hhrPMjCxfQEZfWfGh9zqa4TbXnbIwjtmLq925h+WOu833r7
	 0QZzLibgzVmlUQEyNJp8e8aNFejaB0WpEBVppck6Qsw/e71L90hcSAC/+efBA509aZ
	 /+o0a8OE8rhfw==
Date: Tue, 5 Aug 2025 12:53:54 -0500
From: Rob Herring <robh@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-mediatek@lists.infradead.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, matthias.bgg@gmail.com, ulf.hansson@linaro.org,
	y.oudjana@protonmail.com, fshao@chromium.org, wenst@chromium.org,
	lihongbo22@huawei.com, mandyjh.liu@mediatek.com, mbrugger@suse.com,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org,
	kernel@collabora.com,
	=?iso-8859-1?Q?N=EDcolas_F=2E_R=2E_A=2E?= Prado <nfraprado@collabora.com>
Subject: Re: [PATCH v3 01/10] dt-bindings: memory: mtk-smi: Document
 #access-controller-cells
Message-ID: <20250805175354.GA2004232-robh@kernel.org>
References: <20250805074746.29457-1-angelogioacchino.delregno@collabora.com>
 <20250805074746.29457-2-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250805074746.29457-2-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250805_105355_894610_F22041E7 
X-CRM114-Status: GOOD (  15.14  )
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

On Tue, Aug 05, 2025 at 09:47:37AM +0200, AngeloGioacchino Del Regno wrote:
> Some of the SMI Common HW provides access control to at least
> the power controller: document the #access-controller-cells
> property and allow specifying it only for MT8183 and MT8365
> as those are the only known SoCs with an SMI acting as access
> controller.
> 
> Reviewed-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../memory-controllers/mediatek,smi-common.yaml  | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-common.yaml b/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-common.yaml
> index 0762e0ff66ef..74b355a08493 100644
> --- a/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-common.yaml
> +++ b/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-common.yaml
> @@ -74,6 +74,9 @@ properties:
>      minItems: 2
>      maxItems: 4
>  
> +  '#access-controller-cells':
> +    const: 0

I'm still wondering why this is 0? That seems odd that an access 
controller is 1:1 with a device.

> +
>    mediatek,smi:
>      $ref: /schemas/types.yaml#/definitions/phandle
>      description: a phandle to the smi-common node above. Only for sub-common.
> @@ -168,6 +171,19 @@ allOf:
>              - const: apb
>              - const: smi
>  
> +  - if:  # for SMI providing access control
> +      properties:
> +        compatible:
> +          enum:
> +            - mediatek,mt8183-smi-common
> +            - mediatek,mt8365-smi-common
> +    then:
> +      properties:
> +        '#access-controller-cells': true
> +    else:
> +      properties:
> +        '#access-controller-cells': false
> +
>  additionalProperties: false
>  
>  examples:
> -- 
> 2.50.1
> 

