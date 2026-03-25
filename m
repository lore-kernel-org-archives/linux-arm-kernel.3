Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78212103A9A0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Mar 2026 02:49:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:
	Subject:References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EOC30pXN7Y7q+GNR4np7s6iseJt1GmZgzPGrmSa5bDI=; b=NW0+fPECPkb04DyuSO9srcH1yx
	+lTME96KWN8DWxswRKg1ZBZCObw8NOTv/LRJI/LeG+BoGf8jYy58NQJ+Ny0CfiH53svFb4mCstGsG
	ths/2RXa18lkm0MK4mEho7otxXHGkNWvy/hmoOZHygqhU4gMNQgwQcHbfrJyyDMDdQMf55D37JjvR
	sW/SEYtg4fHlMe2kkAANbPb7NaL5+0qWi6ejc3v677yOBxOg8CqI7UsA57bNjqUnGr1wJ0CoNwPgv
	C3haOQovKkCq2poI9Dk9s8J+nnFCDN4jfFRT618ZgBP2TtB+wqykoSZvBEKCncosA4TejicQfnaH3
	VoR+is/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5EJC-00000002Y3v-2xHP;
	Wed, 25 Mar 2026 02:49:26 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5EJ6-00000002Y1X-2fX8;
	Wed, 25 Mar 2026 02:49:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Message-ID:Date:To:Cc:From:Subject:
	References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:Content-Type:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=EOC30pXN7Y7q+GNR4np7s6iseJt1GmZgzPGrmSa5bDI=; b=Fgam2PuNePqkQcoYbfb47EOz2U
	w0jSFYE/9EeTq7G9C8AzPO/KcawVxyJ6INdxFwYneUOeWDGcui+9xATZgkEMzAXrl3fU5LDYponFf
	Qn3HswDtdqcDB5CuWmXA4i42hOnl552T3tscoLumYvWbNiL2UlcYGCeknk9yc6Rlrzg8PoqDVSB5h
	j7m+NcPbct/BFJBEVCqqwXBh/7BA2UKkqCAKCSQSydQobqi1ZW2vq3JCKqoS8l1VS8MGlO+yb68nD
	qgyz/tHdk5UkK8g56EL4sKd4S98sJP15xEPuYLBBM1He+YUI10jGim1943AGz3iS8MqFMBS766yty
	A+MYl+ig==;
Received: from sea.source.kernel.org ([172.234.252.31])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5EIw-00000005IZy-36lN;
	Wed, 25 Mar 2026 02:49:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7320741AED;
	Wed, 25 Mar 2026 02:49:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47199C19424;
	Wed, 25 Mar 2026 02:49:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774406943;
	bh=lUXHocbr1M1b2KViD96k/UbvtkQcjf0ESNAjW/qWTXg=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=kVnF85fetiOQtOWLC0T952kjOPwthqi7RV0VrM6j9gq/KlAH7Jc8BtpNjnhjtUy2p
	 XH8OxtEFlDYrOZQPaNqiQU2RXYOqzzA/9D6GpgEH4P/nI8uTmZVwvLX6j5LgfEeuXh
	 PyioXsGCaJ5TANFWXjfI85Y4i/QSINVjnfUSbdNii+Rm1r78NsPPXFmZCNaRGjwOaz
	 e1jq42lA3GtcudBmi/pmLgaVGmEeu/ovCvQtCyLGppPn/DcOlh3YHeHll05/dxmMBK
	 xuMU6OaKt87Monu4PLjz6H9SnVEuhuXtOlNfy8XyC9jDtQTlzJ4zpQ5y/Wgs3HH/aZ
	 SHqNahPYq/UJg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260324025332.3416977-9-eleanor.lin@realtek.com>
References: <20260324025332.3416977-1-eleanor.lin@realtek.com> <20260324025332.3416977-9-eleanor.lin@realtek.com>
Subject: Re: [PATCH v5 08/10] clk: realtek: Add support for MMC-tuned PLL clocks
From: Stephen Boyd <sboyd@kernel.org>
Cc: devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-realtek-soc@lists.infradead.org, james.tai@realtek.com, cy.huang@realtek.com, stanley_chang@realtek.com, eleanor.lin@realtek.com
To: Yu-Chun Lin <eleanor.lin@realtek.com>, afaerber@suse.com, conor+dt@kernel.org, cylee12@realtek.com, jyanchou@realtek.com, krzk+dt@kernel.org, mturquette@baylibre.com, p.zabel@pengutronix.de, robh@kernel.org
Date: Tue, 24 Mar 2026 18:54:24 -0700
Message-ID: <177440366488.5403.14385693004290004608@localhost.localdomain>
User-Agent: alot/0.12
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_024913_974962_753A674F 
X-CRM114-Status: GOOD (  13.26  )
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

Quoting Yu-Chun Lin (2026-03-23 19:53:29)
> diff --git a/drivers/clk/realtek/clk-pll-mmc.c b/drivers/clk/realtek/clk-=
pll-mmc.c
> new file mode 100644
> index 000000000000..017663738c1f
> --- /dev/null
> +++ b/drivers/clk/realtek/clk-pll-mmc.c
> @@ -0,0 +1,399 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (C) 2021 Realtek Semiconductor Corporation
> + * Author: Cheng-Yu Lee <cylee12@realtek.com>
> + */
> +
> +#include "clk-pll.h"

Include what you use in this C file, not just this header file. That
makes it simpler to see what is used without following include trails.

> +
> +#define PLL_EMMC1_OFFSET           0x0
> +#define PLL_EMMC2_OFFSET           0x4
> +#define PLL_EMMC3_OFFSET           0x8
> +#define PLL_EMMC4_OFFSET           0xc
> +#define PLL_SSC_DIG_EMMC1_OFFSET   0x0
> +#define PLL_SSC_DIG_EMMC3_OFFSET   0xc
> +#define PLL_SSC_DIG_EMMC4_OFFSET   0x10
> +
> +#define PLL_MMC_SSC_DIV_N_VAL      0x1b
> +
> +#define PLL_PHRT0_MASK             BIT(1)
> +#define PLL_PHSEL_MASK             GENMASK(4, 0)
> +#define PLL_SSCPLL_RS_MASK         GENMASK(12, 10)
> +#define PLL_SSCPLL_ICP_MASK        GENMASK(9, 5)
> +#define PLL_SSC_DIV_EXT_F_MASK     GENMASK(25, 13)
> +#define PLL_PI_IBSELH_MASK         GENMASK(28, 27)
> +#define PLL_SSC_DIV_N_MASK         GENMASK(23, 16)
> +#define PLL_NCODE_SSC_EMMC_MASK    GENMASK(20, 13)
> +#define PLL_FCODE_SSC_EMMC_MASK    GENMASK(12, 0)
> +#define PLL_GRAN_EST_EM_MC_MASK    GENMASK(20, 0)
> +#define PLL_EN_SSC_EMMC_MASK       BIT(0)
> +#define PLL_FLAG_INITAL_EMMC_MASK  BIT(1)
[...]
> diff --git a/drivers/clk/realtek/clk-pll.h b/drivers/clk/realtek/clk-pll.h
> index 2d27a44a270c..9cf219871218 100644
> --- a/drivers/clk/realtek/clk-pll.h
> +++ b/drivers/clk/realtek/clk-pll.h
> @@ -44,4 +44,25 @@ static inline struct clk_pll *to_clk_pll(struct clk_hw=
 *hw)
>  extern const struct clk_ops rtk_clk_pll_ops;
>  extern const struct clk_ops rtk_clk_pll_ro_ops;
> =20
> +struct clk_pll_mmc {
> +       struct clk_regmap clkr;
> +       int pll_ofs;
> +       int ssc_dig_ofs;

These offsets should be unsigned?

> +       struct clk_hw phase0_hw;
> +       struct clk_hw phase1_hw;
> +       u32 set_rate_val_53_97_set_ipc: 1;

bool? Doubt we care about this unless we're packing structs (which we
shouldn't be).

> +};
> +
> +#define __clk_pll_mmc_hw(_ptr)  __clk_regmap_hw(&(_ptr)->clkr)
> +
> +static inline struct clk_pll_mmc *to_clk_pll_mmc(struct clk_hw *hw)
> +{
> +       struct clk_regmap *clkr =3D to_clk_regmap(hw);
> +
> +       return container_of(clkr, struct clk_pll_mmc, clkr);
> +}

