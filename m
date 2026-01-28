Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F45DD35698
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Jan 2026 10:01:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2prp/2+RlS6DkorXzVfUiX0L8fXhKACj1E9ZaJ3Y+A8=; b=ZABf77XHF7B54sa4WZE42ONfir
	khSN7RUFrlO4aCvGpiC/4Idk61CAQZ4fGAQDKE2aQ2B1ESJe+Nz21Gcls7SJW8lG7mqM0OD9wxwbC
	gO8L90k3QcwOFJzD+R7OtS+TCxxV76sBMLlTA+GMoKaDr3LGuK8GU0ZLPgMSOQ307D3XDT6NiuS4w
	P8UCr0pCxDQ8kKVWGaYPMyPwHuCbMpyB2NL4tAwNjiFda92TvRz6zNydt9zQ8x98pURw1WXbL4R/2
	RI+DPAPRLPYt3kcFrFG+iGrrU5jMaktJuonnLC9eqzlvp8viZ6FfDQo8fFGm3biycmEgrEiEVGrMA
	JSQk+RuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl2Mt-0000000Fnem-0IKS;
	Wed, 28 Jan 2026 10:01:47 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl2Ms-0000000Fneg-0lrG
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Jan 2026 10:01:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3B7156001A;
	Wed, 28 Jan 2026 10:01:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75251C4CEF1;
	Wed, 28 Jan 2026 10:01:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769594504;
	bh=huqBKPmdl/GVuwuvQQaYj2vAnPUUV2fdFitGPsGL5rc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=UsFdmFQKnqzBxotq9pxKSI0+GDJWmu4+WszT+rFwLRwl70XrqWN79LKZPahCdABGN
	 zZO+g+bYSdnTn+GZhMwNYu4kPCBJcXaXq0tsTjJyNmIBbF4zVeuO+49i2HwDQJ2euf
	 GDkgrMiFGwkjjDnap1AV6xWA6tTdOh26jmm7MS9PyCovrHIka0VGwJwu9ZaxxS0Vxp
	 XUnyOg7gUMaUFJG1nV9fEklSpS02GCJfWjsLSUTiHWYcuNshuHjqkSq87vBajJMBUI
	 7BB9cAMbVlOKVrEvM4O8l7QrBnck34qPo9mI/1Ljb+A+02hRyxv9FYSW+f3Wj2ZQ9v
	 wyTLeL8eftDvA==
Message-ID: <556bf15b-727a-4eff-92c7-9fc6c744047b@kernel.org>
Date: Wed, 28 Jan 2026 11:01:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/3] dt-bindings: reset: add sky1 reset controller
To: Gary Yang <gary.yang@cixtech.com>, lee@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, p.zabel@pengutronix.de,
 peter.chen@cixtech.com
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, cix-kernel-upstream@cixtech.com
References: <20260128093611.1932770-1-gary.yang@cixtech.com>
 <20260128093611.1932770-2-gary.yang@cixtech.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <20260128093611.1932770-2-gary.yang@cixtech.com>
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

On 28/01/2026 10:36, Gary Yang wrote:
> There are two reset controllers on Cix sky1 Soc.
> One is located in S0 domain, and the other is located
> in S0 and S5 domain.

Please wrap commit message according to Linux coding style / submission
process (neither too early nor over the limit):
https://elixir.bootlin.com/linux/v6.4-rc1/source/Documentation/process/submitting-patches.rst#L597

> 
> Signed-off-by: Gary Yang <gary.yang@cixtech.com>
> Link: https://lore.kernel.org/r/20251124063235.952136-2-gary.yang@cixtech.com
> Signed-off-by: Peter Chen <peter.chen@cixtech.com>
> ---
>  .../devicetree/bindings/mfd/syscon.yaml       |   7 +
>  .../bindings/reset/cix,sky1-rst.yaml          |  46 +++++
>  .../soc/cix/cix,sky1-system-controller.yaml   |  48 +++++
>  include/dt-bindings/reset/cix,sky1-rst-fch.h  |  42 +++++
>  include/dt-bindings/reset/cix,sky1-rst.h      | 164 ++++++++++++++++++
>  5 files changed, 307 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/reset/cix,sky1-rst.yaml
>  create mode 100644 Documentation/devicetree/bindings/soc/cix/cix,sky1-system-controller.yaml
>  create mode 100644 include/dt-bindings/reset/cix,sky1-rst-fch.h
>  create mode 100644 include/dt-bindings/reset/cix,sky1-rst.h
> 
> diff --git a/Documentation/devicetree/bindings/mfd/syscon.yaml b/Documentation/devicetree/bindings/mfd/syscon.yaml
> index 55efb83b1495..be864a6b8efb 100644
> --- a/Documentation/devicetree/bindings/mfd/syscon.yaml
> +++ b/Documentation/devicetree/bindings/mfd/syscon.yaml
> @@ -170,6 +170,8 @@ properties:
>                - cirrus,ep7209-syscon1
>                - cirrus,ep7209-syscon2
>                - cirrus,ep7209-syscon3
> +              - cix,sky1-system-controller
> +              - cix,sky1-s5-system-controller
>                - cnxt,cx92755-uc
>                - freecom,fsg-cs2-system-controller
>                - fsl,imx93-aonmix-ns-syscfg
> @@ -254,6 +256,11 @@ properties:
>            - const: microchip,pic64gx-sysreg-scb
>            - const: microchip,mpfs-sysreg-scb
>            - const: syscon
> +      - items:
> +          - enum:
> +              - cix,sky1-system-controller
> +              - cix,sky1-s5-system-controller
> +          - const: syscon

Do not create your own style. Cix is not special. There is already an
enum for EVERYONE.

>  
>    reg:
>      maxItems: 1

Independent patch. Please do not combine unrelated patches into one.


> diff --git a/Documentation/devicetree/bindings/reset/cix,sky1-rst.yaml b/Documentation/devicetree/bindings/reset/cix,sky1-rst.yaml
> new file mode 100644
> index 000000000000..4323acdc2c45
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/reset/cix,sky1-rst.yaml
> @@ -0,0 +1,46 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/reset/cix,sky1-rst.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: CIX Sky1 Reset Controller
> +
> +maintainers:
> +  - Gary Yang <gary.yang@cixtech.com>
> +
> +description: |
> +  CIX Sky1 reset controller can be used to reset various set of peripherals.
> +  There are two reset controllers, one is located in S0 domain, the other
> +  is located in S0 and S5 domain.
> +
> +  See also:
> +  - include/dt-bindings/reset/cix,sky1-rst.h
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - cix,sky1-rst
> +          - cix,sky1-rst-fch
> +
> +  '#reset-cells':
> +    const: 1

No resources? Then not a dedicated child node, but part of the syscon.
Fold this entire binding into the parent node.

> +
> +required:
> +  - compatible
> +  - '#reset-cells'
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    syscon@16000000 {
> +      compatible = "cix,sky1-s5-system-controller", "syscon",
> +                "simple-mfd";

Mess alignment.

> +      reg = <0x0 0x16000000 0x0 0x1000>;

Does not belong here.

> +      src: reset-controller {
> +        compatible = "cix,sky1-rst";
> +        #reset-cells = <1>;
> +      };

> +    };
> diff --git a/Documentation/devicetree/bindings/soc/cix/cix,sky1-system-controller.yaml b/Documentation/devicetree/bindings/soc/cix/cix,sky1-system-controller.yaml
> new file mode 100644
> index 000000000000..f6e2776e3f53
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/soc/cix/cix,sky1-system-controller.yaml
> @@ -0,0 +1,48 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/soc/cix/cix,sky1-system-controller.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Cix Sky1 SoC system controller register region
> +
> +maintainers:
> +  - Gary Yang <gary.yang@cixtech.com>
> +
> +description:
> +  An wide assortment of registers of the system controller on Sky1 SoC,
> +  including resets and usb.
> +
> +allOf:
> +  - $ref: /schemas/mfd/syscon.yaml#
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - contains:

What? No, don't come with random code. There is no single code like this.

> +          - enum:
> +              - cix,sky1-system-controller
> +              - cix,sky1-s5-system-controller
> +          - const: syscon
> +          - const: simple-mfd

Huh? You already documented this.

NAK, you are making random changes without any concept.

Read previous feedback. Really carefully.

Best regards,
Krzysztof

