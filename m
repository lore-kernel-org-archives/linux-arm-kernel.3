Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13536C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Mar 2025 13:28:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zym7GXFt5FvT0A1TOW91sTo1Arm4QC5F+yW3B9jOMBU=; b=SnzMdyXS0Nm3hjP82EgXVx/g+h
	WZ7mZdPJe/kB7HO5EkDj1/1sj3I4L3s412bkwwUD6xG8nYDO46QYQTv9GDaJm0EngRgalbp/81hAY
	xhlucYJPwtOHSu2eMrrypu2uh7TNk0qtEyG4Ai1OcqVi/U1Cj2dGhvkE5L1EyB9ky/fwmQ5Xfr51A
	SUtg3VKoISReeYBHqeJFZ4Gq/3uq+b7u5Ey1wXybRj92Cae2yo9oDr7fP6LrUuIAd1J7j/Hf7QTUT
	U9tWNeOkLvMlRJ883XiY/sBT74euzixNWnPofXwkINZNPb+0rPuJ0x/ZgvFn+R0JW86gI2YbvXsXM
	67gHaITQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trze5-00000005qAE-2VcI;
	Tue, 11 Mar 2025 13:27:45 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trzcR-00000005prB-0WN9
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Mar 2025 13:26:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 47B0DA44FB2;
	Tue, 11 Mar 2025 13:20:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18C82C4CEE9;
	Tue, 11 Mar 2025 13:25:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741699561;
	bh=7taCYy0GzWbqsnJbUDHzsasZ27x+GWjvIkuximMnFcs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=iDvThAAxzTanVqhD/cNh3tKPAKBSuUl5bb4NGTxrTH3edhtquOIU+f9hJLfm+9HJO
	 yvObIpeHfc6UWfDm0iqEc9tlwm3ZWM4Mv33J8xU3tX0z83wDpoH+L1dOAu+2DKBReC
	 BQItK+7gzQg6mLzSZfGiSJtwMl1dGsJcbjywGqut7DP2zDEQR5zTzX8wpB46ThHYK8
	 4jd7EtzZ/pv3+n+Df6Oq/H/OOMq+rfdG1WbBgvHmrh5FxTnfMMwd+1lxjnQnt74KTH
	 JrGevUwngDLZHgGU98tHdKNvLQi90pygqBHU6gkea4ZyOGG0SVIeGc/nT1ub4FmoCO
	 iRt28K7dcw74Q==
Message-ID: <c7de47e5-9a5d-455e-b293-b25b6f801b2b@kernel.org>
Date: Tue, 11 Mar 2025 14:25:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 01/18] dt-bindings: gpu: img: Future-proofing
 enhancements
To: Matt Coster <Matt.Coster@imgtec.com>
Cc: Frank Binns <Frank.Binns@imgtec.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Nishanth Menon <nm@ti.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, Randolph Sapp <rs@ti.com>,
 Darren Etheridge <detheridge@ti.com>,
 Alessio Belle <Alessio.Belle@imgtec.com>,
 Alexandru Dadu <Alexandru.Dadu@imgtec.com>
References: <20250310-sets-bxs-4-64-patch-v1-v3-0-143b3dbef02f@imgtec.com>
 <20250310-sets-bxs-4-64-patch-v1-v3-1-143b3dbef02f@imgtec.com>
 <20250311-flashy-rattlesnake-of-rain-dcc4f6@krzk-bin>
 <cc6a19b3-ba35-465c-9fa6-a764df7c01c1@imgtec.com>
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
In-Reply-To: <cc6a19b3-ba35-465c-9fa6-a764df7c01c1@imgtec.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250311_062603_299344_99550F4D 
X-CRM114-Status: GOOD (  19.34  )
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

On 11/03/2025 11:33, Matt Coster wrote:
>>> The currently supported GPU (AXE-1-16M) only requires a single power
>>> domain. Subsequent patches will add support for BXS-4-64 MC1, which has
>>> two power domains. Add infrastructure now to allow for this.
>>>
>>> Also allow the dma-coherent property to be added to IMG Rogue GPUs, which
>>> are DMA devices. The decision for coherency is made at integration time and
>>> this property should be applied wherever it accurately describes the
>>> vendor integration.
>>>
>>> Note that the new required properties for power domains are conditional on
>>> the new base compatible string to avoid an ABI break.
>>>
>>> Signed-off-by: Matt Coster <matt.coster@imgtec.com>
>>> ---
>>> Changes in v3:
>>> - Remove unnecessary example
>>> - Remove second power domain details, add these where they're used instead
>>> - Avoid ABI breaks by limiting new required properties to new compatible
>>>   strings and making all binding changes in a single patch.
>>> - Links to v2:
>>>   https://lore.kernel.org/r/20241118-sets-bxs-4-64-patch-v1-v2-1-3fd45d9fb0cf@imgtec.com
>>>   https://lore.kernel.org/r/20241118-sets-bxs-4-64-patch-v1-v2-3-3fd45d9fb0cf@imgtec.com
>>>   https://lore.kernel.org/r/20241118-sets-bxs-4-64-patch-v1-v2-4-3fd45d9fb0cf@imgtec.com
>>> ---
>>>  .../devicetree/bindings/gpu/img,powervr-rogue.yaml | 43 ++++++++++++++++++----
>>>  1 file changed, 36 insertions(+), 7 deletions(-)
>>>
>>> diff --git a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
>>> index 256e252f8087fa0d6081f771a01601d34b66fe19..5c16b2881447c9cda78e5bb46569e2f675d740c4 100644
>>> --- a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
>>> +++ b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
>>> @@ -12,10 +12,20 @@ maintainers:
>>>  
>>>  properties:
>>>    compatible:
>>> -    items:
>>> -      - enum:
>>> -          - ti,am62-gpu
>>> -      - const: img,img-axe # IMG AXE GPU model/revision is fully discoverable
>>> +    oneOf:
>>> +      - items:
>>> +          - enum:
>>> +              - ti,am62-gpu
>>> +          - const: img,img-axe-1-16m
>>> +          - const: img,img-rogue
>>
>> That's still ABI break. You got here NAK. You ust preserve img,img-axe.
>> Your marketing troubles do not concern Linux.
> 
> I think I'm misunderstanding something here. Is keeping the existing
> compatible string around in the deprecated item below not sufficient to
> maintain the existing ABI?

I was not precise/correct. This indeed is not an ABI break itself.
However you will break the users of DTS when anyone applies such DTS.

> 
> Would adding img,img-axe back into the updated list (bringing it to four
> elements) be acceptable?

Yes, you must keep all the compatibles. Affecting users because of
marketing choices is a no-go. No one here cares about marketing.

> 
>>
>>> +
>>> +      # This legacy combination of compatible strings was introduced early on
>>> +      # before the more specific GPU identifiers were used.
>>> +      - items:
>>> +          - enum:
>>> +              - ti,am62-gpu
>>> +          - const: img,img-axe
>>> +        deprecated: true
>>>  
>>>    reg:
>>>      maxItems: 1
>>> @@ -34,8 +44,13 @@ properties:
>>>    interrupts:
>>>      maxItems: 1
>>>  
>>> -  power-domains:
>>> -    maxItems: 1
>>> +  power-domains: true
>>
>> No, widest constraints always stay here.
> 
> Ack
> 
>>
>>> +
>>> +  power-domain-names:
>>> +    items:
>>> +      - const: a
>>
>> That's not a useful name. Are you sure that datasheet calls it power
>> domain A?
> 
> Sadly yes. With the Volcanic architecture the power domains get real
> names, but until then we were stuck with abc. I shared a snipet from the
> BXS-4-64 TRM with Conor in the replies to the V1 series in [1].

OK, that's fine.


Best regards,
Krzysztof

