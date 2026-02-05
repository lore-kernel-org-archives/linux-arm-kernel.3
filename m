Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60119ECD993
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Feb 2026 18:02:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IfdRQqulBEBH4+jaPnbnKKZjZeXKFgh1yBOcS9QKohM=; b=kZrtNiPLknGpyrhMrZl2Jbzz9B
	eqg1YRgkHRXDkm8RYNbchV7hcGeC/d/9K7bUDX1QT+oGyeCThG21/hOm//i/jabTRDP1RuBVL8aKr
	LhbaRGWsHcID2yAZy7bxqorAJk7D8bSt7IzqFAMgkLgL6cjv99lQAA1HnVTS1NEAUZtZCPLOOTobF
	pjuDNWxUzl4WyCuPH9osDK0nDsFIJ68Okab90cfhvxFIr1ssrDGyzEWu27ExrZCdvZDGEJdc8sHpg
	dgKMbYTS1H5W1oq/KJPkuAFoD6BiX9YZzTtzw+FDH/3O+fLpFGCv2UFZ+nsa7cSkO7mUe75wywC53
	yrn5p2qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vo3gC-0000000AKyT-2nSe;
	Thu, 05 Feb 2026 18:02:19 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vo3g1-0000000AKxp-2EVu
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Feb 2026 18:02:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id EE6AB43CA6;
	Thu,  5 Feb 2026 18:01:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7733AC116D0;
	Thu,  5 Feb 2026 18:01:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770314515;
	bh=Jfw7DB/NVA9J+9D9HNJnpKypCog0AebKB2y5FR+C5Go=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=LPLjrAke8ush1zNg4q3/Ec1O4OAmeODrMUvL3D2HNorgziz1PEO1r7W7IH9abYzv1
	 Wom2spzpKHHQQq+QHkNraJ3QymAPTUI5TmNYJWi3AAAyjYcD40ASAUDdmZ+PN/yosc
	 Z8+N+Ug1K/IoEbsnBI8l7kIEC92sla5iHxM3W+KbdiQid4lsm7LnsVEXA+LPynyAy7
	 IjMdWlY5bhewwXkdnMswdLBM3xs3tgQStBJr9i18hnFRcD2JCxfabcwgELMs6SYe0Z
	 Rp1fGRn4cYGIsWDuhU5kyszWQ8ojr1yKxX7YalIiG0vHlKztpQM80oGyiESvdEjiuK
	 9ZwUvuYopI8PQ==
Message-ID: <8f506b2b-1309-4f9e-b8e6-4a73064ea2d0@kernel.org>
Date: Thu, 5 Feb 2026 19:01:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dt-bindings: interrupt-controller: apple,aic2: Add
 AICv3
To: Krzysztof Kozlowski <krzk@kernel.org>, Janne Grunau <j@jannau.net>
Cc: Neal Gompa <neal@gompa.dev>, Thomas Gleixner <tglx@linutronix.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, asahi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20260128-irq-apple-aic3-v2-0-b4bc8e16c997@jannau.net>
 <20260128-irq-apple-aic3-v2-1-b4bc8e16c997@jannau.net>
 <20260205-pastoral-magnificent-cuscus-ce58ad@quoll>
Content-Language: en-US
From: Sven Peter <sven@kernel.org>
In-Reply-To: <20260205-pastoral-magnificent-cuscus-ce58ad@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260205_100202_858559_CA115D37 
X-CRM114-Status: GOOD (  22.98  )
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

Hi,

On 05.02.26 13:50, Krzysztof Kozlowski wrote:
> On Wed, Jan 28, 2026 at 09:57:08AM +0100, Janne Grunau wrote:
>> AIC version 3 as found on the Apple M3 (t8122) is very similar to AICv2
>> in its base functionality. It can use the same device tree bindings as
>> AICv2 so add it to the AICv2 bindings.
>> This interrupt controller is used on all Apple SoCs starting with M3 up
>> to at least M5.
>> The only apparent difference is the increased IRQ config offset. Apple's
>> device tree codes this new offset as property of the "aic" node but the
>> value stayed constant for all SoCs with "aic,3". Since the SoC specific
>> compatible "apple,t8122-aic3" will be used in the driver this offset can
>> remain a driver implementation detail.
>>
>> Signed-off-by: Janne Grunau <j@jannau.net>
>> ---
>>   .../bindings/interrupt-controller/apple,aic2.yaml  | 45 +++++++++++++++++-----
>>   1 file changed, 36 insertions(+), 9 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/interrupt-controller/apple,aic2.yaml b/Documentation/devicetree/bindings/interrupt-controller/apple,aic2.yaml
>> index ee5a0dfff437816056bda0de5523bf38be4f49ba..a6e2251fcc111340c0a27ab6912452f6b1255be2 100644
>> --- a/Documentation/devicetree/bindings/interrupt-controller/apple,aic2.yaml
>> +++ b/Documentation/devicetree/bindings/interrupt-controller/apple,aic2.yaml
>> @@ -4,10 +4,10 @@
>>   $id: http://devicetree.org/schemas/interrupt-controller/apple,aic2.yaml#
>>   $schema: http://devicetree.org/meta-schemas/core.yaml#
>>   
>> -title: Apple Interrupt Controller 2
>> +title: Apple Interrupt Controller 2 and 3
>>   
>>   maintainers:
>> -  - Hector Martin <marcan@marcan.st>
>> +  - Janne Grunau <j@jannau.net>
>>   
>>   description: |
>>     The Apple Interrupt Controller 2 is a simple interrupt controller present on
>> @@ -28,14 +28,24 @@ description: |
>>     which do not go through a discrete interrupt controller. It also handles
>>     FIQ-based Fast IPIs.
>>   
>> +  The Apple Interrupt Controller 3 is in its base functionality very similar to
>> +  the Apple Interrupt Controller 2 and uses the same device tree bindings. It is
>> +  found on Apple ARM SoCs platforms starting with t8122 (M3).
>> +
>>   properties:
>>     compatible:
>> -    items:
>> -      - enum:
>> -          - apple,t8112-aic
>> -          - apple,t6000-aic
>> -          - apple,t6020-aic
>> -      - const: apple,aic2
>> +    oneOf:
>> +      - items:
>> +          - enum:
>> +              - apple,t8112-aic
>> +              - apple,t6000-aic
>> +              - apple,t6020-aic
> 
> If you are re-shuffling these, you can as well sort alphanumerically.

I don't have a strong opinion here but the last time this came up we 
agreed that we'd go with release order IIRC for consistency since that 
order is used in every other binding for this platform.

> 
>> +          - const: apple,aic2
>> +      - items:
>> +          - enum:
>> +              - apple,t6030-aic3
>> +          - const: apple,t8122-aic3
>> +      - const: apple,t8122-aic3
> 
> Hm? How so this is not aic or aic2? We asked not to use generic compatibles
> for aic/aic2 - for all your early upstreamings. Our advice and request
> was in general rejected, although I could make a long term bet that we
> will be right. And here we are.
> 
> Does this patch mean you finally agree with DT maintainers and abandon
> the generic compatible fiasko?

Yeah, see 
https://lore.kernel.org/asahi/12ab93b7-1fc2-4ce0-926e-c8141cfe81bf@kernel.org/


Best,

Sven


