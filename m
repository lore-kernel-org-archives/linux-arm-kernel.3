Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C2C7CD4851
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 May 2026 08:09:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0Xtl+Wcgyrco91Jp0YyLiL2+UAIisx6eRRNEv6ecRpI=; b=JvUNfrPLLVg3nNIqD2qjYnTEJp
	pyj/A3d6Wd144RLlA5TJmCRtWOci5rhplEQAoJU5h+j71T57QX1zJSEgxV0+NmH/4b6Yso4KlknHo
	Bb6zDqfDMWjEEnCWlPxpGuxm0x2mGcX+eqm/H5mK9AiyA/bSRGzj97paA2xlN3mlHX8ZAfw/mzJuq
	whzpPPbIeBh8jSJO3rBwAMvy3E9zL83FCHlFNMEMa1wvlOQ5+/+9Fh9aZm5GjjVx6laOXrCrPhruS
	JqLNVNGMJScqasJ8MfEnC+diSal89JcrEk5PLk1tnZ7JWU33G8BPD+dNX/fJsSQi9XHzbBV2139Ot
	6OmK5+jQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNnbZ-00000007hPx-2e3n;
	Fri, 15 May 2026 08:09:09 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNnbX-00000007hPa-0ZYm;
	Fri, 15 May 2026 08:09:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4B87F60581;
	Fri, 15 May 2026 08:09:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70295C2BCB0;
	Fri, 15 May 2026 08:09:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778832546;
	bh=Bg1YT47zyTBWhwh0sSsEf1oPFueOBupCLeeynnys2HI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vNTOm601qZQyM9NgdondIjlzH01Q1CG7YdS5AgL6NV15huyEn/G5DKJSeDw1NzIVu
	 thjZF1bzS4pQhwkwA07lyUn25QBWDIqArSxr7+EoJ4IAjJKohxBLtRQ8JCqP/A684b
	 p9aoJuB8si12qsbvVcaL8BDgsV8eaIybycR9kQv3qpRKmTIcVhyDFxiZc2H2oiJpF2
	 Trq2LzeONPJPe8tcuiejcDJMBsDW+ioARKNuXmm46Bali1i87BpDyBy0/1GBA/+jxH
	 8LSFT7lLUZHSTQMgkjRv3Fh0+gDzIQ0Y3kcwg4RDhyxX8IQB3cT/2dBeCC7+JbFw0n
	 1pkY+tlnELCkQ==
Date: Fri, 15 May 2026 10:09:03 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jian Hu <jian.hu@amlogic.com>
Cc: Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Jerome Brunet <jbrunet@baylibre.com>, 
	Xianwei Zhao <xianwei.zhao@amlogic.com>, Kevin Hilman <khilman@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 02/10] dt-bindings: clock: Add Amlogic A9 PLL clock
 controller
Message-ID: <20260515-subtle-sepia-tuatara-cfee3d@quoll>
References: <20260511-b4-a9_clk-v1-0-41cb4071b7c9@amlogic.com>
 <20260511-b4-a9_clk-v1-2-41cb4071b7c9@amlogic.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260511-b4-a9_clk-v1-2-41cb4071b7c9@amlogic.com>
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

On Mon, May 11, 2026 at 08:47:24PM +0800, Jian Hu wrote:
> Add the PLL clock controller dt-bindings for the Amlogic A9 SoC family.
> 
> Signed-off-by: Jian Hu <jian.hu@amlogic.com>
> ---
>  .../bindings/clock/amlogic,a9-pll-clkc.yaml        | 110 +++++++++++++++++++++
>  include/dt-bindings/clock/amlogic,a9-pll-clkc.h    |  55 +++++++++++
>  2 files changed, 165 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/clock/amlogic,a9-pll-clkc.yaml b/Documentation/devicetree/bindings/clock/amlogic,a9-pll-clkc.yaml
> new file mode 100644
> index 000000000000..4ee6013ba1a1
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/amlogic,a9-pll-clkc.yaml
> @@ -0,0 +1,110 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +# Copyright (C) 2026 Amlogic, Inc. All rights reserved
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/amlogic,a9-pll-clkc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Amlogic A9 Series PLL Clock Controller
> +
> +maintainers:
> +  - Neil Armstrong <neil.armstrong@linaro.org>
> +  - Jerome Brunet <jbrunet@baylibre.com>
> +  - Jian Hu <jian.hu@amlogic.com>
> +  - Xianwei Zhao <xianwei.zhao@amlogic.com>
> +
> +properties:
> +  compatible:
> +    enum:
> +      - amlogic,a9-gp0-pll
> +      - amlogic,a9-hifi0-pll
> +      - amlogic,a9-hifi1-pll
> +      - amlogic,a9-mclk0-pll
> +      - amlogic,a9-mclk1-pll
> +
> +  reg:
> +    maxItems: 1
> +
> +  '#clock-cells':
> +    const: 1
> +
> +  clocks:
> +    items:
> +      - description: pll input oscillator gate
> +      - description: fixed input clock source for mclk_sel_0
> +      - description: u3p2pll input clock source for mclk_sel_0 (optional)

Second clock is also optional. Drop "(optional)" comment, just
confusing.

> +    minItems: 1
> +
> +  clock-names:
> +    items:
> +      - const: in0
> +      - const: in1
> +      - const: in2

Pretty pointless names, drop property.

> +    minItems: 1
> +
> +required:
> +  - compatible
> +  - '#clock-cells'
> +  - reg
> +  - clocks
> +  - clock-names
> +
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - amlogic,a9-mclk0-pll
> +              - amlogic,a9-mclk1-pll
> +
> +    then:
> +      properties:
> +        clocks:
> +          maxItems: 3

No, minItems instead. maxItems is already 3, so what is the point of
redefining it?

> +
> +        clock-names:
> +          maxItems: 3
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - amlogic,a9-gp0-pll
> +              - amlogic,a9-hifi0-pll
> +              - amlogic,a9-hifi1-pll
> +
> +    then:
> +      properties:
> +        clocks:
> +          maxItems: 1
> +
> +        clock-names:
> +          maxItems: 1
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    apb4 {

soc

> +        #address-cells = <2>;
> +        #size-cells = <2>;
> +
> +        clock-controller@8200 {
> +            compatible = "amlogic,a9-gp0-pll";
> +            reg = <0x0 0x8200 0x0 0x20>;
> +            #clock-cells = <1>;
> +            clocks = <&scmi_clk 0>;
> +            clock-names = "in0";
> +        };
> +
> +        clock-controller@8330 {
> +            compatible = "amlogic,a9-mclk0-pll";
> +            reg = <0x0 0x8330 0x0 0x14>;
> +            #clock-cells = <1>;
> +            clocks = <&scmi_clk 4>,
> +                     <&scmi_clk 8>;
> +            clock-names = "in0", "in1";

One example is enough, you have exactly the same properties.


Best regards,
Krzysztof


