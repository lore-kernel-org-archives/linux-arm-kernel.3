Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C85FDD116F1
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Dec 2025 08:54:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QPt7Lzjv5NOO9AmXGaEbndBUfDWG3N+K6MGje1fGLfs=; b=4p5EKoEsl3lrPGUm/XAUqJh1EP
	GtPic4xibuHoze1DXo3niGYBghGJV3jaOTf44ADl2cj3NPTaP7GUf1272QoLbZjMF8hmTUXH20ifz
	Dixk5RJrKZJR4oRCoJcWyzwbX8v861NuOyEIb2ATbybYkKDo5p/loaxEO43LsZDdwe93OYvBCa2R/
	W6urW4cTTQrxaC3gVyZ9+0oweP59+Z+iMb44yctGmdSh16TbcvuzbMeoZdYFLg68JcPX+ProlT93e
	ayT/EVQNE/aMT+nur9b70kqacpb+Iisg1UHunLCzztzKp7TtzqD7n1C3sQCWN1Yvt2zcQLBpraDxh
	egId8J4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vPzfy-00000003ARy-2zV2;
	Mon, 01 Dec 2025 08:54:30 +0000
Received: from mail-m3284.qiye.163.com ([220.197.32.84])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vPzfu-00000003ARA-4BHQ;
	Mon, 01 Dec 2025 08:54:28 +0000
Received: from [172.16.12.51] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 2b8268f6e;
	Mon, 1 Dec 2025 16:54:21 +0800 (GMT+08:00)
Message-ID: <8ac259e2-c075-4a29-827e-315ad84c6363@rock-chips.com>
Date: Mon, 1 Dec 2025 16:54:20 +0800
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
 <98a847f7-0880-4e5b-a946-26dc81fde5d2@rock-chips.com>
 <491560f1-ee50-43ef-b258-adb5859cb05a@kernel.org>
Content-Language: en-US
From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
In-Reply-To: <491560f1-ee50-43ef-b258-adb5859cb05a@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-HM-Tid: 0a9ad91ebc9f03abkunm0983dea69e84a6
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQx5NTFZJHU9PGU8dSEtJGEtWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=M9saWfPcwmCgvCUeKRaAFxKgt02jlM09r19UmbH+tO5Vh9xp+DZUinmwH87OwuvOv7ArvxSu26Q2PGUWibZoa2eqv1u+tJBntgnKHci8pj9M0HzAWvuG/G1NEwv+jnOMDlsOBdlu+dm3tqXnPqdyfBzNR+nbXinw18D0jtUQZHU=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=QPt7Lzjv5NOO9AmXGaEbndBUfDWG3N+K6MGje1fGLfs=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251201_005427_561749_29E17ADC 
X-CRM114-Status: GOOD (  13.69  )
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

On 12/1/2025 4:39 PM, Krzysztof Kozlowski wrote:
> On 01/12/2025 09:10, Chaoyi Chen wrote:
>>>> +  - if:
>>>> +      properties:
>>>> +        compatible:
>>>> +          items:
>>>> +            - const: rockchip,iommu
>>>> +            - const: rockchip,rk3568-iommu
>>>> +    then:
>>>> +      properties:
>>>> +        clocks:
>>>> +          maxItems: 2
>>>
>>> Why this is unspecific now? Please look at other examples how it is
>>> done, e.g. Samsung clocks.
>>
>> I looked at some examples. Maybe it need to set both minItems and 
>> maxItems here? I'm not sure I understood your point.
> 
> Individual items were described before. Now they are not, so first item
> can be anything.
> 
> You need to define the list. If the devices have completely different
> clocks, then you would go with Samsung approach. But devices should not
> have completely different clocks, so you should define common parts in
> top-level and just narrow number of items here. maxItems is enough in
> such case.

Ah, it looks like Samsung's clock bindings rarely have common parts.
At present, there are indeed some common parts for the IOMMU clock,
but I'm not sure how other variants will change. 

I'll give this a try, thank you!

-- 
Best, 
Chaoyi

