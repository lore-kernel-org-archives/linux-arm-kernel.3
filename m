Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AC36C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Jul 2025 12:24:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SLKDCSBar7TEHGf/3yjKm5ts8mUeyQn6MQragX0irtY=; b=zFONoZ6iMOa0pB3iE3Mg2WyuMg
	pkG+4097z5sHw5OixpbvbrbCXGXwyMAwJ/trnQk7AejiFvN+g7jlrb64v5Zvt/moCUr7LCzuiI7Pb
	zdMqOQ5Htzpt7B2HIacWh/5SM3i9gLFTL8a5LAc8uQOeCfyAWKmLokwvx7VJDo0u1uK0Sc4wwBXNY
	MQZBDRMTIHKFLkc5Ki0mWzWBIJTw+ZceOjuWodIb68Z2JYOuXJuI+4KmdqEsHC7L+ofQPzzzIP6uM
	LcFFTnyYTHiF5kU1qnk1zQOAhUF9etO8S6BfMfN7WGhIgCE9npQFSzWwDYUVuvoawrRXhWX5qJnnl
	WjVtM1vA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucNfN-0000000A6hY-0P93;
	Thu, 17 Jul 2025 12:24:49 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucMB8-00000009u2o-2hQq;
	Thu, 17 Jul 2025 10:49:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1752749368;
	bh=lSP0/9GbrNfw0NFb6DWBwXGSVoqPXgSk/vHOEKnsPg0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=afqILlfAdc29dXdjkvF4I3YSbufR0yN5zVs7ZWdCQnSNZrXwIiIA4WW9e1PQ/k43p
	 Df1AEB2qgK1CcIC2XuMPGOq9i8MF1PgD9lXMQFMyfHMy2qs2lYKYLkDmM6v0Us/shN
	 DeZgcw8OSfYG3OVsnu4GAfPh22EEkfQwIerr8K2enqKMerzEu+rty9auXYe9uCeihA
	 xDeE/B9ljTejzYjPTj+lWQyrWh+2TTo1hlFb/5Ahd9q6yRn0Z8nVafoUvgo1a4iuez
	 mm2tuRwf/QUSDWqydPf4JT/ZMW8F76gshZk4c96BmE7M0kUvnAbtKZ8fWuWGawmgNh
	 khghTJQCBNxeg==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id EE95F17E0C37;
	Thu, 17 Jul 2025 12:49:27 +0200 (CEST)
Message-ID: <327287aa-98c8-4745-adb9-2c36e8d5d825@collabora.com>
Date: Thu, 17 Jul 2025 12:49:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/2] clk: mediatek: Add MT6789 clock controllers
To: Arseniy Velikanov <me@adomerle.pw>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, ~postmarketos/upstreaming@lists.sr.ht
References: <20250715222221.29406-1-me@adomerle.pw>
 <20250715222221.29406-2-me@adomerle.pw>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250715222221.29406-2-me@adomerle.pw>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250717_034930_877952_FB4A7E75 
X-CRM114-Status: GOOD (  20.04  )
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

Il 16/07/25 00:22, Arseniy Velikanov ha scritto:
> Add support for MT6789 clock controllers, which includes apmixed, afe,
> camsys, imgsys, infracfg, mcusys, mdpsys, mfgcfg, mmsys, topckgen,
> vdec, venc.
> 
> Signed-off-by: Arseniy Velikanov <me@adomerle.pw>

Hi Arseniy,
Thanks for all this work!

The submission looks generally fine, and I'm happy that you've ported those drivers
to the common probe, however, there are a few (relatively small) things to fixup.

Please check below.

> ---
>   drivers/clk/mediatek/Kconfig                  |  68 ++
>   drivers/clk/mediatek/Makefile                 |  11 +
>   drivers/clk/mediatek/clk-mt6789-apmixed.c     | 147 +++
>   drivers/clk/mediatek/clk-mt6789-audiosys.c    | 100 +++
>   drivers/clk/mediatek/clk-mt6789-cam.c         | 131 +++
>   drivers/clk/mediatek/clk-mt6789-img.c         | 100 +++
>   .../clk/mediatek/clk-mt6789-imp_iic_wrap.c    |  90 ++
>   drivers/clk/mediatek/clk-mt6789-infra_ao.c    | 228 +++++
>   drivers/clk/mediatek/clk-mt6789-mcu.c         |  68 ++
>   drivers/clk/mediatek/clk-mt6789-mdp.c         |  81 ++
>   drivers/clk/mediatek/clk-mt6789-mfgcfg.c      |  61 ++
>   drivers/clk/mediatek/clk-mt6789-mm.c          |  85 ++
>   drivers/clk/mediatek/clk-mt6789-topckgen.c    | 846 ++++++++++++++++++
>   drivers/clk/mediatek/clk-mt6789-vdec.c        | 119 +++
>   drivers/clk/mediatek/clk-mt6789-venc.c        |  65 ++
>   15 files changed, 2200 insertions(+)
>   create mode 100644 drivers/clk/mediatek/clk-mt6789-apmixed.c
>   create mode 100644 drivers/clk/mediatek/clk-mt6789-audiosys.c
>   create mode 100644 drivers/clk/mediatek/clk-mt6789-cam.c
>   create mode 100644 drivers/clk/mediatek/clk-mt6789-img.c
>   create mode 100644 drivers/clk/mediatek/clk-mt6789-imp_iic_wrap.c
>   create mode 100644 drivers/clk/mediatek/clk-mt6789-infra_ao.c
>   create mode 100644 drivers/clk/mediatek/clk-mt6789-mcu.c
>   create mode 100644 drivers/clk/mediatek/clk-mt6789-mdp.c
>   create mode 100644 drivers/clk/mediatek/clk-mt6789-mfgcfg.c
>   create mode 100644 drivers/clk/mediatek/clk-mt6789-mm.c
>   create mode 100644 drivers/clk/mediatek/clk-mt6789-topckgen.c
>   create mode 100644 drivers/clk/mediatek/clk-mt6789-vdec.c
>   create mode 100644 drivers/clk/mediatek/clk-mt6789-venc.c
> 

..snip..

> diff --git a/drivers/clk/mediatek/clk-mt6789-topckgen.c b/drivers/clk/mediatek/clk-mt6789-topckgen.c
> new file mode 100644
> index 000000000000..bd986e861eb4
> --- /dev/null
> +++ b/drivers/clk/mediatek/clk-mt6789-topckgen.c
> @@ -0,0 +1,846 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) 2022 MediaTek Inc.
> + * Copyright (c) 2025 Arseniy Velikanov <me@adomerle.pw>
> + */

..snip..


 > +static const struct mtk_fixed_factor top_divs[] = {
 > +	FACTOR(CLK_TOP_MFGPLL, "mfgpll_ck", "mfgpll", 1, 1),

..snip..

 > +	FACTOR(CLK_TOP_F26M, "f26m_ck", "clk26m", 1, 1),
 > +	FACTOR(CLK_TOP_AXI, "axi_ck", "axi_sel", 1, 1),
 > +	FACTOR(CLK_TOP_DISP, "disp_ck", "disp_sel", 1, 1),

Please, remove all instances of FACTOR(.... 1, 1) and use the right parent directly
for the other clocks.

The factor(1,1) means clock_rate * 1 / 1 == clock_rate.

I'm not sure why MediaTek likes to declare these - they are doing that in newer
SoCs as well, but that's not for upstream: it does not make any sense to have those
clocks in the driver, as those are effectively just name wrappers and nothing else.

The only thing those do is increasing the footprint for, well, no good reason...!

There's a pattern that you want to check: all of the "_ck" clocks are suspect! :-)

 > +	FACTOR(CLK_TOP_MDP, "mdp_ck", "mdp_sel", 1, 1),
 > +	FACTOR(CLK_TOP_IMG1, "img1_ck", "img1_sel", 1, 1),
 > +	FACTOR(CLK_TOP_IPE, "ipe_ck", "ipe_sel", 1, 1),
 > +	FACTOR(CLK_TOP_CAM, "cam_ck", "cam_sel", 1, 1),
 > +	FACTOR(CLK_TOP_MFG_REF, "mfg_ref_ck", "mfg_ref_sel", 1, 1),
 > +	FACTOR(CLK_TOP_MFG_PLL, "mfg_pll_ck", "mfg_pll_sel", 1, 1),

..snip..

> +
> +static const char * const dvfsrc_parents[] = {
> +	"tck_26m_mx9_ck",
> +	"osc_d10"
> +};
> +
> +static const char * const aes_msdcfde_parents[] = {
> +	"tck_26m_mx9_ck",
> +	"mainpll_d4_d2",
> +	"mainpll_d6",
> +	"mainpll_d4_d4",
> +	"univpll_d4_d2",
> +	"univpll_d6"
> +};
> +
> +static const char * const mcupm_parents[] = {
> +	"tck_26m_mx9_ck",
> +	"mainpll_d6_d4",
> +	"mainpll_d6_d2"
> +};
> +
> +static const char * const dsi_occ_parents[] = {
> +	"tck_26m_mx9_ck",
> +	"mainpll_d6_d2",
> +	"univpll_d5_d2",
> +	"univpll_d4_d2"
> +};
> +

Look at those parents, you're redefining the very same identical array 10 times
in a row!

Please, avoid this kind of duplication: delete all the duplicated arrays and
just have one called, for example, "apll_i2s_mck_parents", then assign that
to all of the relevant clocks.

Same goes for camtg and others :-)

> +static const char * const apll_i2s0_mck_parents[] = {
> +	"aud_1_sel",
> +	"aud_2_sel"
> +};
> +
> +static const char * const apll_i2s1_mck_parents[] = {
> +	"aud_1_sel",
> +	"aud_2_sel"
> +};
> +
> +static const char * const apll_i2s2_mck_parents[] = {
> +	"aud_1_sel",
> +	"aud_2_sel"
> +};
> +
> +static const char * const apll_i2s3_mck_parents[] = {
> +	"aud_1_sel",
> +	"aud_2_sel"
> +};
> +
> +static const char * const apll_i2s4_mck_parents[] = {
> +	"aud_1_sel",
> +	"aud_2_sel"
> +};
> +
> +static const char * const apll_i2s5_mck_parents[] = {
> +	"aud_1_sel",
> +	"aud_2_sel"
> +};
> +
> +static const char * const apll_i2s6_mck_parents[] = {
> +	"aud_1_sel",
> +	"aud_2_sel"
> +};
> +
> +static const char * const apll_i2s7_mck_parents[] = {
> +	"aud_1_sel",
> +	"aud_2_sel"
> +};
> +
> +static const char * const apll_i2s8_mck_parents[] = {
> +	"aud_1_sel",
> +	"aud_2_sel"
> +};
> +
> +static const char * const apll_i2s9_mck_parents[] = {
> +	"aud_1_sel",
> +	"aud_2_sel"
> +};

..snip..

> +module_platform_driver(clk_mt6789_topckgen_drv);
> +
> +MODULE_DESCRIPTION("MediaTek MT6789 top clock generators driver");
> +MODULE_LICENSE("GPL");
> diff --git a/drivers/clk/mediatek/clk-mt6789-vdec.c b/drivers/clk/mediatek/clk-mt6789-vdec.c
> new file mode 100644
> index 000000000000..81d6e720b6cd
> --- /dev/null
> +++ b/drivers/clk/mediatek/clk-mt6789-vdec.c
> @@ -0,0 +1,119 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) 2022 MediaTek Inc.
> + * Copyright (c) 2025 Arseniy Velikanov <me@adomerle.pw>
> + */
> +

..snip..

> +
> +static const struct mtk_clk_desc vde2_desc = {
> +	.clks = vde2_clks,
> +	.num_clks = ARRAY_SIZE(vde2_clks),
> +};
> +
> +static const struct of_device_id of_match_clk_mt6789_vdec[] = {

Can you please compress all of those?

static const struct of_device_id of_match_clk_mt6789_vdec[] ={
	{ .compatible = "mediatek,mt6789-vdecsys", .data = &vde2_desc },
	{ /* sentinel */ }
};


Note that the same comments do apply to other clock drivers that you're introducing
but I'm only writing once - please apply the comments in the others and wherever
they fit.

Cheers!
Angelo

