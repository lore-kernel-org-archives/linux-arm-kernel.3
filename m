Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94CF6C35FFA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Mar 2025 14:09:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=onrfU6dHmD1x2FmPIJyHW7aamYWiR+SbHr2wjfAcWpg=; b=BmO4tN06xsvomo0L/wsZ9cDeSL
	vg7HSH2QMDVZ8c/pQq7QP+CdL4NkwMBrfZomv8AzUqrOuzzrrKGdHlZj9+fIFUCFykCwNWot3ArQo
	h5ext/xjhoU3l1/XDmW6Ev3G+6SeaI4piwF/8eLFpr2vkQRjs5rQ/B3/vwXaSubdpcY0fPVEvfHE0
	BmokIbCPdP8Pzud4rl2vfcCtfQVtxngEUw1ErnduX0nQ8fvbScqf5D+S2AeoTK3AdpG43s9ZElE7M
	uQM9eHhGGNXAH6zWzpGLrxCq0dfI1F7OOiZuqGI49w4cCWdeuAKbu6IJgxYNsvL1FDJTUixsoqe1o
	cL6Pl5YA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuu6Q-00000009A4W-3puU;
	Wed, 19 Mar 2025 14:09:02 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuu4j-000000099oK-3Dk8;
	Wed, 19 Mar 2025 14:07:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1742393235;
	bh=vpGjYI6Vrz1T1LESF45jAadrF+3ulmGVN9/2NRUNuGY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=SZMdqj8US2vOliEoZQe9zqs9dmvk8BMMXT+I9LVY2ZLyGvCt80NrdWzi/bqRLk5BL
	 L0g/P6jQHrtJaLqsjlDv/YJsSzgGVCWv1gZoGtVAdMxNEgXZvqEZTG075OCcl5viAN
	 cOTC+wqAj0Jh9ChssaAYXgrD6ROvZIdd8Tf2FZN36mahwCz9qtuTY8Az5cP/f7vdDd
	 Imj9G7dloskYXP6CBtW8kIIUSVFoghsAqDzxvI49Vv4LNjYQTY5CHinfwJUZPlj4rY
	 uhYTUwJFSRGT8MS0C7sHYGC+4InfFz0nqsBZG29KofKrNJaZoc13VKzPmhbKXq1mqL
	 JzcNajUleXZog==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 3087F17E05D9;
	Wed, 19 Mar 2025 15:07:14 +0100 (CET)
Message-ID: <a79697fa-9ac0-4829-a36f-4e9915ad6bff@collabora.com>
Date: Wed, 19 Mar 2025 15:07:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/3] dt-bindings: media: mediatek: mdp3: Add
 compatibles for MT8188 MDP3
To: Nicolas Dufresne <nicolas@ndufresne.ca>, chunkuang.hu@kernel.org,
 Yunfei Dong <yunfei.dong@mediatek.com>,
 Jason-JH Lin <jason-jh.lin@mediatek.com>
Cc: p.zabel@pengutronix.de, airlied@gmail.com, simona@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 mchehab@kernel.org, matthias.bgg@gmail.com, moudy.ho@mediatek.com,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 kernel@collabora.com, sebastian.fricke@collabora.com,
 macpaul.lin@mediatek.com
References: <20241218105320.38980-1-angelogioacchino.delregno@collabora.com>
 <20241218105320.38980-3-angelogioacchino.delregno@collabora.com>
 <5682afd1785f37d9a995bee1643174b669c48535.camel@ndufresne.ca>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <5682afd1785f37d9a995bee1643174b669c48535.camel@ndufresne.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250319_070717_975290_B61BE0BF 
X-CRM114-Status: GOOD (  15.07  )
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

Il 19/02/25 16:38, Nicolas Dufresne ha scritto:
> Hi Angelo,
> 
> Le mercredi 18 décembre 2024 à 11:53 +0100, AngeloGioacchino Del Regno
> a écrit :
>> Add compatible strings for the FG, HDR, RSZ, STITCH, TCC, TDSHP
>> and WROT hardware components found in MediaTek's MT8188 SoC.
> 
> The firmware for this is missing in linux-firmware. I will not ack or
> pickMTK-VCODEC/MDP3 patches until this issue has been resolved.
> 

Nicolas et al linux-media maintainers:

https://lore.kernel.org/all/CA+5PVA6a+g1rZOM+ZRsNr-e4C9DPagQrffRO36yO3Bt3UXJNfQ@mail.gmail.com/

We ran tests on the firmware that was pushed, and sent the results in
reply to the patch that adds the firmware:

https://lore.kernel.org/all/8049a2ec-b5fe-440d-9704-c3b0e2d610c7@notapiano

The SCP firmware for VCODEC and MDP3 on the MT8188/MT8370/MT8390 SoCs has
been merged in linux-firmware.

Can you please ack this patch now? :-)

Cheers,
Angelo

> regards,
> Nicolas
> 
>>
>> This hardware is compatible with MT8195.
>>
>> Signed-off-by: AngeloGioacchino Del Regno
>> <angelogioacchino.delregno@collabora.com>
>> ---
>>   .../devicetree/bindings/media/mediatek,mdp3-fg.yaml       | 8
>> ++++++--
>>   .../devicetree/bindings/media/mediatek,mdp3-hdr.yaml      | 8
>> ++++++--
>>   .../devicetree/bindings/media/mediatek,mdp3-rsz.yaml      | 1 +
>>   .../devicetree/bindings/media/mediatek,mdp3-stitch.yaml   | 8
>> ++++++--
>>   .../devicetree/bindings/media/mediatek,mdp3-tcc.yaml      | 8
>> ++++++--
>>   .../devicetree/bindings/media/mediatek,mdp3-tdshp.yaml    | 8
>> ++++++--
>>   .../devicetree/bindings/media/mediatek,mdp3-wrot.yaml     | 1 +
>>   7 files changed, 32 insertions(+), 10 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/media/mediatek,mdp3-
>> fg.yaml b/Documentation/devicetree/bindings/media/mediatek,mdp3-
>> fg.yaml
>> index 03f31b009085..40fda59fa8a8 100644
>> --- a/Documentation/devicetree/bindings/media/mediatek,mdp3-fg.yaml
>> +++ b/Documentation/devicetree/bindings/media/mediatek,mdp3-fg.yaml
>> @@ -16,8 +16,12 @@ description:
>>   
>>   properties:
>>     compatible:
>> -    enum:
>> -      - mediatek,mt8195-mdp3-fg
>> +    oneOf:
>> +      - enum:
>> +          - mediatek,mt8195-mdp3-fg
>> +      - items:
>> +          - const: mediatek,mt8188-mdp3-fg
>> +          - const: mediatek,mt8195-mdp3-fg
>>   
>>     reg:
>>       maxItems: 1
>> diff --git a/Documentation/devicetree/bindings/media/mediatek,mdp3-
>> hdr.yaml b/Documentation/devicetree/bindings/media/mediatek,mdp3-
>> hdr.yaml
>> index d4609bba6578..d9f926c20220 100644
>> --- a/Documentation/devicetree/bindings/media/mediatek,mdp3-hdr.yaml
>> +++ b/Documentation/devicetree/bindings/media/mediatek,mdp3-hdr.yaml
>> @@ -16,8 +16,12 @@ description:
>>   
>>   properties:
>>     compatible:
>> -    enum:
>> -      - mediatek,mt8195-mdp3-hdr
>> +    oneOf:
>> +      - enum:
>> +          - mediatek,mt8195-mdp3-hdr
>> +      - items:
>> +          - const: mediatek,mt8188-mdp3-hdr
>> +          - const: mediatek,mt8195-mdp3-hdr
>>   
>>     reg:
>>       maxItems: 1
>> diff --git a/Documentation/devicetree/bindings/media/mediatek,mdp3-
>> rsz.yaml b/Documentation/devicetree/bindings/media/mediatek,mdp3-
>> rsz.yaml
>> index f5676bec4326..8124c39d73e9 100644
>> --- a/Documentation/devicetree/bindings/media/mediatek,mdp3-rsz.yaml
>> +++ b/Documentation/devicetree/bindings/media/mediatek,mdp3-rsz.yaml
>> @@ -20,6 +20,7 @@ properties:
>>             - mediatek,mt8183-mdp3-rsz
>>         - items:
>>             - enum:
>> +              - mediatek,mt8188-mdp3-rsz
>>                 - mediatek,mt8195-mdp3-rsz
>>             - const: mediatek,mt8183-mdp3-rsz
>>   
>> diff --git a/Documentation/devicetree/bindings/media/mediatek,mdp3-
>> stitch.yaml b/Documentation/devicetree/bindings/media/mediatek,mdp3-
>> stitch.yaml
>> index d815bea29154..1d8e7e202c42 100644
>> --- a/Documentation/devicetree/bindings/media/mediatek,mdp3-
>> stitch.yaml
>> +++ b/Documentation/devicetree/bindings/media/mediatek,mdp3-
>> stitch.yaml
>> @@ -16,8 +16,12 @@ description:
>>   
>>   properties:
>>     compatible:
>> -    enum:
>> -      - mediatek,mt8195-mdp3-stitch
>> +    oneOf:
>> +      - enum:
>> +          - mediatek,mt8195-mdp3-stitch
>> +      - items:
>> +          - const: mediatek,mt8188-mdp3-stitch
>> +          - const: mediatek,mt8195-mdp3-stitch
>>   
>>     reg:
>>       maxItems: 1
>> diff --git a/Documentation/devicetree/bindings/media/mediatek,mdp3-
>> tcc.yaml b/Documentation/devicetree/bindings/media/mediatek,mdp3-
>> tcc.yaml
>> index 14ea556d4f82..6cff7c073ce4 100644
>> --- a/Documentation/devicetree/bindings/media/mediatek,mdp3-tcc.yaml
>> +++ b/Documentation/devicetree/bindings/media/mediatek,mdp3-tcc.yaml
>> @@ -17,8 +17,12 @@ description:
>>   
>>   properties:
>>     compatible:
>> -    enum:
>> -      - mediatek,mt8195-mdp3-tcc
>> +    oneOf:
>> +      - enum:
>> +          - mediatek,mt8195-mdp3-tcc
>> +      - items:
>> +          - const: mediatek,mt8188-mdp3-tcc
>> +          - const: mediatek,mt8195-mdp3-tcc
>>   
>>     reg:
>>       maxItems: 1
>> diff --git a/Documentation/devicetree/bindings/media/mediatek,mdp3-
>> tdshp.yaml b/Documentation/devicetree/bindings/media/mediatek,mdp3-
>> tdshp.yaml
>> index 8ab7f2d8e148..cdfa27324738 100644
>> --- a/Documentation/devicetree/bindings/media/mediatek,mdp3-
>> tdshp.yaml
>> +++ b/Documentation/devicetree/bindings/media/mediatek,mdp3-
>> tdshp.yaml
>> @@ -16,8 +16,12 @@ description:
>>   
>>   properties:
>>     compatible:
>> -    enum:
>> -      - mediatek,mt8195-mdp3-tdshp
>> +    oneOf:
>> +      - enum:
>> +          - mediatek,mt8195-mdp3-tdshp
>> +      - items:
>> +          - const: mediatek,mt8188-mdp3-tdshp
>> +          - const: mediatek,mt8195-mdp3-tdshp
>>   
>>     reg:
>>       maxItems: 1
>> diff --git a/Documentation/devicetree/bindings/media/mediatek,mdp3-
>> wrot.yaml b/Documentation/devicetree/bindings/media/mediatek,mdp3-
>> wrot.yaml
>> index 53a679338402..b6269f4f9fd6 100644
>> --- a/Documentation/devicetree/bindings/media/mediatek,mdp3-wrot.yaml
>> +++ b/Documentation/devicetree/bindings/media/mediatek,mdp3-wrot.yaml
>> @@ -20,6 +20,7 @@ properties:
>>             - mediatek,mt8183-mdp3-wrot
>>         - items:
>>             - enum:
>> +              - mediatek,mt8188-mdp3-wrot
>>                 - mediatek,mt8195-mdp3-wrot
>>             - const: mediatek,mt8183-mdp3-wrot
>>   
> 



