Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD486C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Mar 2025 18:05:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AMV6rv+aSlw40sjoVUxv8b1B0fBB7V5bX7dyIX3uzx8=; b=Xhj1tCPiiPs+iHorVHGhMA+OVH
	Kfq90JZbgYR0thNfS/ddb7ViuJi5bpSQtdnYOYd0C7RSWMKpu9YgPeo67/RnPmRjTxwqT9E2G2/hd
	rP9ARRlOvqT4dLuTPGgLo9caeuv5Gjp3/bA+EL8xKwwFErRvZnT0Oye9kRSn0Bj94vRQHNWwcHLAW
	GigbBZMJjIjlG7KADSRMrBJlNFPc3aFT6OIDEawVs7gvkGnRcfZt8kzwlmqAb5swXlwB/2R75Ec1T
	EBbMwRPpnHcsCuE/c1qz9FcvFAAl8ixGz1aL3X8/L1ohJdNLCTf03eNC/h1k28w1snnVCztSWmLio
	6vnhUJOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trhVL-00000003Ys5-2Dv7;
	Mon, 10 Mar 2025 18:05:31 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1treyL-00000003AEa-2G76;
	Mon, 10 Mar 2025 15:23:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1741620196;
	bh=VYbY9rIbQJQUZihr7MBQ0+PYIh42KLO/D4PgPe54Uxs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=PUog0SG76zNzOvlevM9N30C0xe+8NOsE9gTz6GVbGf2rJKtGhTr5/JE3fNIRmPW3T
	 zErGRWxFE4dNsS/s/Ln2jF0R/b9yX5egA4FMToakgHKnXZw42JWFPrm6pACEyg1Z2u
	 olcvSsxBG/1RNNi6SWAZ3nWQHcs5kMml3qxedktabQtUF45J1XzWLrina508rjYRZ4
	 rxdnJX/CQKT6YUyyVcaKmyjpOePusZZqUi//drGXLsExEwIJ3UPsMC2PJ1n502lt11
	 syWoOoqU8pS0bs6mBf23X/LmC1JbrYoMo3oE4QLCwMmaplEyil0DbxIAcVWBdktBO6
	 fk/i8Uql6NzKg==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 3327017E0630;
	Mon, 10 Mar 2025 16:23:15 +0100 (CET)
Message-ID: <5983252e-22b6-4150-a770-a6b64031daf5@collabora.com>
Date: Mon, 10 Mar 2025 16:23:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/14] ASoC: mediatek: mt8196: add common interface for
 mt8196 DAI driver
To: "Darren.Ye" <darren.ye@mediatek.com>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org
References: <20250307124841.23777-1-darren.ye@mediatek.com>
 <20250307124841.23777-5-darren.ye@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250307124841.23777-5-darren.ye@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_082317_745829_B93AFFA6 
X-CRM114-Status: GOOD (  22.17  )
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

Il 07/03/25 13:47, Darren.Ye ha scritto:
> From: Darren Ye <darren.ye@mediatek.com>
> 
> Implement sample rate conversion and set private data for mt8196.
> 
> Signed-off-by: Darren Ye <darren.ye@mediatek.com>
> ---
>   .../soc/mediatek/mt8196/mt8196-afe-control.c  | 109 ++++++++++++++++++
>   1 file changed, 109 insertions(+)
>   create mode 100644 sound/soc/mediatek/mt8196/mt8196-afe-control.c
> 
> diff --git a/sound/soc/mediatek/mt8196/mt8196-afe-control.c b/sound/soc/mediatek/mt8196/mt8196-afe-control.c
> new file mode 100644
> index 000000000000..bb85f4ad8585
> --- /dev/null
> +++ b/sound/soc/mediatek/mt8196/mt8196-afe-control.c
> @@ -0,0 +1,109 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + *  MediaTek ALSA SoC Audio Control
> + *
> + *  Copyright (c) 2024 MediaTek Inc.
> + *  Author: Darren Ye <darren.ye@mediatek.com>
> + */
> +
> +#include "mt8196-afe-common.h"
> +#include <linux/pm_runtime.h>
> +
> +unsigned int mt8196_general_rate_transform(struct device *dev,
> +					   unsigned int rate)
> +{
> +	switch (rate) {
> +	case 8000:
> +		return MTK_AFE_IPM2P0_RATE_8K;
> +	case 11025:
> +		return MTK_AFE_IPM2P0_RATE_11K;
> +	case 12000:
> +		return MTK_AFE_IPM2P0_RATE_12K;
> +	case 16000:
> +		return MTK_AFE_IPM2P0_RATE_16K;
> +	case 22050:
> +		return MTK_AFE_IPM2P0_RATE_22K;
> +	case 24000:
> +		return MTK_AFE_IPM2P0_RATE_24K;
> +	case 32000:
> +		return MTK_AFE_IPM2P0_RATE_32K;
> +	case 44100:
> +		return MTK_AFE_IPM2P0_RATE_44K;
> +	case 48000:
> +		return MTK_AFE_IPM2P0_RATE_48K;
> +	case 88200:
> +		return MTK_AFE_IPM2P0_RATE_88K;
> +	case 96000:
> +		return MTK_AFE_IPM2P0_RATE_96K;
> +	case 176400:
> +		return MTK_AFE_IPM2P0_RATE_176K;
> +	case 192000:
> +		return MTK_AFE_IPM2P0_RATE_192K;
> +	/* not support 260K */
> +	case 352800:
> +		return MTK_AFE_IPM2P0_RATE_352K;
> +	case 384000:
> +		return MTK_AFE_IPM2P0_RATE_384K;
> +	default:
> +		dev_info(dev, "%s(), rate %u invalid, use %d!!!\n",
> +			 __func__,
> +			 rate, MTK_AFE_IPM2P0_RATE_48K);
> +		return MTK_AFE_IPM2P0_RATE_48K;
> +	}
> +}
> +
> +static unsigned int pcm_rate_transform(struct device *dev,
> +				       unsigned int rate)
> +{

You have this function in mt8186-afe-control.c and mt8192-afe-control.c, with
the only difference being the default case.

Please commonize this function and handle the default case for each SoC (if needed)
in each SoC-specific driver.

While at it, please do the same with mt8196_general_rate_transform, as this IPM2.0
will be in other MediaTek SoCs, and this function will otherwise be commonized next
time anyway.

Possible names could be mtk_afe_pcm_rate_transform() for one, and probably
mtk_ipm20_general_rate_transform() for the other.

> +	switch (rate) {
> +	case 8000:
> +		return MTK_AFE_PCM_RATE_8K;
> +	case 16000:
> +		return MTK_AFE_PCM_RATE_16K;
> +	case 32000:
> +		return MTK_AFE_PCM_RATE_32K;
> +	case 48000:
> +		return MTK_AFE_PCM_RATE_48K;
> +	default:
> +		dev_info(dev, "%s(), rate %u invalid, use %d!!!\n",
> +			 __func__,
> +			 rate, MTK_AFE_PCM_RATE_32K);
> +		return MTK_AFE_PCM_RATE_32K;
> +	}
> +}
> +
> +unsigned int mt8196_rate_transform(struct device *dev,
> +				   unsigned int rate, int aud_blk)
> +{
> +	switch (aud_blk) {
> +	case MT8196_DAI_PCM_0:
> +	case MT8196_DAI_PCM_1:
> +		return pcm_rate_transform(dev, rate);
> +	default:
> +		return mt8196_general_rate_transform(dev, rate);
> +	}
> +}
> +
> +int mt8196_dai_set_priv(struct mtk_base_afe *afe, int id,
> +			int priv_size, const void *priv_data)
> +{
> +	struct mt8196_afe_private *afe_priv = afe->platform_priv;
> +	void *temp_data;
> +
> +	temp_data = devm_kzalloc(afe->dev,
> +				 priv_size,
> +				 GFP_KERNEL);
> +	if (!temp_data)
> +		return -ENOMEM;
> +
> +	if (priv_data)
> +		memcpy(temp_data, priv_data, priv_size);
> +
> +	if (id >= MT8196_DAI_NUM || id < 0)
> +		return -EINVAL;
> +
> +	afe_priv->dai_priv[id] = temp_data;
> +
> +	return 0;
> +}
> +



