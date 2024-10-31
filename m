Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C82B0D767F2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Oct 2024 18:13:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6xN42UJV+i3eOv3LCvG4GOm7RpPsptt7AZMqDB+1DNU=; b=gdrA7M4gp9+vubjcV+tFUrPB7H
	ZOwlZEB0bUil2fPx0VfbFii8MNk21ar+QxIYqU8WMBk0jMPjp5NroOPc3jB2d9WAWO21x6c/VHwbd
	ZBf3WrWVJI5C2buw8C59tMXnUUYHG/G2N9kmv+P214INad+LN71aWKtykEsjKCY9El0wHaBzNwWuz
	HqRNAn0KjVbDnN3bI4fRBT2BJPXjswWCzAACBDrfxD4Gkn7XmBedfUmuLKTMSWZIzmXtaZ4l4IuUW
	wH1+v5tncKtv1lp4/etmNkxapxlkruowUUcRP/qyXS7u12V61HhxK9HfdR9f42iZGEjFRVR+tIRQJ
	JPXg5HCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6ZfZ-00000004T8z-1MRX;
	Thu, 31 Oct 2024 18:13:17 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6Zd2-00000004Slq-43cn;
	Thu, 31 Oct 2024 18:10:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 0D2FBA44152;
	Thu, 31 Oct 2024 18:08:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D56BC4CEC3;
	Thu, 31 Oct 2024 18:10:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730398239;
	bh=TcADyLHD8mzD4LXfNgzjzmkk0ShTNI6CxmZOgrOl91Q=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=XXJthmwS6o3ReObP4f5vEtGbvIS4QbrtRuVHmRJPFElJq2HrVTg2v+oj+pMvedhd+
	 U5+0ZOd/SCvbWGtBSWZ75/SX344/FMigM4HugD571i8IuL/64S+hw0zbrlzl0bHnJa
	 k62ZtOJkD5nY8Ze1pRnzSm6CUfzfe7eoUWmFVj7DFBsxE5X6kcKtsVGCFX9htGhHaM
	 mTM/lf9Wa5+XMkXbnxl2Sx+MP4Z1LTgyvOcvCq+sqD65p8nNwgvfw9IbQBri6EUSsb
	 cBs80OieUKe0sz2KTwhcG9ihP43F8/ItdW+WPyZOdexYUXRbiY4mSWFc/ezPU2hLKK
	 eildUb86mFV8w==
Message-ID: <cc2e1a17-c5b1-4608-8e32-a6dea23a7efb@kernel.org>
Date: Thu, 31 Oct 2024 19:10:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 02/12] dt-bindings: pinctrl: Add RaspberryPi RP1
 gpio/pinctrl/pinmux bindings
To: Andrea della Porta <andrea.porta@suse.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Florian Fainelli <florian.fainelli@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Krzysztof Wilczynski <kw@linux.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Bjorn Helgaas <bhelgaas@google.com>, Linus Walleij
 <linus.walleij@linaro.org>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>,
 Derek Kiernan <derek.kiernan@amd.com>, Dragan Cvetic
 <dragan.cvetic@amd.com>, Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Saravana Kannan <saravanak@google.com>, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-gpio@vger.kernel.org,
 Masahiro Yamada <masahiroy@kernel.org>, Stefan Wahren <wahrenst@gmx.net>,
 Herve Codina <herve.codina@bootlin.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Andrew Lunn <andrew@lunn.ch>
References: <cover.1730123575.git.andrea.porta@suse.com>
 <9a02498e0fbc135dcbe94adc7fc2d743cf190fac.1730123575.git.andrea.porta@suse.com>
 <mjhopgkrjahaxydn3ckianqnvjn55kxrldulvjkpqivlz72uyi@57l5vhydpzc2>
 <ZyOPHm7fl_vW7mAJ@apocalypse>
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
In-Reply-To: <ZyOPHm7fl_vW7mAJ@apocalypse>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241031_111041_179238_44ED2B06 
X-CRM114-Status: GOOD (  24.92  )
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

On 31/10/2024 15:07, Andrea della Porta wrote:
> Hi Krzysztof,
> 
> On 08:26 Tue 29 Oct     , Krzysztof Kozlowski wrote:
>> On Mon, Oct 28, 2024 at 03:07:19PM +0100, Andrea della Porta wrote:
>>> Add device tree bindings for the gpio/pin/mux controller that is part of
>>> the RP1 multi function device, and relative entries in MAINTAINERS file.
>>>
>>> Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
>>> ---
>>>  .../pinctrl/raspberrypi,rp1-gpio.yaml         | 163 ++++++++++++++++++
>>>  MAINTAINERS                                   |   2 +
>>>  2 files changed, 165 insertions(+)
>>>  create mode 100644 Documentation/devicetree/bindings/pinctrl/raspberrypi,rp1-gpio.yaml
>>>
>>> diff --git a/Documentation/devicetree/bindings/pinctrl/raspberrypi,rp1-gpio.yaml b/Documentation/devicetree/bindings/pinctrl/raspberrypi,rp1-gpio.yaml
>>> new file mode 100644
>>> index 000000000000..465a53a6d84f
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/pinctrl/raspberrypi,rp1-gpio.yaml
>>> @@ -0,0 +1,163 @@
>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>>> +%YAML 1.2
>>> +---
>>> +$id: http://devicetree.org/schemas/pinctrl/raspberrypi,rp1-gpio.yaml#
>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>> +
>>> +title: RaspberryPi RP1 GPIO/Pinconf/Pinmux Controller submodule
>>> +
>>> +maintainers:
>>> +  - Andrea della Porta <andrea.porta@suse.com>
>>> +
>>> +description:
>>> +  The RP1 chipset is a Multi Function Device containing, among other sub-peripherals,
>>> +  a gpio/pinconf/mux controller whose 54 pins are grouped into 3 banks. It works also
>>
>> Please wrap code according to coding style (checkpatch is not a coding
>> style description but only a tool).
> 
> Ack.
> 
>>
>>> +  as an interrupt controller for those gpios.
>>> +
>>> +properties:
>>> +  compatible:
>>> +    const: raspberrypi,rp1-gpio
>>> +
>>> +  reg:
>>> +    maxItems: 3
>>> +    description: One reg specifier for each one of the 3 pin banks.
>>> +
>>> +  '#gpio-cells':
>>> +    description: The first cell is the pin number and the second cell is used
>>> +      to specify the flags (see include/dt-bindings/gpio/gpio.h).
>>> +    const: 2
>>> +
>>> +  gpio-controller: true
>>> +
>>> +  gpio-ranges:
>>> +    maxItems: 1
>>> +
>>> +  gpio-line-names:
>>> +    maxItems: 54
>>> +
>>> +  interrupts:
>>> +    maxItems: 3
>>> +    description: One interrupt specifier for each one of the 3 pin banks.
>>> +
>>> +  '#interrupt-cells':
>>> +    description:
>>> +      Specifies the Bank number [0, 1, 2] and Flags as defined in
>>> +      include/dt-bindings/interrupt-controller/irq.h.
>>> +    const: 2
>>> +
>>> +  interrupt-controller: true
>>> +
>>> +additionalProperties:
>>
>> Not much improved. You are supposed to have here pattern, just like
>> other bindings. I asked for this last time.
>>
>> And there are examples using it - almost all or most of pinctrl
>> bindings, including bindings having subnodes (but you do not use such
>> case here).
> 
> This is the same approach used in [1], which seems quite recent. I did't

2021, so not that recent, but you are right that it's not the example I
would recommend. See rather:
git grep pins -- Documentation/devicetree/bindings/pinctrl/ | grep '\$'


pins, groups, states, etc.

> use pattern because I wouldn't really want to enforce a particular naming
> scheme. Subnodes are used, please see below. Since pinctrl.yaml explicitly

But we want to enforce, because it brings uniformity and matches
partially generic naming patterns.

> says that there is no common binding but each device has its own, I
> thought that was reasonable choice. Should I enforce some common pattern,
> then?

Yes, you should. Again, look at other bindings, e.g. qcom tlmm or lpass lpi.

> 
>>
>>> +  anyOf:
>>> +    - type: object
>>> +      additionalProperties: false
>>> +      allOf:
>>> +        - $ref: pincfg-node.yaml#
>>> +        - $ref: pinmux-node.yaml#
>>> +
>>> +      description:
>>> +        Pin controller client devices use pin configuration subnodes (children
>>> +        and grandchildren) for desired pin configuration.
>>> +        Client device subnodes use below standard properties.
>>> +
>>> +      properties:
>>> +        pins:
>>> +          description:
>>> +            A string (or list of strings) adhering to the pattern 'gpio[0-5][0-9]'
>>> +        function: true
>>> +        bias-disable: true
>>> +        bias-pull-down: true
>>> +        bias-pull-up: true
>>> +        slew-rate:
>>> +          description: 0 is slow slew rate, 1 is fast slew rate
>>> +          enum: [ 0, 1 ]
>>> +        drive-strength:
>>> +          enum: [ 2, 4, 8, 12 ]
>>> +
>>> +    - type: object
>>> +      additionalProperties:
>>> +        $ref: "#/additionalProperties/anyOf/0"
>>
>> Your example does not use any subnodes, so this looks not needed.
> 
> The example has subnodes, as in the following excerpt from the example:

I meant, you do not need properties in subnodes (1st level). You only
want properties in subnodes of subnodes, so 2nd level. What is the point
of allowing them in 1st level?



Best regards,
Krzysztof


