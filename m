Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 856CEC54ED1
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Jun 2025 12:41:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AV6ecRy1FIw9Z8AXRVF12+h79fjGzpjMLNoeiQPW+Lw=; b=J7vUAPAybx7+tDGnw4ycuKcJHA
	OgQlLCfaCriHRQ2Xl1stNCEZ7QKwxgCaLbqFDrhYFSW0P4wxq6k+LnUK2sQhXju+zelQknP3MF73i
	fWTqr0cp4oL1cbSdO8eBefO1WDlvSSPB7R6owo3qEecMXd4ykPWG+z9VkqH48z+p7ssAlhQQCUloj
	+fTB1T090c04PL7+q+MrWGvFAXb1Bh5fMhH9OY7kWxGu3mWuxPe8/3fQtwqsrnjhAT39KnliNyqWv
	2cDSWDovrSGfb2FukYHS0zKwgH5ND4HkjPKa+mtqIBru4bCNHkdVyGghh7GAaiPk1hw8PldYd5TNm
	W7g1QBIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVUsB-0000000GnEX-3Nq5;
	Sat, 28 Jun 2025 12:41:35 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVUps-0000000Gn4E-2rmN;
	Sat, 28 Jun 2025 12:39:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 11C475C0425;
	Sat, 28 Jun 2025 12:39:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F269C4CEEA;
	Sat, 28 Jun 2025 12:39:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751114351;
	bh=dmi0agTyYUOAkBjgP89gMMImE+0G34MTdb2lXfF8kU8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=OaJqTQ92Gj+5SrShSbqsEONa39t606yv2diIz+ViKncQV5irAx/y4lc9VJilRUpx6
	 ugHjdl46nICMfGTt33VnvcM79GmY9osCM9Ij/XFiu6GTT0wzck/IZiQQ7sh2+ROWKd
	 6A1u9FOk2v0xfeSQ1DyrWHytZlpl0/LgV1hbEcN0VO/ADRllQxzpD0UGM5kgPBCO9D
	 dCCuq4sKLDtOZYFXDL7MnaM2XilRNMxH8III1cUH5jSvvDcbxvjgwA1JJZ6Pzgzk9+
	 U8XRjHd4R9Gs0NJFDB7sXPMmcaOxUi7V8uO0aWYYfvr6/3bu0MiubqVBRq1TJAa1pj
	 lsCdem+Hn3Lrw==
Message-ID: <a62e0111-e3b7-4772-9467-3a2927972f6f@kernel.org>
Date: Sat, 28 Jun 2025 14:39:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/10] ASoC: mediatek: mt8189: add machine driver with
 nau8825
To: Cyril <Cyril.Chao@mediatek.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20250628071442.31155-1-Cyril.Chao@mediatek.com>
 <20250628071442.31155-10-Cyril.Chao@mediatek.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <20250628071442.31155-10-Cyril.Chao@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250628_053912_821679_E9CF770B 
X-CRM114-Status: GOOD (  14.55  )
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

On 28/06/2025 09:14, Cyril wrote:
> +
> +static int mt8189_nau8825_soc_card_probe(struct mtk_soc_card_data *soc_card_data, bool legacy)
> +{
> +	struct snd_soc_card *card = soc_card_data->card_data->card;
> +	struct snd_soc_dai_link *dai_link;
> +	bool init_nau8825 = false;
> +	bool init_rt5682s = false;
> +	bool init_rt5650 = false;
> +	bool init_rt5682i = false;
> +	bool init_dumb = false;
> +	int i;
> +
> +	dev_dbg(card->dev, "%s(), legacy: %d\n", __func__, legacy);

Drop probe success/start/finish messages. Pretty useless.

> +
> +	for_each_card_prelinks(card, i, dai_link) {
> +		if (strcmp(dai_link->name, "TDM_DPTX_BE") == 0) {
> +			if (dai_link->num_codecs &&
> +			    strcmp(dai_link->codecs->dai_name, "snd-soc-dummy-dai"))
> +				dai_link->init = mt8189_dptx_codec_init;
> +		} else if (strcmp(dai_link->name, "PCM_0_BE") == 0) {
> +			if (dai_link->num_codecs &&
> +			    strcmp(dai_link->codecs->dai_name, "snd-soc-dummy-dai"))
> +				dai_link->init = mt8189_hdmi_codec_init;
> +		} else if (strcmp(dai_link->name, "I2SOUT0_BE") == 0 ||
> +			   strcmp(dai_link->name, "I2SIN0_BE") == 0) {
> +			if (!strcmp(dai_link->codecs->dai_name, NAU8825_CODEC_DAI)) {
> +				dai_link->ops = &mt8189_nau8825_ops;
> +				if (!init_nau8825) {
> +					dai_link->init = mt8189_headset_codec_init;
> +					dai_link->exit = mt8189_headset_codec_exit;
> +					init_nau8825 = true;
> +				}
> +			} else if (!strcmp(dai_link->codecs->dai_name, RT5682S_CODEC_DAI)) {
> +				dai_link->ops = &mt8189_headset_i2s_ops;
> +				if (!init_rt5682s) {
> +					dai_link->init = mt8189_headset_codec_init;
> +					dai_link->exit = mt8189_headset_codec_exit;
> +					init_rt5682s = true;
> +				}
> +			} else if (!strcmp(dai_link->codecs->dai_name, RT5650_CODEC_DAI)) {
> +				dai_link->ops = &mt8189_headset_i2s_ops;
> +				if (!init_rt5650) {
> +					dai_link->init = mt8189_headset_codec_init;
> +					dai_link->exit = mt8189_headset_codec_exit;
> +					init_rt5650 = true;
> +				}
> +			} else if (!strcmp(dai_link->codecs->dai_name, RT5682I_CODEC_DAI)) {
> +				dai_link->ops = &mt8189_headset_i2s_ops;
> +				if (!init_rt5682i) {
> +					dai_link->init = mt8189_headset_codec_init;
> +					dai_link->exit = mt8189_headset_codec_exit;
> +					init_rt5682i = true;
> +				}
> +			} else {
> +				if (strcmp(dai_link->codecs->dai_name, "snd-soc-dummy-dai")) {
> +					if (!init_dumb) {
> +						dai_link->init = mt8189_dumb_amp_init;
> +						init_dumb = true;
> +					}
> +				}
> +			}
> +		}
> +	}
> +
> +	return 0;
> +}
> +
> +static struct snd_soc_card mt8189_nau8825_soc_card = {
> +	.owner = THIS_MODULE,
> +	.dai_link = mt8189_nau8825_dai_links,
> +	.num_links = ARRAY_SIZE(mt8189_nau8825_dai_links),
> +	.dapm_widgets = mt8189_nau8825_card_widgets,
> +	.num_dapm_widgets = ARRAY_SIZE(mt8189_nau8825_card_widgets),
> +	.dapm_routes = mt8189_nau8825_card_routes,
> +	.num_dapm_routes = ARRAY_SIZE(mt8189_nau8825_card_routes),
> +	.controls = mt8189_nau8825_card_controls,
> +	.num_controls = ARRAY_SIZE(mt8189_nau8825_card_controls),
> +};
> +
> +static const struct mtk_soundcard_pdata mt8189_nau8825_card = {
> +	.card_name = "mt8189_nau8825",
> +	.card_data = &(struct mtk_platform_card_data) {
> +		.card = &mt8189_nau8825_soc_card,
> +		.num_jacks = MT8189_JACK_MAX,
> +		.flags = NAU8825_HS_PRESENT
> +	},
> +	.sof_priv = NULL,
> +	.soc_probe = mt8189_nau8825_soc_card_probe,
> +};
> +
> +static const struct mtk_soundcard_pdata mt8189_rt5650_card = {
> +	.card_name = "mt8189_rt5650",
> +	.card_data = &(struct mtk_platform_card_data) {
> +		.card = &mt8189_nau8825_soc_card,
> +		.num_jacks = MT8189_JACK_MAX,
> +		.flags = RT5650_HS_PRESENT
> +	},
> +	.sof_priv = NULL,
> +	.soc_probe = mt8189_nau8825_soc_card_probe,
> +};
> +
> +static const struct mtk_soundcard_pdata mt8189_rt5682s_card = {
> +	.card_name = "mt8189_rt5682s",
> +	.card_data = &(struct mtk_platform_card_data) {
> +		.card = &mt8189_nau8825_soc_card,
> +		.num_jacks = MT8189_JACK_MAX,
> +		.flags = RT5682S_HS_PRESENT
> +	},
> +	.sof_priv = NULL,
> +	.soc_probe = mt8189_nau8825_soc_card_probe,
> +};
> +
> +static const struct mtk_soundcard_pdata mt8189_rt5682i_card = {
> +	.card_name = "mt8189_rt5682i",
> +	.card_data = &(struct mtk_platform_card_data) {
> +		.card = &mt8189_nau8825_soc_card,
> +		.num_jacks = MT8189_JACK_MAX,
> +		.flags = RT5682I_HS_PRESENT
> +	},
> +	.sof_priv = NULL,
> +	.soc_probe = mt8189_nau8825_soc_card_probe,
> +};
> +
> +#if IS_ENABLED(CONFIG_OF)

Drop, you have warnings now :/

> +static const struct of_device_id mt8189_nau8825_dt_match[] = {
> +	{.compatible = "mediatek,mt8189-nau8825-sound", .data = &mt8189_nau8825_card,},
> +	{.compatible = "mediatek,mt8189-rt5650-sound", .data = &mt8189_rt5650_card,},
> +	{.compatible = "mediatek,mt8189-rt5682s-sound", .data = &mt8189_rt5682s_card,},
> +	{.compatible = "mediatek,mt8189-rt5682i-sound", .data = &mt8189_rt5682i_card,},
> +	{}
> +};
> +
> +MODULE_DEVICE_TABLE(of, mt8189_nau8825_dt_match);
> +#endif
> +
> +static struct platform_driver mt8189_nau8825_driver = {
> +	.driver = {
> +		.name = "mt8189-nau8825",
> +#if IS_ENABLED(CONFIG_OF)

Drop all this ifdefry, not helpful.

> +		.of_match_table = mt8189_nau8825_dt_match,
> +#endif
> +		.pm = &snd_soc_pm_ops,
> +	},
> +	.probe = mtk_soundcard_common_probe,
> +};
> +
> +module_platform_driver(mt8189_nau8825_driver);
> +
> +/* Module information */
> +MODULE_DESCRIPTION("MT8189 NAU8825 ALSA SoC machine driver");
> +MODULE_AUTHOR("Darren Ye <darren.ye@mediatek.com>");
> +MODULE_LICENSE("GPL");
> +MODULE_ALIAS("mt8189 nau8825 soc card");

That's neither needed nor correct. Look how aliases are created first.


Best regards,
Krzysztof

