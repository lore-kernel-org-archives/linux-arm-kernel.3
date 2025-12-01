Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F00DD111A8
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Dec 2025 08:10:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WpCNmZU9OuV8CRk1ASUXdYD2SrFmtUWcB4i78gH8CCA=; b=U05juaZOx9pB1RVUUGCzAOftby
	rhESWASvM8h4nVT8UVEJ2YGfbwAt/8ksRJqYi4RbejpQeDRrn4io0ffwmXMCa2x4N4Cb1I4nUMuXg
	i7zsL5YXS/O0ky0YyfAtn00RfTJDxWRoDclHGeZJAewhnEz5+WBfOiYkp30bH/j3AOjGtWMpK7K6S
	NHLo8ugQz4nOTld0/7bRgrKpR05KpDGjnO65Jb49TrcRJ6q/eSHwV5wFKZZ/mk2a9L78keYzwu5+c
	5N3orIqhTF4sL0ppB7/mtcIEwO5ByloC0RFJ/sz9RbXUyyWoC24jL4z+pbCaj6gLj0ot/nOJ35kPl
	KbZRW5tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vPyzZ-000000036CC-0gbW;
	Mon, 01 Dec 2025 08:10:41 +0000
Received: from mail-m3292.qiye.163.com ([220.197.32.92])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vPyzV-000000036BA-1sfo;
	Mon, 01 Dec 2025 08:10:39 +0000
Received: from [172.16.12.51] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 2b80636d7;
	Mon, 1 Dec 2025 16:10:30 +0800 (GMT+08:00)
Message-ID: <98a847f7-0880-4e5b-a946-26dc81fde5d2@rock-chips.com>
Date: Mon, 1 Dec 2025 16:10:29 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dt-bindings: iommu: rockchip: Add support for
 multiple interface clocks
To: Krzysztof Kozlowski <krzk@kernel.org>, Chaoyi Chen <kernel@airkyi.com>,
 Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: iommu@lists.linux.dev, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20251128071322.92-1-kernel@airkyi.com>
 <20251128071322.92-2-kernel@airkyi.com>
 <96958186-0e46-4606-ae36-239112eb31ea@kernel.org>
Content-Language: en-US
From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
In-Reply-To: <96958186-0e46-4606-ae36-239112eb31ea@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-HM-Tid: 0a9ad8f6968503abkunm093ab6149dd25d
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQx9IGVZCS0pIHU5JGk8ZS0tWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=SgFW8inrluQrSm0Ix/lMa3syFKAMWrjToL5LGiveUNyz6OAnclQEh7uHh5n2TBkLwfl6w2aKhOkcyOkt2rofXiBBuUe760zci1nT9J9hEFtRXTV3UULX9IixlXz8JhAmljyH+WOpYwpuZ7T2GyhEazAmJsS8irdhBBaueMD+BqE=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=WpCNmZU9OuV8CRk1ASUXdYD2SrFmtUWcB4i78gH8CCA=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251201_001037_986150_652B1DFA 
X-CRM114-Status: GOOD (  17.04  )
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

Hi Krzysztof,

On 12/1/2025 3:55 PM, Krzysztof Kozlowski wrote:
> On 28/11/2025 08:13, Chaoyi Chen wrote:
>> From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
>>
>> The iommu found on RK3576 NPU and RK3576 RKVDEC have 4 clock instead of
>> 2 clock. Their clock names might differ, but I don't think that matters
>> much.
>>
>> Add support for them.
>>
>> Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
>> ---
>>
>> Changes in v2:
>> - Rewrite dt binding.
>>
>>  .../bindings/iommu/rockchip,iommu.yaml        | 52 ++++++++++++++++---
>>  1 file changed, 46 insertions(+), 6 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/iommu/rockchip,iommu.yaml b/Documentation/devicetree/bindings/iommu/rockchip,iommu.yaml
>> index 6ce41d11ff5e..dfa5e25476d9 100644
>> --- a/Documentation/devicetree/bindings/iommu/rockchip,iommu.yaml
>> +++ b/Documentation/devicetree/bindings/iommu/rockchip,iommu.yaml
>> @@ -27,6 +27,8 @@ properties:
>>            - enum:
>>                - rockchip,rk3576-iommu
>>                - rockchip,rk3588-iommu
>> +              - rockchip,rk3576-npu-iommu
>> +              - rockchip,rk3576-rkvdec-iommu
>>            - const: rockchip,rk3568-iommu
>>  
>>    reg:
>> @@ -42,14 +44,12 @@ properties:
>>      minItems: 1
>>  
>>    clocks:
>> -    items:
>> -      - description: Core clock
>> -      - description: Interface clock
> 
> These go to specific variant if:then.
> 
>> +    minItems: 2
>> +    maxItems: 4
>>  
>>    clock-names:
>> -    items:
>> -      - const: aclk
>> -      - const: iface
>> +    minItems: 2
>> +    maxItems: 4
> 
> So you just allow any names, like pink-pony.
> 
> No, define common list here. Actually same for clocks.

Will fix in v3.

> 
>>  
>>    "#iommu-cells":
>>      const: 0
>> @@ -64,6 +64,46 @@ properties:
>>        Some mmu instances may produce unexpected results
>>        when the reset operation is used.
>>  
>> +allOf:
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            enum:
>> +              - rockchip,rk3576-npu-iommu
>> +              - rockchip,rk3576-rkvdec-iommu
>> +    then:
>> +      properties:
>> +        clocks:
>> +          minItems: 4
>> +        clock-names:
>> +          minItems: 4
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          items:
>> +            - const: rockchip,iommu
>> +            - const: rockchip,rk3568-iommu
>> +    then:
>> +      properties:
>> +        clocks:
>> +          maxItems: 2
> 
> Why this is unspecific now? Please look at other examples how it is
> done, e.g. Samsung clocks.

I looked at some examples. Maybe it need to set both minItems and 
maxItems here? I'm not sure I understood your point.

> 
> 
> Best regards,
> Krzysztof
> 
> 

-- 
Best, 
Chaoyi

