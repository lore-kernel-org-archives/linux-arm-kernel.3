Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FCE0EE20AB
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Feb 2026 14:44:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9o0rXBIMjuYc58NNeOxf/SRyJbI7MGZMyxyP2GQWsk4=; b=LxWJ+wQXL23ki9rPa7vBvOPGPN
	b9Xn7QCXNgQkf4rU22TcqVCpXEOfGOBB/3uoQyeSR8WbrXVKQzZKxkrL7pZPTx5O6fY//8tGh4tPl
	XB24kraXY9WixK2dyS76baM9jcIK8pP/Dgd87GNOYqfCW+rLnNK7PO3KGzBhooDxZuw8HgRiyhhL0
	ZEradtpeZJ7w7+euetL/0iZAXhaoHCTDTwCXaBiBWas2ZK6AMqvKsujyvGNHRr9kYDA0nPcZ0mhi0
	xGQF47lwDZx1OwVqYwkysYyxo4qikugc3dC2zkSmbrDDECAOxnLGsLVc+vX84KNer5aeDsOLFzy77
	jNQIkh+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voN4X-0000000BSHk-1a0v;
	Fri, 06 Feb 2026 14:44:37 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voN4W-0000000BSHa-0Vmh
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Feb 2026 14:44:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 057F560051;
	Fri,  6 Feb 2026 14:44:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E1BAC116C6;
	Fri,  6 Feb 2026 14:44:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770389074;
	bh=WqpH7NpECmNqf7k95aSVChL/z7Nah2bI6O93+EyEo9Q=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ItY2jYQbzKhJiyfaUgZikEhxeI200qgma2/oQRBED77Nvb/Kwxg743/k0e1o3vpcU
	 Ikh/o8uHonnwZ0wrJGjElk9/PWZlh3yc1YyIvOzD89H9caq2JDJpL8AeDv6LoQAYnZ
	 H7+LtYuc28+rv+C3AoN+dshLZYL8CI1RpcognkYFmyx4ElSZBHMVvjaGsTvYOxIjGY
	 O9Q/agczwnnUeP6i+Cv7nP9Wci1vJPdmsWFn17o6zGvBmmegESyrQlGVkYzsZSbKxy
	 vGDYAuR6Qls8kKQFBp1Vjx8wY8EjsQ7x1obsWxkSt5gchtXRij0n/f87c4c6tFez0C
	 GLoaC1Q+eSnfw==
Message-ID: <0cc9bd0a-958b-4e63-b2ed-959a3ea43440@kernel.org>
Date: Fri, 6 Feb 2026 15:44:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dt-bindings: interrupt-controller: apple,aic2: Add
 AICv3
To: Janne Grunau <j@jannau.net>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Neal Gompa <neal@gompa.dev>,
 Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, asahi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20260128-irq-apple-aic3-v2-0-b4bc8e16c997@jannau.net>
 <20260128-irq-apple-aic3-v2-1-b4bc8e16c997@jannau.net>
 <20260205-pastoral-magnificent-cuscus-ce58ad@quoll>
 <8f506b2b-1309-4f9e-b8e6-4a73064ea2d0@kernel.org>
 <20260205221918.GA71415@robin.jannau.net>
Content-Language: en-US
From: Sven Peter <sven@kernel.org>
In-Reply-To: <20260205221918.GA71415@robin.jannau.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

On 05.02.26 23:19, Janne Grunau wrote:
> On Thu, Feb 05, 2026 at 07:01:51PM +0100, Sven Peter wrote:
>> Hi,
>>
>> On 05.02.26 13:50, Krzysztof Kozlowski wrote:
>>> On Wed, Jan 28, 2026 at 09:57:08AM +0100, Janne Grunau wrote:
>>>> AIC version 3 as found on the Apple M3 (t8122) is very similar to AICv2
>>>> in its base functionality. It can use the same device tree bindings as
>>>> AICv2 so add it to the AICv2 bindings.
>>>> This interrupt controller is used on all Apple SoCs starting with M3 up
>>>> to at least M5.
>>>> The only apparent difference is the increased IRQ config offset. Apple's
>>>> device tree codes this new offset as property of the "aic" node but the
>>>> value stayed constant for all SoCs with "aic,3". Since the SoC specific
>>>> compatible "apple,t8122-aic3" will be used in the driver this offset can
>>>> remain a driver implementation detail.
>>>>
>>>> Signed-off-by: Janne Grunau <j@jannau.net>
>>>> ---
>>>>    .../bindings/interrupt-controller/apple,aic2.yaml  | 45 +++++++++++++++++-----
>>>>    1 file changed, 36 insertions(+), 9 deletions(-)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/interrupt-controller/apple,aic2.yaml b/Documentation/devicetree/bindings/interrupt-controller/apple,aic2.yaml
>>>> index ee5a0dfff437816056bda0de5523bf38be4f49ba..a6e2251fcc111340c0a27ab6912452f6b1255be2 100644
>>>> --- a/Documentation/devicetree/bindings/interrupt-controller/apple,aic2.yaml
>>>> +++ b/Documentation/devicetree/bindings/interrupt-controller/apple,aic2.yaml
>>>> @@ -4,10 +4,10 @@
>>>>    $id: http://devicetree.org/schemas/interrupt-controller/apple,aic2.yaml#
>>>>    $schema: http://devicetree.org/meta-schemas/core.yaml#
>>>>    
>>>> -title: Apple Interrupt Controller 2
>>>> +title: Apple Interrupt Controller 2 and 3
>>>>    
>>>>    maintainers:
>>>> -  - Hector Martin <marcan@marcan.st>
>>>> +  - Janne Grunau <j@jannau.net>
>>>>    
>>>>    description: |
>>>>      The Apple Interrupt Controller 2 is a simple interrupt controller present on
>>>> @@ -28,14 +28,24 @@ description: |
>>>>      which do not go through a discrete interrupt controller. It also handles
>>>>      FIQ-based Fast IPIs.
>>>>    
>>>> +  The Apple Interrupt Controller 3 is in its base functionality very similar to
>>>> +  the Apple Interrupt Controller 2 and uses the same device tree bindings. It is
>>>> +  found on Apple ARM SoCs platforms starting with t8122 (M3).
>>>> +
>>>>    properties:
>>>>      compatible:
>>>> -    items:
>>>> -      - enum:
>>>> -          - apple,t8112-aic
>>>> -          - apple,t6000-aic
>>>> -          - apple,t6020-aic
>>>> -      - const: apple,aic2
>>>> +    oneOf:
>>>> +      - items:
>>>> +          - enum:
>>>> +              - apple,t8112-aic
>>>> +              - apple,t6000-aic
>>>> +              - apple,t6020-aic
>>>
>>> If you are re-shuffling these, you can as well sort alphanumerically.
>>
>> I don't have a strong opinion here but the last time this came up we
>> agreed that we'd go with release order IIRC for consistency since that
>> order is used in every other binding for this platform.
> 
> The intended scheme as documented in some commit messages is first base
> Mx SoCs in release order and then Mx Pro/Max/Ultra SoCs in release
> order. This scheme isn't used consistently though. I think I fixed that
> in one or two bindings already but there are other using a different
> order.
> I think these unecessarily complex rules are guaranteed to lead to
> inconsistencies. I'll resort the entries alphabetically as that's the
> only rule with a chance of consistent use.

Sure, I'm totally fine with just using alphanumeric order everywhere as 
well.


Sven


