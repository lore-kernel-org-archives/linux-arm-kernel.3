Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91C19E77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jan 2025 16:16:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=32QZXrb62+QSD3pPaL9k/c8TLDGv4uNeJJYp07OLSvY=; b=3DOjj5GPUbnLcZlD+Qw4ZTGhRL
	PNqTc6iIlZRLZhegVBwJVu4E+BI7Belo+CY+siicAsAFLnO5+zb40hM+6jzmGvTG6sQCUdFThsn8D
	BfUN2iqhQ9NCpjtvQoF9kZ1WRz9jrPudDuiVw1QmF9rDWA6iSC1MMn/IvF3ExzUAkAmlGS8GaLfuO
	WI8+d5ywlHBnxFMJaeHwMdBgAdLI/jYAAOQ0uAOJFx9yz0olSIhg5w6no70OR9T0Xl6Yo34gAI0T7
	vLd72nM8UN1dKSth19Lvzq5Bj5KZ0ZHeBcx08IVx/KIoj+mrq+LzkWlSF2GSjNNAbSVeORzYYIbQ+
	IxMSCwSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWHg3-0000000GBfp-0zGg;
	Fri, 10 Jan 2025 16:16:03 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWHKo-0000000G6tk-2xTH;
	Fri, 10 Jan 2025 15:54:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 2D5B15C0FC2;
	Fri, 10 Jan 2025 15:53:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3500C4CED6;
	Fri, 10 Jan 2025 15:54:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736524445;
	bh=KtZ4c7jWTzK/1RwsYWEQ3b4sPV8HEvuExiQjmVNRQaQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qqo2nWRtkTXHYUIcAvGXBfFz9lRjc90pKSWJa3X5Rt1ujIb/Zfnhbs3zoTHzUnZKS
	 reXKrHisV3jT85sYHUYGWu2GG2+M3aKs8lyIE0WUXx3dwmlBJtEanCJzsQ6oqekaCq
	 2NYie+vO8run7Cf1nlJJsbiQsrip82LufKuN+HshH3W0GpZUAfOn5yvWT8NTov4Xez
	 BX81epoL9777exAxcqECpJnGfTixE4bc4vv3AIdQoF4BNqfyPCDcJi10VzyzCL1tVA
	 7zysNjo68cGIj9mxNi9/FLuUFdGFjJNFZ+GdPv/qtXylav7Ugpae9E899Nm3XG6TDx
	 W/f9aIUS8o5ow==
Date: Fri, 10 Jan 2025 09:54:04 -0600
From: Rob Herring <robh@kernel.org>
To: Jian Hu <jian.hu@amlogic.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	Xianwei Zhao <xianwei.zhao@amlogic.com>,
	Chuan Liu <chuan.liu@amlogic.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Dmitry Rokosov <ddrokosov@sberdevices.ru>,
	devicetree <devicetree@vger.kernel.org>,
	linux-clk <linux-clk@vger.kernel.org>,
	linux-amlogic <linux-amlogic@lists.infradead.org>,
	linux-kernel <linux-kernel@vger.kernel.org>,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v2 1/5] dt-bindings: clock: add Amlogic T7 PLL clock
 controller
Message-ID: <20250110155404.GA2928945-robh@kernel.org>
References: <20250108094025.2664201-1-jian.hu@amlogic.com>
 <20250108094025.2664201-2-jian.hu@amlogic.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250108094025.2664201-2-jian.hu@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250110_075406_828259_F6AA070B 
X-CRM114-Status: GOOD (  19.76  )
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

On Wed, Jan 08, 2025 at 05:40:21PM +0800, Jian Hu wrote:
> Add DT bindings for the PLL clock controller of the Amlogic T7 SoC family.
> 
> Signed-off-by: Jian Hu <jian.hu@amlogic.com>
> ---
>  .../bindings/clock/amlogic,t7-pll-clkc.yaml   | 103 ++++++++++++++++++
>  .../dt-bindings/clock/amlogic,t7-pll-clkc.h   |  57 ++++++++++
>  2 files changed, 160 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/amlogic,t7-pll-clkc.yaml
>  create mode 100644 include/dt-bindings/clock/amlogic,t7-pll-clkc.h
> 
> diff --git a/Documentation/devicetree/bindings/clock/amlogic,t7-pll-clkc.yaml b/Documentation/devicetree/bindings/clock/amlogic,t7-pll-clkc.yaml
> new file mode 100644
> index 000000000000..fd0323678d37
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/amlogic,t7-pll-clkc.yaml
> @@ -0,0 +1,103 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +# Copyright (C) 2024 Amlogic, Inc. All rights reserved
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/amlogic,t7-pll-clkc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Amlogic T7 PLL Clock Control Controller
> +
> +maintainers:
> +  - Neil Armstrong <neil.armstrong@linaro.org>
> +  - Jerome Brunet <jbrunet@baylibre.com>
> +  - Jian Hu <jian.hu@amlogic.com>
> +  - Xianwei Zhao <xianwei.zhao@amlogic.com>
> +
> +if:

Move this after 'required' section.

Generally we put 'if' under 'allOf' because we're likely to have another 
if/then schema on the next compatible added. If you don't think this 
binding will ever get used on another chip, then it is fine as-is.

> +  properties:
> +    compatible:
> +      contains:
> +        const: amlogic,t7-pll-mclk
> +
> +then:
> +  properties:
> +    clocks:
> +      items:
> +        - description: mclk pll input oscillator gate
> +        - description: 24M oscillator input clock source for mclk_sel_0
> +        - description: fix 50Mhz input clock source for mclk_sel_0
> +
> +    clock-names:
> +      items:
> +        - const: input
> +        - const: mclk_in0
> +        - const: mclk_in1

Move these to top-level and then both of these are just 'minItems: 3'.

> +
> +else:
> +  properties:
> +    clocks:
> +      items:
> +        - description: pll input oscillator gate
> +
> +    clock-names:
> +      items:
> +        - const: input

And 'maxItems: 1' here.

> +
> +properties:
> +  compatible:
> +    enum:
> +      - amlogic,t7-pll-gp0
> +      - amlogic,t7-pll-gp1
> +      - amlogic,t7-pll-hifi
> +      - amlogic,t7-pll-pcie
> +      - amlogic,t7-mpll
> +      - amlogic,t7-pll-hdmi
> +      - amlogic,t7-pll-mclk
> +
> +  reg:
> +    maxItems: 1
> +
> +  '#clock-cells':
> +    const: 1
> +
> +  clocks:
> +    minItems: 1
> +    maxItems: 3
> +
> +  clock-names:
> +    minItems: 1
> +    maxItems: 3

These are the 'top-level' definitions if that's not clear.

> +
> +required:
> +  - compatible
> +  - '#clock-cells'
> +  - reg
> +  - clocks
> +  - clock-names
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    apb {
> +        #address-cells = <2>;
> +        #size-cells = <2>;
> +
> +        clock-controller@8080 {
> +            compatible = "amlogic,t7-pll-gp0";
> +            reg = <0 0x8080 0 0x20>;
> +            clocks = <&scmi_clk 2>;
> +            clock-names = "input";
> +            #clock-cells = <1>;
> +        };
> +
> +        clock-controller@8300 {
> +            compatible = "amlogic,t7-pll-mclk";
> +            reg = <0 0x8300 0 0x18>;
> +            clocks = <&scmi_clk 2>,
> +                     <&xtal>,
> +                     <&scmi_clk 31>;
> +            clock-names = "input", "mclk_in0", "mclk_in1";
> +            #clock-cells = <1>;
> +        };
> +    };
> diff --git a/include/dt-bindings/clock/amlogic,t7-pll-clkc.h b/include/dt-bindings/clock/amlogic,t7-pll-clkc.h
> new file mode 100644
> index 000000000000..e88c342028db
> --- /dev/null
> +++ b/include/dt-bindings/clock/amlogic,t7-pll-clkc.h
> @@ -0,0 +1,57 @@
> +/* SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause */
> +/*
> + * Copyright (c) 2024 Amlogic, Inc. All rights reserved.
> + * Author: Jian Hu <jian.hu@amlogic.com>
> + */
> +
> +#ifndef __T7_PLL_CLKC_H
> +#define __T7_PLL_CLKC_H
> +
> +/* GP0 */
> +#define CLKID_GP0_PLL_DCO	0
> +#define CLKID_GP0_PLL		1
> +
> +/* GP1 */
> +#define CLKID_GP1_PLL_DCO	0
> +#define CLKID_GP1_PLL		1
> +
> +/* HIFI */
> +#define CLKID_HIFI_PLL_DCO	0
> +#define CLKID_HIFI_PLL		1
> +
> +/* PCIE */
> +#define CLKID_PCIE_PLL_DCO	0
> +#define CLKID_PCIE_PLL_DCO_DIV2	1
> +#define CLKID_PCIE_PLL_OD	2
> +#define CLKID_PCIE_PLL		3
> +
> +/* MPLL */
> +#define CLKID_MPLL_PREDIV	0
> +#define CLKID_MPLL0_DIV		1
> +#define CLKID_MPLL0		2
> +#define CLKID_MPLL1_DIV		3
> +#define CLKID_MPLL1		4
> +#define CLKID_MPLL2_DIV		5
> +#define CLKID_MPLL2		6
> +#define CLKID_MPLL3_DIV		7
> +#define CLKID_MPLL3		8
> +
> +/* HDMI */
> +#define CLKID_HDMI_PLL_DCO	0
> +#define CLKID_HDMI_PLL_OD	1
> +#define CLKID_HDMI_PLL		2
> +
> +/* MCLK */
> +#define CLKID_MCLK_PLL_DCO	0
> +#define CLKID_MCLK_PRE		1
> +#define CLKID_MCLK_PLL		2
> +#define CLKID_MCLK_0_SEL	3
> +#define CLKID_MCLK_0_DIV2	4
> +#define CLKID_MCLK_0_PRE	5
> +#define CLKID_MCLK_0		6
> +#define CLKID_MCLK_1_SEL	7
> +#define CLKID_MCLK_1_DIV2	8
> +#define CLKID_MCLK_1_PRE	9
> +#define CLKID_MCLK_1		10
> +
> +#endif /* __T7_PLL_CLKC_H */
> -- 
> 2.47.1
> 

