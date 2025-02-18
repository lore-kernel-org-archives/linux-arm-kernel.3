Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4C7FC02198
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Feb 2025 13:23:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Bmvrrr+0rLVmnH9Js9Jcng22/M1TT6YYZnQ5v6Jj+dI=; b=g1bAt//7GFn8aN941QHIpGU0Su
	+IbepYHnbaBxGWG6hVTStWkfaH8akjoc0xgum+/jRLanHsUlWQTb5o7Go4B+GbBXLheJZqSjKn2Jc
	qi24LbuobCcCWg7VpDks75Eh3adeBiTG4jBDR2l59dK7DqnkGBRy6SzdmAESLrlKNVlIQby4VsaYT
	cPLBnIJ6Cis0ucu3jPzlrr8lanNxig8ERnV1kdIAbvM32OwoZu3IO3XeLANg40L4tOSQK/5+sxSsZ
	JVhsVhc5NlUcyh+wE7zlODsr+I/QvaakO23PrdlDYkSI9dpjwRWHLE8zK5B2IxQfhz46jqbIddsnP
	1Dl5W4Rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkNZD-00000008Imi-3J1I;
	Tue, 18 Feb 2025 13:23:15 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkNUm-00000008Htd-08Ka;
	Tue, 18 Feb 2025 13:18:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1739884718;
	bh=FPWHPpu0oh2a3YB49PZMeRnbaB9j7/2z74Gs213PxMM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=AYpRsrYdp8B3SpEganL2jKb8Bs73o8Tn+ptsaTezupvmkOLsCMRb0NJW+Qy6PiEwE
	 OqyREqyyT7zX7wl/QvPmk2ihB0UqByW6nErSSkS4sRhEp9aiJPPWtxyFfnf+UqLsi8
	 YC7oePKC9WKeq3bZI7VphNuCq0mYxBFjZlNOqNasFpnnSryDt1KK3o4r0wquxiB+v5
	 Gg2/Zkuzk6Ii9d4MWQyxwlErJjxsVvzwepBA/tVJaQzpXa9DNe8rIickZG79CkQOPK
	 Qc5MGaavU0xUguPKekofn8VFtZCjUpwnkeDzvHSD2BiU4ZAbSiWkaON3VDXkN6BE3f
	 DcjsGH6vLF4Xw==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 1EC9017E0657;
	Tue, 18 Feb 2025 14:18:37 +0100 (CET)
Message-ID: <0ec8b0a5-d9b0-4090-a6b0-22537f449176@collabora.com>
Date: Tue, 18 Feb 2025 14:18:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/13] ASoC: mediatek: mt6359-accdet: Add compatible
 property
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Sen Chu <sen.chu@mediatek.com>,
 Sean Wang <sean.wang@mediatek.com>, Macpaul Lin <macpaul.lin@mediatek.com>,
 Lee Jones <lee@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Cc: kernel@collabora.com, linux-sound@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-pm@vger.kernel.org, Andrew Perepech <andrew.perepech@mediatek.com>
References: <20250214-mt6359-accdet-dts-v1-0-677a151b9b4c@collabora.com>
 <20250214-mt6359-accdet-dts-v1-4-677a151b9b4c@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250214-mt6359-accdet-dts-v1-4-677a151b9b4c@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_051840_212329_AEAAFD24 
X-CRM114-Status: GOOD (  20.68  )
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

Il 14/02/25 18:18, Nícolas F. R. A. Prado ha scritto:
> Add a compatible property and add it to the module device table for the
> mt6359-accdet platform driver to allow automatic module loading and
> probing when the compatible is present in DT.
> 
> Co-developed-by: Andrew Perepech <andrew.perepech@mediatek.com>
> Signed-off-by: Andrew Perepech <andrew.perepech@mediatek.com>
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> ---
>   sound/soc/codecs/mt6359-accdet.c | 10 ++++++++++
>   1 file changed, 10 insertions(+)
> 
> diff --git a/sound/soc/codecs/mt6359-accdet.c b/sound/soc/codecs/mt6359-accdet.c
> index ed34cc15b80e856356c07fd53af22207124e0d19..6f07db879c6a56ce4843954f51bb9602373e4aa5 100644
> --- a/sound/soc/codecs/mt6359-accdet.c
> +++ b/sound/soc/codecs/mt6359-accdet.c
> @@ -1047,9 +1047,19 @@ static int mt6359_accdet_probe(struct platform_device *pdev)
>   	return ret;
>   }
>   
> +const struct of_device_id accdet_of_match[] = {
> +	{
> +		.compatible = "mediatek,mt6359-accdet",
> +	}, {
> +		/* sentinel */
> +	},

Compress that stuff please...

	{ .compatible .. },
	{ /* sentinel */ }
};

after which:

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> +};
> +MODULE_DEVICE_TABLE(of, accdet_of_match);
> +
>   static struct platform_driver mt6359_accdet_driver = {
>   	.driver = {
>   		.name = "pmic-codec-accdet",
> +		.of_match_table = accdet_of_match,
>   	},
>   	.probe = mt6359_accdet_probe,
>   };
> 




