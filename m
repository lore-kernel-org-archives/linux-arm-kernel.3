Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF864C021AA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Feb 2025 12:54:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FM6ZbbuUKgG4fLMGRjhpxU0s57w4l14yW/CL0eWJhz8=; b=MX9Wf/1Iy9Z5A49NGWjso+FTu+
	eW4tgohr2rlwpaoKmSZgVSjX1p/ZYoGXtWuCmybqQZYv6KPKz0+xJUyXm9k39Ehdi3Vwv9zPpblj+
	rd74Ktbs09IwoadBZPVgLFf48ITrkHnC8xbPlhtj55jnjzqgk6YEZAzU9AM2sYCQTWNKOuVSBrN3c
	wQNWYUTQ0DJv4fIhDxeMsTTb2zVwcvx2fiZdZRPrc1KAURfDOVemP7n4nE8b2mY6g/qYTpkFcsQlR
	PtwLr+fnVT0zi/UlszygBiP6+2lqG8Najiw7iah/RXMbVlT88jaMxdlFFAQe08JFIm14fSENM9fWm
	X0o9Vq6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkjab-0000000Cn5U-1JGh;
	Wed, 19 Feb 2025 12:54:09 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkjVq-0000000ClDQ-22MW;
	Wed, 19 Feb 2025 12:49:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1739969352;
	bh=ZRkBJqfwNxsy4NNpzr6JGnP5yZqlVEWFWw7cYvuNgiw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=HCLC3kZRyknIKRy4X4tvHCuM73kSn2JvXMr5HWCdfodgZMf5ZskztPuQhJnC/o/8l
	 8y/TqOf0WiTDwN6dkwSyoNzE85TdLcn9ThMii2ol/CbLK7BdU21egioKu4yGj5UPh/
	 H7y9bde6V2EDGDIAzCR3gyPCmSYGugYImPZN1knxFb0kYTS+qZkn26zRL9fUOW+dya
	 7BhQwkYfgc4LRStI1jzfKwHfJhC122UFk5Pcz9B/JVTPHX2bGJwm+jGGKvaWpMJQOA
	 viyqoQgJYNoH6mjFR1KuMOdlyJpB0P/S4AC4tLrpcNYEpWsG5M/zG84j9DgfZZkZG7
	 ZA4sEm145csZg==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id BD53817E14D5;
	Wed, 19 Feb 2025 13:49:11 +0100 (CET)
Message-ID: <ce224b2e-a3c2-4543-9926-c524944ef1b6@collabora.com>
Date: Wed, 19 Feb 2025 13:49:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/7] dt-bindings: display: mediatek: tdshp: Add support
 for MT8196
To: Krzysztof Kozlowski <krzk@kernel.org>, Jay Liu <jay.liu@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Yongqiang Niu <yongqiang.niu@mediatek.com>,
 CK Hu <ck.hu@mediatek.com>, Hsin-Yi Wang <hsinyi@chromium.org>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20250219092040.11227-1-jay.liu@mediatek.com>
 <20250219092040.11227-8-jay.liu@mediatek.com>
 <4d8abd3f-c39b-49ea-8a43-b6ad0cf6fb15@kernel.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <4d8abd3f-c39b-49ea-8a43-b6ad0cf6fb15@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250219_044914_669716_20827E47 
X-CRM114-Status: GOOD (  21.51  )
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

Il 19/02/25 10:25, Krzysztof Kozlowski ha scritto:
> On 19/02/2025 10:20, Jay Liu wrote:
>> Add a compatible string for MediaTek MT8196 SoC
> 
> No, this is just bogus commit msg.
> 
> You did not try enough, just pasted same useless and incorrect message
> to every patch.
> 
>>
>> Signed-off-by: Jay Liu <jay.liu@mediatek.com>
>> ---
>>   .../display/mediatek/mediatek,tdshp.yaml      | 51 +++++++++++++++++++
>>   1 file changed, 51 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,tdshp.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,tdshp.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,tdshp.yaml
>> new file mode 100644
>> index 000000000000..5ed7bdd53d0e
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,tdshp.yaml
> 
> Filename matching exactly compatible.
> 
>> @@ -0,0 +1,51 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/display/mediatek/mediatek,tdshp.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: MediaTek display clarity correction


Adding more comments to Krzysztof's review....

What does "TDSHP" stand for? "Display Clarity Correction" rolls up as "DCC" which
is not "TDSHP".

Please clarify the title by unrolling "TDSHP"

title: MediaTek T.. Display... S... H... P

>> +
>> +maintainers:
>> +  - Chun-Kuang Hu <chunkuang.hu@kernel.org>
>> +  - Philipp Zabel <p.zabel@pengutronix.de>
>> +
>> +description: |
> 
> Do not need '|' unless you need to preserve formatting.
> 
>> +  MediaTek display clarity correction, namely TDSHP, provides a

Again, TDSHP does not stand for "display clarity correction" - that's what it is
for, and it is ok to say what it is for, but say what TDSHP stands for.

MediaTek T... Display Sharpness? (TDSHP) provides means to adjust
the image sharpness displayed on a physical screen, therefore this
IP is meant to perform display clarity correction.

...rest of the blurb, etc.

>> +  operation used to adjust sharpness in display system.
>> +  TDSHP device node must be siblings to the central MMSYS_CONFIG node.
>> +  For a description of the MMSYS_CONFIG binding, see
>> +  Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
>> +  for details.
> 
> Missing blank line. Do not introduce own style.
> 
>> +properties:
>> +  compatible:
>> +    oneOf:
> 
> Drop, unless this is already going to grow?
> 
> 

krzk: oh, it is, guaranteed!! but ... not exactly right now (not very soon),
so dropping the oneOf is a sane recommendation, I agree.


Cheers,
Angelo

>> +      - enum:
>> +          - mediatek,mt8196-disp-tdshp
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  clocks:
>> +    maxItems: 1
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - clocks
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +
> 
> Drop
> 
> 
> Best regards,
> Krzysztof




