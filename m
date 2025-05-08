Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8766C3ABC5
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 May 2025 08:50:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I/6u434npu/OIMFCdOe8U+YX27jiuYdnGSjpPzb6uqs=; b=zxnrYGZJdWHjQiUEb7kiUtzFbh
	EWFjnZmiT2KiPSZt4bV8mNgeHmgyWkU93XgW1w44vSu18o2ooWHjnEkqp/f0Hpx/PNimrozBUUg9X
	yYCLVpG+lUvPV+npJ2Aw3o0rmt39MBNYBNQhn9jsWryzHIg/fRbIPFJPCqhgxKzdRDUx1QLdA7aNz
	oGHhXYFMM/eEAgQgZYzKX2o/lojdhxbttAIzFDbEecbjQzisYOvjVPZMVpU1YoSvMJHGuGKBrnfnY
	yKG7BPImdTl92GtE+JzNIV/0GCOvHycKW0MhAsxuh6k4xDyp9dTBJZF+rs9P3btNyoZ4/rk9tVthr
	Jtz5fgww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCwwv-00000000ATW-2wuG;
	Thu, 08 May 2025 08:49:49 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCwiP-000000008BG-1E9R;
	Thu, 08 May 2025 08:34:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1746693287;
	bh=/yn0vOBSqs1gT1qgFskCzgf8UxOw44a5QvWI6DwYPmM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=lvHX6Jfr7OJ3b9RU2pr9vKKmVzcczO72O3biC5VnlBbkLBYBi4j80YJi2EahlHN1c
	 6I9FwWK2rI9vTlfgY0vX59fGYaiqUGpGcxReA8po/KwPkXIJBEPYgbVoK27U8P4nkQ
	 X4QD/QaGCH6DAVicsxmX8fpMRCdFt6D/fag3nmUd43PN/6uB7xi1I6h2Cgt/WTqLpq
	 SZEaWRHihGqfwPDfI/lIhJzyu9FoTR2A8LrpgfmZCRkdBpb7sSHMCQ9F4OpeDxNYKz
	 VId7swgQvxQGPbEbgdeQEvtYfy088uRJpCZWNsQMmZX2KRcEXgt4abxmz6xz2/sV+O
	 wA2RMcDIF2HaA==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 62D3417E02BE;
	Thu,  8 May 2025 10:34:46 +0200 (CEST)
Message-ID: <ff8da58b-9e87-46d9-b4d2-4059ef05780d@collabora.com>
Date: Thu, 8 May 2025 10:34:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] dt-bindings: iommu: mediatek: mt8195 Accept up to 5
 interrupts
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Julien Massot <julien.massot@collabora.com>, kernel@collabora.com,
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
 <baeae909-4d12-4cbd-a063-7ad165304b96@kernel.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <baeae909-4d12-4cbd-a063-7ad165304b96@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250508_013449_481393_21DFA73B 
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

Il 08/05/25 08:03, Krzysztof Kozlowski ha scritto:
> On 05/05/2025 15:23, Julien Massot wrote:
>>
>> Fixes: 3b5838d1d82e3 ("arm64: dts: mt8195: Add iommu and smi nodes")
>> Signed-off-by: Julien Massot <julien.massot@collabora.com>
>> ---
>>   Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml | 3 ++-
>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml b/Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml
>> index 75750c64157c868725c087500ac81be4e282c829..035941c2db32170e9a69a5363d8c05ef767bb251 100644
>> --- a/Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml
>> +++ b/Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml
>> @@ -97,7 +97,8 @@ properties:
>>       maxItems: 1
>>   
>>     interrupts:
>> -    maxItems: 1
>> +    minItems: 1
>> +    maxItems: 5
>>   
> Every iommu or just some (as described in commit msg) can have 5
> interrupts? Looks you miss here proper constraints per variant.
> 
Technically, all of the IOMMUs can have more than one interrupt - but it's not
clear which one and why, as documentation is lacking.

Let's restrict this discussion to MT8195 anyway, as it's the only one declaring
those 5 interrupts...
...all of the IOMMUs declare just one, and mediatek,mt8195-iommu-infra declares 5.

P.S.: Nice catch!

Cheers,
Angelo

