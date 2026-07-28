Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 171EBC53219
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jul 2026 13:50:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TCR9C1jZOqNcj2+4RUYXKURLxFK8ipzkgH8+WvlnyEc=; b=onrNy+5eoxLYVs/H0thwGFwRcD
	wDeidTbKAFn251su29y99anrDlcxBoX3UZu2gswsMBLVx2re+J+KK+LVZA7V52v+D8QmV7w2GpbAh
	s2QUmBkRHl0B2Drf16Vta4p10aJb0rs6ycQdcQhPqDpLhe6aJ3Y0Y719oy6bUftkBJ8ImvH6K2pgt
	y9Ypos19XuXwycpYOHgJwArCo/D/j/S4SHh+DjWleRmf9NODbAYSzFTCghQ3Ize84Ydx2sm6CsjD/
	isEM2K7kzg1CLe1QJwyQG0Q4+oiRmYcv4T5Ikxzzz+RGDRwjHqXPFRKsddd70N7R9izoqXyuKRcqn
	+Yn6Ck2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woiBu-00000005OV5-0ksf;
	Tue, 28 Jul 2026 13:49:54 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woiBq-00000005OSS-2W7n;
	Tue, 28 Jul 2026 13:49:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1785246585;
	bh=C5yYxuoznYkx6jjuInKWBoafFhEWvSyRl81rU7O0L28=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=hAh/kji5iB0/IrWz1bQpl2yth3JJZrnTM9K7hhQcwfzWZLk1QmmXef26bTzAGUcNR
	 LleJaTac6MAyAWCfYEa1OuIoIaygmYoE+F5+Okc/h6XhIJe2lL+ITfIwnnFAKFj0He
	 Bshv2dLXnYADYdyan2vlAT1ALumzzBOFfvTBRQAoCkblN3dJYEmbuxBqCOXOT76yGP
	 HBtCGvFEZHfRm1cHN3JnGo3/iQoyqYXnawXoPgTdzYmQiFzFGZA8ITGlKPRviMGbfi
	 V+n6FHcr6Ex3+/YD50PzKyQ26dQyh9e8VgoqNvZJlRtZ2WO4kOSVZsVVS7PjzJKuFH
	 AiKKsWAVU4zJQ==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id B602C17E0678;
	Tue, 28 Jul 2026 15:49:44 +0200 (CEST)
Message-ID: <f3837531-2949-4741-a23e-387317485c02@collabora.com>
Date: Tue, 28 Jul 2026 15:49:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 42/46] dt-bindings: display: mediatek: Introduce MT8196
 2D Sharpness Processor
To: Rob Herring <robh@kernel.org>
Cc: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, airlied@gmail.com,
 simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, krzk+dt@kernel.org, conor+dt@kernel.org,
 matthias.bgg@gmail.com, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 justin.yeh@mediatek.com, jason-jh.lin@mediatek.com, kernel@collabora.com
References: <20260714114414.184512-1-angelogioacchino.delregno@collabora.com>
 <20260714114414.184512-43-angelogioacchino.delregno@collabora.com>
 <CAL_JsqJXpY8jHEgSHcHz4QZTFEZe8PLbO6vbpxWH4qobs0MPyA@mail.gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <CAL_JsqJXpY8jHEgSHcHz4QZTFEZe8PLbO6vbpxWH4qobs0MPyA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_064950_823496_17ADC97D 
X-CRM114-Status: GOOD (  14.07  )
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

On 7/28/26 15:40, Rob Herring wrote:
> On Tue, Jul 14, 2026 at 6:45 AM AngeloGioacchino Del Regno
> <angelogioacchino.delregno@collabora.com> wrote:
>>
>> Add documentation for the Two-Dimension Sharpness Processor, or
>> "TDSHP", found in many MediaTek SoCs including MT8196 and its
>> variants.
>>
>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>> ---
>>   .../mediatek/mediatek,mt8196-tdshp.yaml       | 98 +++++++++++++++++++
>>   1 file changed, 98 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,mt8196-tdshp.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,mt8196-tdshp.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,mt8196-tdshp.yaml
>> new file mode 100644
>> index 000000000000..ccd6a8443443
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,mt8196-tdshp.yaml
>> @@ -0,0 +1,98 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/display/mediatek/mediatek,mt8196-tdshp.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: MediaTek Display Two-Dimension Sharpness Processor (TDSHP)
>> +
>> +maintainers:
>> +  - AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>> +
>> +description:
>> +  The MediaTek 2D Sharpness Processor (TDSHP) is responsible for performing
>> +  image sharpness adjustments/enhancements in a display pipeline.
>> +  This hardware block supports adjusting the luma and contour 2d histograms,
>> +  frequency weighting, luma-chroma gain and others, with adaptive weights.
>> +
>> +properties:
>> +  compatible:
>> +    const: mediatek,mt8196-disp-tdshp
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  clocks:
>> +    maxItems: 1
>> +
>> +  power-domains:
>> +    maxItems: 1
>> +
>> +  ports:
>> +    $ref: /schemas/graph.yaml#/properties/ports
>> +
>> +    properties:
>> +      port@0:
>> +        $ref: /schemas/graph.yaml#/properties/port
>> +
>> +      port@1:
>> +        $ref: /schemas/graph.yaml#/properties/port
>> +
>> +    required:
>> +      - port@0
>> +      - port@1
>> +
>> +  trigger-sources:
>> +    maxItems: 1
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - clocks
>> +  - clock-names
> 
> This causes a warning.
> 
> Seems this is in linux-next already, but no reviews?
> 
> Rob

Wow. No idea how clock-names got into the list of required properties: there is
only one possible clock, and this doesn't need any clock-names at all.

Same for the resizer binding.
Sorry for the mistake.

Cheers,
Angelo

