Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1717BC677C4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Jun 2025 14:53:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PsqFPhhwmaCsa4vXg/mFB286PrcXGx5Y8aFvc9FKgqo=; b=3AVMo8ogqoIj3BTrAfOU9CbT1S
	Ty83TS5u9XJ10EFALlSW6Uwnm6ppq29wfXKpXIkEeL/vsm0dpC3MAvHGP1Hx0LOvQ097vtpzRRAZM
	RJVl7AmR+FRQyu6YiCiHGQ+y1UmAB1OSALxnjfk8PSFWoMTRD5EjhKmYXtyJmM6TON4RXJGMLGr2E
	0FBDC7Zn/hFoQyDvOcSW7dTKr8Btk5QZpKRRgvWXXXoyndefX+sdfSo+juEkeUPUajN8xXya+n3ye
	WpmkldbhNmpxNsmCHddDGz9GYVuSwmYOmB6SpsOpBr/2PuwVj6cL4cGRpJyby65Mqv3zAv8KzSl8Y
	x971BZtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPMpN-0000000AH98-2My3;
	Wed, 11 Jun 2025 14:53:21 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPJQ1-00000009j2T-1BHZ;
	Wed, 11 Jun 2025 11:14:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1749640495;
	bh=xoTzQij77wJqxKu/8WOJivHo5xvIanP8StGNmp1ewxg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=UW/oVHTA/HuPIQy39vzAQ7DA1PBC85oXq9visjD+/znO4tH1rAuNncJk7GIpCza8Z
	 NkJYneqv/byx/sB3AzA9mHYHsVnvMDH39Qzg+cJxGpZYLqMw35tG4YtCW/UlBljvgt
	 SSHevCKLFTzbtMwSM7OG5tJMAs7FxDqJNOYYId38nYUePx/y8g65jhRAeKj6T129bb
	 tYyvyPRuaamYqgV+zK5zS9OaGByXCmkMrUX/QYs8wz03ouNmTyfU1W0IeiGKep1pYI
	 RKF0sX21fDaXM0/WJANlVHC8WLQq2/DeV+6iLHMj49MhbCbChRJJFCSei0rjNEDSZl
	 mUWhfOw23cFNQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 8EA3D17E10F8;
	Wed, 11 Jun 2025 13:14:54 +0200 (CEST)
Message-ID: <5cf01f45-ea0b-421e-81a7-163c069aeaf0@collabora.com>
Date: Wed, 11 Jun 2025 13:14:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 01/10] ASoC: mediatek: common: modify mtk afe platform
 driver for mt8196
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
References: <20250610092852.21986-1-darren.ye@mediatek.com>
 <20250610092852.21986-2-darren.ye@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250610092852.21986-2-darren.ye@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_041457_493285_6F216BCA 
X-CRM114-Status: GOOD (  13.20  )
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

Il 10/06/25 11:27, Darren.Ye ha scritto:
> From: Darren Ye <darren.ye@mediatek.com>
> 
> Mofify the pcm pointer interface to support 64-bit address access.
> 
> Signed-off-by: Darren Ye <darren.ye@mediatek.com>
> ---
>   .../mediatek/common/mtk-afe-platform-driver.c | 47 ++++++++++++-------
>   .../mediatek/common/mtk-afe-platform-driver.h |  2 +
>   2 files changed, 33 insertions(+), 16 deletions(-)
> 
> diff --git a/sound/soc/mediatek/common/mtk-afe-platform-driver.c b/sound/soc/mediatek/common/mtk-afe-platform-driver.c
> index 6b6330583941..a86594dca2b7 100644
> --- a/sound/soc/mediatek/common/mtk-afe-platform-driver.c
> +++ b/sound/soc/mediatek/common/mtk-afe-platform-driver.c

..snip..

> diff --git a/sound/soc/mediatek/common/mtk-afe-platform-driver.h b/sound/soc/mediatek/common/mtk-afe-platform-driver.h
> index fcc923b88f12..9809e60db511 100644
> --- a/sound/soc/mediatek/common/mtk-afe-platform-driver.h
> +++ b/sound/soc/mediatek/common/mtk-afe-platform-driver.h
> @@ -12,6 +12,8 @@
>   #define AFE_PCM_NAME "mtk-afe-pcm"
>   extern const struct snd_soc_component_driver mtk_afe_pcm_platform;
>   
> +#define MTK_WORD_SIZE_ALIGN(x) ((x) & (0xfffffffff0))

This doesn't really look like alignment to me, so perhaps change the macro name.
Also, please use the GENMASK macro.

0xfffffffff0 -> GENMASK(39, 4)

after which:

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> +
>   struct mtk_base_afe;
>   struct snd_pcm;
>   struct snd_soc_component;



