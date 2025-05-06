Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E94BBC3ABBF
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 12:26:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RLTFOPBJa/eAcRAwfvM0ORsp8r9sVjS5mMPyhlYqkFA=; b=DwzrfMSDuySIoZgXI0IKYWYZlT
	2xpOK1Liln+vzGZB+9ZfUj3EIyi2LzvWUAQVsM5xlnb+fV32dD4WMn3IH47HBNy6gVGF5yLYyaYEX
	j7P6DTAkJ9Qp1ALUD1pmG2Weet95enzwlJqVTdbwqGAafAVLVMvJ7iBTjFaL3KT7xlPfXXkFOad2p
	aTMbxsuJJswUBsF0SP1MvqgywzQBvsp1e1tcupFqkaFi5Ey8S/LllT1o+St8kEQkXT4mdfdx+iePp
	rKR0QURmY4EPUBKALtTpduwDRroJrwiivHVwX0geEawGSnEyrfHpSPPnPn1R3sNlxf8rVZeKdWOIk
	JHZuZ3eA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCHNU-0000000Btz8-1tTZ;
	Tue, 06 May 2025 12:26:28 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCFPu-0000000BY7G-0dah;
	Tue, 06 May 2025 10:20:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1746526848;
	bh=cTlctsLV2/rm79eOqeotyVv+FV9QLw5D/EGMnFgswkQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Oic6ZbqMxNknj0hcfe+ZvNlfYvKMruLwQGy/idLjU5+wHNR2dqVkJ+YfCmH1IK6WP
	 bkuqQJLdrFtkcvwYnNM/MJ+GEBjIlpCFFalEaVWlq/x9f/EQNdTH8gJwtZOeWdCGHk
	 iAL7PuEQ2kl1x6OLuV3IQVGDmRzUFEZ8K7kJSQU4wI7tOUGhNmpkxFWwV3WRIfCU4i
	 YQDbrbhm99KAbgZQQLZ2RoZsRevMRvMiMUmC26hB0OsJMyPxrzbgKMcAi6b5B/s1b/
	 S16uKYZkLIj1dZGqinA4nvSK2rOyrdiBGUiUryzeZtmOxpMPkOJ5obOpVtCVdkrer2
	 PjxX9fcWQ7OrA==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 62EEB17E088B;
	Tue,  6 May 2025 12:20:47 +0200 (CEST)
Message-ID: <c8bb938d-5a43-47a2-b7de-695f95b077ad@collabora.com>
Date: Tue, 6 May 2025 12:20:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] dt-bindings: iommu: mediatek: mt8195 Accept up to 5
 interrupts
To: Julien Massot <julien.massot@collabora.com>, kernel@collabora.com,
 Sen Chu <sen.chu@mediatek.com>, Sean Wang <sean.wang@mediatek.com>,
 Macpaul Lin <macpaul.lin@mediatek.com>, Lee Jones <lee@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?=
 <nfraprado@collabora.com>, Hui Liu <hui.liu@mediatek.com>,
 Yong Wu <yong.wu@mediatek.com>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Tinghan Shen <tinghan.shen@mediatek.com>
Cc: linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, iommu@lists.linux.dev
References: <20250505-mt8395-dtb-errors-v1-0-9c4714dcdcdb@collabora.com>
 <20250505-mt8395-dtb-errors-v1-2-9c4714dcdcdb@collabora.com>
 <cb715936-3a44-4002-8d64-565f8d31820c@collabora.com>
 <2d3a8e55105526c999b490a2e92dd448c099faab.camel@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <2d3a8e55105526c999b490a2e92dd448c099faab.camel@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_032050_344443_0DCAA2CC 
X-CRM114-Status: GOOD (  12.86  )
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

Il 06/05/25 12:03, Julien Massot ha scritto:
> Hi Angelo,
> 
> On Tue, 2025-05-06 at 10:34 +0200, AngeloGioacchino Del Regno wrote:
>> Il 05/05/25 15:23, Julien Massot ha scritto:
>>> Some Mediatek IOMMU can have up to five interrupts so increase
>>> the 'maxItems' to 5.
>>>
>>> Fix the following dtb-check error:
>>>
>>> mediatek/mt8395-radxa-nio-12l.dtb: infra-iommu@10315000: interrupts:
>>> [[0, 795, 4, 0], [0, 796, 4, 0], [0, 797, 4, 0], [0, 798, 4, 0], [0, 799, 4, 0]] is too long
>>>
>>> Fixes: 3b5838d1d82e3 ("arm64: dts: mt8195: Add iommu and smi nodes")
>>> Signed-off-by: Julien Massot <julien.massot@collabora.com>
>>> ---
>>>    Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml | 3 ++-
>>>    1 file changed, 2 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml
>>> b/Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml
>>> index 75750c64157c868725c087500ac81be4e282c829..035941c2db32170e9a69a5363d8c05ef767bb251 100644
>>> --- a/Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml
>>> +++ b/Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml
>>> @@ -97,7 +97,8 @@ properties:
>>>        maxItems: 1
>>>    
>>>      interrupts:
>>> -    maxItems: 1
>>> +    minItems: 1
>>
>> Isn't minItems already implicitly 1? :-)
>>
>> Looks not, from my understanding if 'minItems' is omitted then
> dt-schema is setting it to 'maxItems'.
> https://github.com/devicetree-org/dt-schema/blob/v2025.02/dtschema/fixups.py#L129
> 
> And you will have an error for a one item interrupts:
> Documentation/devicetree/bindings/iommu/mediatek,iommu.example.dtb: iommu@10205000: interrupts: [[0,
> 139, 8]] is too short
> 

Whoops, you're right.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



