Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B28BEC021AA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Feb 2025 22:26:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zfMZhcNVQIY79dAab5hBr81KrcZyuJ7L9twYgjtlEoA=; b=a6XvbyLixCaG9wLHofFpmQdjfl
	KZSA3w5pJZ0JslVeBRiOS4GX9KQ7/wGq4dSnoLfTgaTTTFw+VDG/5jjMbB2VUQmGHsD4wNO88UuxI
	WFpxdT0HATFGRfMCHdbqNLT6QPa6odsh+ZLmocG/356Db/05Y2IWqFA1m3XJ6RtG8xwf1Py/VXcax
	C6suKmsXI9OYIAF7vWB3KqAfGEZpLCfVoEugsvCvxwXsfYLRD8rLZOpLUy3eZe88eAvgM3wipf6X0
	zNTEx16XToVXjGl1zDeeENqNQSpJUiTf9C/x/A5nwIqdpkFyqeR9A0OmXYgw9mprsAersQey6m2ge
	+ZtMJUWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tksVp-0000000FQnR-0RaZ;
	Wed, 19 Feb 2025 22:25:49 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tksTW-0000000FQ89-1V0v;
	Wed, 19 Feb 2025 22:23:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 38DE161202;
	Wed, 19 Feb 2025 22:23:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A904C4CED1;
	Wed, 19 Feb 2025 22:23:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740003805;
	bh=jJj74kq2dXg5VOc0yCCKcirAapeCmvuLU0B0w4KuQQg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JT9G67YHTPyWuV4c8g3Dviag3iI5OsJ0Aw1swxfwhD88uWVwhvFNF5T7AiEacq/Xi
	 nQZyxf6GXzQTeqO373fjlM0MKOMoYBh63Pxd4nS024yIv1aGQul5wS7xo8Oeq4hJp2
	 ImuoR0boWN/6Kj3u9lhZ/44GAByjDb/sTSvnkgx1TNbRziXwVTSnRDRlWbAOdXETru
	 XRiTlXMxxE8VrxLaNYncx9TBcGEbyhxdpld06fKIuauccThdIJST7m/GbAZRm8gHF0
	 hAp5NnxaQ04f13X1+NdAPGAvsiekKLplm9a9XKlb7hHlymIFAMjSqWBuLCyRJubHfK
	 NwqEajbwKENgA==
Date: Wed, 19 Feb 2025 16:23:23 -0600
From: Rob Herring <robh@kernel.org>
To: Dharma Balasubiramani <dharma.b@microchip.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/2] dt-bindings: mmc: atmel,hsmci: Convert to json
 schema
Message-ID: <20250219222323.GA3013450-robh@kernel.org>
References: <20250212-mmc-slot-v3-0-2bf288207040@microchip.com>
 <20250212-mmc-slot-v3-2-2bf288207040@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250212-mmc-slot-v3-2-2bf288207040@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250219_142326_453384_EC408624 
X-CRM114-Status: GOOD (  14.39  )
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

On Wed, Feb 12, 2025 at 02:52:11PM +0530, Dharma Balasubiramani wrote:
> Convert atmel,hsmci documentation to yaml format. The new file will inherit
> from mmc-controller.yaml.
> 
> Signed-off-by: Dharma Balasubiramani <dharma.b@microchip.com>
> ---
>  .../devicetree/bindings/mmc/atmel,hsmci.yaml       | 106 +++++++++++++++++++++
>  .../devicetree/bindings/mmc/atmel-hsmci.txt        |  73 --------------
>  2 files changed, 106 insertions(+), 73 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/mmc/atmel,hsmci.yaml b/Documentation/devicetree/bindings/mmc/atmel,hsmci.yaml
> new file mode 100644
> index 000000000000..feaa98e44955
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mmc/atmel,hsmci.yaml
> @@ -0,0 +1,106 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mmc/atmel,hsmci.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Atmel High-Speed MultiMedia Card Interface (HSMCI)
> +
> +description:
> +  The Atmel HSMCI controller provides an interface for MMC, SD, and SDIO memory
> +  cards.
> +
> +maintainers:
> +  - Nicolas Ferre <nicolas.ferre@microchip.com>
> +  - Aubin Constans <aubin.constans@microchip.com>
> +
> +allOf:
> +  - $ref: mmc-controller.yaml
> +
> +properties:
> +  compatible:
> +    const: atmel,hsmci
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  dmas:
> +    maxItems: 1
> +
> +  dma-names:
> +    const: rxtx
> +
> +  clocks:
> +    maxItems: 1
> +
> +  clock-names:
> +    const: mci_clk
> +
> +  "#address-cells":
> +    const: 1
> +    description: Used for slot IDs.
> +
> +  "#size-cells":
> +    const: 0
> +
> +patternProperties:
> +  "^slot@[0-9]+$":

If reg can only be 0 or 1, then allowing 2-<infinity> is not valid.

Otherwise,

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

> +    $ref: mmc-slot.yaml
> +    description: A slot node representing an MMC, SD, or SDIO slot.
> +
> +    properties:
> +      reg:
> +        enum: [0, 1]

