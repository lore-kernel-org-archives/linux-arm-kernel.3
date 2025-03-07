Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 459D2C19F32
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Mar 2025 15:33:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z4Of7EMEdjwx5Jcu7d2vsHuZPtcn+fQ2lWIF6+BXOzw=; b=edWSyEiMlSWsGHIjlphP0h60V6
	JXypB2mqKsRZ/N1oRPG/tylhLV0YWlEUU7pFp665XpPAESfiDCO08wvtAo6uN6tSK2rG7LjaRPuU4
	KfW1ai3Ig6lT8h6iLSgiN18RaelpYpAmgnMoycZKjaQ5LTTofmaa6u100Z6A0CqkS5RdsRkHSAj9p
	ScGdRPGF/B9JI7RUrcxyJSSKMHCl0T23pG2DrnqP0dOGi1SPHJoA3KGjMV5i0KFB85+9o/jGJJZQU
	a6C4+F79U9ly4DrYeOdfMJp0mWgdy1/4kE299ZAOW1wRPIsQq2/HG6ACyww30NKpgGXQwUuvE77Tn
	KZ+0K9IQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqZhK-0000000EgI7-2oot;
	Fri, 07 Mar 2025 15:33:14 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqZZ9-0000000EdpW-0DuZ;
	Fri, 07 Mar 2025 15:24:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 7CC78A4587D;
	Fri,  7 Mar 2025 15:19:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1583C4CED1;
	Fri,  7 Mar 2025 15:24:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741361085;
	bh=pWhJRKhRk9JsmnVQA2wV95EPd2i9ZYmV/9+gkiFNv7o=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=SgIPCjARLXwNRYDp7Oo4nRQo7X6b+R7QrLx64dQb2ETENjelOaTgHgDpMEyhoSf6J
	 gAHE7W9u4naMcZnQ4SrXPTpPSCPILj+Wh0N/lztxxZI6VP5D5abdBZ+HEh9Pai2Kkv
	 XSlMHc8xa2VdzldwdXbie+8WK+fFZhRPa+BLniF7AqGhYjlrycJnj/Pxv/6vjOhxtD
	 qH6WUASK2vzTQAjyP/he680ahTp2uIu2OdUUyP6s6kSoOUsymv/w3K02ip82KvgBYR
	 47kyhTvbTZ56KHA5nynE5zXHf8s3jZozY3o4JOW8h/JCbOsr2bRpeGuhJ23jCBfVd7
	 2VyPBmszljp4w==
Message-ID: <934d740a-f382-411a-b769-4f9f21a53257@kernel.org>
Date: Fri, 7 Mar 2025 16:24:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/14] ASoC: mediatek: mt8196: support I2S in platform
 driver
To: "Darren.Ye" <darren.ye@mediatek.com>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org
References: <20250307124841.23777-1-darren.ye@mediatek.com>
 <20250307124841.23777-9-darren.ye@mediatek.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <20250307124841.23777-9-darren.ye@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250307_072447_271126_35CCCCE4 
X-CRM114-Status: GOOD (  15.81  )
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

On 07/03/2025 13:47, Darren.Ye wrote:
> +
> +static int etdm_parse_dt(struct mtk_base_afe *afe)
> +{
> +	int ret;
> +	struct mt8196_afe_private *afe_priv = afe->platform_priv;
> +	struct mtk_afe_i2s_priv *i2sin4_priv = afe_priv->dai_priv[MT8196_DAI_I2S_IN4];
> +	struct mtk_afe_i2s_priv *i2sout4_priv = afe_priv->dai_priv[MT8196_DAI_I2S_OUT4];
> +	unsigned int ch_num_in;
> +	unsigned int ch_num_out;
> +	unsigned int sync_in;
> +	unsigned int sync_out;
> +	unsigned int ip_mode;
> +
> +	/* get etdm ch */
> +	ret = of_property_read_u32(afe->dev->of_node, "mediatek,etdm-out-ch", &ch_num_out);
> +	if (ret) {
> +		dev_info(afe->dev, "%s() failed to read mediatek,etdm-out-ch\n", __func__);
> +		return -EINVAL;
> +	}
> +	i2sout4_priv->ch_num = ch_num_out;
> +	dev_dbg(afe->dev, "%s() mediatek,etdm-out-ch: %d\n", __func__, ch_num_out);
> +
> +	ret = of_property_read_u32(afe->dev->of_node, "mediatek,etdm-in-ch", &ch_num_in);
> +	if (ret) {
> +		dev_info(afe->dev, "%s() failed to read mediatek,etdm-in-ch\n", __func__);
> +		return -EINVAL;
> +	}
> +	i2sin4_priv->ch_num = ch_num_in;
> +	dev_dbg(afe->dev, "%s() mediatek,etdm-in-ch: %d\n", __func__, ch_num_in);
> +
> +	/* get etdm sync */
> +	ret = of_property_read_u32(afe->dev->of_node, "mediatek,etdm-out-sync", &sync_out);
> +	if (ret) {
> +		dev_info(afe->dev, "%s() failed to read mediatek,etdm-out-sync\n", __func__);
> +		return -EINVAL;
> +	}
> +	i2sout4_priv->sync = sync_out;
> +	dev_dbg(afe->dev, "%s() mediatek,etdm-out-sync: %d\n", __func__, sync_out);
> +
> +	ret = of_property_read_u32(afe->dev->of_node, "mediatek,etdm-in-sync", &sync_in);
> +	if (ret) {
> +		dev_info(afe->dev, "%s() failed to read mediatek,etdm-in-sync\n", __func__);
> +		return -EINVAL;
> +	}
> +	i2sin4_priv->sync = sync_in;
> +	dev_dbg(afe->dev, "%s() mediatek,etdm-in-sync: %d\n", __func__, sync_in);
> +
> +	/* get etdm ip mode */
> +	ret = of_property_read_u32(afe->dev->of_node, "mediatek,etdm-ip-mode", &ip_mode);
> +	if (ret) {
> +		dev_info(afe->dev, "%s() failed to read mediatek,etdm-ip-mode\n", __func__);
> +		return -EINVAL;
> +	}
> +	i2sin4_priv->ip_mode = ip_mode;
> +	dev_dbg(afe->dev, "%s() mediatek,etdm-ip-mode: %d\n", __func__, ip_mode);
> +
> +	return 0;
> +}
> +
> +static int mt8196_dai_i2s_get_share(struct mtk_base_afe *afe)
> +{
> +	struct mt8196_afe_private *afe_priv = afe->platform_priv;
> +	const struct device_node *of_node = afe->dev->of_node;
> +	const char *of_str;
> +	const char *property_name;
> +	struct mtk_afe_i2s_priv *i2s_priv;
> +	int i;
> +
> +	for (i = 0; i < DAI_I2S_NUM; i++) {
> +		i2s_priv = afe_priv->dai_priv[mt8196_i2s_priv[i].id];
> +		property_name = mt8196_i2s_priv[i].share_property_name;
> +		if (of_property_read_string(of_node, property_name, &of_str))
> +			continue;
> +		i2s_priv->share_i2s_id = get_i2s_id_by_name(afe, of_str);
> +	}
> +	return 0;
> +}
> +
> +static int mt8196_dai_i2s_set_priv(struct mtk_base_afe *afe)
> +{
> +	int i;
> +	int ret;
> +
> +	for (i = 0; i < DAI_I2S_NUM; i++) {
> +		ret = mt8196_dai_set_priv(afe, mt8196_i2s_priv[i].id,
> +					  sizeof(struct mtk_afe_i2s_priv),
> +					  &mt8196_i2s_priv[i]);
> +		if (ret)
> +			return ret;
> +	}
> +	return 0;
> +}
> +
> +int mt8196_dai_i2s_register(struct mtk_base_afe *afe)
> +{
> +	struct mtk_base_afe_dai *dai;
> +	int ret;
> +
> +	dev_dbg(afe->dev, "%s() successfully start\n", __func__);

Well, no. Tracing is for debugging entry/exit of functions. Say
something useful or just drop such entry/exist success messages.

> +
> +	dai = devm_kzalloc(afe->dev, sizeof(*dai), GFP_KERNEL);
> +	if (!dai)
> +		return -ENOMEM;
> +
> +	list_add(&dai->list, &afe->sub_dais);
> +
> +	dai->dai_drivers = mtk_dai_i2s_driver;
> +	dai->num_dai_drivers = ARRAY_SIZE(mtk_dai_i2s_driver);
> +
> +	dai->controls = mtk_dai_i2s_controls;
> +	dai->num_controls = ARRAY_SIZE(mtk_dai_i2s_controls);
> +	dai->dapm_widgets = mtk_dai_i2s_widgets;
> +	dai->num_dapm_widgets = ARRAY_SIZE(mtk_dai_i2s_widgets);
> +	dai->dapm_routes = mtk_dai_i2s_routes;
> +	dai->num_dapm_routes = ARRAY_SIZE(mtk_dai_i2s_routes);
> +
> +	/* set all dai i2s private data */
> +	ret = mt8196_dai_i2s_set_priv(afe);
> +	if (ret)
> +		return ret;
> +
> +	/* parse share i2s */
> +	ret = mt8196_dai_i2s_get_share(afe);
> +	if (ret)
> +		return ret;
> +
> +	/* for customer to change ch_num & sync & ipmode from dts */
> +	ret = etdm_parse_dt(afe);
> +	if (ret) {
> +		dev_info(afe->dev, "%s() fail to parse dts: %d\n", __func__, ret);

Why do you print errors twice?

> +		return ret;
> +	}
> +
> +	return 0;
> +}


Best regards,
Krzysztof

