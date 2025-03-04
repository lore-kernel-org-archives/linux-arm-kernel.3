Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3A24C282D2
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 16:52:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S3lw51WNIj2UBMkh0b4v5ydnAMx2f32XdKKOY+LvIFo=; b=xppQ8qHCm/V513LKBwsyyL6IKc
	gLIvI25/usyYDS9dxhm+WM0sxS130X0/C10yZVg6GTkV7w2u8DmxoGmcFiRgCJerJi8spld0iJB7S
	TVCLKw+D/0VKJV4RbvhmdIgo3Sa4uGR+Vv6v2mEG02o0v5svbHc0r0A/CwiBlSnSlmhaEKCMj0rQ0
	GO/xDDr9LI3ytGU/YA4+YTyIhLwZOgNRmmESxnoFmqc+t68+eCe5eeD78Ttdsdqlk59y8J5RrMZdU
	YBgDYsh6dsjbjilSYFOLlTs6RFgNUCh6sYMI2x4JdwAF+XMebmUYA6vPwOWObcIeSgkJtfn9PB+sx
	44s+tRXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpVVR-00000005VHZ-3CRp;
	Tue, 04 Mar 2025 16:52:33 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpUMq-00000005FfW-1Kqz;
	Tue, 04 Mar 2025 15:39:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1741102774;
	bh=rTHmT8TPyQxFKshMV+NQu7E2dxKgvKj/LvmOG4VU9oY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=cVjvZFOOXNP5ur8KYe6/kegXSszckIo+mMM+zkWOZ/119TzPiTpmuCTjOW5jXnQwY
	 mClRlZKwAoI/WqSgONgZp4AD+S8wm/IT++GZbg6xFOC5pgGGa3XumVxCUT7pfeM03g
	 LXnYh8FNvU+mg8qAhgmmBRi+2cAN5oDfpjlEg1yoBEjGCuWPs6WyUGEdjX/NpNr3H5
	 gPNyqWEVSSbvRqrQQDV8tfOVpbbXsZsRUlXWCR04A4b/c1Lep7bEmIskFuj/WWPw5x
	 /R3usM2B5r9V6Z7G+0gWx26Ye5p9QqaimHhvT6jucLLcz/3QQCT14HwK+GVzjWDP1B
	 1WygIuFL+HwKA==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9257D17E087F;
	Tue,  4 Mar 2025 16:39:33 +0100 (CET)
Message-ID: <d976b28d-f44f-4d51-8b61-4c046c571412@collabora.com>
Date: Tue, 4 Mar 2025 16:39:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] ASoC: mediatek: mt8188-mt6359: Add headset jack
 detect support
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Trevor Wu <trevor.wu@mediatek.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: kernel@collabora.com, linux-sound@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Zoran Zhan <zoran.zhan@mediatek.com>
References: <20250214-mt8188-accdet-v1-0-6bbd5483855b@collabora.com>
 <20250214-mt8188-accdet-v1-3-6bbd5483855b@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250214-mt8188-accdet-v1-3-6bbd5483855b@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_073936_529150_C62D1F87 
X-CRM114-Status: GOOD (  26.85  )
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

Il 14/02/25 16:14, Nícolas F. R. A. Prado ha scritto:
> Enable headset jack detection for MT8188 platforms using the MT6359
> ACCDET block for it.
> 
> Co-developed-by: Zoran Zhan <zoran.zhan@mediatek.com>
> Signed-off-by: Zoran Zhan <zoran.zhan@mediatek.com>
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> ---
>   sound/soc/mediatek/mt8188/mt8188-mt6359.c | 43 +++++++++++++++++++++++++++++++
>   1 file changed, 43 insertions(+)
> 
> diff --git a/sound/soc/mediatek/mt8188/mt8188-mt6359.c b/sound/soc/mediatek/mt8188/mt8188-mt6359.c
> index 2d0d04e0232da07ba43a030b14853322427d55e7..4e19e6cfad1e1f42863b2e2f27131f880c5883bf 100644
> --- a/sound/soc/mediatek/mt8188/mt8188-mt6359.c
> +++ b/sound/soc/mediatek/mt8188/mt8188-mt6359.c
> @@ -17,6 +17,7 @@
>   #include "mt8188-afe-common.h"
>   #include "../../codecs/nau8825.h"
>   #include "../../codecs/mt6359.h"
> +#include "../../codecs/mt6359-accdet.h"
>   #include "../../codecs/rt5682.h"
>   #include "../common/mtk-afe-platform-driver.h"
>   #include "../common/mtk-soundcard-driver.h"
> @@ -266,6 +267,17 @@ static struct snd_soc_jack_pin nau8825_jack_pins[] = {
>   	},
>   };
>   
> +static struct snd_soc_jack_pin mt8188_headset_jack_pins[] = {

This is the same as nau8825_jack_pins... perhaps we could reuse that?

> +	{
> +		.pin    = "Headphone",
> +		.mask   = SND_JACK_HEADPHONE,
> +	},
> +	{
> +		.pin    = "Headset Mic",
> +		.mask   = SND_JACK_MICROPHONE,
> +	},
> +};
> +
>   static const struct snd_kcontrol_new mt8188_dumb_spk_controls[] = {
>   	SOC_DAPM_PIN_SWITCH("Ext Spk"),
>   };
> @@ -500,6 +512,35 @@ static int mt8188_mt6359_mtkaif_calibration(struct snd_soc_pcm_runtime *rtd)
>   	return 0;
>   }
>   
> +static int mt8188_mt6359_accdet_init(struct snd_soc_pcm_runtime *rtd)
> +{
> +	struct mtk_soc_card_data *soc_card_data = snd_soc_card_get_drvdata(rtd->card);
> +	struct snd_soc_jack *jack = &soc_card_data->card_data->jacks[MT8188_JACK_HEADSET];
> +	int ret;
> +
> +	if (!soc_card_data->accdet)
> +		return 0;

I'm not sure... if we have mediatek,accdet (so accdet is present here), but we also
have a NAU8825, or RT5682S, or ES8326 codec, this function will create a headset
jack for MT6359, but then mt8188_headset_codec_init() will do the same again!

I think we should find a way to avoid that situation, as I'm mostly sure that this
will give issues in the long run.

Even if it wouldn't, having two headset jacks exposed, of which one doesn't work
because it doesn't exist on the physical board... would be confusing for the user.

I guess that the best option here would be:
  - Let the `for_each_card_prelinks()` loop finish
  - Check if any of the external codecs are providing 3.5mm jack
    - External codec providing jack means that the detection should be performed
      by the external codec, as the jack should not be physically routed to the
      MediaTek ACCDET related PMIC pins (right?)
    - No external codec means that the accessory detection can only be performed
      by the MediaTek ACCDET IP
  - If external codec manages 3.5mm jack: do nothing
  - If no external codec managing 3.5mm jack: check if accdet provided in DT and
    initialize it

....unless I'm wrong - and if I am, please explain why (and also add explanation
to the commit description).

Cheers,
Angelo

> +
> +	ret = snd_soc_card_jack_new_pins(rtd->card, "Headset Jack",
> +				   SND_JACK_HEADSET | SND_JACK_BTN_0 |
> +				   SND_JACK_BTN_1 | SND_JACK_BTN_2 |
> +				   SND_JACK_BTN_3,
> +				   jack, mt8188_headset_jack_pins,
> +				   ARRAY_SIZE(mt8188_headset_jack_pins));
> +	if (ret) {
> +		dev_err(rtd->dev, "Headset Jack create failed: %d\n", ret);
> +		return ret;
> +	}
> +
> +	ret = mt6359_accdet_enable_jack_detect(soc_card_data->accdet, jack);
> +	if (ret) {
> +		dev_err(rtd->dev, "Headset Jack enable failed: %d\n", ret);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
>   static int mt8188_mt6359_init(struct snd_soc_pcm_runtime *rtd)
>   {
>   	struct snd_soc_component *cmpnt_codec =
> @@ -512,6 +553,8 @@ static int mt8188_mt6359_init(struct snd_soc_pcm_runtime *rtd)
>   	/* mtkaif calibration */
>   	mt8188_mt6359_mtkaif_calibration(rtd);
>   
> +	mt8188_mt6359_accdet_init(rtd);
> +
>   	return 0;
>   }
>   
> 

