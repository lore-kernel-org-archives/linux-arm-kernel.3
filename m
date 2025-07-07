Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39BAAC83030
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Jul 2025 05:50:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+0uzkhGv4VXyCQyJx45O/5/irshbF4fV5GSoN5nIvFk=; b=RHr/zAtit6B7xD5Z4Fxwmbi/2h
	gmLTYBacVXIdPXMh9NrsQLf7c4qIN1g1qIhI4bH7crY93U4CnYcMCwnk6IhZpQ+QztHFk4B+wsyy/
	lQ3PNysXA0HUo0hcmGu2zEf3FI8Mzpfsh5WdkGPAGpnS9HjE+2gDcpNPwe64rlRZZR2k1wVPG+HY6
	h4gAsLzKAZZdmdeBlmsPuXmJjtLpwJfrptk7nnLM+4OA/V0dbX3KciFjNLAfWacxSffEs2ojZUm7Z
	KxPTqPda/qEeRaOqonR61CKoTGGsq1Z3Rhv0Z2M48wD9ViJHPdr9ONZtd0n2/isrNho4+cOX8Da5O
	qGMUwMYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYekM-00000001Tso-1K7L;
	Mon, 07 Jul 2025 05:50:34 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYeha-00000001TUX-0Dgt;
	Mon, 07 Jul 2025 05:47:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 52CE05C3A6B;
	Mon,  7 Jul 2025 05:47:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6EE30C4CEE3;
	Mon,  7 Jul 2025 05:47:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751867261;
	bh=RUg14gaLugN27TRVwpe1/3n2sC7iFkyWvPiH9pWUG9U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CYuD4PVbP0qSkgXbrQHODHCo9u5/BJOYbdMDgQAtUvpp2B7ucekEBv+AksbJPBRpP
	 8WzKchoYO8ih/2WNgc2BwGMjbSbLRwZ/JDRgyJsSvEou+QHFaGG7Pp42YtVaL9voaQ
	 kBelBtaSmUfBb78jf2ZgxiaJXUE6eY2u4as2WPBoweekJjLif26ZHZFpdZGmkbsR2A
	 5So4v0MbtIcuNnu9GpJ7MbMizRRgiAQP+PDGT3HAyciWBrofZBaOo15KBhvqAmvELw
	 qjRYUCqb0Hri3Irx1cCLavkraaTQ8IQwYewBq0Nf3IWVsF0/ymbURtoBJer16JV7lW
	 c4I+0Tiy/AY5A==
Date: Mon, 7 Jul 2025 07:47:38 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: shangyao lin <shangyao.lin@mediatek.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH v2 04/13] dt-bindings: media: mediatek: add cam-yuv
 binding
Message-ID: <20250707-fiery-conscious-squirrel-e0fa1e@krzk-bin>
References: <20250707013154.4055874-1-shangyao.lin@mediatek.com>
 <20250707013154.4055874-5-shangyao.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250707013154.4055874-5-shangyao.lin@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250706_224742_124680_911AA63F 
X-CRM114-Status: GOOD (  13.11  )
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

On Mon, Jul 07, 2025 at 09:31:45AM +0800, shangyao lin wrote:
> From: "shangyao.lin" <shangyao.lin@mediatek.com>
> 
> Add camera isp7x module device document.
> 
> ---
> 
> Changes in v2:
>   - Rename binding file to mediatek,mt8188-cam-yuv.yaml
>   - Various fixes per review comments
>   - Update maintainers list

Where did you post v1?

Please use standard email subjects, so with the PATCH keyword in the
title. 'git format-patch -vX' helps here to create proper versioned patches.
Another useful tool is b4. Skipping the PATCH keyword makes filtering of
emails more difficult thus making the review process less convenient.

A nit, subject: drop second/last, redundant "bindings". The
"dt-bindings" prefix is already stating that these are bindings.
See also:
https://elixir.bootlin.com/linux/v6.7-rc8/source/Documentation/devicetree/bindings/submitting-patches.rst#L18

> +properties:
> +  compatible:
> +    const: mediatek,mt8188-cam-yuv
> +
> +  reg:
> +    minItems: 1

What, why?

Look at other bindings.

> +    maxItems: 2
> +    description:
> +      Base address and optional inner base address of the cam-yuv hardware block.

Why are you stating obvious? From where did you take it?

> +
> +  reg-names:
> +    items:
> +      - const: base
> +      - const: inner_base
> +    minItems: 1
> +    maxItems: 2

No, really no. You did not follow any existing patterns and this binding
does not look at all as anything else. Why making this things up? Just
use recently reviewed binding as starting point.

Best regards,
Krzysztof


