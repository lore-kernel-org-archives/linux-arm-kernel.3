Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 656DCC36005
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Mar 2025 03:25:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UfYH3zGacFehZtm/R3MoecwWV/tWXd2TTZJDUhD3qxY=; b=E7gkcWeXSi1k2uDbexze8HEKpg
	4g0deXtHkO5rbE5+HzMt0f8D4000yePBW19nATFu9tbAf8JAEskn8vd0JZ5Cmj+4nIcZ+DTILNK/d
	evU08IjuzZ/Hmugw8ow9PYq5f1kkVlCjE6RJBbIxw+FQg0qp0mZqSdquY74XdFDIm8x9cRlbCEmN9
	sg32c3nfUrOFOKZhN4ZyZ8iOn2gLoQiFAhltiPIQCHAAn4mB0j9jUn/zmd9vBm1x4ttrwveQh/fmC
	fJpFL2b7HRttMXvKTLzHiC/6uhmq/oT/UIrdxLWI8nrZPzw4RrgZeLS4gT2QHpta0D875ZYmWZNSR
	pJKkUaSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twuuL-00000004lQU-28Wr;
	Tue, 25 Mar 2025 03:24:53 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1twusb-00000004lCQ-1YeT
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Mar 2025 03:23:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 677F343627;
	Tue, 25 Mar 2025 03:23:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59EB0C4CEE8;
	Tue, 25 Mar 2025 03:23:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742872984;
	bh=WwL66kYR3F+uZq5uOtCGWp7idJWWj5WsdtRUs00zJag=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Mp31jYZVn5eyKEAP1PFsxKTyo9qX0SB0WIaembvnyhdKhV6dlbHKQUq7CdKOuKAF5
	 OA1uEQWeXxEPpdqjEZwn4uOsa0N6FXwZCH/mx13Fm73rqKwL3l99oEKbodKBePIHOR
	 RHjXi5WjD0rx27um5V9XSlWwqhgr2dZU6bH1fVyieY1MLfUEUSHIl6BRkRYdClRwsy
	 gqilazXbehsm0kEYP1PXJljuQ54G9RO0zMahFRfSrhO/+dTMJPAzu7GmTd9kkNsIeG
	 yoQETUSdk5lYoNG79VWeo94aBzxiRae7IIQpt0sF3tQSnXfdfKl6hjtIUnb4LQap4Z
	 jsXbzf9KM29Xg==
Date: Mon, 24 Mar 2025 22:23:03 -0500
From: Rob Herring <robh@kernel.org>
To: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>, Frank Li <Frank.li@nxp.com>,
	Marco Felsch <m.felsch@pengutronix.de>,
	Marc Kleine-Budde <mkl@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/5] dt-bindings: bus: add documentation for the IMX
 AIPSTZ bridge
Message-ID: <20250325032303.GA1624882-robh@kernel.org>
References: <20250324162556.30972-1-laurentiumihalcea111@gmail.com>
 <20250324162556.30972-2-laurentiumihalcea111@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250324162556.30972-2-laurentiumihalcea111@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250324_202305_453264_1EED2E15 
X-CRM114-Status: GOOD (  21.67  )
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

On Mon, Mar 24, 2025 at 12:25:52PM -0400, Laurentiu Mihalcea wrote:
> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> 
> Add documentation for IMX AIPSTZ bridge.
> 
> Co-developed-by: Daniel Baluta <daniel.baluta@nxp.com>
> Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
> Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> ---
>  .../bindings/bus/fsl,imx8mp-aipstz.yaml       | 107 ++++++++++++++++++
>  1 file changed, 107 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/bus/fsl,imx8mp-aipstz.yaml
> 
> diff --git a/Documentation/devicetree/bindings/bus/fsl,imx8mp-aipstz.yaml b/Documentation/devicetree/bindings/bus/fsl,imx8mp-aipstz.yaml
> new file mode 100644
> index 000000000000..c0427dfcdaca
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/bus/fsl,imx8mp-aipstz.yaml
> @@ -0,0 +1,107 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/bus/fsl,imx8mp-aipstz.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Secure AHB to IP Slave bus (AIPSTZ) bridge
> +
> +description:
> +  The secure AIPS bridge (AIPSTZ) acts as a bridge for AHB masters
> +  issuing transactions to IP Slave peripherals. Additionally, this module
> +  offers access control configurations meant to restrict which peripherals
> +  a master can access.

Wrap at 80 chars.

> +
> +maintainers:
> +  - Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> +
> +properties:
> +  compatible:
> +    const: fsl,imx8mp-aipstz
> +
> +  reg:
> +    maxItems: 2
> +
> +  reg-names:
> +    items:
> +      - const: bus
> +      - const: ac
> +
> +  power-domains:
> +    maxItems: 1
> +
> +  "#address-cells":
> +    const: 1
> +
> +  "#size-cells":
> +    const: 1
> +
> +  "#access-controller-cells":
> +    const: 0

With 0 cells, how do you identify which device it is?

> +
> +  ranges: true
> +
> +# borrowed from simple-bus.yaml, no additional requirements for children
> +patternProperties:
> +  "@(0|[1-9a-f][0-9a-f]*)$":
> +    type: object
> +    additionalProperties: true
> +    properties:
> +      reg:
> +        items:
> +          minItems: 2
> +          maxItems: 4
> +        minItems: 1
> +        maxItems: 1024
> +      ranges:
> +        oneOf:
> +          - items:
> +              minItems: 3
> +              maxItems: 7
> +            minItems: 1
> +            maxItems: 1024
> +          - $ref: /schemas/types.yaml#/definitions/flag
> +    anyOf:
> +      - required:
> +          - reg
> +      - required:
> +          - ranges
> +
> +required:
> +  - compatible
> +  - reg
> +  - reg-names
> +  - power-domains
> +  - "#address-cells"
> +  - "#size-cells"
> +  - "#access-controller-cells"
> +  - ranges
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/imx8mp-clock.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +    bus@30c00000 {
> +        compatible = "fsl,imx8mp-aipstz";
> +        reg = <0x30c00000 0x400000>, <0x30df0000 0x10000>;

It doesn't look like you have any registers in the 1st entry, but they 
are child devices? Then you should use ranges and drop it here:

ranges = <0x0 0x30c00000 0x400000>;


> +        reg-names = "bus", "ac";
> +        power-domains = <&pgc_audio>;
> +        #address-cells = <1>;
> +        #size-cells = <1>;
> +        #access-controller-cells = <0>;
> +        ranges;
> +
> +        dma-controller@30e00000 {
> +            compatible = "fsl,imx8mp-sdma", "fsl,imx8mq-sdma";
> +            reg = <0x30e00000 0x10000>;
> +            #dma-cells = <3>;
> +            clocks = <&audio_blk_ctrl IMX8MP_CLK_AUDIOMIX_SDMA3_ROOT>,
> +                     <&clk IMX8MP_CLK_AUDIO_ROOT>;
> +            clock-names = "ipg", "ahb";
> +            interrupts = <GIC_SPI 34 IRQ_TYPE_LEVEL_HIGH>;
> +            fsl,sdma-ram-script-name = "imx/sdma/sdma-imx7d.bin";

No 'access-controllers' here?

> +        };
> +    };
> -- 
> 2.34.1
> 

