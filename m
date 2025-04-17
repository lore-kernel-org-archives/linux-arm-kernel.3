Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45637C369B2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Apr 2025 10:37:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bXY6mfuLh1GmYjVNQ5RKzkA76s2q+iTTxEqGfUkI5+0=; b=c5fRvRqyK+ZUi4yOWJuZETpyUn
	2BLP075rONvenEyqovAh9eV0J/HhYO3ljHVHsNwjLv5PB64eKwEWQGJb298U/xKayEXPWdZUVC+wQ
	9TS/7NGPJjrJifRASn3tCDEej07wp9oamuExYjX4aNEkcE2q5q1QVqTxcoBIRFd+vqOFZT/YLnKMs
	L2yVKiHvdIK/8deDpoDSEr+u233iMNJOFiPeZM2bi6TIXt1XWNkkTE0ghHo+UZFLEzkke+sOWvSfn
	No7ybLrMgg+vJTi3RmUnQouVD+F2FgU4iqGnyxHJO/uW+SX26nqSuSe/P/+TqlowKx9zQcX0RPs2x
	hssF5kpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5McW-0000000Cf1R-0gNB;
	Thu, 17 Apr 2025 10:37:24 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5MM6-0000000CcGx-3Ht0;
	Thu, 17 Apr 2025 10:20:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1744885225;
	bh=euPKG55mbzRFcDRjbCeKgcpRHVb0QMDwPWJSl0dozv4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=VmlKm73UT5ynd4rGl4xarSCzhHRSGSmktoLk9gbixVHTSgzSD/6dUSK1c3rr+QqHF
	 T8eITWj/slbXee0RqSnDi1eIZCV2e0pJuoSn1O/kepo+8l6iBimchVfl1CqdGde+Uc
	 6yqh3eQYxa0nKAfI2PC1kSO3lx5p3xdQjY9OHuunAakMVjjEtZ7ZfQMuIwKe36XIR2
	 lu6G5nF1sFH+u3y39UD9B41r5l17ueBYXlam+AEuoOGf3PMWllG/2iFpFXDjeWswsU
	 oTc7+2FpHqgqhtmIkpWa8sNYbYQBRd27IcNu72h4z/hs1WHQr8yBdBLRQvUOt3nyxL
	 SqcJ4M0WMt9aA==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 8DAD617E0F85;
	Thu, 17 Apr 2025 12:20:24 +0200 (CEST)
Message-ID: <8ffa4ba2-6d22-4ca8-b5c9-04f91d45456b@collabora.com>
Date: Thu, 17 Apr 2025 12:20:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/6] ASoC: dt-bindings: mt8195: add compatible
 mt8195_mt6359
To: Julien Massot <julien.massot@collabora.com>, kernel@collabora.com,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Trevor Wu <trevor.wu@mediatek.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org
References: <20250417-mt8395-audio-sof-v1-0-30587426e5dd@collabora.com>
 <20250417-mt8395-audio-sof-v1-4-30587426e5dd@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250417-mt8395-audio-sof-v1-4-30587426e5dd@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250417_032026_969858_667D0546 
X-CRM114-Status: GOOD (  11.48  )
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

Il 17/04/25 10:44, Julien Massot ha scritto:
> Make it also compatible for platform without external
> codecs.
> 
> Signed-off-by: Julien Massot <julien.massot@collabora.com>

For the next time - please remember that bindings commits should come before
driver changes :-)

Anyway:
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> ---
>   Documentation/devicetree/bindings/sound/mt8195-mt6359.yaml | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/sound/mt8195-mt6359.yaml b/Documentation/devicetree/bindings/sound/mt8195-mt6359.yaml
> index 2af1d8ffbd8b58f1dce42b369fd699795183a7d7..54a53d15f40c0af56a2a0221025f3a090a05b6e6 100644
> --- a/Documentation/devicetree/bindings/sound/mt8195-mt6359.yaml
> +++ b/Documentation/devicetree/bindings/sound/mt8195-mt6359.yaml
> @@ -21,6 +21,7 @@ properties:
>         - mediatek,mt8195_mt6359_rt1019_rt5682
>         - mediatek,mt8195_mt6359_rt1011_rt5682
>         - mediatek,mt8195_mt6359_max98390_rt5682
> +      - mediatek,mt8195_mt6359
>   
>     model:
>       $ref: /schemas/types.yaml#/definitions/string
> 


-- 

