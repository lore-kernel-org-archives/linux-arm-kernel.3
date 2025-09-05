Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 908C0CA1013
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Sep 2025 09:48:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vnXYVVdsIAMxLXHF8nIDDdNKoE2J8PUDyP9C3zelP1U=; b=V5LiddzdHhjWisTmpZDEJqFvh0
	gf75kfNTbIP+82IV+ngnmCkFWjdFWCRVnNK+BzSV4uG5eJBoIPqAL0e0sdPoM4z+e2miP4XhaMRcL
	5hDD6OKCYzQ9BonImfAjMB9uNuA+QdVwzImhZZqbeSzK5qqVdsq009B8L/zZKcFL076UOputIOcLP
	ECD+l+hkieltVZK9/oymFKU6NH8bl7+HRa0DItHna/XVdzoOj7sfWyoR/R7UCL4fl+bB+sl81HpiS
	QQuuAxnp6kJwhU1NLqloqWbGKOxH9ZpjgyEz3gkHcm5YW+KF3Zf7HFe0LffTkih6cKPPGdrrvB6yL
	uJQYh9Gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuT3s-00000000qYt-1s9j;
	Fri, 05 Sep 2025 09:48:52 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuRgQ-00000000JuY-2TBv;
	Fri, 05 Sep 2025 08:20:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1757060432;
	bh=fvvYld9Sx9cpIAFh8bm7RCs6V/pbPldioba2BeMv12M=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=bSV46OmbR79MUBmJf7WLPrjpuI4dxMHMZCck6lkSMnpZs5Hu1Z16X4HFBJwK0GUed
	 yhOP5nFISWI6gijaY44mBWj/0p9l/O3DGrYPyBg5AG1YWdkl7RTxmRGJ5BRBvhPHQy
	 Y8qS12VxhJel6zXWINhu9qE0TVhHO7PbLis80o2jjW6AtnnU671TYKKjyOzpqQmPrJ
	 Prod7n+vw0l/LLFh+VqEF4UHncN6Md4cspu1ybuJ4lhIf1Hlq1IViDJOmnAQMatHpP
	 nqU51czJpWNtrsQx8rD1HTwcAqqLBFoP9Y6AhZqKCXSp92H0Lv2MSleg6SzY3Egcvh
	 tZS1+8sULb3iQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id EF44917E0A29;
	Fri,  5 Sep 2025 10:20:31 +0200 (CEST)
Message-ID: <4a37f32e-2f30-468b-98f4-b68bcf8e85f1@collabora.com>
Date: Fri, 5 Sep 2025 10:20:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 13/27] clk: mediatek: Add MT8196 vlpckgen clock support
To: Laura Nao <laura.nao@collabora.com>, mturquette@baylibre.com,
 sboyd@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 matthias.bgg@gmail.com, p.zabel@pengutronix.de, richardcochran@gmail.com
Cc: guangjie.song@mediatek.com, wenst@chromium.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
 kernel@collabora.com
References: <20250829091913.131528-1-laura.nao@collabora.com>
 <20250829091913.131528-14-laura.nao@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250829091913.131528-14-laura.nao@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250905_012034_807884_51D87DCF 
X-CRM114-Status: GOOD (  18.96  )
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

Il 29/08/25 11:18, Laura Nao ha scritto:
> Add support for the MT8196 vlpckgen clock controller, which provides
> muxes and dividers for clock selection in other IP blocks.
> 
> Signed-off-by: Laura Nao <laura.nao@collabora.com>
> ---
>   drivers/clk/mediatek/Makefile              |   2 +-
>   drivers/clk/mediatek/clk-mt8196-vlpckgen.c | 729 +++++++++++++++++++++
>   2 files changed, 730 insertions(+), 1 deletion(-)
>   create mode 100644 drivers/clk/mediatek/clk-mt8196-vlpckgen.c
> 
> diff --git a/drivers/clk/mediatek/Makefile b/drivers/clk/mediatek/Makefile
> index c415453e02fd..031e7ac38804 100644
> --- a/drivers/clk/mediatek/Makefile
> +++ b/drivers/clk/mediatek/Makefile
> @@ -151,7 +151,7 @@ obj-$(CONFIG_COMMON_CLK_MT8195_VENCSYS) += clk-mt8195-venc.o
>   obj-$(CONFIG_COMMON_CLK_MT8195_VPPSYS) += clk-mt8195-vpp0.o clk-mt8195-vpp1.o
>   obj-$(CONFIG_COMMON_CLK_MT8195_WPESYS) += clk-mt8195-wpe.o
>   obj-$(CONFIG_COMMON_CLK_MT8196) += clk-mt8196-apmixedsys.o clk-mt8196-topckgen.o \
> -				   clk-mt8196-topckgen2.o
> +				   clk-mt8196-topckgen2.o clk-mt8196-vlpckgen.o
>   obj-$(CONFIG_COMMON_CLK_MT8365) += clk-mt8365-apmixedsys.o clk-mt8365.o
>   obj-$(CONFIG_COMMON_CLK_MT8365_APU) += clk-mt8365-apu.o
>   obj-$(CONFIG_COMMON_CLK_MT8365_CAM) += clk-mt8365-cam.o
> diff --git a/drivers/clk/mediatek/clk-mt8196-vlpckgen.c b/drivers/clk/mediatek/clk-mt8196-vlpckgen.c
> new file mode 100644
> index 000000000000..c38d1e80a5ba
> --- /dev/null
> +++ b/drivers/clk/mediatek/clk-mt8196-vlpckgen.c
> @@ -0,0 +1,729 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2025 MediaTek Inc.
> + *                    Guangjie Song <guangjie.song@mediatek.com>
> + * Copyright (c) 2025 Collabora Ltd.
> + *                    Laura Nao <laura.nao@collabora.com>
> + */

..snip..

> +
> +static const char * const vlp_noc_vlp_parents[] = {
> +	"clk26m",
> +	"osc_d20",
> +	"mainpll_d9"
> +};
> +
> +static const char * const vlp_audio_h_parents[] = {
> +	"clk26m",

Please remove clk26m from this list (and from engen1/2/intbus).
We shall either use vlp_clk26m or clk26m directly - and I suspect that the VLP
specific 26m one is there for a reason.

What I'm not sure of is whether vlp_clk26m is really parented to clk26m or if it
is an additional internal crystal, but let's be cautious for now and keep the
parenting.

> +	"vlp_clk26m",
> +	"vlp_apll1",
> +	"vlp_apll2"
> +};
> +
> +static const char * const vlp_aud_engen1_parents[] = {
> +	"clk26m",
> +	"vlp_clk26m",
> +	"apll1_d8",
> +	"apll1_d4"
> +};
> +
> +static const char * const vlp_aud_engen2_parents[] = {
> +	"clk26m",
> +	"vlp_clk26m",
> +	"apll2_d8",
> +	"apll2_d4"
> +};
> +
> +static const char * const vlp_aud_intbus_parents[] = {
> +	"clk26m",
> +	"vlp_clk26m",
> +	"mainpll_d7_d4",
> +	"mainpll_d4_d4"
> +};
> +
> +static const u8 vlp_aud_parent_index[] = { 1, 2, 3 };

... of course, this index list doesn't match the parents list, so this will
break all of the clocks above because you're selecting wrong index in HW and
ignoring the last entry as well, producing a clock rate mismatch.

Once the clk26m is dropped from the names list, though, this index list becomes
valid.

After fixing:

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



