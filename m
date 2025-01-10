Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7B2BE7719C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jan 2025 07:44:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NbjjRkRWokCOvRa380wZBaj6vLZjXMaPmn836/HzFPQ=; b=1QoHwv8T8ajr8Hn/cxRaTJ6D4v
	QOLT67qXfUO4hF35mMABqWDdGhufIeg+DL1YTS/9EzdOugp/H2rQhVrXoeEXsZW3YYacKbzV186Hu
	HZNh1fq3f857k578flso5XQfXePshi1VGzfFcsXoaNaDcryubOLJ1pmjm0rJbYW60dkCXzWZ7O3P+
	6gl0dTJKLY7tuYlUafYqYgf5bhm1Ajhn13IhPnamyzZwcX+wodNeoUkJkNh62koGLkJEPhPnLf65y
	C/Rfsfvd3Zopd5YlA+5A7chGaD+2b+3xISkU2rbHRsUVPRp8jltv3vdp3uB53QmjSZ2HFEa/UkwyV
	bPlD/Xlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tW9gb-0000000EPno-0iBT;
	Fri, 10 Jan 2025 07:44:05 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tW9fM-0000000EPWi-2QK5;
	Fri, 10 Jan 2025 07:42:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 2AAE6A41A19;
	Fri, 10 Jan 2025 07:40:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57A5EC4CED6;
	Fri, 10 Jan 2025 07:42:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736494967;
	bh=XmYgjpNvIDSw8Yc0EFTFMPiabKK7MhC3gK3twFF80Ac=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=nRQ5DgATufb9Jd8uFEtMIRU41Hpb/TPoJIf+hkKZ/nRNW/luySUcdtBZ4czDpb0KW
	 sX8eyy6em8haxZbjBvtlJsdbnM0OFxm8VWAEBjRXQgp8jN4IvLP/IiAiDZj9v81cj7
	 zLWIJMLYnZRlbPhSjkcA8NtxNAB+LuqVwBHL9ExbyKHQWBSzdcMyVYa/yr8Y+B/0it
	 ITSd7yFHyuVejzo+gBhsw8LCtn91JzH04IaqvXICgJ9SQJAtV0OMi1I3R11BJU6sst
	 GtYqSG0YmQF6hEPz9GSVT0wV5su/6lAp6CdbmN9dSJZl04/q00XVfTv0+DRrZH4FHN
	 qxfkAF9QAicxw==
Message-ID: <9caddd6a-fe1b-468a-ba1e-0513e46404dc@kernel.org>
Date: Fri, 10 Jan 2025 08:42:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/5] dt-bindings: clock: Document clock and reset unit
 of RK3528
To: Yao Zi <ziyao@disroot.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Philipp Zabel <p.zabel@pengutronix.de>, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250108114605.1960-2-ziyao@disroot.org>
 <20250108114605.1960-3-ziyao@disroot.org>
 <tep74dy3oc6y2wwhp6bthv6brhkge7cojzrtj6x53lvtsws4g5@areqtyxhyayq>
 <Z3-T3JwcsW0xYKvk@pie>
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
In-Reply-To: <Z3-T3JwcsW0xYKvk@pie>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250109_234248_747602_810837D5 
X-CRM114-Status: GOOD (  18.42  )
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

On 09/01/2025 10:16, Yao Zi wrote:
> On Thu, Jan 09, 2025 at 09:59:25AM +0100, Krzysztof Kozlowski wrote:
>> On Wed, Jan 08, 2025 at 11:46:02AM +0000, Yao Zi wrote:
>>> There are two types of clocks in RK3528 SoC, CRU-managed and
>>> SCMI-managed. Independent IDs are assigned to them.
>>>
>>> For the reset part, differing from previous Rockchip SoCs and
>>> downstream bindings which embeds register offsets into the IDs, gapless
>>> numbers starting from zero are used.
>>>
>>> Signed-off-by: Yao Zi <ziyao@disroot.org>
>>> ---
>>>  .../bindings/clock/rockchip,rk3528-cru.yaml   |  67 +++
>>>  .../dt-bindings/clock/rockchip,rk3528-cru.h   | 453 ++++++++++++++++++
>>>  .../dt-bindings/reset/rockchip,rk3528-cru.h   | 241 ++++++++++
>>>  3 files changed, 761 insertions(+)
>>>  create mode 100644 Documentation/devicetree/bindings/clock/rockchip,rk3528-cru.yaml
>>>  create mode 100644 include/dt-bindings/clock/rockchip,rk3528-cru.h
>>>  create mode 100644 include/dt-bindings/reset/rockchip,rk3528-cru.h
>>>
>>> diff --git a/Documentation/devicetree/bindings/clock/rockchip,rk3528-cru.yaml b/Documentation/devicetree/bindings/clock/rockchip,rk3528-cru.yaml
>>> new file mode 100644
>>> index 000000000000..19dbda858172
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/clock/rockchip,rk3528-cru.yaml
>>> @@ -0,0 +1,67 @@
>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>>> +%YAML 1.2
>>> +---
>>> +$id: http://devicetree.org/schemas/clock/rockchip,rk3528-cru.yaml#
>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>> +
>>> +title: Rockchip RK3528 Clock and Reset Controller
>>> +
>>> +maintainers:
>>> +  - Yao Zi <ziyao@disroot.org>
>>> +
>>> +description: |
>>> +  The RK3528 clock controller generates the clock and also implements a reset
>>> +  controller for SoC peripherals. For example, it provides SCLK_UART0 and
>>> +  PCLK_UART0 as well as SRST_P_UART0 and SRST_S_UART0 for the first UART
>>> +  module.
>>> +  Each clock is assigned an identifier, consumer nodes can use it to specify
>>> +  the clock. All available clock and reset IDs are defined in dt-binding
>>> +  headers.
>>> +
>>> +properties:
>>> +  compatible:
>>> +    const: rockchip,rk3528-cru
>>> +
>>> +  reg:
>>> +    maxItems: 1
>>> +
>>> +  assigned-clocks: true
>>> +
>>> +  assigned-clock-rates: true
>>
>> Drop both, totally redundant.
> 
> Okay, will fix in next version.
> 
>>> +
>>> +  clocks:
>>> +    items:
>>> +      - description: External 24MHz oscillator clock
>>> +      - description: 50MHz clock generated by PHY module
>>> +
>>> +  clock-names:
>>> +    items:
>>> +      - const: xin24m
>>> +      - const: gmac0
>>
>> gmac
>> (unless you have gmac1 here as well but then please add it now)
> 
> RK3528 comes with two onchip gmacs. This input clock is only used for
> the first one and I think keeping the number would give the reader an
> extra hint. What do you think about it?
You don't get the point. What clock is from this module perspective? gmac.

Best regards,
Krzysztof

