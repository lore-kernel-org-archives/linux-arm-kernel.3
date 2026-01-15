Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A121D44C46
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Jan 2026 13:56:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Yw395J6q09lXTfkuWg88zVwNGZymaS/UocxodoEl6sI=; b=PjOh2/OWwWQkk3AkhQgzURkPGd
	tMMybjJmdEFdLK7B4EiI1TlxSIlRFjRiccKNZlbjv+RzSM0kGlv0zFqrG6/isN12tl7h5WETPRzvP
	pUS5LfzLCXNiWoPPEGtOJOXGTXwWlDFKr7WaKf7Y5H3UsDxjFSU8ySwmZEbwdlLs0+Ipz99JX5BHU
	yYSfk/tFYfB7b43ySkISua9FxkNMmKBppuAa2rOvcqeF+2UEO8rZPpzE4OgvCRhuTQdhDqlWpUYf3
	OI8ALcmdx4iwZyTJ/8BE+iF7PkyhZaku2o+kGiSKdXZypM3a2GWA6JP4el2QBeOxvdYSeIIQbWHQ5
	gtUCpXag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgNpH-0000000CRVJ-1NGW;
	Thu, 15 Jan 2026 13:55:51 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgNpC-0000000CRUR-1MAB;
	Thu, 15 Jan 2026 13:55:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1768485343;
	bh=eRwBxsCfbUvrq6+iEFeXt1XljTAEoWXuaPhjITIfx6Y=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Xg24JJpPFG5FrlZTiysZ0Z46F3ud+UNUX/sRKL3uN1krMVulN+N47XfehTpuEewAr
	 Q1apP6Ai1uLSVvga3AklmeQ079aUzTLkfqgKZ2tx9MYvRKOWDFw1VfWqNHdzhTmJGY
	 JLetjsVsSiw+jRIGut6I4VXBkrHDgPGufZNjK3naQhLqUjn38b/ksbV9IHSKJ99lzL
	 6sAUH/5uMO5/M5Oy49Fq50A/TWAKd9SfaFC9p9fZ7Hrx+atzoR3J49abmlo/daK8r2
	 UIQJtz5hZlYbcgdfs/e0zwTMoqyCPBYkVLJZWGYfX1GQ90ikBHnK5C1KKYP9Y408dq
	 CqN2rYLuWrwxQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 6128F17E0CF3;
	Thu, 15 Jan 2026 14:55:42 +0100 (CET)
Message-ID: <60bb622a-f88a-46ce-b835-bbefe47509bc@collabora.com>
Date: Thu, 15 Jan 2026 14:55:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] dt-bindings: mtd: jedec,spi-nor: Add Winbond
 W25Q(32/64/128/256)JWM
To: Pratyush Yadav <pratyush@kernel.org>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 tudor.ambarus@linaro.org, mwalle@kernel.org, miquel.raynal@bootlin.com,
 richard@nod.at, vigneshr@ti.com, lgirdwood@gmail.com, broonie@kernel.org,
 matthias.bgg@gmail.com, julien.massot@collabora.com,
 eugen.hristev@linaro.org, jiaxin.yu@mediatek.com, shane.chien@mediatek.com,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-sound@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 kernel@collabora.com
References: <20260115125624.73598-1-angelogioacchino.delregno@collabora.com>
 <20260115125624.73598-2-angelogioacchino.delregno@collabora.com>
 <2vxz5x93818a.fsf@kernel.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <2vxz5x93818a.fsf@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_055546_525430_7A01E108 
X-CRM114-Status: GOOD (  12.06  )
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

Il 15/01/26 14:16, Pratyush Yadav ha scritto:
> On Thu, Jan 15 2026, AngeloGioacchino Del Regno wrote:
> 
>> Add Winbond W25Q32JWM, W25Q64JWM, W25Q128JWM, W25Q256JWM to the
>> allowed compatible strings pattern.
>>
>> This also resolves a dtbs_check warning happening on all of the
>> MediaTek MT8192 Chromebooks devicetrees (for winbond,w25q64jwm).
> 
> We normally don't allow adding any more device-specific compatibles.
> This list here is only for legacy DTS. You should be using
> "jedec,spi-nor" in your device trees.
> 

Ah, okay, didn't know that.

That's actually making things easier for me honestly as removing the
model string is a 10 seconds change, so I'm totally happy with that.

Ignore this commit then.

Thanks!
Angelo

>>
>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>> ---
>>   Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml b/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
>> index 587af4968255..2db446c9ca9b 100644
>> --- a/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
>> +++ b/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
>> @@ -29,7 +29,7 @@ properties:
>>                 (sst,)?sst26wf016b|\
>>                 (sst,)?sst25wf(040b|080)|\
>>                 winbond,w25x(80|32)|\
>> -              (winbond,)?w25q(16|32(w|dw)?|64(dw)?|80bl|128(fw)?|256))$"
>> +              (winbond,)?w25q(16|32(w|dw)?|64(dw|jwm)?|80bl|128(fw|jwm)?|256(jwm)?))$"
>>             - const: jedec,spi-nor
>>         - items:
>>             - enum:
> 



