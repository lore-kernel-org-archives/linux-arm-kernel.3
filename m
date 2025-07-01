Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4000DC8302F
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Jul 2025 11:28:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=69mW9QW+4jPO2/UvV67vqm1ZgUL5IHPm90XJ/fRmZO8=; b=4nd+NCfT4gsjs+AsLMK6AydSX6
	J5txDqcCpUfFqBGmeBG1uZ4VN6M/JkNrhXgLCYwz6jNjWRaUjehK5vcYvMc2c56MWyWHK3ecpBYno
	fsmyL7L99yNGZI9mfk+UZUi80wlHnOYZEVzc83cAhyQ9nzBuNJfGyFHnZoum80k6M6xx99JRJY1gQ
	r2mxqRvclNoFcGDH9EcPSaAgVaYVRU6Ir16DMvz92hD+YCEuDJ+OH3QqqtcsQTYz3C66UXoSPIuMm
	OE6c9XxvXXEwhr95U6BH5JsRKatxklMlo76RlMRTH1+mz9KBMuegJCI0L1Mdgvi4wapgRnpp+6XtS
	2VaWmtlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWZ9c-00000004rxt-31rz;
	Tue, 01 Jul 2025 11:28:00 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWZ7J-00000004rkG-0h8U;
	Tue, 01 Jul 2025 11:25:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 96AA261441;
	Tue,  1 Jul 2025 11:25:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A53FC4CEEB;
	Tue,  1 Jul 2025 11:25:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751369136;
	bh=sovRK5k6yrNB91o3/eBq3umT71d/FWg4mdRWQDzlGIw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=styklcjFdeCJ4cEf3lkqdklnTvXtjNNTjot7MDbObFP8sNyNa0qJL7LuUWpk7y1ox
	 1UbWpnex5HX3cxe/iYSghFdohWRl+jaFdML1GLNSysNCil0oealErPlXH0mkJm1Z2K
	 fRkbz5HNmJh9XQGzGUN3BhFOPSRPPinexUMkWocsGo3nw9VN0HpCv1qvqHripjliQ1
	 HnZQf77naJCwGFTtuAcwycKlliBrYw6tRIg2IafYaK8pp8eGRhPAYX9pzf4knEeacf
	 6cqN8vKGQiUgiOaa/o0qHi4Xxt1qCSg8K0Doelyc2ll3TP1BGrS4FUOwhaTN0ywKvD
	 NShq04PXss2Lg==
Message-ID: <f877b3d7-d770-4424-9813-da748775f456@kernel.org>
Date: Tue, 1 Jul 2025 13:25:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 07/10] dt-bindings: phy: Add PHY bindings support for
 FSD SoC
To: Shradha Todi <shradha.t@samsung.com>, 'Rob Herring' <robh@kernel.org>
Cc: linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-fsd@tesla.com, mani@kernel.org, lpieralisi@kernel.org, kw@linux.com,
 bhelgaas@google.com, jingoohan1@gmail.com, krzk+dt@kernel.org,
 conor+dt@kernel.org, alim.akhtar@samsung.com, vkoul@kernel.org,
 kishon@kernel.org, arnd@arndb.de, m.szyprowski@samsung.com,
 jh80.chung@samsung.com, pankaj.dubey@samsung.com
References: <20250625165229.3458-1-shradha.t@samsung.com>
 <CGME20250625165319epcas5p3721c19f6e6b482438c62dd1ef784de03@epcas5p3.samsung.com>
 <20250625165229.3458-8-shradha.t@samsung.com>
 <20250627211721.GA153863-robh@kernel.org>
 <02af01dbea78$24f01310$6ed03930$@samsung.com>
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
In-Reply-To: <02af01dbea78$24f01310$6ed03930$@samsung.com>
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

On 01/07/2025 13:06, Shradha Todi wrote:
> 
> 
>> -----Original Message-----
>> From: Rob Herring <robh@kernel.org>
>> Sent: 28 June 2025 02:47
>> To: Shradha Todi <shradha.t@samsung.com>
>> Cc: linux-pci@vger.kernel.org; devicetree@vger.kernel.org; linux-arm-kernel@lists.infradead.org;
> linux-
>> samsung-soc@vger.kernel.org; linux-kernel@vger.kernel.org; linux-phy@lists.infradead.org; linux-
>> fsd@tesla.com; manivannan.sadhasivam@linaro.org; lpieralisi@kernel.org; kw@linux.com;
>> bhelgaas@google.com; jingoohan1@gmail.com; krzk+dt@kernel.org; conor+dt@kernel.org;
>> alim.akhtar@samsung.com; vkoul@kernel.org; kishon@kernel.org; arnd@arndb.de;
>> m.szyprowski@samsung.com; jh80.chung@samsung.com; pankaj.dubey@samsung.com
>> Subject: Re: [PATCH v2 07/10] dt-bindings: phy: Add PHY bindings support for FSD SoC
>>
>> On Wed, Jun 25, 2025 at 10:22:26PM +0530, Shradha Todi wrote:
>>> Document PHY device tree bindings for Tesla FSD SoCs.
>>>
>>> Signed-off-by: Shradha Todi <shradha.t@samsung.com>
>>> ---
>>>  .../bindings/phy/samsung,exynos-pcie-phy.yaml | 25 +++++++++++++++++--
>>>  1 file changed, 23 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/Documentation/devicetree/bindings/phy/samsung,exynos-pcie-phy.yaml
>> b/Documentation/devicetree/bindings/phy/samsung,exynos-pcie-phy.yaml
>>> index 41df8bb08ff7..4dc20156cdde 100644
>>> --- a/Documentation/devicetree/bindings/phy/samsung,exynos-pcie-phy.yaml
>>> +++ b/Documentation/devicetree/bindings/phy/samsung,exynos-pcie-phy.yaml
>>> @@ -15,10 +15,13 @@ properties:
>>>      const: 0
>>>
>>>    compatible:
>>> -    const: samsung,exynos5433-pcie-phy
>>> +    enum:
>>> +      - samsung,exynos5433-pcie-phy
>>> +      - tesla,fsd-pcie-phy
>>>
>>>    reg:
>>> -    maxItems: 1
>>> +    minItems: 1
>>> +    maxItems: 2
>>>
>>>    samsung,pmu-syscon:
>>>      $ref: /schemas/types.yaml#/definitions/phandle
>>> @@ -30,6 +33,24 @@ properties:
>>>      description: phandle for FSYS sysreg interface, used to control
>>>                   sysreg registers bits for PCIe PHY
>>>
>>> +allOf:
>>> +  - if:
>>> +      properties:
>>> +        compatible:
>>> +          contains:
>>> +            enum:
>>> +              - tesla,fsd-pcie-phy
>>> +    then:
>>> +      description:
>>> +        The PHY controller nodes are represented in the aliases node
>>> +        using the following format 'pciephy{n}'. Depending on whether
>>> +        n is 0 or 1, the phy init sequence is chosen.
>>
>> What? Don't make up your own aliases.
>>
>> If the PHY instances are different, then maybe you need a different
>> compatible. If this is just selecting the PHY mode, you can do that in
>> PHY cells as the mode depends on the consumer.
>>
> 
> FSD PCIe has 2 instances of PHY. Both are the same HW Samsung
> PHYs (Therefore share the same register offsets). But the PHY used here

So same?

> does not support auto adaptation so we need to tune the PHYs
> according to the use case (considering channel loss, etc). This is why we

So not same? Decide. Either it is same or not, cannot be both.

If you mean that some wiring is different on the board, then how does it
differ in soc thus how it is per-soc property? If these are use-cases,
then how is even suitable for DT?

I use your Tesla FSD differently and then I exchange DTSI and compatibles?

You are no describing real problem and both binding and your
explanations are vague and imprecise. Binding tells nothing about it, so
it is example of skipping important decisions.

> have 2 different SW PHY initialization sequence depending on the instance
> number. Do you think having different compatible (something like
> tesla,fsd-pcie-phy0 and tesla,fsd-pcie-phy1) and having phy ID as platform data
> is okay in this case? I actually took reference from files like:

And in different use case on same soc you are going to reverse
compatibles or instance IDs?

> drivers/usb/phy/phy-am335x-control.c

So you took 15 years old hardware, code and binding as an example.

No, don't do that ever.

Anyway, poor choices even in newer code should not drive your design.
Design it properly, describe the hardware.

> drivers/phy/freescale/phy-fsl-imx8-mipi-dphy.c
> who use alias to differentiate between register offsets for instances.



Best regards,
Krzysztof

