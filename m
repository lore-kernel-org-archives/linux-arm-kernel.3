Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7ABEC83F25
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Jul 2025 20:01:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LiqZrO0f8QTxCThXFHlqUgqAKNIYsYfSfuuYj8e3p8s=; b=C01fwAmjYB2ANLn9UeqOgvnNJV
	MRVAFuCbOX+M4roq+GepRUXKiJ0U3riouboukI8aGN2gS7tCYsobrBNLDsIuZzZ9vQdCSSbhAeHLx
	j0lY9nPKtssuL877mZaxVPO7SzHMA9cVD6ENBTHl/kqpDkdfvUM47fCs0WSc5LtuKaFKQ6k8GZlnn
	DYSXnfeAOdUxj/BdT3JKYmCxivW+45pPKIBWeqcj8hkx28n6JTg1vhlhN4bSA+yJoF8DkzC433Lwh
	IAapLV7TbH6A1HMButIplKvEtZOtntSrHVXqVGtlBiiCQ80Ejb5Aek5hpObqdbAt1Y79OeZXrfdl9
	6XDUCDxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udwgx-00000000Z4B-0xTS;
	Mon, 21 Jul 2025 20:00:55 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udweU-00000000YwD-3JHi;
	Mon, 21 Jul 2025 19:58:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1F8AC4389B;
	Mon, 21 Jul 2025 19:58:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB1E7C4CEED;
	Mon, 21 Jul 2025 19:58:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753127902;
	bh=KuJmPdgYM52TyEfb5GOaYYy/Wz8zkqWtBSMWMCCCUXo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AViKdRQUgjZkH+Mbtvssorka8bkheIkitMNfiDbxUfb+690Dt1VuzCqU+7ttwe5Ad
	 kMPF6GD1v1DRk3vz0S1w8yKh2jsTm5YgQeqEbAGIhhM9HefDaeosAA4fK27RVMkKfy
	 qVsIHS6OB9L6yMwapvunD/anMfISkff2B8R0uhxqJkO8u/CFZlLgJdJcwAtJ+O8pr1
	 l493eO1Ku7LwqQMqMStazmD7gJXCwEMZ/VQL+lvqHIMD+CeqOiNbr5zO4epfHrA7sS
	 InnBoE+iqnd4Zpmy6wFJQOL3gt+1C1e8oyT6R8g3Rl78Kc8gaEU7F+Zhmlwo9piLu4
	 35tiwJnZhQuGg==
Date: Mon, 21 Jul 2025 14:58:21 -0500
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
Subject: Re: [PATCH v2 03/10] dt-bindings: power: mediatek: Document
 access-controllers property
Message-ID: <20250721195821.GA1163453-robh@kernel.org>
References: <20250707105605.98248-1-angelogioacchino.delregno@collabora.com>
 <20250707105605.98248-4-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250707105605.98248-4-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250721_125822_872530_BB7003C3 
X-CRM114-Status: GOOD (  18.66  )
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

On Mon, Jul 07, 2025 at 12:55:58PM +0200, AngeloGioacchino Del Regno wrote:
> Allow specifying access-controllers in the main power controller
> node and deprecate the old mediatek,infracfg, mediatek,infracfg-nao
> and mediatek,smi properties located in the children.
> 
> This is done in order to both simplify the power controller
> nodes and in preparation for adding support for new generation
> SoCs like MT8196/MT6991 and other variants, which will need
> to set protection on new busses.
> 
> Reviewed-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../power/mediatek,power-controller.yaml      | 39 +++++++++++++++++++
>  1 file changed, 39 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml b/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml
> index 9c7cc632abee..82bfd3899b22 100644
> --- a/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml
> +++ b/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml
> @@ -44,6 +44,17 @@ properties:
>    '#size-cells':
>      const: 0
>  
> +  access-controllers:
> +    description:
> +      A number of phandles to external blocks to set and clear the required
> +      bits to enable or disable bus protection, necessary to avoid any bus
> +      faults while enabling or disabling a power domain.
> +      For example, this may hold phandles to INFRACFG and SMI.
> +    minItems: 1
> +    maxItems: 3

> +    items:
> +      maxItems: 1

Drop 'items' as how many cells is up to the provider.

> +
>  patternProperties:
>    "^power-domain@[0-9a-f]+$":
>      $ref: "#/$defs/power-domain-node"
> @@ -123,14 +134,17 @@ $defs:
>        mediatek,infracfg:
>          $ref: /schemas/types.yaml#/definitions/phandle
>          description: phandle to the device containing the INFRACFG register range.
> +        deprecated: true
>  
>        mediatek,infracfg-nao:
>          $ref: /schemas/types.yaml#/definitions/phandle
>          description: phandle to the device containing the INFRACFG-NAO register range.
> +        deprecated: true
>  
>        mediatek,smi:
>          $ref: /schemas/types.yaml#/definitions/phandle
>          description: phandle to the device containing the SMI register range.
> +        deprecated: true
>  
>      required:
>        - reg
> @@ -138,6 +152,31 @@ $defs:
>  required:
>    - compatible
>  
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - mediatek,mt8183-power-controller
> +    then:
> +      properties:
> +        access-controllers:
> +          minItems: 2
> +          maxItems: 2
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - mediatek,mt8365-power-controller
> +    then:
> +      properties:
> +        access-controllers:
> +          minItems: 3
> +          maxItems: 3
> +
>  additionalProperties: false
>  
>  examples:
> -- 
> 2.49.0
> 

