Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9B26CAC5BB
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Oct 2025 23:56:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0jRMyVBlSdkWjmJbL4XtMdQXbP7Z5TJyAYlDDGPOt0o=; b=QIkE6VRQFwwoieglvm2LVF7LP/
	vPI6ZWqAsiYDGwshODx7pkD+9OiuJFuZtUi9I0DVKIwRtVrqzbNe3xOViSetlfxHyhIzq+q7bCcYr
	KV6+t561vk+DE8LY5OaxKWpoqhRmaeW/gB+T0X6YYzK/gAvLwiSmgxiXFGsQHGgBDrty7dJtFfU80
	hNXjbkuapB7VpeOl9umTGKPAad3dNcDqOCWK8wcjY/JYguRUit87b8+kZrZLH60rgL97arekdP0Ts
	XXgIogs2aO4cOBGV/4LbowgqfYpM0PE43n3xzXO8gxSlwI/fSTF9d2at5Ilsq1UOhCqfj//65RP1h
	yovDAa3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6e1Q-00000004qPZ-0ZRz;
	Wed, 08 Oct 2025 23:56:40 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6e1P-00000004qPQ-08dd;
	Wed, 08 Oct 2025 23:56:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 353D1603CF;
	Wed,  8 Oct 2025 23:56:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DEB9C4CEE7;
	Wed,  8 Oct 2025 23:56:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759967797;
	bh=gfm6M2tF1gf+jvegzebAVXKYeH2HyBSskMG0yM3A/54=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=UA4mfs1JJD6ewAp+USdjMUhIuzr4XJ23pisGajJVXqvBD7RgI8a6yu0W0jW6dKjNt
	 YGIwi91/QPquvZs8LHga2eSZv2qjmGph+amPuaScNhraiq5qnknbYNhmm8TdHBN4Aw
	 PANy69N4MCnUDeR5TZ2MrIh8biwgJYdg/X3IoOgoWuDw71PUspwUjqkP6hEFeFK3wB
	 xgk40KaiaifdMW+XoMt2kwfe9Y6OrF8gntBHuLHX2abOiZgk4HACzN49Y6PNleQ17r
	 zheb2XYra0mFw8CU1eScKVmZnYRREDvWlyU1WoY77XyJHvLpGHtPJU76ijTJaNw20J
	 enNuPKKtKgAjw==
Message-ID: <8966b6a9-ff70-4833-a5c7-c6d6c13c6c8b@kernel.org>
Date: Thu, 9 Oct 2025 08:56:26 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] dt-bindings: usb: dwc3: Add Google Tensor G5 DWC3
To: Roy Luo <royluo@google.com>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Peter Griffin <peter.griffin@linaro.org>,
 =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Joy Chakraborty <joychakr@google.com>, Naveen Kumar <mnkumar@google.com>,
 Badhri Jagan Sridharan <badhri@google.com>, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org
References: <20251008060000.3136021-1-royluo@google.com>
 <20251008060000.3136021-2-royluo@google.com>
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
In-Reply-To: <20251008060000.3136021-2-royluo@google.com>
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

On 08/10/2025 14:59, Roy Luo wrote:
> Document the device tree bindings for the DWC3 USB controller found in
> Google Tensor SoCs, starting with the G5 generation.
> 
> The Tensor G5 silicon represents a complete architectural departure from


G5 does not have a model number like G1-G4?

> previous generations (like gs101), including entirely new clock/reset
> schemes, top-level wrapper and register interface. Consequently,
> existing Samsung/Exynos DWC3 USB bindings and drivers are incompatible,

Do not reference drivers. Explain the hardware.

> necessitating this new device tree binding.
> 
> The USB controller on Tensor G5 is based on Synopsys DWC3 IP and features
> Dual-Role Device single port with hibernation support.
> 
> Signed-off-by: Roy Luo <royluo@google.com>
> ---
>  .../bindings/usb/google,gs-dwc3.yaml          | 145 ++++++++++++++++++
>  1 file changed, 145 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/usb/google,gs-dwc3.yaml
> 
> diff --git a/Documentation/devicetree/bindings/usb/google,gs-dwc3.yaml b/Documentation/devicetree/bindings/usb/google,gs-dwc3.yaml
> new file mode 100644
> index 000000000000..9eb0bf726e8d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/usb/google,gs-dwc3.yaml
> @@ -0,0 +1,145 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +# Copyright (c) 2025, Google LLC
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/usb/google,gs-dwc3.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Google Tensor Series (G5+) DWC3 USB SoC Controller
> +
> +maintainers:
> +  - Roy Luo <royluo@google.com>
> +
> +description: |


Do not need '|' unless you need to preserve formatting.

> +  Describes the DWC3 USB controller block implemented on Google Tensor SoCs,
> +  starting with the G5 generation. Based on Synopsys DWC3 IP, the controller
> +  features Dual-Role Device single port with hibernation add-on.
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - google,gs5-dwc3
> +
> +  reg:
> +    minItems: 3

Drop

> +    maxItems: 3
> +
> +  reg-names:
> +    description: |
> +      The following memory regions must present:
> +        - dwc3_core: Core DWC3 IP registers.
> +        - host_cfg_csr: Hibernation control registers.
> +        - usbint_csr: Hibernation interrupt registers.

Drop description or move it to items in reg. See other bindings.

> +    items:
> +      - const: dwc3_core
> +      - const: host_cfg_csr
> +      - const: usbint_csr
> +
> +  interrupts:
> +    minItems: 3

Drop

> +    maxItems: 3
> +
> +  interrupt-names:
> +    description: |
> +      The following interrupts must present:
> +        - dwc_usb3: Core DWC3 interrupt.
> +        - hs_pme_irq: High speed remote wakeup interrupt for hibernation.
> +        - ss_pme_irq: Super speed remote wakeup interrupt for hibernation.

From where did you get this style? Don't write bindings with chat gpt or
whatever other tool. it is a waste of our time.

> +    items:
> +      - const: dwc_usb3
> +      - const: hs_pme_irq
> +      - const: ss_pme_irq
> +
> +  clocks:
> +    minItems: 3
> +    maxItems: 3
> +
> +  clock-names:
> +    minItems: 3
> +    maxItems: 3

From where did you get such syntax?

> +
> +  resets:
> +    minItems: 5
> +    maxItems: 5
> +
> +  reset-names:
> +    items:
> +      - const: usbc_non_sticky
> +      - const: usbc_sticky
> +      - const: usb_drd_bus
> +      - const: u2phy_apb
> +      - const: usb_top_csr
> +
> +  power-domains:
> +    minItems: 2
> +    maxItems: 2
> +
> +  power-domain-names:
> +    description: |
> +      The following power domain must present:
> +          - usb_psw_pd: The child power domain of usb_top_pd. Turning it on puts the controller
> +                         into full power state, turning it off puts the controller into power
> +                         gated state.
> +          - usb_top_pd: The parent power domain of usb_psw_pd. Turning it on puts the controller
> +                         into power gated state, turning it off completely shuts off the
> +                         controller.

Same comments.


> +    items:
> +      - const: usb_psw_pd
> +      - const: usb_top_pd
> +
> +  iommus:
> +    maxItems: 1
> +
Best regards,
Krzysztof

