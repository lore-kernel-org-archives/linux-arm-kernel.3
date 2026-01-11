Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF42ED2502F
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 11 Jan 2026 11:27:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u8t1mWoIoCHBQcYM0H+Xye3p7uzWHC/iIhrlECUFhaA=; b=bh0XF0qVUWPQ2peroOJO2t379Z
	thCHRF+Ko8WAcmHQktEVuPsXzSly3HApRoJhwvBsvKDxCvOZo0Iv0fJk3FYcMEd5WolJQFwUlMJmP
	YKsyBZl9TOZQeAC2ftUE0I5i+stJQSkJgZxaWySlCZSc10JNhjqVnMnxLLcDOFkHRcAs+CkuueKq0
	KNQyyYcRVlx3HdLPN33JGPRy9snz8Ufw2TK63b3Ulm3KRwe06xkNrqG/+FZiP0oikUZMM146vTAQ0
	W2aqWTrZh6Yx+kEfhOX9OM40qkKWV473q2NYZszwTGedfY0CEoqJ1nsU9TdSjuZ5Yjhd4ybCm13IR
	ANMhSngA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vetbq-00000004AAs-3yuY;
	Sun, 11 Jan 2026 11:27:50 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vetbp-00000004AAa-1QAI
	for linux-arm-kernel@lists.infradead.org;
	Sun, 11 Jan 2026 11:27:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C544960121;
	Sun, 11 Jan 2026 11:27:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A56C6C4CEF7;
	Sun, 11 Jan 2026 11:27:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768130867;
	bh=zPJqN9LOFjBLU3yXIud5hCQrNqRO8hEy9xtsO89iMUw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Mesbm3KUH2NTKvitxJ4A6J5ojU4QwFDRyDqYGemjJqlZz9qQdp/ewBcgawxaAxkiV
	 SJenBudsWtvqKSU0xSAPjXvhDA6rb7miPKt9z7d9vOvTkNhHKAgocV3mMmXjGVHqJo
	 hgxgkN5S022OS7eTPrXbNLJrG8Uhts9EdUd0/4X3iDnt/pdnPvHsMfB10Rkg5NlpZS
	 cARSrXHHPuAzHWPg0lqunnBJYc4g6HKKtrwOXR+yYdHCS+3K9uySBDoQXRvh9CTynq
	 Gn8cJ+gI6XDgg+MBF5oAxjOVA0VTptrVz9M84hLIDdQX90lAnlm31WrAqJUKOQwPUJ
	 w6UtB6lPmjCVA==
Message-ID: <a4e11134-3035-4963-a434-db168da32945@kernel.org>
Date: Sun, 11 Jan 2026 12:27:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/11] dt-bindings: bus: document the stm32 debug bus
To: Gatien Chevallier <gatien.chevallier@foss.st.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach
 <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, Leo Yan <leo.yan@linux.dev>,
 =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>,
 Linus Walleij <linusw@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
References: <20260109-debug_bus-v1-0-8f2142b5a738@foss.st.com>
 <20260109-debug_bus-v1-3-8f2142b5a738@foss.st.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 xsFNBFVDQq4BEAC6KeLOfFsAvFMBsrCrJ2bCalhPv5+KQF2PS2+iwZI8BpRZoV+Bd5kWvN79
 cFgcqTTuNHjAvxtUG8pQgGTHAObYs6xeYJtjUH0ZX6ndJ33FJYf5V3yXqqjcZ30FgHzJCFUu
 JMp7PSyMPzpUXfU12yfcRYVEMQrmplNZssmYhiTeVicuOOypWugZKVLGNm0IweVCaZ/DJDIH
 gNbpvVwjcKYrx85m9cBVEBUGaQP6AT7qlVCkrf50v8bofSIyVa2xmubbAwwFA1oxoOusjPIE
 J3iadrwpFvsZjF5uHAKS+7wHLoW9hVzOnLbX6ajk5Hf8Pb1m+VH/E8bPBNNYKkfTtypTDUCj
 NYcd27tjnXfG+SDs/EXNUAIRefCyvaRG7oRYF3Ec+2RgQDRnmmjCjoQNbFrJvJkFHlPeHaeS
 BosGY+XWKydnmsfY7SSnjAzLUGAFhLd/XDVpb1Een2XucPpKvt9ORF+48gy12FA5GduRLhQU
 vK4tU7ojoem/G23PcowM1CwPurC8sAVsQb9KmwTGh7rVz3ks3w/zfGBy3+WmLg++C2Wct6nM
 Pd8/6CBVjEWqD06/RjI2AnjIq5fSEH/BIfXXfC68nMp9BZoy3So4ZsbOlBmtAPvMYX6U8VwD
 TNeBxJu5Ex0Izf1NV9CzC3nNaFUYOY8KfN01X5SExAoVTr09ewARAQABzSVLcnp5c3p0b2Yg
 S296bG93c2tpIDxrcnprQGtlcm5lbC5vcmc+wsGVBBMBCgA/AhsDBgsJCAcDAgYVCAIJCgsE
 FgIDAQIeAQIXgBYhBJvQfg4MUfjVlne3VBuTQ307QWKbBQJoF1BKBQkWlnSaAAoJEBuTQ307
 QWKbHukP/3t4tRp/bvDnxJfmNdNVn0gv9ep3L39IntPalBFwRKytqeQkzAju0whYWg+R/rwp
 +r2I1Fzwt7+PTjsnMFlh1AZxGDmP5MFkzVsMnfX1lGiXhYSOMP97XL6R1QSXxaWOpGNCDaUl
 ajorB0lJDcC0q3xAdwzRConxYVhlgmTrRiD8oLlSCD5baEAt5Zw17UTNDnDGmZQKR0fqLpWy
 786Lm5OScb7DjEgcA2PRm17st4UQ1kF0rQHokVaotxRM74PPDB8bCsunlghJl1DRK9s1aSuN
 hL1Pv9VD8b4dFNvCo7b4hfAANPU67W40AaaGZ3UAfmw+1MYyo4QuAZGKzaP2ukbdCD/DYnqi
 tJy88XqWtyb4UQWKNoQqGKzlYXdKsldYqrLHGoMvj1UN9XcRtXHST/IaLn72o7j7/h/Ac5EL
 8lSUVIG4TYn59NyxxAXa07Wi6zjVL1U11fTnFmE29ALYQEXKBI3KUO1A3p4sQWzU7uRmbuxn
 naUmm8RbpMcOfa9JjlXCLmQ5IP7Rr5tYZUCkZz08LIfF8UMXwH7OOEX87Y++EkAB+pzKZNNd
 hwoXulTAgjSy+OiaLtuCys9VdXLZ3Zy314azaCU3BoWgaMV0eAW/+gprWMXQM1lrlzvwlD/k
 whyy9wGf0AEPpLssLVt9VVxNjo6BIkt6d1pMg6mHsUEVzsFNBFVDXDQBEADNkrQYSREUL4D3
 Gws46JEoZ9HEQOKtkrwjrzlw/tCmqVzERRPvz2Xg8n7+HRCrgqnodIYoUh5WsU84N03KlLue
 MNsWLJBvBaubYN4JuJIdRr4dS4oyF1/fQAQPHh8Thpiz0SAZFx6iWKB7Qrz3OrGCjTPcW6ei
 OMheesVS5hxietSmlin+SilmIAPZHx7n242u6kdHOh+/SyLImKn/dh9RzatVpUKbv34eP1wA
 GldWsRxbf3WP9pFNObSzI/Bo3kA89Xx2rO2roC+Gq4LeHvo7ptzcLcrqaHUAcZ3CgFG88CnA
 6z6lBZn0WyewEcPOPdcUB2Q7D/NiUY+HDiV99rAYPJztjeTrBSTnHeSBPb+qn5ZZGQwIdUW9
 YegxWKvXXHTwB5eMzo/RB6vffwqcnHDoe0q7VgzRRZJwpi6aMIXLfeWZ5Wrwaw2zldFuO4Dt
 91pFzBSOIpeMtfgb/Pfe/a1WJ/GgaIRIBE+NUqckM+3zJHGmVPqJP/h2Iwv6nw8U+7Yyl6gU
 BLHFTg2hYnLFJI4Xjg+AX1hHFVKmvl3VBHIsBv0oDcsQWXqY+NaFahT0lRPjYtrTa1v3tem/
 JoFzZ4B0p27K+qQCF2R96hVvuEyjzBmdq2esyE6zIqftdo4MOJho8uctOiWbwNNq2U9pPWmu
 4vXVFBYIGmpyNPYzRm0QPwARAQABwsF8BBgBCgAmAhsMFiEEm9B+DgxR+NWWd7dUG5NDfTtB
 YpsFAmgXUF8FCRaWWyoACgkQG5NDfTtBYptO0w//dlXJs5/42hAXKsk+PDg3wyEFb4NpyA1v
 qmx7SfAzk9Hf6lWwU1O6AbqNMbh6PjEwadKUk1m04S7EjdQLsj/MBSgoQtCT3MDmWUUtHZd5
 RYIPnPq3WVB47GtuO6/u375tsxhtf7vt95QSYJwCB+ZUgo4T+FV4hquZ4AsRkbgavtIzQisg
 Dgv76tnEv3YHV8Jn9mi/Bu0FURF+5kpdMfgo1sq6RXNQ//TVf8yFgRtTUdXxW/qHjlYURrm2
 H4kutobVEIxiyu6m05q3e9eZB/TaMMNVORx+1kM3j7f0rwtEYUFzY1ygQfpcMDPl7pRYoJjB
 dSsm0ZuzDaCwaxg2t8hqQJBzJCezTOIkjHUsWAK+tEbU4Z4SnNpCyM3fBqsgYdJxjyC/tWVT
 AQ18NRLtPw7tK1rdcwCl0GFQHwSwk5pDpz1NH40e6lU+NcXSeiqkDDRkHlftKPV/dV+lQXiu
 jWt87ecuHlpL3uuQ0ZZNWqHgZoQLXoqC2ZV5KrtKWb/jyiFX/sxSrodALf0zf+tfHv0FZWT2
 zHjUqd0t4njD/UOsuIMOQn4Ig0SdivYPfZukb5cdasKJukG1NOpbW7yRNivaCnfZz6dTawXw
 XRIV/KDsHQiyVxKvN73bThKhONkcX2LWuD928tAR6XMM2G5ovxLe09vuOzzfTWQDsm++9UKF a/A=
In-Reply-To: <20260109-debug_bus-v1-3-8f2142b5a738@foss.st.com>
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

On 09/01/2026 11:55, Gatien Chevallier wrote:
> Document the stm32 debug bus. The debug bus is responsible for
> checking the debug sub-system accessibility before probing any related
> drivers.
> 
> Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
> ---
>  .../bindings/bus/st,stm32mp131-dbg-bus.yaml        | 86 ++++++++++++++++++++++
>  1 file changed, 86 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/bus/st,stm32mp131-dbg-bus.yaml b/Documentation/devicetree/bindings/bus/st,stm32mp131-dbg-bus.yaml
> new file mode 100644
> index 000000000000..68bdfba08909
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/bus/st,stm32mp131-dbg-bus.yaml
> @@ -0,0 +1,86 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/bus/st,stm32mp131-dbg-bus.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: STM32 Coresight bus
> +
> +maintainers:
> +  - Gatien Chevallier <gatien.chevallier@foss.st.com>
> +
> +description: |


Do not need '|' unless you need to preserve formatting.

> +  The STM32 debug bus is in charge of checking the debug configuration

What sort of bus it is? What protocol? Looks like rather fake wrapping
node. You cannot just organize children in MMIO and call it a "bus".
just to justify having child nodes.

> +  of the platform before probing the peripheral drivers that rely on the debug
> +  domain.
> +
> +properties:
> +  compatible:
> +    oneOf:

Drop

> +      - items:

Drop

> +          - enum:
> +              - st,stm32mp131-dbg-bus
> +              - st,stm32mp151-dbg-bus
> +
> +  "#address-cells":
> +    const: 1
> +
> +  "#size-cells":
> +    const: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  ranges: true
> +
> +  reg:
> +    maxItems: 1

What stuff is here? Your driver does not use it at all.

> +
> +  "#access-controller-cells":
> +    const: 1
> +    description:
> +      Contains the debug profile necessary to access the peripheral.
> +
> +patternProperties:
> +  "^.*@[0-9a-f]+$":
> +    description: Debug related peripherals
> +    type: object
> +
> +    additionalProperties: true
> +
> +    required:
> +      - access-controllers

I don't get why children need to reference the parent. If you have such
relationship, then the access-controllers are redundant, no?

> +
> +required:
> +  - "#access-controller-cells"
> +  - "#address-cells"
> +  - "#size-cells"
> +  - clocks
> +  - compatible
> +  - ranges
> +  - reg
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/stm32mp1-clks.h>
> +
> +    dbg_bus: bus@50080000 {
> +      compatible = "st,stm32mp131-dbg-bus";
> +      reg = <0x50080000 0x3f80000>;
> +      #address-cells = <1>;
> +      #size-cells = <1>;
> +      clocks = <&rcc CK_DBG>;

So the same clock as child? Another argument that this node is not a
true bus node.

> +      #access-controller-cells = <1>;
> +      ranges;
> +
> +      cs_cti_trace: cti@50094000 {

Drop unused label

> +        compatible = "arm,coresight-cti", "arm,primecell";
> +        reg = <0x50094000 0x1000>;
> +        clocks = <&rcc CK_DBG>;
> +        clock-names = "apb_pclk";
> +        access-controllers = <&dbg_bus 0>;
> +        status = "disabled";

Drop

> +      };
> +    };
> 


Best regards,
Krzysztof

