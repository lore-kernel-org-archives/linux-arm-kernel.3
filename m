Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3A5FC7115A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Jun 2025 16:38:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vXXYrjy6lKrDzzyL60yxuVBUSgBI0TuAEVwTlF/jxNU=; b=2EF0t8DQqtw49iKDzQQWlxxDYu
	ADZjk15wCN7xkwkZEUHCPGRVQFadiGQJ1II/z+nP2PK3UrMRsC5ATJ/ffyuEb5qi8O9zrMXlNefd/
	nXhY31eM1vZ9BfZwNhzO7YUbum9Axtp5s03+VryLtYgwn7Wn8L+vLMZTot0ZkuaOycEm8+0bS4aWa
	xCBdmlrNJZqpcZHX4Izk0xqxk9CAXWd6E8dJZSQ/23gi2Q/v/GJWwgy4TAtEqAif0rnDzUI9t36us
	W9PD1MCUVxfNtS8pQvwifOW/WE459v1wbREcWyeY8xbepKXjIApgBas9SQWNO+E5eL0tFVxEfRLQ0
	+xVWNfBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRvnw-0000000Ak9S-39ML;
	Wed, 18 Jun 2025 16:38:28 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRtyE-0000000ATSA-39cx
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Jun 2025 14:40:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id CC5736113B;
	Wed, 18 Jun 2025 14:40:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09B44C4CEE7;
	Wed, 18 Jun 2025 14:40:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750257657;
	bh=MtBYd0YqvCToULpVWPvQ6YQNEEYqx1BJQAEVFsIlfCY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=DXYqYQowBIk5OsSUlcIaYr9pUiMvHEBs3Pqac0Eb7Xk1iz4A/Locx3gCanl44crW2
	 rLgFpvRMDRfmJlIDB9uK3eaDi9SHsGULMwVKw2InKZmXbDzY36iyh2/4LurVAR0jBB
	 CL8duK28vZwzncDGaHzUXENGo1wyxTjtv4KUabC47CBxGe+ma9OCChFr5c24oTuWbw
	 m5k6kuEOWCHZ2HA62OXgJncqbqU+VCtiEyC5Z5xQC57tySqEK6rFOzcksQdxxBf6V3
	 IaZsSZ7H0WhgKZw3ULGDeQGhHVhpNheXj4z/8M7UYbbk+QGPtBldKmlhzMNrXsSE37
	 qhFvjzwarPnKg==
Message-ID: <c3eb842a-61ee-4884-9394-856bcee1a476@kernel.org>
Date: Wed, 18 Jun 2025 16:40:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/12] dt-bindings: samsung,mipi-dsim: document exynos7870
 DSIM compatible
To: Kaustabh Chakraborty <kauschluss@disroot.org>
Cc: Inki Dae <inki.dae@samsung.com>, Jagan Teki <jagan@amarulasolutions.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Alim Akhtar <alim.akhtar@samsung.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
References: <20250612-exynos7870-dsim-v1-0-1a330bca89df@disroot.org>
 <20250612-exynos7870-dsim-v1-10-1a330bca89df@disroot.org>
 <5672e2ee-a828-4555-bf78-9d75c58840bd@kernel.org>
 <9e2f29d3763ea50b30e5a493551627cd@disroot.org>
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
In-Reply-To: <9e2f29d3763ea50b30e5a493551627cd@disroot.org>
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

On 18/06/2025 16:27, Kaustabh Chakraborty wrote:
> On 2025-06-18 10:00, Krzysztof Kozlowski wrote:
>> On 12/06/2025 17:18, Kaustabh Chakraborty wrote:
>>> Add compatible string for Exynos7870 DSIM bridge controller. The
>>> devicetree node requires four clock sources, named:
>>> - bus_clk
>>> - phyclk_mipidphy0_bitclkdiv8
>>> - phyclk_mipidphy0_rxclkesc0
>>> - sclk_mipi
>>>
>>> Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
>>> ---
>>>  .../bindings/display/bridge/samsung,mipi-dsim.yaml | 26 ++++++++++++++++++++++
>>>  1 file changed, 26 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/display/bridge/samsung,mipi-dsim.yaml b/Documentation/devicetree/bindings/display/bridge/samsung,mipi-dsim.yaml
>>> index 1acad99f396527192b6853f0096cfb8ae5669e6b..887f3ba1edd24a177a766b1b523d0c197ff1123a 100644
>>> --- a/Documentation/devicetree/bindings/display/bridge/samsung,mipi-dsim.yaml
>>> +++ b/Documentation/devicetree/bindings/display/bridge/samsung,mipi-dsim.yaml
>>> @@ -24,6 +24,7 @@ properties:
>>>            - samsung,exynos5410-mipi-dsi
>>>            - samsung,exynos5422-mipi-dsi
>>>            - samsung,exynos5433-mipi-dsi
>>> +          - samsung,exynos7870-mipi-dsi
>>>            - fsl,imx8mm-mipi-dsim
>>>            - fsl,imx8mp-mipi-dsim
>>>        - items:
>>> @@ -144,6 +145,31 @@ required:
>>>  
>>>  allOf:
>>>    - $ref: ../dsi-controller.yaml#
>>> +  - if:
>>> +      properties:
>>> +        compatible:
>>> +          contains:
>>> +            const: samsung,exynos7870-mipi-dsi
>>> +
>>> +    then:
>>> +      properties:
>>> +        clocks:
>>> +          minItems: 4
>>
>> maxItems: 4
> 
> Will replace. maxItems == minItems implicit if maxItems present and
> minItems absent.

No, you need both. Add maxItemsd. Look at all or most of Exynos bindings.

> 
>>
>>> +
>>> +        clock-names:
>>> +          items:
>>> +            - const: bus_clk
>>> +            - const: phyclk_mipidphy0_bitclkdiv8
>>> +            - const: phyclk_mipidphy0_rxclkesc0
>>> +            - const: sclk_mipi
>>
>> Does any existing driver code actually depends on the names? If not, we
>> switched in Samsung in general to names matching the input or the
>> function, not the name of provider. bus, bit (or bitdiv?), rx or esc0, sclk 
> 
> Yeah, Exynos5433 uses it. Code is here [1].

It is fine then.

> 
> Though, I could get around this if you would like to. Would need to add
> a few more patches.

If you want to work on this, then it would be useful - add clock names
per variant/device and just clk_get_bulk() on supplied array. Up to you.


Best regards,
Krzysztof

