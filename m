Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D650AC77B7F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Jun 2025 08:28:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NHfqhITlmhrbjtO0T2hpezInkwvE1h9cCNZir7Y+m8U=; b=PysBBTMCVG9D99YWrcGxtkHvBH
	uPLPR86z67jEhbR+zFM0zSwOBGpDfREAXI5m/vMbRZPG8PrbQyQxur5+MIzL35jNVKzAaHjJk3RNB
	ksIuwPsDz+qn0eY8ZPOp2MIttaOz/pja5cVZd8CEP4rZAliwzhQoFTNDj28YrMcUTdNb3L5NIu7Jk
	Fj7ifLOS4I2W7Yxvi9FDNLhplAjeZ2+qB631VO3zVA16WFdjmSOZFqPKcUOa+7yPx4R2LUk688b+i
	BGZaWUblg0KAMBj6uqbfkNEkgVfTUIm317o5UEhjztpC+fWdjqouLVImIHMXdipEONaTxc4O4HtfE
	8eKSrWfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV4Ry-0000000Dxfd-3JNL;
	Fri, 27 Jun 2025 08:28:46 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV4Kx-0000000DwRI-3bUw;
	Fri, 27 Jun 2025 08:21:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 1DD48A524EC;
	Fri, 27 Jun 2025 08:21:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00081C4CEE3;
	Fri, 27 Jun 2025 08:21:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751012490;
	bh=R1sZzVC/82bShp+OXCNfF4U5u7UiznUIJE69/OzQOtQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WfhF8km/BFAiaGhTzFhBCOiEFtu4vrTsTW3HOyzC/brHj3LwGcAj3peH9ZLLgCGHo
	 cDEDhbmPHrLRqP8fdh1c+R1J1BcI2AsspLUjfU7YOMg7ZZYqRXZEGgxIFQetMs9Ph8
	 WpcOCwFJUFNqpa+1vs2/OdlbSq/WT8clsFQlmi3FHuMbJCzugLzHB8arMGy/IIOVj3
	 awG43vJyBrsSoxVfP3zw5t/17rJw4LiJjC0FSMHmkkXH9xse/MPtgozMCc8m+5eBr3
	 vrZG18T7OAaoRxCjFXpOCrWTKbrAdsBvIWfinoJMTKq7d4c8ywSe2nmoXuwZhcCWEy
	 hLbj3j5z3pX+Q==
Date: Fri, 27 Jun 2025 10:21:27 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: broonie@kernel.org, lgirdwood@gmail.com, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, matthias.bgg@gmail.com, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, kernel@collabora.com
Subject: Re: [PATCH v2 5/6] dt-bindings: regulator: Document MediaTek MT6373
 PMIC Regulators
Message-ID: <20250627-meek-furry-mayfly-6bf0e1@krzk-bin>
References: <20250624073548.29732-1-angelogioacchino.delregno@collabora.com>
 <20250624073548.29732-6-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250624073548.29732-6-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250627_012131_959856_165D62AD 
X-CRM114-Status: UNSURE (   9.30  )
X-CRM114-Notice: Please train this message.
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

On Tue, Jun 24, 2025 at 09:35:47AM +0200, AngeloGioacchino Del Regno wrote:
> +properties:
> +  compatible:
> +    const: mediatek,mt6373-regulator

Where is mediatek,mt6373? Nothing in cover letter explains that, but I
expect parent device schema to $ref this one or (better) mention
compatibles for child.

> +
> +  interrupts:
> +    description: Overcurrent warning interrupts
> +    minItems: 1
> +    maxItems: 35
> +
> +  interrupt-names:
> +    description:
> +      Names for the overcurrent interrupts are the same as the name
> +      of a regulator (hence the same as each regulator's node name).
> +      For example, the interrupt name for regulator vs2 will be "vs2".
> +    minItems: 1
> +    maxItems: 35
> +
> +patternProperties:
> +  "^v(ant|aud|aux)18$":
> +    type: object
> +    $ref: regulator.yaml#
> +    unevaluatedProperties: false

You need to document what modes mean in schema with constraints and in
text with their actual meaning (see regulator.yaml).

Also: Other comments from previous patch are applicable.

Best regards,
Krzysztof


