Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 890A6E6748D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Dec 2025 08:54:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PByN/RZX4bckpa1sNzseldf/w4tqWjOQAjf4r2bIloo=; b=zJGjEafizKNqxn5zwKwYiZt/FH
	FQrm74SQyxaYGGxTvYPBjEXrtVQbkn16z67toWqh7jy+VX+pnhgWDoeCXHwgWMcWlzSL6v2eP+IdR
	F5igQtd0Wif6WuYHd4wIVI9qZGrbVdc9s9p27JgHD/D2z92Yy+yzmLkXSY1G1XBrRh+ENyAaintSk
	z+srGRS+sPAxSLpee5x4Ihv60MkeMetJejZcP0cS0F0rHuYDdlLHn34Lrnklmo3U+ISxVab1lSrqd
	00XLPS48CI3Rm8ha4dUZD+7wA05oBJ4Len+O6hX7JEPZ6+BfsgmzT1Fyqc+pSXoCMDHVWd0R8+Hw5
	g3vqVglw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXbg4-0000000DTvk-2PfL;
	Mon, 22 Dec 2025 08:54:04 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXbg0-0000000DTvL-3owI
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Dec 2025 08:54:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 13CF240BDA;
	Mon, 22 Dec 2025 08:54:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24481C4CEF1;
	Mon, 22 Dec 2025 08:53:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766393639;
	bh=91YP+hjH18eqWa/+gAOvZoSPL5m8ixhoZqW4ppWRLOw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=rdxuFm+DUzvrDD9jYzFPVSqR9tHifC/jLtTY345vNrNDOAc29fV6aBzhdcJeHKT1R
	 YlRu09E2eV8fleFUhPxQcHhMj4T6AcDdEzGU7AGW5AwCg2JXXbVsRe6ht7uH4kVwvY
	 ELqROtm1F7F2fKGYJHN5jvYwj27TGzhykT7hVTt63EqHrBjmmlEmFBHg7WulMMmG1Z
	 aEgWUv1+ONg7oXWeMRfp9gf8bFBotVmWBne/ewkCA4moVOff17JISVvZNgoUxaiaOU
	 /gk1ddyY7+O2nzEleZZsNqEKV91v8gWudYUN2K/8SJQZZbqIzHwR3yVZPK/R4hJtrX
	 qvWqEW98M6iYg==
Message-ID: <1844147d-543d-4739-a1ec-a59f8a4564fb@kernel.org>
Date: Mon, 22 Dec 2025 09:53:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6] dt-bindings: arm: keystone: add boot_* mboxes to
 ti,sci
To: Anshul Dalal <anshuld@ti.com>, Nishanth Menon <nm@ti.com>,
 Tero Kristo <kristo@kernel.org>, Santosh Shilimkar <ssantosh@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Andrew Davis <afd@ti.com>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Vignesh Raghavendra <vigneshr@ti.com>
References: <20251222-k3_syscon_add_boot_mailboxes-v6-1-b93ada9f1d47@ti.com>
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
In-Reply-To: <20251222-k3_syscon_add_boot_mailboxes-v6-1-b93ada9f1d47@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251222_005400_999891_8B36DC18 
X-CRM114-Status: GOOD (  26.70  )
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

On 22/12/2025 09:43, Anshul Dalal wrote:
> The bootloader on K3 devices makes use of mailboxes as per the ROM spec
> which might be different than one's available to the kernel (firmware
> spec).
> 
> Therefore, this patch adds the missing mailbox entries to the DT binding
> if the matching compatible is ti,am654-sci to represent the mailboxes
> exposed by the hardware during boot for the purpose of loading the
> firmware.
> 
> The new ti,am642-sci compatible is also added to represent SoCs which do
> not expose a "notify" channel as part of their TI-SCI spec such as AM64x
> or the AM62 family. The newly added mboxes are made optional by keeping
> minItems as 2 to remain compliant with existing device-trees.
> 
> Signed-off-by: Anshul Dalal <anshuld@ti.com>
> ---
> Changes in v6:
> - Added ti,am642-sci compatible to represent SoCs without a "notify" channel
> - Added new examples instead of editing existing ones

Why? Rob asked not to.

> - Link to v5: https://lore.kernel.org/r/20251215-k3_syscon_add_boot_mailboxes-v5-1-5a8fe567fd31@ti.com
> 
> Changes in v5:
> - Added commit description for the optional mailboxes
> - Link to v4: https://lore.kernel.org/r/20251205-k3_syscon_add_boot_mailboxes-v4-1-8e216fb88941@ti.com
> 
> Changes in v4:
> - Make new boot_* mboxes conditional on ti,am654-sci compatible
> - Link to v3: https://lore.kernel.org/r/20251112-k3_syscon_add_boot_mailboxes-v3-1-66155a4236dc@ti.com
> 
> Changes in v3:
> - Drop [1/2] of the last patch series
> - Update existing example with boot_* mailboxes instead of adding a new one
> - Link to v2: https://lore.kernel.org/r/20251112-k3_syscon_add_boot_mailboxes-v2-0-aebc1e47b391@ti.com
> 
> Changes in v2:
> - Remove maxItems entry
> - Remove RFC tag from patch (added by mistake in v1)
> - Document the new mailboxes in mboxes instead of mbox-names
> - Provide example with all the mailboxes set
> - Update commit title to have "ti,sci"
> - Split into two patches
> - Link to v1: https://lore.kernel.org/r/20251111-k3_syscon_add_boot_mailboxes-v1-1-529a27f21076@ti.com
> ---
>  .../devicetree/bindings/arm/keystone/ti,sci.yaml   | 94 +++++++++++++++++++++-
>  1 file changed, 91 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/arm/keystone/ti,sci.yaml b/Documentation/devicetree/bindings/arm/keystone/ti,sci.yaml
> index 25a2b42105e5..0f2c764eae5a 100644
> --- a/Documentation/devicetree/bindings/arm/keystone/ti,sci.yaml
> +++ b/Documentation/devicetree/bindings/arm/keystone/ti,sci.yaml
> @@ -40,6 +40,9 @@ properties:
>        - description: System controller on TI AM654 SoC
>          items:
>            - const: ti,am654-sci
> +      - description: System controller on TI AM642 SoC
> +        items:
> +          - const: ti,am642-sci

Why this is not part of enum with previous entries like that?

>  
>    reg-names:
>      description: |
> @@ -51,15 +54,15 @@ properties:
>      minItems: 1
>  
>    mbox-names:
> +    minItems: 2
> +    maxItems: 6
>      description: |
>        Specifies the mailboxes used to communicate with TI-SCI Controller
>        made available from TI-SCI controller.
> -    items:
> -      - const: rx
> -      - const: tx
>  
>    mboxes:
>      minItems: 2
> +    maxItems: 6
>  
>    ti,host-id:
>      $ref: /schemas/types.yaml#/definitions/uint32
> @@ -79,6 +82,66 @@ properties:
>      type: object
>      $ref: /schemas/reset/ti,sci-reset.yaml#
>  
> +if:
> +  properties:
> +    compatible:
> +      contains:
> +        const: ti,am654-sci
> +then:
> +  properties:
> +    mbox-names:
> +      minItems: 2
> +      items:
> +        - const: rx
> +        - const: tx
> +        - const: notify

Move the notify to the end, so you have only one common list defined at
the top and you only change number of items per variant.

> +        - const: boot_rx
> +        - const: boot_tx
> +        - const: boot_notify
> +    mboxes:
> +      minItems: 2
> +      items:
> +        - description: RX thread
> +        - description: TX thread
> +        - description: Notify thread
> +        - description: boot stage RX thread
> +        - description: boot stage TX thread
> +        - description: boot stage Notify thread
> +else:
> +  if:

No, that's not readable. Don't nest these.

> +    properties:
> +      compatible:
> +        contains:
> +          const: ti,am642-sci
> +  then:
> +    properties:
> +      mbox-names:
> +        minItems: 2
> +        items:
> +          - const: rx
> +          - const: tx
> +          - const: boot_rx
> +          - const: boot_tx
> +          - const: boot_notify
> +      mboxes:
> +        minItems: 2
> +        items:
> +          - description: RX thread
> +          - description: TX thread
> +          - description: boot stage RX thread
> +          - description: boot stage TX thread
> +          - description: boot stage Notify thread
> +  else:
> +    properties:
> +      mbox-names:
> +        items:
> +          - const: rx
> +          - const: tx
> +      mboxes:
> +        items:
> +          - description: RX thread
> +          - description: TX thread
> +
>  required:
>    - compatible
>    - mbox-names
> @@ -122,3 +185,28 @@ examples:
>          #reset-cells = <2>;
>        };
>      };
> +
> +  - |
> +    system-controller@44083000 {
> +      compatible = "ti,am654-sci";
> +      ti,host-id = <4>;
> +      mbox-names = "rx", "tx", "notify", "boot_rx", "boot_tx";
> +      mboxes = <&secure_proxy_mcu 6>, <&secure_proxy_mcu 8>,
> +        <&secure_proxy_mcu 5>, <&secure_proxy_mcu 5>, <&secure_proxy_mcu 4>;
> +
> +      reg-names = "debug_messages";
> +      reg = <0x44083000 0x1000>;
> +    };

You already have there two examples. You do not need three and for sure
you do not need four of which two are exactly the same. Rob already
commented on this.

Best regards,
Krzysztof

