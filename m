Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C76AC021AA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Feb 2025 14:08:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gB54zPAPLqhWFMcjLyuu6DfM1aMSTYUbV7sNsYkZqg0=; b=Zz7ms9uJkt3udNR0tUnLlnbExz
	mEG0Xj+bB5uIlKFqNo+TufClWW/oyGQbmMc08J0Q7ocxDntNHYa8KN6YOr7jgiB1dp/2+uq3M+HYF
	AmpMuJ6kTJBgv+Ywa1ETFaxY3lQpTZ9AJm/Di6WQituD3zyrsYUEExPkvXnAh1MBnKERmbQQQGg8O
	KGuFGnsxJB2c20szKBEUtVh4Wg3blZokLN5yf9np/gVYBnJJ6st6ixjMot2J7+8pzGfzek8EHvweD
	gHo+PrRZcOOnZoRR1aXPCwj/g6VMfUVmspMfhaULafj7AB+dLtZaeRlshfKNap8rU+of5Q8Ga+pMZ
	FnUpQVSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkkkl-0000000DCHg-1sCt;
	Wed, 19 Feb 2025 14:08:43 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkkfY-0000000D90b-0mFh;
	Wed, 19 Feb 2025 14:03:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=gB54zPAPLqhWFMcjLyuu6DfM1aMSTYUbV7sNsYkZqg0=; b=OLdVz+bq8EJPfIWcEBcAMN//o+
	VkI3fuVzlbt3aLtUPM+EvYKmSdQDU+TcyeqgcaIviYN4xwRc6VCb0rnFQTkMPZAYOA5uX8OXH+Esv
	x0med2KuSQgNihoiibvoHd0CnBKSHZ3z/etngbX4H0AtWhhsGRm7sf05FHuVE2PuyGqSIezILSoli
	PhfvOs1M9I5526HvrLf/HUhfG111ovC6xFneRH2BsXgCvzoF+0gThPyCWiGv/gi8flc90/qTvOPzK
	GoGIZRUC38+5jMjHQif9mjV/aubwSyZ5qWQejTUa2Vya2Lrcdeb3gA40yVNyvrkB+FToJkuT6STWB
	YiARcoDQ==;
Received: from bali.collaboradmins.com ([148.251.105.195])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkkfV-00000002AFV-0Y6S;
	Wed, 19 Feb 2025 14:03:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1739973791;
	bh=+yoyTgslXEGlaSowE8SMsWkFERto3CdZJqou3uuI6Ok=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=TFExlLpOj3jsnWCm2u34v6V3QmBM165e/qPBc7wdqoPKkaAkfZWJS0t5LphRnbsIq
	 49LT+aBrQ1rbAogEwlX7fOJOpgFUwZ5PIVU6z/JLjPGY5hzZMRwjRsXjE+ESCWQdj+
	 5rdavkl1WwyCgYZe1jJBfjNr1XHZcsDJIBydJkC1r7+jb8xfQ6FnDtTowrRWoC4xsq
	 naZGbKRUnSlDxZ6oLNlzlCCmGZ6scV1NAE2hxKwQi0DJrf8SHa0gui19+MTnLB3E3R
	 7JmUQ4nAzY3cxsD1t4liVDbbOGx75GTc2x99/d+JwWApIDNDDz5+1Yq7/qXuyXNck9
	 Rf4IsUiiQItTA==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 4EFDB17E0860;
	Wed, 19 Feb 2025 15:03:10 +0100 (CET)
Message-ID: <c534a79b-c253-4d7e-9bc1-9efa491d1db0@collabora.com>
Date: Wed, 19 Feb 2025 15:03:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/3] dt-bindings: display: mediatek: Add compatibles
 for MT8188 MDP3
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
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
 <20241218105320.38980-2-angelogioacchino.delregno@collabora.com>
 <CAAOTY_9J4TE=qo+00N7T6-daMET+eTt8psp+eV1DXdgrz+avEQ@mail.gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <CAAOTY_9J4TE=qo+00N7T6-daMET+eTt8psp+eV1DXdgrz+avEQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250219_140317_362424_5722A5D5 
X-CRM114-Status: GOOD (  10.57  )
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

Il 19/02/25 14:49, Chun-Kuang Hu ha scritto:
> AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com> 於
> 2024年12月18日 週三 下午6:53寫道：
>>
>> Add compatible strings for the AAL, COLOR, MERGE and PADDING
>> hardware components found in MediaTek's MT8188 SoC.
>>
>> This hardware is compatible with MT8195.
> 
> Acked-by: Chun-Kuang Hu <chunkuang.hu@mediatek.com>

Thanks CK, much appreciated.

Cheers!

> 
>>
>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>> ---
>>   .../bindings/display/mediatek/mediatek,aal.yaml        |  4 ++++
>>   .../bindings/display/mediatek/mediatek,color.yaml      |  4 ++++
>>   .../bindings/display/mediatek/mediatek,merge.yaml      |  4 ++++
>>   .../bindings/display/mediatek/mediatek,padding.yaml    | 10 +++++++---
>>   4 files changed, 19 insertions(+), 3 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml
>> index cf24434854ff..1479035da409 100644
>> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml
>> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml
>> @@ -25,6 +25,10 @@ properties:
>>             - mediatek,mt8173-disp-aal
>>             - mediatek,mt8183-disp-aal
>>             - mediatek,mt8195-mdp3-aal
>> +      - items:
>> +          - enum:
>> +              - mediatek,mt8188-mdp3-aal
>> +          - const: mediatek,mt8195-mdp3-aal
>>         - items:
>>             - enum:
>>                 - mediatek,mt2712-disp-aal
>> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,color.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,color.yaml
>> index 7df786bbad20..799c0b8fc1f9 100644
>> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,color.yaml
>> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,color.yaml
>> @@ -27,6 +27,10 @@ properties:
>>             - mediatek,mt8167-disp-color
>>             - mediatek,mt8173-disp-color
>>             - mediatek,mt8195-mdp3-color
>> +      - items:
>> +          - enum:
>> +              - mediatek,mt8188-mdp3-color
>> +          - const: mediatek,mt8195-mdp3-color
>>         - items:
>>             - enum:
>>                 - mediatek,mt7623-disp-color
>> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,merge.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,merge.yaml
>> index dae839279950..415a25bc18fa 100644
>> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,merge.yaml
>> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,merge.yaml
>> @@ -25,6 +25,10 @@ properties:
>>             - mediatek,mt8173-disp-merge
>>             - mediatek,mt8195-disp-merge
>>             - mediatek,mt8195-mdp3-merge
>> +      - items:
>> +          - enum:
>> +              - mediatek,mt8188-mdp3-merge
>> +          - const: mediatek,mt8195-mdp3-merge
>>         - items:
>>             - const: mediatek,mt6795-disp-merge
>>             - const: mediatek,mt8173-disp-merge
>> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,padding.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,padding.yaml
>> index be07bbdc54e3..86787866ced0 100644
>> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,padding.yaml
>> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,padding.yaml
>> @@ -20,9 +20,13 @@ description:
>>
>>   properties:
>>     compatible:
>> -    enum:
>> -      - mediatek,mt8188-disp-padding
>> -      - mediatek,mt8195-mdp3-padding
>> +    oneOf:
>> +      - enum:
>> +          - mediatek,mt8188-disp-padding
>> +          - mediatek,mt8195-mdp3-padding
>> +      - items:
>> +          - const: mediatek,mt8188-mdp3-padding
>> +          - const: mediatek,mt8195-mdp3-padding
>>
>>     reg:
>>       maxItems: 1
>> --
>> 2.46.1
>>


