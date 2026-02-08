Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D849FEF06E2
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  8 Feb 2026 10:37:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JkPin0ayRbWV2bcMnyTq8ACbHp5CZQECHoTkeUwS6Lc=; b=afHgqm3JqsSQab6mmeftu4L8nR
	tfwiaGzTVBEq6Zm+AcYvcJExmTeoEE4LdsGmn4JRkaFWRCYsowcOGmwgdNInCmaBD1z8vhAHyiRDR
	AEQu14ZX6Xqw7I7vU5p5WoUroi64N+4IK8F94f9XTYDCTEYdvc3vFVZ6Ac2EuKnRIsNDCcnBDEfiR
	5+hkX2q1Kt6kW0mzFNzPPTXIvy8dcdRes0kJNoSfqy2flMhLyi3Pks85EsnAl+3tK/SThblJ1OTIj
	FI+KOU+7U7VGS/Ef2HmZY3np44qn4lA8VBGO27c8wPLv/Fe8exykbxA8vrk855KoIJatTZxvYJ8uw
	I4QxQbrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vp29z-0000000DER0-3ktQ;
	Sun, 08 Feb 2026 10:36:59 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vp29x-0000000DEQs-3GXt
	for linux-arm-kernel@lists.infradead.org;
	Sun, 08 Feb 2026 10:36:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D91AC60054;
	Sun,  8 Feb 2026 10:36:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA43AC4CEF7;
	Sun,  8 Feb 2026 10:36:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770547016;
	bh=ZJcNQC83teh7+Vsu+y7dgbRiRrWJD7su7SWlEPJlW1M=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=XyOb958dXTZfuEfbYtFB67DGgAvKYnFxNTUpXJ5cXTe4FROOCAA10L/6g9QQCDPeS
	 UVgL5PPSTuQ1Sz+vJXaCAn0vZrISkIArThW+IsV+nTwWgDJVie63a6PSBw8x63QMZK
	 pEwxYJEcSN5tqIIM/XZZWKN2kcjasw9ZhMyGJyyTmW0pBMmBh6WxaVMKPLkm13Icgk
	 J9jCUEDAcV9z/rAmon3e1hQhJshqUUrTOr83uDlr0FPMppFo369wAljb9p+YvcfW4K
	 NT50YceUpUTAel0mHUJGS2T9XNytu8o379k7AnUPlIk/mGHVhhAMiqijOYKO05dwfi
	 FIbVo9IEltAkA==
Message-ID: <a3504101-e516-461b-8ad3-8075e0edd879@kernel.org>
Date: Sun, 8 Feb 2026 11:36:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: mailbox: xlnx,zynqmp-ipi-mailbox: Document
 msg region requirement
To: "T, Harini" <Harini.T@amd.com>
Cc: "jassisinghbrar@gmail.com" <jassisinghbrar@gmail.com>,
 "robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
 <krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "Simek, Michal" <michal.simek@amd.com>,
 "Datta, Shubhrajyoti" <shubhrajyoti.datta@amd.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "git (AMD-Xilinx)" <git@amd.com>
References: <20251222044653.1757886-1-harini.t@amd.com>
 <20251222-funny-aspiring-seal-05c4ae@quoll>
 <LV5PR12MB980465BAF86F179E5638016A92B5A@LV5PR12MB9804.namprd12.prod.outlook.com>
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
In-Reply-To: <LV5PR12MB980465BAF86F179E5638016A92B5A@LV5PR12MB9804.namprd12.prod.outlook.com>
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

On 23/12/2025 11:48, T, Harini wrote:
> [Public]

What? Fix your email client, so we wan't be dealing with your corporate
rules.

[Private]

or rather let's mess with corporate systems:

[Confidential]

> 
> Hi,
> 
>> -----Original Message-----
>> From: Krzysztof Kozlowski <krzk@kernel.org>
>> Sent: Monday, December 22, 2025 2:39 PM
>> To: T, Harini <Harini.T@amd.com>
>> Cc: jassisinghbrar@gmail.com; robh@kernel.org; krzk+dt@kernel.org;
>> conor+dt@kernel.org; Simek, Michal <michal.simek@amd.com>; Datta,
>> Shubhrajyoti <shubhrajyoti.datta@amd.com>; linux-kernel@vger.kernel.org;
>> devicetree@vger.kernel.org; linux-arm-kernel@lists.infradead.org; git (AMD-
>> Xilinx) <git@amd.com>
>> Subject: Re: [PATCH] dt-bindings: mailbox: xlnx,zynqmp-ipi-mailbox:
>> Document msg region requirement
>>
>> Caution: This message originated from an External Source. Use proper caution
>> when opening attachments, clicking links, or responding.
>>
>>
>> On Mon, Dec 22, 2025 at 10:16:53AM +0530, Harini T wrote:
>>> Add description clarifying that for Versal IPI mailboxes, both host
>>> and remote agents must have the "msg" register region defined for
>>> successful message passing. Without both, only notification-based
>>> communication works.
>>>
>>> Signed-off-by: Harini T <harini.t@amd.com>
>>> ---
>>>  .../bindings/mailbox/xlnx,zynqmp-ipi-mailbox.yaml           | 6 ++++++
>>>  1 file changed, 6 insertions(+)
>>>
>>> diff --git
>>> a/Documentation/devicetree/bindings/mailbox/xlnx,zynqmp-ipi-mailbox.ya
>>> ml
>>> b/Documentation/devicetree/bindings/mailbox/xlnx,zynqmp-ipi-mailbox.ya
>>> ml index 04d6473d666f..8fdf77c7935c 100644
>>> ---
>>> a/Documentation/devicetree/bindings/mailbox/xlnx,zynqmp-ipi-mailbox.ya
>>> ml
>>> +++ b/Documentation/devicetree/bindings/mailbox/xlnx,zynqmp-ipi-mailbo
>>> +++ x.yaml
>>> @@ -165,6 +165,12 @@ allOf:
>>>          reg-names: false
>>>
>>>      else:
>>> +      description:
>>
>> Else block cannot have description.
> 
> Can I remove the description from else block and move the clarifying text to the top-level description field?
> 
>>
>>> +        For Versal IPI mailboxes, the "msg" register region is optional.
>>
>> So it is optional...
> 
> The schema marks "msg" as optional to support both notification-only and message-passing use-cases. In hardware, some mailbox channels may be designed for notification only (no buffer), while others support full message passing (with buffer). The schema allows both, but for message passing, "msg" is required on both ends

This is not wrapped. Again, fix your email client.

> 
>>
>>> +        However, for successful message passing via mailbox, both the
>>> + host IPI
>>
>> And it is not optional. If nothing works, then it is not optional.
>>
>> And why would it be optional in the first place? You generate your same IP
>> with different settings?
> 
> There are 2 types of IPI channels (Buffered and Buffer-less)
> Some IPI channels are used only for notification (no message buffer, so "msg" is omitted).


Confusing description then.

> 


Best regards,
Krzysztof

