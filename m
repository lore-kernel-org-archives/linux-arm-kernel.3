Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F24B5C79FAD
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 09:53:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+Z9QqY8nW5wxQiyUux8nuGtspp5zSIH5OgC/3UhaUeY=; b=m7D7QEgNbB1lcLD8lZsV/E7LG/
	p53v1eDs45EeERcvD0V30L3NlDRtISTxcqE1O3rWHzOXtbAmCkMLgPyD0Jnp5DuhPuCFCR9x9TRWf
	QbWkPI7NKJ064z+ngfVgNBbr/Un4zjJlzzLbewrCQYi+t0ycltOpjEIXVOTccE75kRWRgwMRnB3UY
	R8ANz/Gajs30GwknrgcETc6FA/6ILvJlRlhpZgvW53B02/4k29QOLKaSVakX/EP0ouGsda8vI8+rE
	Twsgg5uIsqssQTnQMfrvjoxAH66k4yvEbIARyb8PJuwn2XGIi1bLDfuz0qcbuurCLoLJ2HtSmLXWP
	hzU2wAvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4EzV-0000000BM3P-3fAf;
	Wed, 09 Sep 2026 09:53:17 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4EzO-0000000BM0u-25f1;
	Wed, 09 Sep 2026 09:53:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1788947587;
	bh=ZoLRYrhsi0rsdSeaR+606R03qSLubwt7gfupiCo9cfQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=FNhYyLcYk+pHG+NuCEBoN9Z9qL4DcRhrU+huzWhiidgEmeCWxspJXn7VJwZ/n0TJt
	 hBnfmuUwE3ybYGY6GXbQD3iq2Q/ucPpom3qJSpa4w8ax2CP5F8lkk7VKIPj5QC2YQp
	 +1Wr1BER27HnNb02KA28QvzTOz6zudDz1haVx88h08HrPtMMRT2RsvE9RKR3g3nXLN
	 RpHf52dq9yke72Y+icPpIfFhsemJllPUfUz1TGqCHcBTB3qTLaiG1bB6J9W1fY3GpT
	 Fa2jCs+2feOqQGIP1gNJhJfuvqW2cSgGw/DqWhZ50k4SSyNFndlDABnEj1WZLjTlWb
	 cfVO5CvVgAKIA==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id BA1F017E093B;
	Wed, 09 Sep 2026 11:53:06 +0200 (CEST)
Message-ID: <637ff670-1d12-479a-b35f-9d54b153a832@collabora.com>
Date: Wed, 9 Sep 2026 11:53:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v2] dt-bindings: mediatek: hdmi-ddc: Correct the
 compatibles for mt7623-mt8167
To: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
 linux-mediatek@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, CK Hu <ck.hu@mediatek.com>,
 Jitao shi <jitao.shi@mediatek.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20260908184125.10916-1-l.scorcia@gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260908184125.10916-1-l.scorcia@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_025311_021340_2DAA684C 
X-CRM114-Status: GOOD (  13.02  )
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

On 9/8/26 20:41, Luca Leonardo Scorcia wrote:
> The HDMI DDC driver for both mt7623 and mt8167 is actually the same as
> mt8173-hdmi-ddc and the mt7623n.dtsi board include file already uses
> mt8173-hdmi-ddc compatible as a fallback, but the documentation lists
> them as separate entries. Correct the binding by adding the correct
> fallback.
> 
> Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> ---
> Fixes the following dtbs_check error in mt7623n-rfb-emmc.dts and
> mt7623n-bananapi-bpi-r2.dts:
> 
> i2c@11013000 (mediatek,mt7623-hdmi-ddc): compatible:
>    ['mediatek,mt7623-hdmi-ddc', 'mediatek,mt8173-hdmi-ddc'] is too long
> 
>   .../bindings/display/mediatek/mediatek,hdmi-ddc.yaml  | 11 +++++++----
>   1 file changed, 7 insertions(+), 4 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,hdmi-ddc.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,hdmi-ddc.yaml
> index bd8f7b8ae0ff..966127e1ee63 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,hdmi-ddc.yaml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,hdmi-ddc.yaml
> @@ -15,10 +15,13 @@ description: |
>   
>   properties:
>     compatible:
> -    enum:
> -      - mediatek,mt7623-hdmi-ddc
> -      - mediatek,mt8167-hdmi-ddc
> -      - mediatek,mt8173-hdmi-ddc
> +    oneOf:
> +      - const: mediatek,mt8173-hdmi-ddc
> +      - items:
> +          - enum:
> +              - mediatek,mt7623-hdmi-ddc
> +              - mediatek,mt8167-hdmi-ddc
> +          - const: mediatek,mt8173-hdmi-ddc
>   
>     reg:
>       maxItems: 1


