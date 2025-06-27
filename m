Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4F75C77B7F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Jun 2025 20:26:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=anT+MpcAETEZTFVNotlxJrIA1V52NxZb8yCs+oSUW7A=; b=nf9i8xQvw0MxvV3uWp9b5CuEql
	0bFnVxRZjb39WT55RewCMK+4AWquS9bVCfwbDl5Qg24trsOKxB2aWsTxkmsSP/ibxV/ndJ/a2xwhF
	pBKpxJd6h+YQ6Je6SxHZ6U9x8eesGvakbyRhpD69iDgsyhnETQBLx1LkRJD2SW48wFZTaCcLWEdj1
	8qqEM4ZvdtM8bW+I/GhDIs3HJUlF5PEj5FBv5uiH5jvrcLwJXNkMoQgqrGdgzcc0o8+BiAMu42NSu
	Z7TOCOtVTBLmBsigTw6fVTDIbDUoHztHNdhmvOqqhWXi3ppaUIc1Nh5fiIakW46Lpvf7IrGWPPx/r
	9chp9OnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVFeg-0000000FkXc-1bHe;
	Fri, 27 Jun 2025 20:26:38 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVFU9-0000000FjXT-28yu;
	Fri, 27 Jun 2025 20:15:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E113944CD4;
	Fri, 27 Jun 2025 20:15:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5257C4CEE3;
	Fri, 27 Jun 2025 20:15:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751055344;
	bh=A1HZdHwLlVd1wktKvcUvDiv1sLcJQsvaROUniDdEirI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qrHiXih+BZdymtaHzgqTsVDdu1FEBGcLRQgLhv1aG2fsboVDOZbVMbynjwTaX3sNA
	 iWGag08iZ4mv30r/ci/yihUghINwgdiMVZhoZBh3bnyRsXN5OthTcrzdiFHQ41xlmk
	 2woK0MPlzohsTuK9e63xEhfpn+73hPWvc9IN1IsA3hHrKBOYPv/FvVYXSbyu6VGn8c
	 i19BkmMr0OojSpgJxRcDIwIPlwJ1tP+2svqvKBr7A8H3B8V5Gr3lGA8x91em23ot1z
	 K/BMTKv86TfG4EaUgc3t9yudO3Bo4hTMV48TuVsbF7MWaeEADllTHH67D/o+viXmad
	 hTLcRg4Fpphdw==
Date: Fri, 27 Jun 2025 15:15:43 -0500
From: Rob Herring <robh@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-mediatek@lists.infradead.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, matthias.bgg@gmail.com, ulf.hansson@linaro.org,
	y.oudjana@protonmail.com, fshao@chromium.org, wenst@chromium.org,
	lihongbo22@huawei.com, mandyjh.liu@mediatek.com, mbrugger@suse.com,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org,
	kernel@collabora.com
Subject: Re: [PATCH v1 01/13] dt-bindings: power: mediatek: Document
 mediatek,bus-protection
Message-ID: <20250627201543.GA4171766-robh@kernel.org>
References: <20250623120154.109429-1-angelogioacchino.delregno@collabora.com>
 <20250623120154.109429-2-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250623120154.109429-2-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250627_131545_589834_4980580D 
X-CRM114-Status: GOOD (  18.67  )
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

On Mon, Jun 23, 2025 at 02:01:42PM +0200, AngeloGioacchino Del Regno wrote:
> Add a new mediatek,bus-protection property in the main power
> controller node and deprecate the old mediatek,infracfg,
> mediatek,infracfg-nao and mediatek,smi properties located in
> the children.
> 
> This is done in order to both simplify the power controller
> nodes and in preparation for adding support for new generation
> SoCs like MT8196/MT6991 and other variants, which will need
> to set protection on new busses.

Protection like access controls? We have the access-controller binding 
for that.

> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../power/mediatek,power-controller.yaml      | 40 +++++++++++++++++++
>  1 file changed, 40 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml b/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml
> index 9c7cc632abee..2530c873bb3c 100644
> --- a/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml
> +++ b/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml
> @@ -44,6 +44,18 @@ properties:
>    '#size-cells':
>      const: 0
>  
> +  mediatek,bus-protection:
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +    description:
> +      A number of phandles to external blocks to set and clear the required
> +      bits to enable or disable bus protection, necessary to avoid any bus
> +      faults while enabling or disabling a power domain.
> +      For example, this may hold phandles to INFRACFG and SMI.
> +    minItems: 1
> +    maxItems: 3
> +    items:
> +      maxItems: 1
> +
>  patternProperties:
>    "^power-domain@[0-9a-f]+$":
>      $ref: "#/$defs/power-domain-node"
> @@ -123,14 +135,17 @@ $defs:
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
> @@ -138,6 +153,31 @@ $defs:
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
> +        mediatek,bus-protection:
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
> +        mediatek,bus-protection:
> +          minItems: 3
> +          maxItems: 3
> +
>  additionalProperties: false
>  
>  examples:
> -- 
> 2.49.0
> 

