Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9AEFC982C1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 09:01:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ndY4ZVKXn4jYxy2ap4ChhJIz6Pf0w0TMQtMwao0c/s4=; b=N1wSny5i5V/TdWqX20IAGH8qSP
	ZFk5YWNaUa9m9IwLCjfYfF0JmXcQcFHxIk48QLT0r/gHVNWWjReVCeUjB6EE/tO2sD1KgeT50jzQA
	YPopx53acjFBSU2IlTacKySKxVoxXBvmyMFEtFe8Y96zZdLWW6kqHmDS+ZOu74B/gKExQxaP2P54l
	+nR8pIBHrh4DnjvBeVcNS318zlZclnljExYJVrrnDerp64egmlwFKlsfvydxbE4abeqz+Z0vHMk2Y
	2wJfXGg59McKRMpD7YXmUrnNGQShTkLaEVvu7RByded7CDoLSzAwfy3WdjJAebf8ns381qUH58iAe
	iypd6ucw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6lVv-00000008mr5-2sMs;
	Wed, 16 Sep 2026 09:01:11 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6lVs-00000008mqD-3lV2;
	Wed, 16 Sep 2026 09:01:08 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 4478743A51;
	Wed, 16 Sep 2026 09:01:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5292E1F0089A;
	Wed, 16 Sep 2026 09:01:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789549268;
	bh=ndY4ZVKXn4jYxy2ap4ChhJIz6Pf0w0TMQtMwao0c/s4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=AumnpGhaRDz4R/OANmzzZG+60wVb7KKHlLqeRbzur2rPpJXJ+bSfzUwzzC5ntEdX/
	 k2O4TX/o4wTaK24YTKSYeDi6Z1xNup/y0HiQJJ2Kirvk2xH1IykfBjzRH7zSIZhCnx
	 14SA24CeuBJNR7vqi3LN0PN7V6vbfiG4TeJclZxgNbq67C9nYZtqbsId6UYS/rI812
	 vxYfu77u3+0mr3rF9Q+LebrLCvhnssBgk+1qvFZ432Xmwj5afxGwOgyvOEKV+f+jSJ
	 haZpG5Fi0eQOBUyRRKs7NdnL98JJ+LP/kj+7kvjJ+sSbl9do4hVO0z4dIomZJ4r7AG
	 v1guUypbrXsUQ==
Date: Wed, 16 Sep 2026 11:01:03 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Zhentao Guo <zhentao.guo@amlogic.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org
Subject: Re: [PATCH v9 3/6] media: dt-bindings: Add Amlogic V4L2 video decoder
Message-ID: <20260916-fat-enthusiastic-termite-44b2e2@quoll>
References: <20260914-b4-s4-vdec-upstream-v9-0-72fdb0d71b02@amlogic.com>
 <20260914-b4-s4-vdec-upstream-v9-3-72fdb0d71b02@amlogic.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260914-b4-s4-vdec-upstream-v9-3-72fdb0d71b02@amlogic.com>
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

On Mon, Sep 14, 2026 at 04:10:20PM +0800, Zhentao Guo wrote:
> Describe the initial support for the V4L2 stateless video decoder
> driver used with the Amlogic S4 (S805X2) platform.

Drop driver. Describe the hardware instead.

> 
> Signed-off-by: Zhentao Guo <zhentao.guo@amlogic.com>
> ---
>  .../devicetree/bindings/media/amlogic,s4-vdec.yaml | 114 +++++++++++++++++++++
>  1 file changed, 114 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/amlogic,s4-vdec.yaml b/Documentation/devicetree/bindings/media/amlogic,s4-vdec.yaml
> new file mode 100644
> index 000000000000..d350b3e68a38
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/amlogic,s4-vdec.yaml
> @@ -0,0 +1,114 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +# Copyright (C) 2025 Amlogic, Inc. All rights reserved
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/amlogic,s4-vdec.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Amlogic Video Decode Accelerator
> +
> +maintainers:
> +  - Zhentao Guo <zhentao.guo@amlogic.com>
> +
> +description:
> +  The Video Decoder Accelerator present on Amlogic SOCs.
> +  It supports stateless h264 decoding.
> +
> +properties:
> +  compatible:
> +    const: amlogic,s4-vdec
> +
> +  reg:
> +    maxItems: 2
> +
> +  reg-names:
> +    items:
> +      - const: dos
> +      - const: dmc
> +
> +  interrupts:
> +    maxItems: 2
> +
> +  interrupt-names:
> +    items:
> +      - const: core_hvdec
> +      - const: core_vdec

Drop "core_" from both... or rather some consistency would be more
useful. Below you call them core_v and core_h, but there is also:

> +
> +  clocks:
> +    items:
> +      - description: Clock for dos core

core dos?

> +      - description: Clock for vdec core
> +      - description: Clock for hvdec core
> +
> +  clock-names:
> +    items:
> +      - const: dos
> +      - const: core_v

hvdec?

> +      - const: core_h

vdec? to keep the naming and order of interrupts?

> +
> +  power-domains:
> +    maxItems: 2
> +
> +  power-domain-names:
> +    items:
> +      - const: dos_v
> +      - const: dos_h

So there is also dos variant v and h?

Pretty confusing.

> +
> +  resets:
> +    maxItems: 1
> +
> +  amlogic,canvas:
> +    description: Canvas maintains an index-to-physical-address
> +     mapping table that allows the 16-bit AMRISC decoder core
> +     to access 32-bit or 64-bit physical address.
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +
> +  amlogic,secure-monitor:
> +    description: Used to decrypt and load the signed decoder
> +     firmware through ARM SMC (Secure Monitor Call).
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +
> +required:
> +  - compatible
> +  - reg
> +  - reg-names
> +  - interrupts
> +  - clocks
> +  - clock-names
> +  - power-domains
> +  - power-domain-names
> +  - resets
> +  - amlogic,canvas
> +  - amlogic,secure-monitor
> +
> +additionalProperties: false

Best regards,
Krzysztof


