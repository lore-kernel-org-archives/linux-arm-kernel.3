Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EC24C19F32
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 17:20:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5kSxBBmXLp5znuvDpyfInXgp33ac9fBkMm+7i47g4Mo=; b=bHErNTxmHVpb7aj0aLVtQhKYyS
	7TsjuY9PzbUWuFu1u8/KQvMNqDL2vFdz09Du8QQt5LDyzVc+R/IuFXPdYftmF8G2d6pyCgZVvq/oM
	FkpqhMgj8qh9UdU9sbE2tO9PI0MbtdNW6TXUpgDo0H1VUMw1TRtJjYOhIUtPhgfPIsCOWr1OFUt+p
	Gfu4cTPJWCboQp6C/QQB6cAglXmgk4jjHxp7iBixKIXcFo3CvM7QlR7GWkUNYVhuyoWy+X2v/mUlB
	mL6XpkGs6U5vDwiEsVLvHnXJU9Xg0bmW8gG0SofBqxVXIXDvjLWUM6l/G158wf0gsuQDj+pAKK0Ec
	0E5GwR/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpsQF-00000008mq1-3CkL;
	Wed, 05 Mar 2025 17:20:43 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpsOK-00000008maW-2sNv;
	Wed, 05 Mar 2025 17:18:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1741195122;
	bh=VLo1VfKrncc62HR3H2AUBFVFZ8nlgV/Ud1MBfjGjdvc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=aTA7ZkljZ0mv/kvuFSL6iNhvjnFmepeIqml6cipt78WQCD8DVBYT4ayvgJNa8bDxZ
	 9eyAoRiJFFSLFDUWN/eYHS4iFF6gG1x21l6eC4OVpNq/LxPxUV3Kag5RH38TpsPS/D
	 Tj9X1QpmSv3XQOhFpvb0ppJ+71rYZJYxdGx3fjlIjSJoyRErnnPsUJr4+UABm9pOsV
	 zvkQTu++r3FyH99pMIh36+wrVRM2D62KYLydeDBpxWVRFPd9abf/Yrr0CpuM1WqXDZ
	 9TzubIlTg/b9ZFaTPbSF20cGG5fT6j1ItwO37jslD/R4XNdUZWZvBK9rMQE+SSp8PI
	 FpzVtRGmCqe2w==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id DB02417E0599;
	Wed,  5 Mar 2025 18:18:41 +0100 (CET)
Message-ID: <59d0d382-1d15-46c4-b9e4-b66c32c188d3@collabora.com>
Date: Wed, 5 Mar 2025 18:18:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] ASoC: mediatek: mt8188-mt6359: Add accdet headset
 jack detect support
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
References: <20250304-mt8188-accdet-v2-0-27f496c4aede@collabora.com>
 <20250304-mt8188-accdet-v2-3-27f496c4aede@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250304-mt8188-accdet-v2-3-27f496c4aede@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_091844_880848_00B29DF6 
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

Il 04/03/25 22:35, Nícolas F. R. A. Prado ha scritto:
> Enable headset jack detection for MT8188 platforms that use the MT6359
> ACCDET block for it, indicated by the mediatek,accdet property in DT.
> For those platforms, register a jack and initialize the ACCDET block to
> report jack events through it.
> 
> Co-developed-by: Zoran Zhan <zoran.zhan@mediatek.com>
> Signed-off-by: Zoran Zhan <zoran.zhan@mediatek.com>
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

We chatted about the issue that I raised before with mt8188_headset_jack_pins[],
it's fine to have it for now, as whatever we do with that would still duplicate
things and there's no way around that for now.

The sound card driver should get a bigger cleanup anyway, and it's not really
possible even because otherwise we'd break UCM2 confs, so it is what it is.

> ---
>   sound/soc/mediatek/Kconfig                |  1 +
>   sound/soc/mediatek/mt8188/mt8188-mt6359.c | 43 +++++++++++++++++++++++++++++++
>   2 files changed, 44 insertions(+)
> 
> diff --git a/sound/soc/mediatek/Kconfig b/sound/soc/mediatek/Kconfig
> index 3033e2d3fe16840631a465dd967da77f7a6ff43c..64155ea7965a1cc50593fef442ce90761836f328 100644
> --- a/sound/soc/mediatek/Kconfig
> +++ b/sound/soc/mediatek/Kconfig
> @@ -237,6 +237,7 @@ config SND_SOC_MT8188_MT6359
>   	select SND_SOC_NAU8825
>   	select SND_SOC_RT5682S
>   	select SND_SOC_ES8326
> +	select SND_SOC_MT6359_ACCDET

The only remaining complaint that I have is that this driver shouldn't really
add a select SND_SOC_MT6359_ACCDET.

Instead, the mt6359-accdet.h header should be modified to stub-ify the accdet
driver functions in the case in which it's not built in, or not available as a
module anyway.

This is because the accdet driver is not *mandatory* for this driver to work,
and being it an optional peripheral, adding a dependency doesn't really make
a lot of sense as it'd only force in bloat when not wanted.

So...

Get to that mt6359-accdet.h header and:

#if IS_ENABLED(CONFIG_SND_SOC_MT6359_ACCDET)

function signatures

#else

static .... { return -EINVAL; (or whatever else) }

#endif

That said, for the future v3 of this commit, after removing the select
SND_SOC_MT6359_ACCDET (and granted that the proposed header fix is in place),
you can add my

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Cheers,
Angelo



