Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0F21CD98D5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Nov 2025 19:36:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BR0Nw114DPbAZiM2duCu/VchmYAmL6iiSTBKmeOPgm0=; b=mjCnuzRCj25hRPSbm60aM6sw5c
	xqNoyoNKJnkV8DzqpQV3U4cmxiBm463TQk09gfeex3SHVOInw20wPgtImTnkg1/ZPLsq5WzNaxfJV
	3Evql9ar4fh2k7ZUUGY38BPx9Odl16cA0l30bEXVQe7uvMYN/tRE4GLvCQLFpsWSeWjc1rDV6DQiK
	kzH+1OWPKLMuM47cVhsDeyXSDJiyhXSEZel2A036qCFV96SZIkT+kEZfJxstPiK5cCaDiPymlpW9a
	4/vsghlmmperMeuv2nH3tLbJFqAxITIpAa8e5bcg8qZxpNdFd4knZiR+Z1fPDfMoDzzWoCzIZhO3E
	KzOfupaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJd7I-0000000B14k-0A6Q;
	Thu, 13 Nov 2025 19:36:24 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJd7G-0000000B14P-2wZ9;
	Thu, 13 Nov 2025 19:36:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 252CA60189;
	Thu, 13 Nov 2025 19:36:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09FB7C4CEFB;
	Thu, 13 Nov 2025 19:36:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763062582;
	bh=hz0GYD+Mg4hopGCUSIgCQYTiHKUCYR/UQC23uvZvnzA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=sv1RP0XTWeuzW15+irE2QLKBHkZ91nN8BlWqmKizMeiOVEFEKbVvo3SwyaOiOOTrj
	 ax97X7o3OmKZDd3BhIPG2hBB9/oyYkEaxWD2OBc+fKyB0OrGD4FPDjfK1bYcVQP1Ko
	 rlPpKL0yDlAthmzUtphZkEEYbzWmAfEV/U2B9PRc/tmkcWzIIOpvb6u2AkO+JLZigi
	 550R3iU2nv28ZZVG4/dZnU9TSK4RwjPzaHlCr3WnNRiXmxyXS2X1oJreYpmTNhE0An
	 sWfFoCrEanq5PQgGg5jOzKKXnri0opXpGPy05R3Ojk2kBCWJ0PqPjMphqQjw7alrCw
	 hkWgqeAVoZvyg==
Message-ID: <8e707b96-0839-42ad-87b0-07274b53d9bd@kernel.org>
Date: Thu, 13 Nov 2025 20:36:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] dt-bindings: mfd: Add Realtek MISC system
 controller
To: Yu-Chun Lin <eleanor.lin@realtek.com>, afaerber@suse.de, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, lee@kernel.org,
 james.tai@realtek.com
Cc: linux-arm-kernel@lists.infradead.org,
 linux-realtek-soc@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, cy.huang@realtek.com, stanley_chang@realtek.com
References: <20251113123009.26568-1-eleanor.lin@realtek.com>
 <20251113123009.26568-3-eleanor.lin@realtek.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <20251113123009.26568-3-eleanor.lin@realtek.com>
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

On 13/11/2025 13:30, Yu-Chun Lin wrote:
> Add DT binding schema for Realtek system controller.

What is Realtek system controller? I already asked.

I have Realtek WiFi RT8192, so it is the same, right?

> 
> Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>
> ---
>  .../devicetree/bindings/mfd/realtek,misc.yaml | 72 +++++++++++++++++++
>  1 file changed, 72 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/realtek,misc.yaml
> 
> diff --git a/Documentation/devicetree/bindings/mfd/realtek,misc.yaml b/Documentation/devicetree/bindings/mfd/realtek,misc.yaml
> new file mode 100644
> index 000000000000..4f4a9ae250be
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mfd/realtek,misc.yaml
> @@ -0,0 +1,72 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mfd/realtek,misc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Realtek MISC System Controller
> +
> +description:
> +  The Realtek MISC System Controller is a register area that contains
> +  miscellaneous system registers for the SoC and serves as a parent node
> +  for other functions.
> +
> +maintainers:
> +  - James Tai <james.tai@realtek.com>
> +  - Yu-Chun Lin <eleanor.lin@realtek.com>
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - realtek,misc

Nothing improved, still no soc part. You received comment on that - you
need soc specific compatibles.

Explain properly what is the hardware. You have entire commit msg for that.

Did you read writing bindings doc?



> +      - const: syscon
> +      - const: simple-mfd
> +
> +  reg:
> +    maxItems: 1
> +
> +  ranges:
> +    maxItems: 1
> +
> +  '#address-cells':
> +    const: 1
> +
> +  '#size-cells':
> +    const: 1
> +
> +patternProperties:
> +  "^serial@[0-9a-f]+$":
> +    type: object
> +    description: UART controllers inside MISC area

Please read what is a syscon. Then please bring justification why you
claim that SNPS block is part of miscellaneous registers, because it
highly unlikely. Reach to your hardware engineers to explain that.
 > +
> +required:
> +  - compatible
> +  - reg
> +  - ranges
> +  - '#address-cells'
> +  - '#size-cells'
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +    syscon@7000 {
> +        compatible = "realtek,misc", "syscon", "simple-mfd";
> +        reg = <0x7000 0x1000>;
> +        ranges = <0x0 0x7000 0x1000>;
> +        #address-cells = <1>;
> +        #size-cells = <1>;
> +
> +        uart0: serial@800 {
> +            compatible = "snps,dw-apb-uart";
> +            reg = <0x800 0x100>;
> +            clock-frequency = <432000000>;
> +            interrupts = <GIC_SPI 68 IRQ_TYPE_LEVEL_HIGH>;
> +            reg-io-width = <4>;
> +            reg-shift = <2>;
> +            status = "disabled";

Your code is not improving, but going opposite direction. There is no
such code in the bindings, drop.

> +        };
> +    };


Best regards,
Krzysztof

