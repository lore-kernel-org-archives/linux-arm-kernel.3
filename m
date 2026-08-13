Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6296EC5CFEB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Aug 2026 07:02:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/gqKioEF1GbavDA4gwe7ihUQosNd/QI2W5YICXn7nnM=; b=xmI66uvQKeYeRKIFszSXWS9lBv
	VBpoimy0YWaesrkK0zpscU4r7CAKiXqgFovBXI2OttzShvljjP1mmUVb0aCZ2hTpj9jUnWQEmMOIz
	VajX7xIP2lcYy9GuZd51TkWQZPcraRN8EaQ4F3ZdccOUTZrOHg6MYeE8ZuIJHcAoHIN5zM7Q+LlwS
	p5crzJWHJYerUnq0yLbikRUWcSefJgQnRjC/rCF/k4XYlFNu5X1IZpj4cjjadkLwK/kZcXm59ErOv
	H2NUxnKdNdYb6DT2Lzms/z0jsEIuByAgqOwxraSdIOia7WYbn/+Xl1YeFnUdI30uwnClgT/rjqddH
	4/KXondA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuPS6-0000000HYUV-1aiC;
	Thu, 13 Aug 2026 07:02:10 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuPS4-0000000HYUI-3mF2;
	Thu, 13 Aug 2026 07:02:08 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A4EAC438AE;
	Thu, 13 Aug 2026 07:02:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D8A11F000E9;
	Thu, 13 Aug 2026 07:02:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786604527;
	bh=/gqKioEF1GbavDA4gwe7ihUQosNd/QI2W5YICXn7nnM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=VPNynnMKL0D+jC2TYBCxyz6/CIOrImpUbn9HaqmsYgbOJXdkyDNTUWGSAAkfUj210
	 qzNYoVGaM2Lh/HZrM9fAkftOBaDQ1wReQ9dLFTc2G8JskEYyMCgpS6QZvKLfE5+cyP
	 3Iw3Wb+BOP/gG6i9vqc6e+CIPywd97oWkr9otA7rHSZ3V6/dLZALCRccRgUzzs7qWn
	 qQ1RO7HelgDVVyYRwLz4mNS9E1L7vEA8yop7bsKrklGsZZ3wiHzF682nsnyPwYbsf8
	 4TrMzMPPokVRUcU23LStE2v79ttyY7xstReSObt4x9mtUpvW57g4uNYKprJLuXdM56
	 2Wjwj97PEl8fw==
Date: Thu, 13 Aug 2026 09:01:59 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Zhentao Guo <zhentao.guo@amlogic.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org
Subject: Re: [PATCH v7 3/6] media: dt-bindings: Add Amlogic V4L2 video decoder
Message-ID: <20260813-rustling-sassy-terrier-11b99d@quoll>
References: <20260812-b4-s4-vdec-upstream-v7-0-3fae085861bd@amlogic.com>
 <20260812-b4-s4-vdec-upstream-v7-3-3fae085861bd@amlogic.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260812-b4-s4-vdec-upstream-v7-3-3fae085861bd@amlogic.com>
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

On Wed, Aug 12, 2026 at 10:41:25AM +0800, Zhentao Guo wrote:
> Describe the initial support for the V4L2 stateless video decoder
> driver used with the Amlogic S4 (S805X2) platform.
> 
> Signed-off-by: Zhentao Guo <zhentao.guo@amlogic.com>
> ---
>  .../devicetree/bindings/media/amlogic,s4-vdec.yaml | 111 +++++++++++++++++++++
>  1 file changed, 111 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/amlogic,s4-vdec.yaml b/Documentation/devicetree/bindings/media/amlogic,s4-vdec.yaml
> new file mode 100644
> index 000000000000..b5af3f931b26
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/amlogic,s4-vdec.yaml
> @@ -0,0 +1,111 @@
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
> +      - const: hvdec
> +      - const: vdec

vdec is the name of the module, so not really useful name.

> +
> +  clocks:
> +    maxItems: 3
> +
> +  clock-names:
> +    items:
> +      - const: dos
> +      - const: vdec

Same here

> +      - const: hevcf
> +
> +  power-domains:
> +    maxItems: 2
> +
> +  power-domain-names:
> +    items:
> +      - const: vdec
> +      - const: hvdec

Same here.

> +
> +  resets:
> +    maxItems: 1
> +
> +  amlogic,canvas:
> +    description: should point to a canvas provider node

You basically duplicate the property name. Say something useful, what is
it used for?

> +    $ref: /schemas/types.yaml#/definitions/phandle
> +
> +  secure-monitor:
> +    description: phandle to the secure-monitor node

Can a property whose type is a phandle and is called "secure-monitor" be
not "phandle to the secure-monitor node"?

Write useful code, not redundant.

Anyway, missing vendor prefix as it is not a generic property (otherwise
point me to generic schema defining it).

Best regards,
Krzysztof


