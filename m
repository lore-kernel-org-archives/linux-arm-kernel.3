Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 240EFC282D3
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 22:29:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JXCVqm/hbSSn+y0sENPQt1ymg4Ig7PymvWMw+I5jFLY=; b=xsDW/ehN9Q6uWmb7ObZRVivdF3
	twULd7xWipKTBNGJPj62ha7Rt/b4OsbdlA30nq2ANR0zAzf71Jc0Wjdinh8cAFteraA3MEq33IaEG
	N/zQhcBNs09sMePS6zUhpPPO5IwqWvFKW40DY7PDqmBVqvcqKAWv0rdGXDFaDro+jserjH2RAufO1
	H3gOFxdNYxci1YEEhQz7HmyBiVd2HApoBrDe42Z7EJmeS41XatRArFHj6hqUInsiaW1khtFfGoe+l
	jcNDmn8b9fyWFj7ElhaJUDpftkAzlijSbP6zHpucp4LmpVXwrdlqxPYJ6QNiqiC3h+T9nUrVqZ14J
	jteOiH4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpalo-00000006Q0X-0Bsj;
	Tue, 04 Mar 2025 22:29:48 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpYna-00000006BD0-1N0Q;
	Tue, 04 Mar 2025 20:23:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1741119411;
	bh=+m3MSI+Wse2/nqsFrLOXWe0hhVL+hryAhIW9WJvUc8E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NNECqxIPqgDEtxC9WNQhyIy2/0BlsbnkQQQ7J3VmPwFXLmxwhcJ+X7zkHWp8SAX7B
	 80IHb7DobMVk8upoZzv8kZ7Ufys9Hv8cVcU53xTnQY9nprqmn2JHwMQ6VhhJ3NVW5i
	 0MuVOIz/bQq7nkZfbkrgbWHLZpEtFgKpeYIsMacQFP5CtPp9LtjWqlrdteyopxakxY
	 cSrHMsNJBsLul3xcQbe8hvEezMHOGJjnWaW18al4Et6xnkoxAIeB3wiAfVgWHkAIK7
	 SFH9XJHNAiatitTFKSLxGGbiHgdue62MXrDC8rFAOELpfqAHr+gPith0ORbN+P2A2d
	 418DLNuKI5Leg==
Received: from notapiano (unknown [IPv6:2804:14c:1a9:53ee::1001])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id B51B417E0630;
	Tue,  4 Mar 2025 21:16:47 +0100 (CET)
Date: Tue, 4 Mar 2025 17:16:45 -0300
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Trevor Wu <trevor.wu@mediatek.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	kernel@collabora.com, linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Zoran Zhan <zoran.zhan@mediatek.com>
Subject: Re: [PATCH 3/3] ASoC: mediatek: mt8188-mt6359: Add headset jack
 detect support
Message-ID: <fc9863ef-8781-46a0-ba8c-6dabd9fb6cdf@notapiano>
References: <20250214-mt8188-accdet-v1-0-6bbd5483855b@collabora.com>
 <20250214-mt8188-accdet-v1-3-6bbd5483855b@collabora.com>
 <d976b28d-f44f-4d51-8b61-4c046c571412@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d976b28d-f44f-4d51-8b61-4c046c571412@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_122330_519660_CD128F1A 
X-CRM114-Status: GOOD (  41.14  )
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

On Tue, Mar 04, 2025 at 04:39:33PM +0100, AngeloGioacchino Del Regno wrote:
> Il 14/02/25 16:14, Nícolas F. R. A. Prado ha scritto:
> > Enable headset jack detection for MT8188 platforms using the MT6359
> > ACCDET block for it.
> > 
> > Co-developed-by: Zoran Zhan <zoran.zhan@mediatek.com>
> > Signed-off-by: Zoran Zhan <zoran.zhan@mediatek.com>
> > Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> > ---
> >   sound/soc/mediatek/mt8188/mt8188-mt6359.c | 43 +++++++++++++++++++++++++++++++
> >   1 file changed, 43 insertions(+)
> > 
> > diff --git a/sound/soc/mediatek/mt8188/mt8188-mt6359.c b/sound/soc/mediatek/mt8188/mt8188-mt6359.c
> > index 2d0d04e0232da07ba43a030b14853322427d55e7..4e19e6cfad1e1f42863b2e2f27131f880c5883bf 100644
> > --- a/sound/soc/mediatek/mt8188/mt8188-mt6359.c
> > +++ b/sound/soc/mediatek/mt8188/mt8188-mt6359.c
> > @@ -17,6 +17,7 @@
> >   #include "mt8188-afe-common.h"
> >   #include "../../codecs/nau8825.h"
> >   #include "../../codecs/mt6359.h"
> > +#include "../../codecs/mt6359-accdet.h"
> >   #include "../../codecs/rt5682.h"
> >   #include "../common/mtk-afe-platform-driver.h"
> >   #include "../common/mtk-soundcard-driver.h"
> > @@ -266,6 +267,17 @@ static struct snd_soc_jack_pin nau8825_jack_pins[] = {
> >   	},
> >   };
> > +static struct snd_soc_jack_pin mt8188_headset_jack_pins[] = {
> 
> This is the same as nau8825_jack_pins... perhaps we could reuse that?

The difference is the pin name: "Headphone Jack", which results in a difference
in the widget's name. I remember you wanted to not have the "Jack" in the
widget's name to standardize it among other MTK platforms, and we could do that
here by dropping it from the nau8825_jack_pins. But since that name is also used
on the audio routes in a few DTs, those would need updating as well:

arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dts
arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dts
arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dts
arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dts
arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dts
arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dts
arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dts
arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dts

The name is not used in upstream alsa-ucm-conf though, so it should be safe to
update.

In any case, I didn't want to expand the scope of this series to that unrelated
change, so that's why I introduced this separate struct, thinking we could
commonize as a later step.

> 
> > +	{
> > +		.pin    = "Headphone",
> > +		.mask   = SND_JACK_HEADPHONE,
> > +	},
> > +	{
> > +		.pin    = "Headset Mic",
> > +		.mask   = SND_JACK_MICROPHONE,
> > +	},
> > +};
> > +
> >   static const struct snd_kcontrol_new mt8188_dumb_spk_controls[] = {
> >   	SOC_DAPM_PIN_SWITCH("Ext Spk"),
> >   };
> > @@ -500,6 +512,35 @@ static int mt8188_mt6359_mtkaif_calibration(struct snd_soc_pcm_runtime *rtd)
> >   	return 0;
> >   }
> > +static int mt8188_mt6359_accdet_init(struct snd_soc_pcm_runtime *rtd)
> > +{
> > +	struct mtk_soc_card_data *soc_card_data = snd_soc_card_get_drvdata(rtd->card);
> > +	struct snd_soc_jack *jack = &soc_card_data->card_data->jacks[MT8188_JACK_HEADSET];
> > +	int ret;
> > +
> > +	if (!soc_card_data->accdet)
> > +		return 0;
> 
> I'm not sure... if we have mediatek,accdet (so accdet is present here), but we also
> have a NAU8825, or RT5682S, or ES8326 codec, this function will create a headset
> jack for MT6359, but then mt8188_headset_codec_init() will do the same again!
> 
> I think we should find a way to avoid that situation, as I'm mostly sure that this
> will give issues in the long run.
> 
> Even if it wouldn't, having two headset jacks exposed, of which one doesn't work
> because it doesn't exist on the physical board... would be confusing for the user.

IMO that situation happening would mean the DT is wrong. If the board has the
headset jack pins wired to a headset codec, and that's responsible for jack
detection, then those pins won't be wired to the ACCDET block, and therefore the
board DT shouldn't have the mediatek,accdet property.

I think you're imagining having the mediatek,accdet property always present, and
the logic you propose would allow specifying a headset codec to essentially
override it (making the mediatek,accdet property useless in this case). But
there can also be boards with no jacks at all, and in those cases we don't want
jack widgets exposed to userspace, so the mediatek,accdet property should be
omitted for those boards, and only present on boards where the ACCDET is
actually wired to.

> 
> I guess that the best option here would be:
>  - Let the `for_each_card_prelinks()` loop finish
>  - Check if any of the external codecs are providing 3.5mm jack
>    - External codec providing jack means that the detection should be performed
>      by the external codec, as the jack should not be physically routed to the
>      MediaTek ACCDET related PMIC pins (right?)
>    - No external codec means that the accessory detection can only be performed
>      by the MediaTek ACCDET IP
>  - If external codec manages 3.5mm jack: do nothing
>  - If no external codec managing 3.5mm jack: check if accdet provided in DT and
>    initialize it
> 
> ....unless I'm wrong - and if I am, please explain why (and also add explanation
> to the commit description).

I can add to the commit message:

Only boards that have jack detection managed by the MT6359 ACCDET block will
have the mediatek,accdet property present.

Thanks,
Nícolas

> 
> Cheers,
> Angelo
> 
> > +
> > +	ret = snd_soc_card_jack_new_pins(rtd->card, "Headset Jack",
> > +				   SND_JACK_HEADSET | SND_JACK_BTN_0 |
> > +				   SND_JACK_BTN_1 | SND_JACK_BTN_2 |
> > +				   SND_JACK_BTN_3,
> > +				   jack, mt8188_headset_jack_pins,
> > +				   ARRAY_SIZE(mt8188_headset_jack_pins));
> > +	if (ret) {
> > +		dev_err(rtd->dev, "Headset Jack create failed: %d\n", ret);
> > +		return ret;
> > +	}
> > +
> > +	ret = mt6359_accdet_enable_jack_detect(soc_card_data->accdet, jack);
> > +	if (ret) {
> > +		dev_err(rtd->dev, "Headset Jack enable failed: %d\n", ret);
> > +		return ret;
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> >   static int mt8188_mt6359_init(struct snd_soc_pcm_runtime *rtd)
> >   {
> >   	struct snd_soc_component *cmpnt_codec =
> > @@ -512,6 +553,8 @@ static int mt8188_mt6359_init(struct snd_soc_pcm_runtime *rtd)
> >   	/* mtkaif calibration */
> >   	mt8188_mt6359_mtkaif_calibration(rtd);
> > +	mt8188_mt6359_accdet_init(rtd);
> > +
> >   	return 0;
> >   }
> > 

