Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E256BD6B087
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Jan 2026 16:23:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LZ6hHd5xymaSsXvhBB04Vz/xfU3D5XQXvoRBeUfvYwo=; b=3SD6ueFBnPrl8KiYtFUZdh6OHG
	CMcWYvaZxeDJghy/HTs37o+CpvmI2P+MJHd1YJFcvLHAnuh83aJlz9Am9lhKmLqI3ADILXAmwUs6Z
	yAeIcNdU5Jfya3L88dg+6nrVcR6rUpFYlxFxwiruXjPYpjKwH/c5uzXi8/XsvxtCRahZH7IoKCJvU
	8jA4Y3UEbSpTn/55S//FLUnRoaskY5c9F6CaXlYbw/cPKoz9GFf99o8Uw8NpCz9gYyUCCLEELHhH6
	XZvQNu5OvTblzuKSdBQzibLI2Kn1FexTaYQgt/nEgJW9F+PuExDQMA7Ts7pww6NR5EZN2y7ecHDmX
	BmpP9mBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlUna-00000000LQd-1Oag;
	Thu, 29 Jan 2026 16:23:14 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlUnS-00000000LOi-0FmP
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Jan 2026 16:23:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3E28E4374C;
	Thu, 29 Jan 2026 16:23:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 020F0C4CEF7;
	Thu, 29 Jan 2026 16:23:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769703785;
	bh=H0JUGjT6UJGPBNFYGcqjXsbNql7WKYh6KMyId7b2fSY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YN0ns6rRb3X2NOFT1ENrEeGq0XJ3ODDb5Lmqm9mw27GBicS6hPyO5IaFQUyefIfYZ
	 r7DtoV6wRH6vbFB/5ulaf6RDna0QjwW/umEx9EQSLkXBoo2ZCsER8oH4t5fTkWRS7O
	 BiYoixWd01AHfLAwXCvQCT5+TuUf7DmT1pUy1cLJi+AjG4WISrIGw5gM1WyyISun0F
	 96Jy4rJn/W1Pr6KQAsOGBGD6ALQqMHJtgq7YFVxBPdxUo/xqkiFsao8hjkoeQlogkp
	 rvx9HpqoxADnaQHLYV67UCgtrpNogD9qnvxG4ZonyR36+cdJ0bR2iJ3uMWO0bCV0YY
	 Jwn+y6lj258VA==
Date: Thu, 29 Jan 2026 10:23:04 -0600
From: Rob Herring <robh@kernel.org>
To: Gary Yang <gary.yang@cixtech.com>
Cc: lee@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	p.zabel@pengutronix.de, peter.chen@cixtech.com,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	cix-kernel-upstream@cixtech.com
Subject: Re: [PATCH v5 1/3] dt-bindings: reset: add sky1 reset controller
Message-ID: <20260129162304.GA1209761-robh@kernel.org>
References: <20260129070046.2601503-1-gary.yang@cixtech.com>
 <20260129070046.2601503-2-gary.yang@cixtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260129070046.2601503-2-gary.yang@cixtech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260129_082306_136644_08DF3798 
X-CRM114-Status: GOOD (  19.52  )
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

On Thu, Jan 29, 2026 at 03:00:44PM +0800, Gary Yang wrote:
> There are two reset controllers on Cix sky1 Soc. One is located in S0
> domain, and the other is located in S0 and S5 domain.

The comments on v4 still apply... Repeated below...

> 
> Signed-off-by: Gary Yang <gary.yang@cixtech.com>
> Signed-off-by: Peter Chen <peter.chen@cixtech.com>
> ---
>  .../bindings/reset/cix,sky1-rst.yaml          |  41 +++++
>  .../soc/cix/cix,sky1-system-controller.yaml   |  48 +++++
>  include/dt-bindings/reset/cix,sky1-rst-fch.h  |  42 +++++
>  include/dt-bindings/reset/cix,sky1-rst.h      | 164 ++++++++++++++++++
>  4 files changed, 295 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/reset/cix,sky1-rst.yaml
>  create mode 100644 Documentation/devicetree/bindings/soc/cix/cix,sky1-system-controller.yaml
>  create mode 100644 include/dt-bindings/reset/cix,sky1-rst-fch.h
>  create mode 100644 include/dt-bindings/reset/cix,sky1-rst.h
> 
> diff --git a/Documentation/devicetree/bindings/reset/cix,sky1-rst.yaml b/Documentation/devicetree/bindings/reset/cix,sky1-rst.yaml
> new file mode 100644
> index 000000000000..b52791e2b18e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/reset/cix,sky1-rst.yaml
> @@ -0,0 +1,41 @@
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
> +
> +required:
> +  - compatible
> +  - '#reset-cells'
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    reset-controller {
> +      compatible = "cix,sky1-rst";
> +      #reset-cells = <1>;
> +    };
> diff --git a/Documentation/devicetree/bindings/soc/cix/cix,sky1-system-controller.yaml b/Documentation/devicetree/bindings/soc/cix/cix,sky1-system-controller.yaml
> new file mode 100644
> index 000000000000..913e77fc522a
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
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - cix,sky1-system-controller
> +          - cix,sky1-s5-system-controller
> +      - const: syscon
> +      - const: simple-mfd
> +
> +  reg:
> +    maxItems: 1
> +
> +patternProperties:
> +  "^reset(-controller)?$":
> +    type: object
> +    $ref: /schemas/reset/cix,sky1-rst.yaml#

This is not a separate device.

> +
> +required:
> +  - compatible
> +  - reg
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    syscon@16000000 {
> +      compatible = "cix,sky1-s5-system-controller", "syscon", "simple-mfd";
> +      reg = <0x16000000 0x1000>;
> +      reset-controller {
> +        compatible = "cix,sky1-rst";
> +        #reset-cells = <1>;

Move #reset-cells to the parent node and drop this node. And then drop 
"simple-mfd". Or perhaps the definition for what's in the 
"cix,sky1-s5-system-controller" is incomplete? If so, please define all 
the binding.

Rob

