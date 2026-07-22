Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52564C44532
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 16:40:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6AsHAr9oPrWe3NWtzRC9dMApr39B7DUnNgZYW87mems=; b=rLD0Rc3FnS6P5jJ/iRuVOaamRM
	RYTGez0jT8E19T5Z6MiVOEy63fyB2r8ejJvExsi+M5m8SEy4lyN7CpyaxiovhmIheq2pQm8ujyUPZ
	9QWzNmIUHzwtVEQtGqqMT/lqQCHJoHlVykBySguVrNTv1DS34GXrHc7NdurH9o0iow94ReUvDAW8d
	SX1Y0q6yB0gjAxREnXmTur3yM0wn9fsjtCmVk9NPowVTw5Yptm7alGUfiQ5aTRQURJ6WEq4bV8Grv
	tzEY1RKct7N7ajOWDSDgNcy7Zoklgy+sIGL/1gNq0c61nQEC1uvokhaUNLvm9rLD21DLib+RgFicm
	fzmkFX9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmZzJ-0000000CN1B-3a7O;
	Wed, 22 Jul 2026 16:40:05 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmZzI-0000000CN10-3Jz6;
	Wed, 22 Jul 2026 16:40:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=6AsHAr9oPrWe3NWtzRC9dMApr39B7DUnNgZYW87mems=; b=Jc/iWb5HcJexu9hdspySO5b5c/
	xek98aawfV+cr2daiYEs71qoWESBVuWdRGlMkTReTUNzrh/lh39mYDroobMZRZqIbODkvte4iwGJO
	B57nwK+qZ1EV86Myye+U2l1lmpSbIJiQqAasNjVPKUcKKu/PouSoFruawjkPXZnkmebpng+AIT1I/
	6evafC+x1KWALko6dPHEQ6ZOIdCMBsSl0ZSB0FicjYwCGNU6EgDEb4uxg2XCBW861YMIf/jZnKSZm
	mzcuyYOmrSjpVkwTLTeaag0Ml1dvxqZ5pmHQisQGVBekHQ8lW+bGSawMhrdd4Q79JgErA0YHE404K
	dWkn7mew==;
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wmZzF-000000012DG-3AmB;
	Wed, 22 Jul 2026 16:40:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1784738396;
	bh=IxuY5Yy2+bxQ50G6EPCluh37NLO448od94aJA4UYTJY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=eHXd4ulJMx0crFk7Dr3i+pMm/cnivYbupFgA0CnfYAqtWh85kRODN1K3eKwN5vJJE
	 6JY5bMmRGFE/9Llcc3mZ4qHUjFU7Q3mCb57+NC+imT7ZK/n2NJxfri3DhdVK3GchE7
	 oL5n3NsOY8go2mCSmv+99myb2WIt5x754QJe9ZrRH8/NBs655zRUy91m5v5niCkYLQ
	 5f6CGeScCfNN+dLZl+yhJVoOXvpKN/l21HJ6UQSqmFCRBDaz4fORGrDunqKKp+W8fb
	 ZiCqpfCUTTvXxvotIqLGD4xmnhrfaCzHtru7NBoEeXmxMeRrtacLJCckRBAp8Rzsm/
	 59oNtmWDFzvLA==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 09F9717E04AE;
	Wed, 22 Jul 2026 18:39:56 +0200 (CEST)
Message-ID: <2949748a-2a37-46f9-996b-8e2438c8f8f8@collabora.com>
Date: Wed, 22 Jul 2026 18:39:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 12/46] dt-bindings: soc: mediatek: mutex: Allow
 #trigger-source-cells
To: Rob Herring <robh@kernel.org>
Cc: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, airlied@gmail.com,
 simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, krzk+dt@kernel.org, conor+dt@kernel.org,
 matthias.bgg@gmail.com, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 justin.yeh@mediatek.com, jason-jh.lin@mediatek.com, kernel@collabora.com
References: <20260714114414.184512-1-angelogioacchino.delregno@collabora.com>
 <20260714114414.184512-13-angelogioacchino.delregno@collabora.com>
 <20260722154500.GA988735-robh@kernel.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260722154500.GA988735-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_174001_978787_60A261B4 
X-CRM114-Status: GOOD (  11.54  )
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

On 7/22/26 17:45, Rob Herring wrote:
> On Tue, Jul 14, 2026 at 01:43:40PM +0200, AngeloGioacchino Del Regno wrote:
>> This hardware controls trigger sources, and there's even a generic
>> binding just for that: allow #trigger-source-cells in MuteX, so
>> that this is allowed to provide triggers to external HW.
>>
>> Acked-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> 
> You ack-ed your own patch?
> 

Mysterious things happen in my workflow... :facepalm:

>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>> ---
>>   .../devicetree/bindings/soc/mediatek/mediatek,mutex.yaml      | 4 ++++
>>   1 file changed, 4 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/soc/mediatek/mediatek,mutex.yaml b/Documentation/devicetree/bindings/soc/mediatek/mediatek,mutex.yaml
>> index 5267cfe92572..886e6f904b78 100644
>> --- a/Documentation/devicetree/bindings/soc/mediatek/mediatek,mutex.yaml
>> +++ b/Documentation/devicetree/bindings/soc/mediatek/mediatek,mutex.yaml
>> @@ -54,6 +54,9 @@ properties:
>>       items:
>>         - description: MUTEX Clock
>>   
>> +  '#trigger-source-cells':
>> +    const: 1
>> +
>>     mediatek,gce-events:
>>       description:
>>         The event id which is mapping to the specific hardware event signal
>> @@ -116,6 +119,7 @@ examples:
>>               interrupts = <GIC_SPI 169 IRQ_TYPE_LEVEL_LOW>;
>>               power-domains = <&spm MT8173_POWER_DOMAIN_MM>;
>>               clocks = <&mmsys CLK_MM_MUTEX_32K>;
>> +            #trigger-source-cells = <1>;
>>               mediatek,gce-events = <CMDQ_EVENT_MUTEX0_STREAM_EOF>,
>>                                     <CMDQ_EVENT_MUTEX1_STREAM_EOF>;
>>           };
>> -- 
>> 2.54.0
>>

