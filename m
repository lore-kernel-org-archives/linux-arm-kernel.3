Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7A4FC54E90
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 25 May 2025 04:58:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zAI4r50m2qegVgD4by79W9Cgqa98Pr+bKH9zz0T8m+0=; b=Dnggf+v4CyRcGw3NjX50YNdq0S
	jEC02ODhqzsvJES13vI4RGbUKHdbFHmX60T424H9sdZX2YBImqghqr8bAe8KmyQpK5n417gmcQikr
	SjTRpvwtFjMTD4QWH7SqvGMw7t8JlIS5yRHvg4LmFjoIlvhX/LvZ0UXB28yidgD2TvNYKpZpe2GLe
	YM5ugdvuO9BE735QESetE+iUz0+iss1d+cdTwfWU5yKCEoYYDiATVrzK2z547HbJhHHAVQJfGNJaZ
	nllAdJ5SFzGGhObhI3WJxHMgXfR3hEEZU2vUsj6RfMmsrkZk4vRz07ppR0CtK4kTV+Jl68Omx06wI
	1islHrAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJ3Qo-00000006ZCX-30cd;
	Sun, 25 May 2025 04:57:54 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJ3Oi-00000006Z5v-3sh2;
	Sun, 25 May 2025 04:55:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D8ADE60007;
	Sun, 25 May 2025 04:55:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABDB5C4CEEA;
	Sun, 25 May 2025 04:55:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748148942;
	bh=bWw6f1oPVGszDiKHtYyvEIzbYdNJsCK4FK7ugxSRdS0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=oPa07mHVn+W/bK57GWXsNpWjBZGxRWs4pJYLeXBiBaWmDWOYIiN0qM7KWnImn1lVc
	 T9Jw4t+7Mci12ZoQvQgv+wIHBksqyQId2xZQFXjg8wbIOR/pRoQTsHQ7iRh+I2z8yf
	 H8GEGqtwkRF66y5gBOgXqttPcULKwgUAzp4hkAW9YD80vMfWZE5wjPXP/ufwre9i9q
	 k3ybE0GCpZskmZSAnTmW4HPGUPtex47VOI6eg/+DfRryNqa87VqlkFQSXUQKwSzvAk
	 hXzHtMH/b6QZYFC4M3nD6fEb2PlML7AkoofNcvEbXDopEMPTbMUVIfhJHdZPsh5olW
	 y0BI/cqJ/giqw==
Message-ID: <1e18c066-dc4c-4f54-a784-8edbfdd7b5d0@kernel.org>
Date: Sun, 25 May 2025 06:55:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 02/10] dt-bindings: media: Add MT8188 ImgSys's LARB
To: Olivia Wen <olivia.wen@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com, teddy.chen@mediatek.com,
 yunkec@chromium.org
References: <20250524115144.3832748-1-olivia.wen@mediatek.com>
 <20250524115144.3832748-3-olivia.wen@mediatek.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <20250524115144.3832748-3-olivia.wen@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

On 24/05/2025 13:49, Olivia Wen wrote:
> This patch adds support for the MT8188 Image System's Local Arbiter
> (LARB) in the device tree bindings. The LARB is a crucial component in
> MediaTek's ImgSys architecture, responsible for managing memory access
> and arbitration between various hardware modules.
> 
> Signed-off-by: Olivia Wen <olivia.wen@mediatek.com>
> ---
>  .../bindings/media/mediatek,imgsys-larbs.yaml | 75 +++++++++++++++++++

Your patchset wasn't tested, so I won't do full review. Be sure you test
it prior sending. Few nits below:

Please use subject prefixes matching the subsystem. You can get them for
example with `git log --oneline -- DIRECTORY_OR_FILE` on the directory
your patch is touching. For bindings, the preferred subjects are
explained here:
https://www.kernel.org/doc/html/latest/devicetree/bindings/submitting-patches.html#i-for-patch-submitters


>  1 file changed, 75 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/mediatek,imgsys-larbs.yaml
> 
> diff --git a/Documentation/devicetree/bindings/media/mediatek,imgsys-larbs.yaml b/Documentation/devicetree/bindings/media/mediatek,imgsys-larbs.yaml
> new file mode 100644
> index 000000000000..d2966c64ddb6
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/mediatek,imgsys-larbs.yaml

Filename equal to compatible.

> @@ -0,0 +1,75 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/mediatek,imgsys-larbs.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: LARB Information for MediaTek Camera Image System Hardware
> +
> +maintainers:
> +  - Olivia Wen <olivia.wen@mediatek.com>
> +
> +description:
> +  Detailed configuration for MediaTek Camera Image System's Local Arbiter
> +  (LARB) hardware integration.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - mediatek,mt8188-imgsys-larbs
> +
> +  iommus:
> +    minItems: 1
> +    maxItems: 30

This cannot be flexible. List the items, unless it is somehow obvious.


> +
> +  '#address-cells':
> +    const: 2
> +
> +  '#size-cells':
> +    const: 2

These are useless.

> +
> +required:
> +  - compatible
> +  - iommus
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/memory/mediatek,mt8188-memory-port.h>
> +
> +    imgsys-l11b {

Node names should be generic. See also an explanation and list of
examples (not exhaustive) in DT specification:
https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation


> +        compatible = "mediatek,mt8188-imgsys-larb";
> +        #address-cells = <2>;
> +        #size-cells = <2>;

Why?

> +        iommus = <&vpp_iommu M4U_PORT_L11B_WPE_RDMA_0>,
> +             <&vpp_iommu M4U_PORT_L11B_WPE_RDMA_1>,

Fix alignment.



Best regards,
Krzysztof

