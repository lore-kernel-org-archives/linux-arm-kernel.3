Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E77AAC28B30
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Mar 2025 16:23:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FNJFZdWpa7qTv7TayiY1KM1bNVh08zKYaQD69LWVv+c=; b=wcABOziYdjcruHOb+KTHJSoUE4
	stb1tWmMWv03ik2L1orK9M7IDUI5Ln4j+Rgqw+fTIV3/n1h3SWkhWL8EX89ili1HldwnG26llKVk5
	72ZieMvOknDbuUbCLUzcgk1WGYYaNncWV63THvPeMPMN5azfmWC3qfHglM9OZlWfiVOF9ZizE05qC
	FTo4Ch/jI/Et2vFjTgQGbPT39xLKSl7MmhZvrA9eO+ysVyHCIlbH3WmuqDDmYVEYq6Ux7YgMdixAo
	2KgpsyHpLBSFf+VsBbiI5xpYuFOdW9X+zleloPxMe3Etm2L910q8ioG49KU+MnYOaAEFOUH8uhsaG
	QEfjRZzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvIgB-0000000CgCf-34Zn;
	Thu, 20 Mar 2025 16:23:35 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvIdL-0000000CfpV-1cXQ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Mar 2025 16:20:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9FDD1448AE;
	Thu, 20 Mar 2025 16:20:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8ED1C4CEDD;
	Thu, 20 Mar 2025 16:20:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742487639;
	bh=09ZvEo9Lo8wDXBHYBhzRezudTriTulM3WHI6hCa51Nk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=puN9NyjLrRNlhGHgDejODSbzff/92krPiS3mKFZxi7T3OFQfMvTeFQdk6sERmu42Z
	 NxTOJtZDglCsMi60wIoF+UTQvG+pEtM7j5F6noCDnlq3BD59nye912C4pdV7OWh/x1
	 qDQsX59VD247e3kXWne8Gy1zP5Q4BJoVSdABpWv7u6wvYTbYxTy4cr1BHly75RrZIr
	 RNR8B6G9csJjcJnpZBlpTk6m7wFLVG8/hlNIzDKD59Y82lBUivyVxgfD7+nqdSMt8v
	 duDkpXpFaQ/lpzmqD8qd1Kuza0VbabVRo5QaNj7TMRZ/BW35xPYazQrSZSxjL9YEMz
	 TWVRrgv9zHD1Q==
Message-ID: <7ed2af14-7677-4188-b77b-7f3c325d40a4@kernel.org>
Date: Thu, 20 Mar 2025 17:20:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 6/6] MAINTAINERS: Add CIX SoC maintainer entry
To: Peter Chen <peter.chen@cixtech.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 catalin.marinas@arm.com, will@kernel.org, arnd@arndb.de,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, cix-kernel-upstream@cixtech.com,
 marcin@juszkiewicz.com.pl, Fugang Duan <fugang.duan@cixtech.com>
References: <20250305053823.2048217-1-peter.chen@cixtech.com>
 <20250305053823.2048217-7-peter.chen@cixtech.com>
 <7419360a-abc0-44cf-8d55-8f5fad8e9079@kernel.org>
 <Z9vyy7f5NOPyzUES@nchen-desktop>
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
In-Reply-To: <Z9vyy7f5NOPyzUES@nchen-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250320_092039_469892_621EAF25 
X-CRM114-Status: GOOD (  12.79  )
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

On 20/03/2025 11:49, Peter Chen wrote:
> On 25-03-20 10:25:53, Krzysztof Kozlowski wrote:
>> EXTERNAL EMAIL
>>
>> On 05/03/2025 06:38, Peter Chen wrote:
>>> Using this entry as the maintainers information for CIX SKY series SoCs.
>>>
>>> Acked-by: Fugang Duan <fugang.duan@cixtech.com>
>>> Signed-off-by: Peter Chen <peter.chen@cixtech.com>
>>> ---
>>> Changes for v4
>>> - Add two dts files as maintained files
>>>
>>>  MAINTAINERS | 10 ++++++++++
>>>  1 file changed, 10 insertions(+)
>>>
>>> diff --git a/MAINTAINERS b/MAINTAINERS
>>> index efee40ea589f..edf26cf11ee2 100644
>>> --- a/MAINTAINERS
>>> +++ b/MAINTAINERS
>>> @@ -2354,6 +2354,16 @@ F:     arch/arm/boot/compressed/misc-ep93xx.h
>>>  F:   arch/arm/mach-ep93xx/
>>>  F:   drivers/iio/adc/ep93xx_adc.c
>>>
>>> +ARM/CIX SKY ARM ARCHITECTURE
>>> +M:   Peter Chen <peter.chen@cixtech.com>
>>> +M:   Fugang Duan <fugang.duan@cixtech.com>
>>> +R:   CIX Linux Kernel Upstream Group <cix-kernel-upstream@cixtech.com>
>>> +L:   linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
>>> +S:   Maintained
>>> +F:   Documentation/devicetree/bindings/arm/cix.yaml
>>> +F:   arch/arm64/boot/dts/cix/sky1-orion-o6.dts
>>> +F:   arch/arm64/boot/dts/cix/sky1.dtsi
>>
>> Instead:
>> arch/arm64/boot/dts/cix/
>>
>> or if you think there will be more different architectures coming from
>> cix, which you will not maintain, then useful would be a "sky" subdirectory.
>>
> Hi Krzysztof,
> 
> Thanks for your comment, CIX is Arm SoC based silicon design
> company, we may have different SoC style for middle end in future.
> So, for that SoC series, it may not name sky.

Your Kconfig says ARCH_CIX :/

Anyway, listing individual files is pointless, so if you are not going
to maintain entire arch, then create subdir. Otherwise why creating so
many entries? The biggest upstreamed SoC vendor (by number of SoCs and
boards has one entry.


Best regards,
Krzysztof

