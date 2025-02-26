Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E89F5C021B8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Feb 2025 21:18:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xIjNiXxGBBm/xoXabL4X4YmYNTbyIpSevbFSsZpJgRo=; b=AZiScG7X9QzIDSt3WnEqGQfs6M
	2VHi6dmGtxwoqztWT26bLyQjrobcSM5vfH8+ZMwFlgP9u4nolpSmnHu/9Aij/n2k1hKTB4b4f2vMM
	krif7C7CswFO9geu5UeUnfGm1Ra12Gm/pdz6nCc8iUPgxrGPHZ0ReYYYBl68SCz1ZmasilGdXc2Jj
	JIeNNGuqXXBJAbJuTFHO1rrQPgdba/sx1COi1OaIC4jPBbBa09i4JNhZHZ9GlVtf6s882aumVevgJ
	VYiheUv3m6Jsl9QDdwvc5PEfaBqFFmnUOmfr7Q5ZowwHowF3WiHxWrUcsKtjm9i66KdKhFpQrUKN7
	eT2rBsvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnOn9-00000005Rke-0FVK;
	Wed, 26 Feb 2025 21:18:07 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnOlb-00000005RSg-10vl
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Feb 2025 21:16:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 812D75C2760;
	Wed, 26 Feb 2025 21:15:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F32AEC4CED6;
	Wed, 26 Feb 2025 21:16:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740604590;
	bh=dPJC0lc57f2rXn0+uVJILsaYDPovw8HJ1xtdYghmLBM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=NUWUinCTYGHKGQaNumUPg7EzITLxV+feDCDtX8F0PUNXcrXV5Vg1RU4LToP5y/c9T
	 surSs667chPmyTFNFxi7zs5Ho/TQJYEtqI0kTK1k1dlwWnAxBZ0C5i7AeTiTQ32APX
	 0RwfW4u6fYs4TcobKN/PJIh5X0ZzDkDWJMq5AogDPG8IXJ3qL/lAnYwXjCcjPr9jc3
	 lhZvGo2bf42jQeza5+v2geAgc/I3yWBb/nawIOsNKLCO6p60PH+arwg4kRgwhrxUSy
	 o5NfsJmYb5v2qqCWV7KL/4C1O/0zwRe0LmrPAOmSE6NA0RddgcRWXh+2DbWmLQUh5T
	 vabIxfHT1vpEw==
Message-ID: <837c7fd8-68b1-4d95-af3e-2af5dfccb60a@kernel.org>
Date: Wed, 26 Feb 2025 22:16:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/5] dt-bindings: bus: add documentation for the IMX
 AIPSTZ bridge
To: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
 Daniel Baluta <daniel.baluta@nxp.com>, Shengjiu Wang
 <shengjiu.wang@nxp.com>, Frank Li <Frank.li@nxp.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250226165314.34205-1-laurentiumihalcea111@gmail.com>
 <20250226165314.34205-2-laurentiumihalcea111@gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <20250226165314.34205-2-laurentiumihalcea111@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_131631_371701_70CA5B3A 
X-CRM114-Status: GOOD (  18.16  )
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

On 26/02/2025 17:53, Laurentiu Mihalcea wrote:
> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> 
> Add documentation for IMX AIPSTZ bridge.
> 

Please use get_maintainers so this will reach proper lists and
automation. Or just start using b4, so you won't remove cc-entries (v1
looked correct).


> Co-developed-by: Daniel Baluta <daniel.baluta@nxp.com>
> Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
> Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> ---
>  .../bindings/bus/fsl,imx8mp-aipstz.yaml       | 86 +++++++++++++++++++
>  1 file changed, 86 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/bus/fsl,imx8mp-aipstz.yaml
> 
> diff --git a/Documentation/devicetree/bindings/bus/fsl,imx8mp-aipstz.yaml b/Documentation/devicetree/bindings/bus/fsl,imx8mp-aipstz.yaml
> new file mode 100644
> index 000000000000..dfcfe4a8ae74
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/bus/fsl,imx8mp-aipstz.yaml
> @@ -0,0 +1,86 @@
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
> +
> +maintainers:
> +  - Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> +
> +properties:
> +  compatible:
> +    const: fsl,imx8mp-aipstz
> +
> +  reg:
> +    maxItems: 1
> +
> +  power-domains:
> +    maxItems: 1
> +
> +  "#address-cells":
> +    enum: [1, 2]
> +
> +  "#size-cells":
> +    enum: [1, 2]

Why flexible? This is either 32- or 64-bit addressing in the sources,
isn't it?

> +
> +  "#access-controller-cells":
> +    const: 0
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
> +    bus@30df0000 {
> +      compatible = "fsl,imx8mp-aipstz";
> +      reg = <0x30df0000 0x10000>;
> +      power-domains = <&pgc_audio>;
> +      #address-cells = <1>;
> +      #size-cells = <1>;
> +      #access-controller-cells = <0>;
> +      ranges;

Add at least one child, so your pattern will be tested.



Best regards,
Krzysztof

