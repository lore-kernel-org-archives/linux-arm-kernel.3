Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01486C87FD2
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Aug 2025 07:52:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vmMyVJ/5rMb78KKUEbNykzKHIlbPOfd9AY/XmKVzJp4=; b=tsn/LXck5ZII4cS4AEohuKQKJ/
	iyRoVCXw1/H/Q8n1cXC3z6JaYojKAJdYLCS+TrjYGGG8o1d4OvuFOxtk+FYcFPrOYF9r1jGe3Bi/l
	UX1E8qSQgC8kf5cZ1eIgGAmCqi2pvlv1HtYX+CTVV03A1+sNsmFxCNJfWNNwhx63nt8+6mj5xqRrz
	/WtAmALwWmBVvKJc6uwfICU18N03ocwzALVtIEGPTTmgPbFbdcBxIpziMimw++lg8ea0IAI7Y6x+R
	Z1tuuqd0Y9yh1B0Skf9tjV0dGFz3V8cR1EvrAOZmJ8Dhbtfpd9XW7JwJp40fk7MJtbQSxyHG/7/8L
	rPxmuArA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhkYy-00000005B1q-2XkP;
	Fri, 01 Aug 2025 07:52:24 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhkM5-000000059ta-2FUO;
	Fri, 01 Aug 2025 07:39:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1754033944;
	bh=wAiPTqgnauUCUB9qcLcvnu642yRlTqzNKg/FCLXG3hw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=CGvqrRC11iEJ2l+58kHuA3tF7uQu74MzunG8cZcQ0+6z8Ggxki17DOYY4LX3MvqgO
	 wV8P8NPAHQpy0rZyOSwe3NLVhQhg82zoJnIwnm0cM6qga9YySzWL/KRuhunzPerzsg
	 1vCNLWUp9Ro9rndQThheFpX67sn6oS4EtbJsS4qvTPhOf8q9Nn4xeEtsC8mHYKlNQK
	 Gi9xY+EsIDII0tOrshYm4xWcbRJZDg2bMtV2c31hzYn+PGcBUFnOAZE2wzPRYgwlF+
	 KY7uB0wAiH7BPKqWlXVo2wLQT1EsjZQiH+Bpxh1Ke7FFPsGmzSArfgK3Mm9pCso4MI
	 wTQrugt6vGF5g==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 4C55617E0202;
	Fri,  1 Aug 2025 09:39:03 +0200 (CEST)
Message-ID: <9b70908a-d664-4f2c-8fd1-3ca280fe7381@collabora.com>
Date: Fri, 1 Aug 2025 09:39:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] soc:mediatek mt8189: Porting driver for spmi/pwrap
To: "niklaus.liu" <niklaus.liu@mediatek.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Flora Fu <flora.fu@mediatek.com>, Alexandre Mergnat <amergnat@baylibre.com>,
 Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20250801070913.3109-1-niklaus.liu@mediatek.com>
 <20250801070913.3109-3-niklaus.liu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250801070913.3109-3-niklaus.liu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250801_003905_731779_2BD630C6 
X-CRM114-Status: GOOD (  19.85  )
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

Il 01/08/25 08:39, niklaus.liu ha scritto:
> Modify spmi/pwrap driver for mt8189
> 
> Signed-off-by: niklaus.liu <niklaus.liu@mediatek.com>
> ---
>   drivers/soc/mediatek/mtk-pmic-wrap.c | 27 +++++++++++++++++++++++++++
>   drivers/spmi/spmi-mtk-pmif.c         |  3 +++
>   2 files changed, 30 insertions(+)
> 
> diff --git a/drivers/soc/mediatek/mtk-pmic-wrap.c b/drivers/soc/mediatek/mtk-pmic-wrap.c
> index 0bcd85826375..e3e8234e29a0 100644
> --- a/drivers/soc/mediatek/mtk-pmic-wrap.c
> +++ b/drivers/soc/mediatek/mtk-pmic-wrap.c
> @@ -1087,6 +1087,17 @@ static const int mt8183_regs[] = {
>   	[PWRAP_WACS2_VLDCLR] =			0xC28,
>   };
>   
> +static int mt8189_regs[] = {
> +	[PWRAP_INIT_DONE2] =		0x0,
> +	[PWRAP_TIMER_EN] =		0x3e4,
> +	[PWRAP_INT_EN] =		0x450,
> +	[PWRAP_WACS2_CMD] =		0x880,
> +	[PWRAP_SWINF_2_WDATA_31_0] =	0x884,
> +	[PWRAP_SWINF_2_RDATA_31_0] =	0x894,
> +	[PWRAP_WACS2_VLDCLR] =		0x8a4,
> +	[PWRAP_WACS2_RDATA] =		0x8a8,
> +};

You can fully reuse mt8195_regs, as mt8189 has the same layout.

> +
>   static const int mt8195_regs[] = {
>   	[PWRAP_INIT_DONE2] =		0x0,
>   	[PWRAP_STAUPD_CTRL] =		0x4C,
> @@ -1324,6 +1335,7 @@ enum pwrap_type {
>   	PWRAP_MT8173,
>   	PWRAP_MT8183,
>   	PWRAP_MT8186,
> +	PWRAP_MT8189,
>   	PWRAP_MT8195,
>   	PWRAP_MT8365,
>   	PWRAP_MT8516,
> @@ -1854,6 +1866,7 @@ static int pwrap_init_cipher(struct pmic_wrapper *wrp)
>   		break;
>   	case PWRAP_MT6873:
>   	case PWRAP_MT8183:
> +	case PWRAP_MT8189:
>   	case PWRAP_MT8195:
>   		break;
>   	}
> @@ -2393,6 +2406,19 @@ static const struct pmic_wrapper_type pwrap_mt8183 = {
>   	.init_soc_specific = pwrap_mt8183_init_soc_specific,
>   };
>   
> +static struct pmic_wrapper_type pwrap_mt8189 = {
> +	.regs = mt8189_regs,
> +	.type = PWRAP_MT8189,
> +	.arb_en_all = 0x777f,
> +	.int_en_all = 0x180000,
> +	.int1_en_all = 0,
> +	.spi_w = PWRAP_MAN_CMD_SPI_WRITE,
> +	.wdt_src = PWRAP_WDT_SRC_MASK_ALL,
> +	.caps = PWRAP_CAP_ARB,

Why are you avoiding to enable the INT1 interrupt on MT8189?

Is this working around a hardware bug, or did you simply forget to enable it?
I think you should really enable it, which means....

> +	.init_reg_clock = pwrap_common_init_reg_clock,
> +	.init_soc_specific = NULL,
> +};
> +
>   static const struct pmic_wrapper_type pwrap_mt8195 = {
>   	.regs = mt8195_regs,
>   	.type = PWRAP_MT8195,
> @@ -2456,6 +2482,7 @@ static const struct of_device_id of_pwrap_match_tbl[] = {
>   	{ .compatible = "mediatek,mt8173-pwrap", .data = &pwrap_mt8173 },
>   	{ .compatible = "mediatek,mt8183-pwrap", .data = &pwrap_mt8183 },
>   	{ .compatible = "mediatek,mt8186-pwrap", .data = &pwrap_mt8186 },
> +	{ .compatible = "mediatek,mt8189-pwrap", .data = &pwrap_mt8189 },

...means that you don't even need to add a new compatible in this list, because
the MT8195 compatible can be reused.

You only have to add the MT8189 compatible to the bindings, so that you are
allowed to specify in your devicetree node

compatible = "mediatek,mt8189-pwrap", "mediatek,mt8195-pwrap";

>   	{ .compatible = "mediatek,mt8195-pwrap", .data = &pwrap_mt8195 },
>   	{ .compatible = "mediatek,mt8365-pwrap", .data = &pwrap_mt8365 },
>   	{ .compatible = "mediatek,mt8516-pwrap", .data = &pwrap_mt8516 },
> diff --git a/drivers/spmi/spmi-mtk-pmif.c b/drivers/spmi/spmi-mtk-pmif.c
> index 160d36f7d238..00420568afef 100644
> --- a/drivers/spmi/spmi-mtk-pmif.c
> +++ b/drivers/spmi/spmi-mtk-pmif.c
> @@ -530,6 +530,9 @@ static const struct of_device_id mtk_spmi_match_table[] = {
>   	{
>   		.compatible = "mediatek,mt6873-spmi",
>   		.data = &mt6873_pmif_arb,
> +	}, {
> +		.compatible = "mediatek,mt8189-spmi",
> +		.data = &mt8195_pmif_arb,

This change is useless. Just add the compatible to the bindings so that you
can specify

compatible = "mediatek,mt8189-spmi", "mediatek,mt8195-spmi";

Regards,
Angelo

