Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E343ED62041
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Nov 2024 09:11:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=j7GDqdIjjOn/k4+Ysb258y5jyKDmormsh1XePdMhU2E=; b=0GF+P9/jihQeAK
	KK9WXdiTeDPQqMlIQxTKda+huw/WLsHsh2YQHLn6sZs4LdPPQYskQGod2ifTQFv/eOGr0O7GdCjyB
	0KOXdLqCjnzMFMT26vFL/qn53zzZRzklveww3h2P0Yd0vxZCm5gDyNsp5bhT+Z9l74Du0IP5qrVQE
	NzyyYqOP9DorJP/VkxnB8KjJ+XPAeg9CEmOLXfTixcme6P5ysmsJO6wVyi0Mkr0CF12Y1Np3r5LY5
	eZ038qqo6ngYFwEMtBMRrYouiozvyyA3sD4yikISGdAz9/Pvc9oG4FTH6il6ydDzss2QOCRmi9azA
	8Sybu1QqTW7R1uap3ixw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDKGo-0000000BqjT-49lu;
	Tue, 19 Nov 2024 09:11:38 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDKFs-0000000BqYj-2mLL
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Nov 2024 09:10:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1B1585C4BB2;
	Tue, 19 Nov 2024 09:09:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E930BC4CECF;
	Tue, 19 Nov 2024 09:10:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732007439;
	bh=klvYqdvZj+RbuOlNJ198QZqAWt60/GPJdcJ4YVksHnQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=SPlVJLAlOgxCWtJQzSHwjCN209bg88x6pc9XD+FZ3rykPebtUGROkz4itBCBac1zP
	 H/i4n/yQpQGl1uhOJx1YNNBu2zeE8pJsVNtRZ0PsdXs0w8LWLM9NvQ31c5pXYv6qj9
	 dWg86DnZQt13T0rixVzazJXTBqkFkxS93NyHkQNX+7UTLQeyEoLKZm1qH0EQDk/BAY
	 1L5S32NdHcvQoNDV6cgJpUlSj0LKTOO6SuPcYy/Yn07LnZV0fuUP5nQMROHe642tP1
	 6M0PQuviMBUGsDmdic9JAuX7p12PzRzQdTByfh0p44s03nCNL6fcPZfzOHBrxmKq2c
	 jUYxkiKVtlcKg==
Message-ID: <81ab828c-3584-491d-8ce7-0d309758457a@kernel.org>
Date: Tue, 19 Nov 2024 10:10:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] dt-bindings: net: can: atmel: Convert to json schema
To: Charan.Pedumuru@microchip.com
References: <20241003-can-v2-1-85701d3296dd@microchip.com>
 <xykmnsibdts7u73yu7b2vn3w55wx7puqo2nwhsji57th7lemym@f4l3ccxpevo4>
 <cd3a9342-3863-4a81-9b09-db7b8da1d561@microchip.com>
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
 FgIDAQIeAQIXgBYhBJvQfg4MUfjVlne3VBuTQ307QWKbBQJgPO8PBQkUX63hAAoJEBuTQ307
 QWKbBn8P+QFxwl7pDsAKR1InemMAmuykCHl+XgC0LDqrsWhAH5TYeTVXGSyDsuZjHvj+FRP+
 gZaEIYSw2Yf0e91U9HXo3RYhEwSmxUQ4Fjhc9qAwGKVPQf6YuQ5yy6pzI8brcKmHHOGrB3tP
 /MODPt81M1zpograAC2WTDzkICfHKj8LpXp45PylD99J9q0Y+gb04CG5/wXs+1hJy/dz0tYy
 iua4nCuSRbxnSHKBS5vvjosWWjWQXsRKd+zzXp6kfRHHpzJkhRwF6ArXi4XnQ+REnoTfM5Fk
 VmVmSQ3yFKKePEzoIriT1b2sXO0g5QXOAvFqB65LZjXG9jGJoVG6ZJrUV1MVK8vamKoVbUEe
 0NlLl/tX96HLowHHoKhxEsbFzGzKiFLh7hyboTpy2whdonkDxpnv/H8wE9M3VW/fPgnL2nPe
 xaBLqyHxy9hA9JrZvxg3IQ61x7rtBWBUQPmEaK0azW+l3ysiNpBhISkZrsW3ZUdknWu87nh6
 eTB7mR7xBcVxnomxWwJI4B0wuMwCPdgbV6YDUKCuSgRMUEiVry10xd9KLypR9Vfyn1AhROrq
 AubRPVeJBf9zR5UW1trJNfwVt3XmbHX50HCcHdEdCKiT9O+FiEcahIaWh9lihvO0ci0TtVGZ
 MCEtaCE80Q3Ma9RdHYB3uVF930jwquplFLNF+IBCn5JRzsFNBFVDXDQBEADNkrQYSREUL4D3
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
 YpsFAmA872oFCRRflLYACgkQG5NDfTtBYpvScw/9GrqBrVLuJoJ52qBBKUBDo4E+5fU1bjt0
 Gv0nh/hNJuecuRY6aemU6HOPNc2t8QHMSvwbSF+Vp9ZkOvrM36yUOufctoqON+wXrliEY0J4
 ksR89ZILRRAold9Mh0YDqEJc1HmuxYLJ7lnbLYH1oui8bLbMBM8S2Uo9RKqV2GROLi44enVt
 vdrDvo+CxKj2K+d4cleCNiz5qbTxPUW/cgkwG0lJc4I4sso7l4XMDKn95c7JtNsuzqKvhEVS
 oic5by3fbUnuI0cemeizF4QdtX2uQxrP7RwHFBd+YUia7zCcz0//rv6FZmAxWZGy5arNl6Vm
 lQqNo7/Poh8WWfRS+xegBxc6hBXahpyUKphAKYkah+m+I0QToCfnGKnPqyYIMDEHCS/RfqA5
 t8F+O56+oyLBAeWX7XcmyM6TGeVfb+OZVMJnZzK0s2VYAuI0Rl87FBFYgULdgqKV7R7WHzwD
 uZwJCLykjad45hsWcOGk3OcaAGQS6NDlfhM6O9aYNwGL6tGt/6BkRikNOs7VDEa4/HlbaSJo
 7FgndGw1kWmkeL6oQh7wBvYll2buKod4qYntmNKEicoHGU+x91Gcan8mCoqhJkbqrL7+nXG2
 5Q/GS5M9RFWS+nYyJh+c3OcfKqVcZQNANItt7+ULzdNJuhvTRRdC3g9hmCEuNSr+CLMdnRBY fv0=
In-Reply-To: <cd3a9342-3863-4a81-9b09-db7b8da1d561@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241119_011040_790057_B153AB18 
X-CRM114-Status: GOOD (  19.26  )
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
Cc: robh@kernel.org, conor+dt@kernel.org, linux-kernel@vger.kernel.org, alexandre.belloni@bootlin.com, devicetree@vger.kernel.org, netdev@vger.kernel.org, linux-can@vger.kernel.org, claudiu.beznea@tuxon.dev, edumazet@google.com, mkl@pengutronix.de, linux-arm-kernel@lists.infradead.org, kuba@kernel.org, krzk+dt@kernel.org, pabeni@redhat.com, davem@davemloft.net, mailhol.vincent@wanadoo.fr
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On 13/11/2024 06:30, Charan.Pedumuru@microchip.com wrote:
> On 03/10/24 14:04, Krzysztof Kozlowski wrote:
>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>
>> On Thu, Oct 03, 2024 at 10:37:03AM +0530, Charan Pedumuru wrote:
>>> Convert atmel-can documentation to yaml format
>>>
>>> Signed-off-by: Charan Pedumuru <charan.pedumuru@microchip.com>
>>> ---
>>> Changes in v2:
>>> - Renamed the title to "Microchip AT91 CAN controller"
>>> - Removed the unnecessary labels and add clock properties to examples
>>> - Removed if condition statements and made clock properties as default required properties
>>> - Link to v1: https://lore.kernel.org/r/20240912-can-v1-1-c5651b1809bb@microchip.com
>>> ---
>>>   .../bindings/net/can/atmel,at91sam9263-can.yaml    | 58 ++++++++++++++++++++++
>>>   .../devicetree/bindings/net/can/atmel-can.txt      | 15 ------
>>>   2 files changed, 58 insertions(+), 15 deletions(-)
>>>
>>> diff --git a/Documentation/devicetree/bindings/net/can/atmel,at91sam9263-can.yaml b/Documentation/devicetree/bindings/net/can/atmel,at91sam9263-can.yaml
>>> new file mode 100644
>>> index 000000000000..c818c01a718b
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/net/can/atmel,at91sam9263-can.yaml
>>> @@ -0,0 +1,58 @@
>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>>> +%YAML 1.2
>>> +---
>>> +$id: http://devicetree.org/schemas/net/can/atmel,at91sam9263-can.yaml#
>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>> +
>>> +title: Microchip AT91 CAN Controller
>>> +
>>> +maintainers:
>>> +  - Nicolas Ferre <nicolas.ferre@microchip.com>
>>> +
>>> +allOf:
>>> +  - $ref: can-controller.yaml#
>>> +
>>> +properties:
>>> +  compatible:
>>> +    oneOf:
>>> +      - enum:
>>> +          - atmel,at91sam9263-can
>>> +          - atmel,at91sam9x5-can
>>> +      - items:
>>> +          - enum:
>>> +              - microchip,sam9x60-can
>>> +          - const: atmel,at91sam9x5-can
>> That is not what old binding said.
> 
> Apologies for the late reply, the driver doesn't have compatible with 
> "microchip,sam9x60-can",
> so I made "atmel,at91sam9x5-can" as fallback driver

Any changes to the binding must be clearly expressed in the commit msg,
with appropriate reasoning.

> 
>>> +
>>> +  reg:
>>> +    maxItems: 1
>>> +
>>> +  interrupts:
>>> +    maxItems: 1
>>> +
>>> +  clocks:
>>> +    maxItems: 1
>>> +
>>> +  clock-names:
>>> +    items:
>>> +      - const: can_clk
>> These are new...
> 
> These were already defined in the previous revision.

Any changes to the binding must be clearly expressed in the commit msg,
with appropriate reasoning.


> 
>>
>>> +
>>> +required:
>>> +  - compatible
>>> +  - reg
>>> +  - interrupts
>>> +  - clocks
>>> +  - clock-names
>> Here the same. Each change to the binding should be explained (answer
>> to the: why) in commit msg.
> 
> Sure, I will include the reason for changes in commit message for the 
> next revision.
> 

Why am I repeating myself...


Best regards,
Krzysztof


