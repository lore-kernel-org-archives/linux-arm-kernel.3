Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56D40E9A04B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Feb 2026 19:54:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WKe4Q58TG50aFYUFI/hO4gIzlu2zY3C6bLJe2KZ7cOg=; b=uXJk1XrQzXw+B1IDXiVau8mirx
	kSs9O/B+l8WgMxNXWq3XujMWELUtWSAZi+zPV+Gl8hVLoNwOyi9nxENiesgM6tIMwIp2CcDtk9UdC
	fAK+PEIqrk97QhdAOEQWisXrlqFZpuLN85MdUrXS7Ay64zFy8fRciPYO1o+ZfPnkF75mIc7FoQPx/
	ODQDrD+JCm3QakQz4P5WDtEtNKz8ZA8rMoF8LMfiPsG+riowHmCaqPRaVhoVBZVslc3wlDST7zo0D
	hZGyAvNAM4HSsNVrbn5gRPYvaskvco0Ab3VUuU1b7KaFHFV18mZPVVJUTm/zNPJ9UyOytfdF/Z0LF
	C5M2JEuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsnd0-0000000AKt2-0ph0;
	Wed, 18 Feb 2026 19:54:30 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsncy-0000000AKsL-30f2
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Feb 2026 19:54:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B6E396132F;
	Wed, 18 Feb 2026 19:54:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75C6EC2BCC7;
	Wed, 18 Feb 2026 19:54:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771444467;
	bh=KwR7Qx4Tq8mj28cxomJ98ZhpYCkpEiUTX7F8Mbj2A2A=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Ki7KQPRdWlKE0bmrbUS/r2tfQj+AkwZ5a9iIPQzv92suGsOvMofkIYijaJm1g6Qcd
	 llrzML/R0DDF2wXn/3q6haV9J9bcPBhBpavm47scHegTWUsbjiyxSftDD/nIiqci4I
	 u4IprFFzva5neIkWvP/s2r0J1iLe6qG0EIfyXHnpoFYsaz3mTChHk6+BW5NnFd4kJP
	 jPUL1zdemKv9T2gotJqfmaP5n2Vd8ZQbr6kzfREWu11lP/7VERP2//XBJNpxWSCw+I
	 HBZEwxCPLzqzWUn4x/QbOxBNXZ4n1FfL+/8axbqWHZkFD5g0RM0OcUrlCQ9vLf6c5X
	 eXFj/7TfGAihg==
Message-ID: <a7c5c5df-28d9-4b4e-87f0-572b7f637d26@kernel.org>
Date: Wed, 18 Feb 2026 20:54:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] arm64: dts: exynos: ExynosAutov920: Add regulators
 for the USB
To: pritam.sutar@samsung.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, alim.akhtar@samsung.com
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
 rosa.pila@samsung.com, dev.tailor@samsung.com, faraz.ata@samsung.com,
 muhammed.ali@samsung.com, selvarasu.g@samsung.com
References: <20260122130721.205664-1-pritam.sutar@samsung.com>
 <CGME20260122125134epcas5p36625b7ac70b8dfba9430831a11955682@epcas5p3.samsung.com>
 <20260122130721.205664-3-pritam.sutar@samsung.com>
 <352427f4-144a-4a43-a2f3-dd959302939f@kernel.org>
 <000001dc9c13$ea305520$be90ff60$@samsung.com>
 <2edff611-76bb-45aa-922e-f96581dd0525@kernel.org>
 <019001dca0b8$f709e640$e51db2c0$@samsung.com>
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
In-Reply-To: <019001dca0b8$f709e640$e51db2c0$@samsung.com>
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

On 18/02/2026 10:28, pritam.sutar@samsung.com wrote:
>>>>> +	usbdrd31_dwc3_vbus: usbdrd31_dwc3-vbus {
>>>>
>>>> Please use name for all fixed regulators which matches current format
>>>> recommendation: 'regulator-[0-9]v[0-9]'
>>>>
>>>> https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi
>>>> t/tree/
>>>> Documentation/devicetree/bindings/regulator/fixed-regulator.yaml
>>>>
>>>> None of the regulators are called like you wrote. Really NONE.
>>>>
>>>
>>> Thank you for the references. Will bring changes for regulator's name
>>> and labels as
>>>
>>> -       usbdrd31_dwc3_vbus: usbdrd31_dwc3-vbus {
>>> +       reg_usbdrd31_dwc3_vbus: regulator-1 {
>>
>> Did you read the binding? That's not what I asked.
>>
> 
> Yes. 
> Sorry for misinterpreting above comment. Is it expected as below?
> 
> This is based on our understanding by referring binding and other vendor dts.
> 
> --- a/arch/arm64/boot/dts/exynos/exynosautov920-sadk.dts
> +++ b/arch/arm64/boot/dts/exynos/exynosautov920-sadk.dts
> @@ -59,7 +59,7 @@ dummy_regulator: regulator-0 {
>                  regulator-name = "dummy_regulator";
>         };
> 
> -       usbdrd31_dwc3_vbus: usbdrd31_dwc3-vbus {
> +       reg_usb_vbus0: regulator-5v0-vbus0 {

Yes, that's better.

Only under the assumption these are actually dedicated single-enable-pin
regulators, not pins going to the PMIC.

>                compatible = "regulator-fixed";
>                regulator-name = "usbdrd31_dwc3-vbus";
>                regulator-min-microvolt = <5000000>;
> @@ -75,7 +75,7 @@ usb_phy0: usb-phy0 {
>                 vbus-supply = <&usbdrd31_dwc3_vbus>;
>         };
> 

...

>>>>
>>>> That's a bit too much of dummies. This is heavily incomplete. You
>>>> need to bring back the PMIC first.
>>>>
>>>
>>> Presently, relying on USB LDOs being enabled by the bootloader in this
>>> automotive SoC. However, we understand the concern and it is added in
>>> case if anyone wants to use implemented PMIC in future. For now, would
>>> like to proceed with the dummy regulators to enable the required USB
>> features.
>>
>> And I don't see the point of these dummies. Solves nothing.
>>
> 
> Are you expecting details as mentioned in above section in commit message? 
> However, we have mentioned these details in cover letter.

No, I am expecting proper PMIC to be represented here. One dummy
regulator during the fast development phase is okay. Dummy added by
community contributors without resources and schematics would also fly.

But Samsung, with all the resources, schematics doing development since
2023 and still adding 20 dummies to every device? Nope, no, sorry.

Please start doing this properly. Look how entire new SoC was upstreamed
by Linaro:
https://lore.kernel.org/all/20231121-topic-sm8650-upstream-dt-v3-0-db9d0507ffd3@linaro.org/

Or something newer by Qualcomm:
https://lore.kernel.org/linux-arm-msm/?q=s%3Aglymur


Best regards,
Krzysztof

