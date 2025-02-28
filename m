Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FBCCC282C5
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Feb 2025 08:51:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Qb0fEuCte1cV4KKThmH3phUv+EhRJsrL0OnHjUns1H8=; b=o8jx2bVHSKckEs5PUHTPXfnYUO
	8D99oTa9Z1fD9OolAYpsBsuaz+tHFSPTVmrnVCxBMEraIYqjqmFJCrrmT8dRH8vus6NPitfzAkBcT
	Azdn7fNgFDKWdYUZK0dGNbTTeCmdPsYga2QJYuj0L9UCj4TCZ41xF/PF57vu5IEBgc0q9l74K78yc
	EQYbDM+SCkdv7PvHVNsl4Cz301R1r87xd5Nn1kYx/bNU4mX0gnjM64sLt3UhNL4ux1pnG4ZBAeUIl
	DKpBhwnKJZBicpxeHzzaZ0bJKGjsUOw3XkZgJkwZY5HMyJqum0Ecg/tUCDj6eXl5tpdTW3jr+9vJY
	EcBUaXPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnw5k-0000000AFYZ-2MOK;
	Fri, 28 Feb 2025 08:51:32 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnw43-0000000AFJO-2Omn;
	Fri, 28 Feb 2025 08:49:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1740732585;
	bh=hrumNHzaFlpOdg+6QSUhWy9VTkbT/XcBYRpYCCjZgnA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=UimGJTRL1tIv6J8a8JGGrwRYcp09VlmGWndhoaSNzJsNgxU7hQA+ao4Hq0/GfWjF/
	 wxZlEyGFhmniAZCDvHnliCz6foiyg93iX2PxNAMnvCVILMxcdbdPtG+v+LzyIa9uVg
	 /cxkO/SDiSu7lp/WfOTz6TvsqMWffZ5CRVsj+kX0m2TqeogpBHN39xDbQ+Hms7RYfF
	 iG7A4vICu1W0aLiHAaY8dHohFzpKOwrgb98xtrrUJU7EXReL6fK+YSac6vO7UgOpFP
	 ltTukYslZX6JP4UFZH5FF2SIQ9aoNvaApYT+K1rM1ucXDqWj0o1flWr/Xc5Zw428CE
	 Qhp9PqIESQVhA==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A97DB17E0673;
	Fri, 28 Feb 2025 09:49:44 +0100 (CET)
Message-ID: <4ae2ef45-93c8-4cac-8331-0962085cea10@collabora.com>
Date: Fri, 28 Feb 2025 09:49:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/3] pinctrl: mediatek: Add pinctrl driver on mt8196
To: Cathy Xu <ot_cathy.xu@mediatek.com>,
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Sean Wang <sean.wang@kernel.org>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, Yong Mao <yong.mao@mediatek.com>,
 Axe Yang <axe.yang@mediatek.com>, Wenbin Mei <wenbin.mei@mediatek.com>,
 Lei Xue <lei.xue@mediatek.com>, Guodong Liu <guodong.liu@mediatek.com>
References: <20250228011702.16493-1-ot_cathy.xu@mediatek.com>
 <20250228011702.16493-4-ot_cathy.xu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250228011702.16493-4-ot_cathy.xu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250228_004947_797508_813F9A3F 
X-CRM114-Status: GOOD (  21.95  )
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

Il 28/02/25 02:16, Cathy Xu ha scritto:
> From: Guodong Liu <guodong.liu@mediatek.com>
> 
> Add pinctrl driver support for MediaTek Soc mt8196.
> 
> Signed-off-by: Guodong Liu <guodong.liu@mediatek.com>
> Signed-off-by: Cathy Xu <ot_cathy.xu@mediatek.com>
> ---
>   drivers/pinctrl/mediatek/Kconfig              |   12 +
>   drivers/pinctrl/mediatek/Makefile             |    1 +
>   drivers/pinctrl/mediatek/pinctrl-mt8196.c     | 1857 +++++++++++
>   drivers/pinctrl/mediatek/pinctrl-mtk-mt8196.h | 2789 +++++++++++++++++
>   4 files changed, 4659 insertions(+)
>   create mode 100644 drivers/pinctrl/mediatek/pinctrl-mt8196.c
>   create mode 100644 drivers/pinctrl/mediatek/pinctrl-mtk-mt8196.h
> 
> diff --git a/drivers/pinctrl/mediatek/Kconfig b/drivers/pinctrl/mediatek/Kconfig
> index 58f32818a0e6..b59d94a0fe3b 100644
> --- a/drivers/pinctrl/mediatek/Kconfig
> +++ b/drivers/pinctrl/mediatek/Kconfig
> @@ -263,6 +263,18 @@ config PINCTRL_MT8195
>   	default ARM64 && ARCH_MEDIATEK
>   	select PINCTRL_MTK_PARIS
>   
> +config PINCTRL_MT8196
> +	bool "MediaTek MT8196 pin control"
> +	depends on OF
> +	depends on ARM64 || COMPILE_TEST
> +	default ARM64 && ARCH_MEDIATEK
> +	select PINCTRL_MTK_PARIS
> +	help
> +	  Say yes here to support pin controller and gpio driver
> +	  on MediaTek MT8196 SoC.
> +	  In MTK platform, we support virtual gpio and use it to
> +	  map specific eint which doesn't have real gpio pin.
> +
>   config PINCTRL_MT8365
>   	bool "MediaTek MT8365 pin control"
>   	depends on OF
> diff --git a/drivers/pinctrl/mediatek/Makefile b/drivers/pinctrl/mediatek/Makefile
> index 721ae83476d0..08e7239fcd8b 100644
> --- a/drivers/pinctrl/mediatek/Makefile
> +++ b/drivers/pinctrl/mediatek/Makefile
> @@ -36,6 +36,7 @@ obj-$(CONFIG_PINCTRL_MT8186)		+= pinctrl-mt8186.o
>   obj-$(CONFIG_PINCTRL_MT8188)		+= pinctrl-mt8188.o
>   obj-$(CONFIG_PINCTRL_MT8192)		+= pinctrl-mt8192.o
>   obj-$(CONFIG_PINCTRL_MT8195)		+= pinctrl-mt8195.o
> +obj-$(CONFIG_PINCTRL_MT8196)		+= pinctrl-mt8196.o
>   obj-$(CONFIG_PINCTRL_MT8365)		+= pinctrl-mt8365.o
>   obj-$(CONFIG_PINCTRL_MT8516)		+= pinctrl-mt8516.o
>   obj-$(CONFIG_PINCTRL_MT6397)		+= pinctrl-mt6397.o
> diff --git a/drivers/pinctrl/mediatek/pinctrl-mt8196.c b/drivers/pinctrl/mediatek/pinctrl-mt8196.c
> new file mode 100644
> index 000000000000..1baefdc7e36d
> --- /dev/null
> +++ b/drivers/pinctrl/mediatek/pinctrl-mt8196.c
> @@ -0,0 +1,1857 @@

..snip..

> +
> +static const struct mtk_pin_soc mt8196_data = {
> +	.reg_cal = mt8196_reg_cals,
> +	.pins = mtk_pins_mt8196,
> +	.npins = ARRAY_SIZE(mtk_pins_mt8196),
> +	.ngrps = ARRAY_SIZE(mtk_pins_mt8196),
> +	.eint_hw = &mt8196_eint_hw,
> +	.nfuncs = 8,
> +	.gpio_m = 0,
> +	.base_names = mt8196_pinctrl_register_base_names,
> +	.nbase_names = ARRAY_SIZE(mt8196_pinctrl_register_base_names),
> +	.pull_type = mt8196_pull_type,
> +	.pin_rsel = mt8196_pin_rsel_val_range,
> +	.npin_rsel = ARRAY_SIZE(mt8196_pin_rsel_val_range),
> +	.bias_set_combo = mtk_pinconf_bias_set_combo,
> +	.bias_get_combo = mtk_pinconf_bias_get_combo,
> +	.drive_set = mtk_pinconf_drive_set_rev1,
> +	.drive_get = mtk_pinconf_drive_get_rev1,
> +	.adv_drive_get = mtk_pinconf_adv_drive_get_raw,
> +	.adv_drive_set = mtk_pinconf_adv_drive_set_raw,

In the cover letter, you said:

"Add values in SI units option to |struct mtk_pin_soc| in pinctrl-mt8196.c"

....I don't see that here though?

> +};
> +
> +static const struct of_device_id mt8196_pinctrl_of_match[] = {
> +	{ .compatible = "mediatek,mt8196-pinctrl", .data = &mt8196_data },
> +	{ }

{ /* sentinel */ }

> +};
> +
> +static struct platform_driver mt8196_pinctrl_driver = {
> +	.driver = {
> +		.name = "mt8196-pinctrl",
> +		.of_match_table = mt8196_pinctrl_of_match,
> +		.pm = pm_sleep_ptr(&mtk_paris_pinctrl_pm_ops),
> +	},
> +	.probe = mtk_paris_pinctrl_probe,
> +};
> +
> +static int __init mt8196_pinctrl_init(void)
> +{
> +	return platform_driver_register(&mt8196_pinctrl_driver);
> +}
> +arch_initcall(mt8196_pinctrl_init);
> +
> +MODULE_DESCRIPTION("MediaTek MT8196 Pinctrl Driver");

MODULE_LICENSE is missing!

Cheers,
Angelo

> diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-mt8196.h b/drivers/pinctrl/mediatek/pinctrl-mtk-mt8196.h
> new file mode 100644
> index 000000000000..d342d091672c

