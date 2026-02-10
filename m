Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67F32EA811F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Feb 2026 14:28:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iLRJO034PzNlcAUBwZKAbBLhNDsdkfdFamaIdMTqIdE=; b=cjP1BnbwZ6xe2xaTepW4ysON22
	vPDXl12NDm611Z/o5rvbLkcqqYISDPQeCKijfSvKdYILxwjlhcCBcT6G9QcCSeUr5b4K9vfAtpzc0
	p3ZCdg/Ida65qf4F8iDT68DwEnW80yHsA5uEqv7JdB+T6ufE0N5/WxPZIxVgPlOozkUAGiFe5t1Kn
	IBD40EQBiT9380g1lYMkCMXpGlPFLfkQAPTFi6E2gc3oGgg9Xw/JPzM2GoJoSoLZzbJ328vnLivQz
	zjaENiyirkVg+KM/3vFVDiBrofe5ikUOkt/fBiArEUUABiamneR62xn0/7weEb0kx35qA4NQNvuxq
	zj6rhYeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpoj2-0000000H35b-2kJE;
	Tue, 10 Feb 2026 14:28:24 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpoiz-0000000H34i-2if8;
	Tue, 10 Feb 2026 14:28:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1770733698;
	bh=muVQ1zQzdc9CjW+SMGZIOKie1oQVfcVMN3gvbBxDNQw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=n6QsXv0HmwEC4rsdnP2MtqVr7K2V/6R9qghoJSN7lLgDKzayX8QLq7Z3JT7nF2b11
	 f2goSCY2LqBw56NAm/s7IDxxyiAL74ofPiLNc56kPLdOXYIrEstWGiTlmHD4QuSI9Y
	 q4ruM/bLlfad2Oq1DPAzvWtDSrVWgRt4Uw17mlDQW9GUIUGgw++IO8KB4vheHBEsIk
	 iyHxWEuVbE7mU9q+xwO258CHdCPasCNjmHKZotgf0LC8P3RKGpVQpjEvybX/hDkxYS
	 2KAhXNLy9yjE1oRVvxgeghNTrq9YjsqBhOYJNDIdJtV0S03hT+PXjpOPqeHIEdZByC
	 PfVZ0TBb919dg==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id E580C17E12A9;
	Tue, 10 Feb 2026 15:28:17 +0100 (CET)
Message-ID: <0ccca45c-34af-4d38-ad0f-6cd080f2882d@collabora.com>
Date: Tue, 10 Feb 2026 15:28:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] dt-bindings: arm: mediatek: audsys: Support
 mt8192-audsys variant
To: Rob Herring <robh@kernel.org>
Cc: krzk+dt@kernel.org, conor+dt@kernel.org, tudor.ambarus@linaro.org,
 pratyush@kernel.org, mwalle@kernel.org, miquel.raynal@bootlin.com,
 richard@nod.at, vigneshr@ti.com, lgirdwood@gmail.com, broonie@kernel.org,
 matthias.bgg@gmail.com, julien.massot@collabora.com,
 eugen.hristev@linaro.org, jiaxin.yu@mediatek.com, shane.chien@mediatek.com,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-sound@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 kernel@collabora.com
References: <20260115125624.73598-1-angelogioacchino.delregno@collabora.com>
 <20260115125624.73598-4-angelogioacchino.delregno@collabora.com>
 <CAL_JsqL=zAqyVDAP_B1VW1FWKoS9OEdTNZiZabSNxDscBryYgw@mail.gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <CAL_JsqL=zAqyVDAP_B1VW1FWKoS9OEdTNZiZabSNxDscBryYgw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260210_062821_863018_AFE20DC2 
X-CRM114-Status: GOOD (  13.94  )
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

Il 10/02/26 14:41, Rob Herring ha scritto:
> On Thu, Jan 15, 2026 at 6:56 AM AngeloGioacchino Del Regno
> <angelogioacchino.delregno@collabora.com> wrote:
>>
>> Add support for the mediatek,mt8192-audsys compatible, which uses
>> a different audio controller (mt8192-afe-pcm) compared to mt8183
>> and mt2701.
>>
>> This resolves a dtbs_check warning on all MT8192 devicetrees.
>>
>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>> ---
>>   .../arm/mediatek/mediatek,audsys.yaml         | 46 +++++++++++++------
>>   1 file changed, 33 insertions(+), 13 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,audsys.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,audsys.yaml
>> index f3a761cbd0fd..09a6c16e7e82 100644
>> --- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,audsys.yaml
>> +++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,audsys.yaml
>> @@ -48,19 +48,39 @@ required:
>>     - compatible
>>     - '#clock-cells'
>>
>> -if:
>> -  properties:
>> -    compatible:
>> -      contains:
>> -        const: mediatek,mt8183-audiosys
>> -then:
>> -  properties:
>> -    audio-controller:
>> -      $ref: /schemas/sound/mediatek,mt8183-audio.yaml#
>> -else:
>> -  properties:
>> -    audio-controller:
>> -      $ref: /schemas/sound/mediatek,mt2701-audio.yaml#
>> +allOf:
>> + - if:
> 
> Documentation/devicetree/bindings/arm/mediatek/mediatek,audsys.yaml:52:2:
> [warning] wrong indentation: expected 2 but found 1 (indentation)
> 
> 
>> +     properties:
>> +       compatible:
>> +         contains:
>> +           enum:
>> +             - mediatek,mt2701-audsys
>> +             - mediatek,mt7622-audsys
>> +   then:
>> +     properties:
>> +       audio-controller:
>> +         $ref: /schemas/sound/mediatek,mt2701-audio.yaml#
>> +
>> + - if:
>> +     properties:
>> +       compatible:
>> +         contains:
>> +           const: mediatek,mt8183-audiosys
>> +   then:
>> +     properties:
>> +       audio-controller:
>> +         $ref: /schemas/sound/mediatek,mt8183-audio.yaml#
>> +
>> + - if:
>> +     properties:
>> +       compatible:
>> +         contains:
>> +           const: mediatek,mt8192-audsys
>> +   then:
>> +     properties:
>> +       audio-controller:
>> +         $ref: /schemas/sound/mt8192-afe-pcm.yaml#
>> +
>>
> 
> Documentation/devicetree/bindings/arm/mediatek/mediatek,audsys.yaml:84:1:
> [warning] too many blank lines (2 > 1) (empty-lines)
> 
> Please fix as these are warnings in linux-next now.
> 

Ack. Sorry for the mistakes. Not sure how this happened.

Let me see when I can get some minutes to get this addressed.

Cheers,
Angelo

> 
>>   additionalProperties: false
>>
>> --
>> 2.52.0
>>



