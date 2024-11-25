Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0171DD3B7E1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Nov 2024 07:47:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LBuk0UVcyQ6/IaH8sVqrQHBouMdvbTSVqVSKxZCS0SQ=; b=NsXpzvSufhVT6lZsZaNLt7SaTm
	FdYSNnsDDYscxuMHcluk26KU3TmrS9uM3tyfFBHQU76QL2Kwbv9ODzFhdtiQ9RBVGTdCDr/Yr425Y
	OVwGiZCBGNs0U5gKdZ5ENttHUgNpXhTNE7DVuAttH678FiivS2UurEaviEpTDWloC3inEzQNRt+8m
	PtSITFoMv9cMmp2YnmYazLRt0y8gwq6WnKtvDjp4QSc+Lawu0q+qPdej+5WlhnFnnyfU0nNMlr48r
	GTjS69kby23blHsZtYU2SAyOPUh2XgY55jGuIrLwkbaY0YTi1jy3Q8PwaGyf8l+ywDGVni08XGXIQ
	F4kV5WBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFTo2-00000007GyV-2nVh;
	Mon, 25 Nov 2024 07:46:50 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFTn5-00000007Gth-1Gf0
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 Nov 2024 07:45:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E34EA5C54E6;
	Mon, 25 Nov 2024 07:45:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A65BC4CECE;
	Mon, 25 Nov 2024 07:45:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732520749;
	bh=QkmKRQufxVbtOJlGOhCoU0r8+2yxxJyk9PPJcIydGG4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MYFrveydLiYRWlAIyh8GYlL0YM9Q896zpfUzgrP0F9/Go8fZEYiUzoU56kg8PVMbI
	 c0BolaJeNa1960vBUIJdWNczsAwuU5LjEenBa9nIm0/SHrtDlUGMjs0ASf9Y2QWrbi
	 odnBkyNsXl3TUXYUj0aXwkubOMoLldrvbsHk65USwfjW0KoIiZc/H739irmyq9cjsK
	 Jp/0N6/JvyJK7ut2EnOqctMa9QNnFqxpIK8EClS/Ro9X7CCRi1BX8TzQJx6jfDhA4b
	 Es3cOdNVgtyzREvIT7yFzdZmmMVMlyl54De87aPPHr5dcZwxTVVMwuz9KvqfDHN1mE
	 CY9x0i+yy68Ag==
Date: Mon, 25 Nov 2024 08:45:46 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Sasha Finkelstein <fnkl.kernel@gmail.com>
Cc: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <quic_jesszhan@quicinc.com>, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/5] dt-bindgins: display: Add Apple pre-DCP display
 controller bindings
Message-ID: <ksdp54qj55v7igvvcshl6y2cxpmqy7rlsh4xsixpptjn7s7wlu@76ejtq6ytvbp>
References: <20241124-adpdrm-v1-0-3191d8e6e49a@gmail.com>
 <20241124-adpdrm-v1-1-3191d8e6e49a@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241124-adpdrm-v1-1-3191d8e6e49a@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241124_234551_433206_223F3F92 
X-CRM114-Status: GOOD (  17.90  )
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

On Sun, Nov 24, 2024 at 11:29:24PM +0100, Sasha Finkelstein wrote:
> Add bindings for a secondary display controller present on certain
> Apple laptops.
> 
> Signed-off-by: Sasha Finkelstein <fnkl.kernel@gmail.com>
> ---
>  .../bindings/display/apple,display-pipe.yaml       | 59 ++++++++++++++++++++++
>  .../bindings/display/panel/apple,summit.yaml       | 24 +++++++++
>  2 files changed, 83 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/apple,display-pipe.yaml b/Documentation/devicetree/bindings/display/apple,display-pipe.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..bd25ddc6e09dd636c0221c854e594113f6011866
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/apple,display-pipe.yaml

No, use fallback compatible as filename.

> @@ -0,0 +1,59 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/apple,display-pipe.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Apple pre-DCP display controller.
> +
> +maintainers:
> +  - asahi@lists.linux.dev
> +  - Sasha Finkelstein <fnkl.kernel@gmail.com>
> +
> +description: |

Drop |

> +  A secondary display controller used to drive the "touchbar" on certain
> +  Apple laptops.
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +        - "apple,t8112-display-pipe"
> +        - "apple,t8103-display-pipe"
> +      - const: "apple,h7-display-pipe"


This wasn't tested... Drop all quotes. Do you see any file with quotes?
Why doing things entirely different than everyone else?

> +
> +  reg:
> +    minItems: 3

Drop

> +    maxItems: 3
> +
> +  reg-names:
> +    items:
> +      - const: be
> +      - const: fe
> +      - const: mipi
> +
> +  power-domains: true

List the items instead or maxItems: 1.

> +
> +  interrupts:
> +    minItems: 2

Drop

> +    maxItems: 2
> +
> +  interrupt-names:
> +    items:
> +      - const: be
> +      - const: fe
> +
> +  iommus: true


maxItems: 1

> +
> +  "#address-cells":
> +    const: 1
> +
> +  "#size-cells":
> +    const: 0
> +
> +additionalProperties: true

This cannot be true. Must be false.

> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts

This goes before additionalProperties.

Missing example: that's a strong NAK and prove that this could not be
even tested.

Do you see any device schema without example? No. Do not develop things
differently, Apple is not unique, special or exceptional.


> diff --git a/Documentation/devicetree/bindings/display/panel/apple,summit.yaml b/Documentation/devicetree/bindings/display/panel/apple,summit.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..dc281c1f52c1ed07cc2f7f804dcfd2f3b4239d89
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/panel/apple,summit.yaml
> @@ -0,0 +1,24 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/panel/apple,summit.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Apple "Summit" display panel.
> +
> +maintainers:
> +  - asahi@lists.linux.dev
> +  - Sasha Finkelstein <fnkl.kernel@gmail.com>
> +
> +properties:
> +  compatible:
> +    const: apple,summit

No, too generic. Panels need much more properties, this is heavily
incomplete. See other panel bindings.

Best regards,
Krzysztof


