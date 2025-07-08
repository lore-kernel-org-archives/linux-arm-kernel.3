Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DBC9C8303C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Jul 2025 20:01:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=niMNxn7ng6fdm3cI5pTRspXuG8lfvTxhpN794/dU0cQ=; b=xkXmxv6BthCgpYtR4bWHQNl6/z
	rOx8LcX7tfHuvU1AvrF6nNDa1yuigG9pk2MlzT4YLWhiDhW5oRbCHUI7GlFMZyQy0y+wuFLhlAdFs
	H//OB5nDTx532UubGI6K7d6/cU6k4UobrfnLR3jGMEF9+QFciXYHofPbdLo+pjhU8bpGrZx2HoHXP
	t2X5aWDwfN3a0UxamQynYArnUvnTizL2LkrZE8L/WhRPdq8xCmQjAL9lgL4AwseviSe8XaEg76v/R
	3rix1ehCOIhxtL9sg0sqAN81Jp5GkTcsmJO17NaXLdiGmel9ECK64bfVfYWTXoCNoYqk/fLHdDO4M
	Z4aNMp1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZEV6-00000006Ryl-1BBh;
	Tue, 08 Jul 2025 20:01:12 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZDpb-00000006L5j-1Fo0;
	Tue, 08 Jul 2025 19:18:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 801B3A542AE;
	Tue,  8 Jul 2025 19:18:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C4A0C4CEED;
	Tue,  8 Jul 2025 19:18:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752002297;
	bh=CqxReAjk4p+ThDgdhazjTZmOHtB9hZJ/Bma1N9kU+Hk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KZZbEkp5Qh7CYJ/We3wQhmgXCmuLJuq9jo3slSJ1B8UvZ+bVszH1wC/78AbyAyuVU
	 P3b6zw1YqWv7n5VW5NDZjf0vnEOPuK/7x90h1eGdnMgxaTdOWaFTPWIcsAI/d6hgJq
	 q4JsimkJIJ3inT1x66GZI9zQgF9qvspCZ2ZetLSvDDxVLw+AL3WPJ/9NfMKD9wddrr
	 4xC1/PCtuQfQM85NHeOkbJ9saLQBUTCgpl81LIGrIxCaUvHVMeWGpVhaaLOECwqWg4
	 KtPuAlJpAQWktPtHVBYAPwBfge5/HtOiIvmnuDYx29fVXTsF6Rt8aZav8kX7V5kBzp
	 TPO0L181oPFng==
Date: Tue, 8 Jul 2025 14:18:16 -0500
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
Subject: Re: [PATCH v2 01/10] dt-bindings: memory: mtk-smi: Document
 #access-controller-cells
Message-ID: <20250708191816.GA770716-robh@kernel.org>
References: <20250707105605.98248-1-angelogioacchino.delregno@collabora.com>
 <20250707105605.98248-2-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250707105605.98248-2-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_121819_404206_B75370C3 
X-CRM114-Status: GOOD (  14.89  )
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

On Mon, Jul 07, 2025 at 12:55:56PM +0200, AngeloGioacchino Del Regno wrote:
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

Kind of odd for an access controller controlling only 1 device. You 
said 'at least', so maybe this should be 1?

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
> 2.49.0
> 

