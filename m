Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C406CF2567
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Nov 2025 07:31:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rFht0fmhf5g2arYgJ/iP+/CngsmiLrPS8GH9MCEKflM=; b=okAAry1cTVskNcOYajFDqNP2K7
	i8wFLLhflyX4IbsCFLlbazLyQY0xYgOW3QbhDO/QpDGQ8IRbQkq/EsWjsgPRyU1Va2Ljqa+ZYYW3J
	Ek4+wtteueM9YHvyY89UcM5WHkjmYDgzrsZil934sBgHLj0XzrHgrqa5wKz3xx9OelOqay4bWhAM1
	ooTfGIfDGWLxo5c0mEjDb3rgGhjxo5PPdJPoMO1Cc+lwKhR45zlcrWluvossCUEwmV0t8Ej36dEdk
	YlyFugArEJN3jzPlABtclChZu9t6g4rZ7uVQaGYs2FIWKWSZmftZ5iY313epICFManzkjKVRSbctj
	t88zNR4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLcf8-00000002i3C-37YK;
	Wed, 19 Nov 2025 07:31:34 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLcf7-00000002i31-1WMh;
	Wed, 19 Nov 2025 07:31:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 392BC60207;
	Wed, 19 Nov 2025 07:31:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49374C2BCB0;
	Wed, 19 Nov 2025 07:31:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763537491;
	bh=Uk1P1yAR/gAChVYsJ7dKNzU1fhqI7nE/pvp9Hvveqxg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=FTeTpTPEGIrhij++EyxyqQA92gt988/tEssWkp7hC2r1Z7LnMW9IlbyzfnDofekBK
	 IkewrfzFt4qNitML+NhUaWzN5XPfrP1J/O/BgAgpovRE00eStdL38THNv9Y1EPdhXw
	 nI/ZNxGYlH6jDrBSRjJcAOuAq6ofoBqrV+RfaN9k7JdyDf3QYsYiIbgokdWLJLaB8F
	 SW3fPIQ1YCewke6ifialDBNpLNuH2ESAzKYbzStBdufkBIE82sPDpHh0Lf+bpk+CKE
	 pv+uYpsiD3RLbCwtjOJDL680Guwy2NCPfQui+WAnvIKjXL3zPKnh7MisAZf28JSAuy
	 zmgSGfb1T+4uw==
Message-ID: <5bc642d3-fe05-4654-88c3-11c6534c5aa4@kernel.org>
Date: Wed, 19 Nov 2025 08:31:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] dt-bindings: arm: rockchip: Add Asus Tinker Board
 3/3S
To: Dragan Simic <dsimic@manjaro.org>
Cc: Michael Opdenacker <michael.opdenacker@rootcommit.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20251118-tinker3-v3-0-2903693f2ebb@rootcommit.com>
 <20251118-tinker3-v3-1-2903693f2ebb@rootcommit.com>
 <155d3d05-49f8-a000-6939-1411917745bb@manjaro.org>
 <e7417a6e-3824-48f7-af56-eaf4bf097cb9@kernel.org>
 <b8e91b59-afb1-6d0d-4709-c7f76ded0e18@manjaro.org>
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
In-Reply-To: <b8e91b59-afb1-6d0d-4709-c7f76ded0e18@manjaro.org>
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

On 19/11/2025 08:23, Dragan Simic wrote:
> Hello Krzysztof,
> 
> On Wednesday, November 19, 2025 08:09 CET, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>> On 19/11/2025 08:00, Dragan Simic wrote:
>>> On Tuesday, November 18, 2025 16:56 CET, Michael Opdenacker <michael.opdenacker@rootcommit.com> wrote:
>>>> Document the compatible strings for Asus Tinker Board 3 [1] and 3S [2],
>>>> which are SBCs based on the Rockchip 3566 SoC.
>>>>
>>>> The "3S" version ("S" for "storage") just adds a 16 GB eMMC
>>>> and a "mask ROM" DIP switch to the "3" version.
>>>>
>>>> [1] https://tinker-board.asus.com/series/tinker-board-3.html
>>>> [2] https://tinker-board.asus.com/series/tinker-board-3s.html
>>>>
>>>> Signed-off-by: Michael Opdenacker <michael.opdenacker@rootcommit.com>
>>>>
>>>> ---
>>>>
>>>> Changes in V3:
>>>>
>>>> - Remove this Acked-by as the binding code changed substantially:
>>>>   Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>>> ---
>>>>  Documentation/devicetree/bindings/arm/rockchip.yaml | 7 +++++++
>>>>  1 file changed, 7 insertions(+)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
>>>> index 6aceaa8acbb2..800c11323a4f 100644
>>>> --- a/Documentation/devicetree/bindings/arm/rockchip.yaml
>>>> +++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
>>>> @@ -86,6 +86,13 @@ properties:
>>>>            - const: asus,rk3288-tinker-s
>>>>            - const: rockchip,rk3288
>>>>  
>>>> +      - description: Asus Tinker Board 3/3S
>>>> +        items:
>>>> +          - enum:
>>>> +              - asus,rk3566-tinker-board-3
>>>> +              - asus,rk3566-tinker-board-3s
>>>> +          - const: rockchip,rk3566
>>>> +
>>>>        - description: Beelink A1
>>>>          items:
>>>>            - const: azw,beelink-a1
>>>
>>> Please see my delayed response in the v2. [1]  I think that would be
>>> a better approach.
>>>
>>> [1] https://lore.kernel.org/linux-rockchip/3c96ee6b-dca7-1a0a-792b-f8c165ec997d@manjaro.org/
>>
>> Your reviews are not helpful. You nitpick irrelevant things and propose
>> solutions which later reverse leading to wasted effort on contributors side.
>>
>> Michael implemented what you asked here:
>>
>> https://lore.kernel.org/linux-rockchip/e4cd11d0-463c-e707-5110-6b92899b1ba3@manjaro.org/
> 
> Not exactly, because I didn't ask for any compatibles to be removed
> from the new board dts files.

Read your answer again. You wanted ENTIRE bindings, to be like this:

     - description: Asus Tinker Board 3/3S
       items:
         - enum:
	   - asus,rk3566-tinker-board-3
           - asus,rk3566-tinker-board-3s
         - const: rockchip,rk3566

(skipping obvious indentation fixup)
There are exactly like this.

> 
> In this case, we could also say that it was Michael's fault not to
> give enough time for the reviewers to respond.

Michael implemented EXACTLY what you asked. Now, you ask to change it to
what Michael did BEFORE.

Your reviews are completely irresponsible and incorrect.

Best regards,
Krzysztof

