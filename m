Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B6BDCA0FF0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 Aug 2025 14:24:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WkREyAIbjHi66nrdKvSxkiOGdtSQSu4pVCyFRbMKlBU=; b=ZDW3XpGGkx91rFPkTGBOzMr32l
	Q0W5b0UsBt5hkmUZEsq1KhLSAEkpCqo8trmB93aW7EP96o71Co5WPSrRRIFyoOBNQjZCLRxQzFmC8
	y9asiR/BGlxTJOn8DX1dTAi2B/bIE2hbipo08tP96LuczbgFdzPQPjPLka64BM68T83JfiwuMBHvB
	xkIWuTPQNZ8o0SZevcNovKRnENb1vlTno6E2fHmNndyIdyYODmlvaQ0WL2sqMs52oInUmHTr/S8D9
	hAqFjM9Iv0WGcUf9Q2PnlkLO2uQ/pTvRIT169o+AI82DWEZCsqakgbbLT48V6Cv6xIZa2MBYOWi3k
	TqO+UsxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1us01i-000000060ZZ-37sX;
	Fri, 29 Aug 2025 14:24:26 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urx69-00000005SV5-0Wvo
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 Aug 2025 11:16:50 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5990519F0;
	Fri, 29 Aug 2025 04:16:39 -0700 (PDT)
Received: from [10.57.2.173] (unknown [10.57.2.173])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0AE383F738;
	Fri, 29 Aug 2025 04:16:45 -0700 (PDT)
Message-ID: <c178a775-5953-4b20-b37d-87a8559c8062@arm.com>
Date: Fri, 29 Aug 2025 12:16:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 13/14] dt-bindings: dma: dma350: Support ARM DMA-250
To: Krzysztof Kozlowski <krzk@kernel.org>, Jisheng Zhang
 <jszhang@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: dmaengine@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250823154009.25992-1-jszhang@kernel.org>
 <20250823154009.25992-14-jszhang@kernel.org>
 <0aea52e1-4bfa-43ca-a527-f3ae198118dc@kernel.org>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <0aea52e1-4bfa-43ca-a527-f3ae198118dc@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250829_041649_218014_F2090901 
X-CRM114-Status: GOOD (  11.36  )
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

On 2025-08-23 5:11 pm, Krzysztof Kozlowski wrote:
> On 23/08/2025 17:40, Jisheng Zhang wrote:
>> Compared with ARM DMA-350, DMA-250 is a simplified version, they share
>> many common parts, but they do have difference. The difference will be
>> handled in next driver patch, while let's add DMA-250 compatible string
>> to dt-binding now.
>>
>> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
>> ---
>>   Documentation/devicetree/bindings/dma/arm,dma-350.yaml | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/Documentation/devicetree/bindings/dma/arm,dma-350.yaml b/Documentation/devicetree/bindings/dma/arm,dma-350.yaml
>> index 94752516e51a..d49736b7de5e 100644
>> --- a/Documentation/devicetree/bindings/dma/arm,dma-350.yaml
>> +++ b/Documentation/devicetree/bindings/dma/arm,dma-350.yaml
>> @@ -15,6 +15,7 @@ allOf:
>>   properties:
>>     compatible:
>>       const: arm,dma-350
>> +    const: arm,dma-250
> 
> This obviously cannot work and was NEVER tested. Please test your code
> before you send it to mailing lists.

Also, DMA-250 should be 100% "compatible" with DMA-350 in the DT sense, 
since it shares the same register layout and general functionality, and 
the detailed features and even exact model are discoverable from ID 
registers (hence why the current driver explicitly checks for 
PRODUCTID_DMA350 as that's the only one it knows it definitely understands).

Thanks,
Robin.

