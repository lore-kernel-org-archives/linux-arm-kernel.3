Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F03CC02184
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jan 2025 19:13:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:Content-Type:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=63A9SgL5tnNjXoU2Sp0IfU8EZw2Fj6JjQJbqs7VCN5A=; b=YIJ8WNxdB85GJuZe7F+y9Z12X9
	yH7GNl/PuwYEyNsqrJ8GCA9+7Sc6N+z8RkYB5kExIf/7Hh/CKDXcFlW4/TnEXEwla9DqFGio32XC6
	+1O95I81pjTInCSajVYlAKZBl5oDzsCV2kbB5ityNLm4STgfIhR8jLWs6RKSWlQu0kZpuCzdaY8kl
	VAywUc1lzHzkjiakvEWtPmTXjIlPzG+AlhNPkYs1UqtnjPbf6RAObaBqNVBDF6Y1PbtJX/HYszWYY
	1xx5Oq97WovHt/AKzJmkjYVYg50UvNiBRIJEdoq+H58XzXvTiyWNXuPf87I6xpgBJz2qaGcA13GcC
	jSniYCoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXPsc-00000006KyO-1B8E;
	Mon, 13 Jan 2025 19:13:42 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXPrN-00000006Klv-02LC
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jan 2025 19:12:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id F0350A412FB;
	Mon, 13 Jan 2025 19:10:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B61D3C4CED6;
	Mon, 13 Jan 2025 19:12:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736795543;
	bh=jCOB8aOzNhWI9qttXZRifzoIBgrVVWf/a92tgmgzrwA=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=HN9yx449EQxLOrNAvGNn9irfi+2rJJpk/6PEosDIO9CBH0RbAVxhy/bbpQAosnOQr
	 4MiPb0aHyqbI1zpSxlNAaXGyoCXDa+Hjcs4ktJCbLdMFu2J8vVXwxohYLbmvOsCalo
	 FjBuU9eSfrclmjBtKLK9Ozt/L0rSH3d/6br0mPUECpe7T2gL8EuVbfBf909TQO2qy4
	 cvJlaBttOtm/f/7jwbEaB9AF37wPfx+MpPnUgAs6ob9Wf6byI0uuxgTIu5KmVU+hfA
	 Mtna0ceEensBP7JFfcgHmsUphBAecSY65k4195gqUYk8CWXtx3uo7flhZKKo9wJZiD
	 PnURzcV80O2yQ==
Message-ID: <9cc9071129187fbc1498ec25fb1c985d.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250109211908.1553072-5-dario.binacchi@amarulasolutions.com>
References: <20250109211908.1553072-1-dario.binacchi@amarulasolutions.com> <20250109211908.1553072-5-dario.binacchi@amarulasolutions.com>
Subject: Re: [PATCH v2 4/4] clk: stm32f4: support spread spectrum clock generation
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-amarula@amarulasolutions.com, Dario Binacchi <dario.binacchi@amarulasolutions.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Michael Turquette <mturquette@baylibre.com>, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>, linux-kernel@vger.kernel.org
Date: Mon, 13 Jan 2025 11:12:21 -0800
User-Agent: alot/0.12.dev1+gaa8c22fdeedb
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_111225_183778_4137BF48 
X-CRM114-Status: GOOD (  19.66  )
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

Quoting Dario Binacchi (2025-01-09 13:18:31)
> diff --git a/drivers/clk/clk-stm32f4.c b/drivers/clk/clk-stm32f4.c
> index db1c56c8d54f..6c80c0dbb0a3 100644
> --- a/drivers/clk/clk-stm32f4.c
> +++ b/drivers/clk/clk-stm32f4.c
> @@ -35,6 +35,7 @@
>  #define STM32F4_RCC_APB2ENR            0x44
>  #define STM32F4_RCC_BDCR               0x70
>  #define STM32F4_RCC_CSR                        0x74
> +#define STM32F4_RCC_SSCGR              0x80
>  #define STM32F4_RCC_PLLI2SCFGR         0x84
>  #define STM32F4_RCC_PLLSAICFGR         0x88
>  #define STM32F4_RCC_DCKCFGR            0x8c
> @@ -42,6 +43,12 @@
> =20
>  #define STM32F4_RCC_PLLCFGR_N_MASK     GENMASK(14, 6)
> =20
> +#define STM32F4_RCC_SSCGR_SSCGEN       BIT(31)
> +#define STM32F4_RCC_SSCGR_SPREADSEL    BIT(30)
> +#define STM32F4_RCC_SSCGR_RESERVED_MASK        GENMASK(29, 28)
> +#define STM32F4_RCC_SSCGR_INCSTEP_MASK GENMASK(27, 13)
> +#define STM32F4_RCC_SSCGR_MODPER_MASK  GENMASK(12, 0)
> +
>  #define NONE -1
>  #define NO_IDX  NONE
>  #define NO_MUX  NONE
> @@ -512,6 +519,17 @@ static const struct clk_div_table pll_divr_table[] =
=3D {
>         { 2, 2 }, { 3, 3 }, { 4, 4 }, { 5, 5 }, { 6, 6 }, { 7, 7 }, { 0 }
>  };
> =20
> +enum stm32f4_pll_ssc_mod_type {
> +       STM32F4_PLL_SSC_CENTER_SPREAD,
> +       STM32F4_PLL_SSC_DOWN_SPREAD,
> +};
> +
> +struct stm32f4_pll_ssc {
> +       unsigned int mod_freq;
> +       unsigned int mod_depth;
> +       enum stm32f4_pll_ssc_mod_type mod_type;
> +};
> +
>  struct stm32f4_pll {
>         spinlock_t *lock;
>         struct  clk_gate gate;
> @@ -519,6 +537,8 @@ struct stm32f4_pll {
>         u8 bit_rdy_idx;
>         u8 status;
>         u8 n_start;
> +       bool ssc_enable;
> +       struct stm32f4_pll_ssc ssc_conf;
>  };
> =20
>  #define to_stm32f4_pll(_gate) container_of(_gate, struct stm32f4_pll, ga=
te)
> @@ -541,6 +561,7 @@ struct stm32f4_vco_data {
>         u8 offset;
>         u8 bit_idx;
>         u8 bit_rdy_idx;
> +       bool sscg;
>  };
> =20
>  static const struct stm32f4_vco_data  vco_data[] =3D {
> @@ -661,6 +682,34 @@ static long stm32f4_pll_round_rate(struct clk_hw *hw=
, unsigned long rate,
>         return *prate * n;
>  }
> =20
> +static void stm32f4_pll_set_ssc(struct clk_hw *hw, unsigned long parent_=
rate,
> +                               unsigned int ndiv)
> +{
> +       struct clk_gate *gate =3D to_clk_gate(hw);
> +       struct stm32f4_pll *pll =3D to_stm32f4_pll(gate);
> +       struct stm32f4_pll_ssc *ssc =3D &pll->ssc_conf;
> +       u32 modeper, incstep;
> +       u32 sscgr;
> +
> +       sscgr =3D readl(base + STM32F4_RCC_SSCGR);
> +       /* reserved field must be kept at reset value */
> +       sscgr &=3D STM32F4_RCC_SSCGR_RESERVED_MASK;
> +
> +       modeper =3D DIV_ROUND_CLOSEST(parent_rate, 4 * ssc->mod_freq);
> +       incstep =3D DIV_ROUND_CLOSEST(((1 << 15) - 1) * ssc->mod_depth * =
ndiv,
> +                                   5 * 10000 * modeper);
> +       sscgr |=3D STM32F4_RCC_SSCGR_SSCGEN |
> +               FIELD_PREP(STM32F4_RCC_SSCGR_INCSTEP_MASK, incstep) |
> +               FIELD_PREP(STM32F4_RCC_SSCGR_MODPER_MASK, modeper);
> +
> +       if (ssc->mod_type)
> +               sscgr |=3D STM32F4_RCC_SSCGR_SPREADSEL;
> +
> +       pr_debug("%s: pll: %s: modeper: %d, incstep: %d, sscgr: 0x%08x\n",
> +                __func__, clk_hw_get_name(hw), modeper, incstep, sscgr);

Do we need to keep all this pr_debug()? It's tested code right?

> +       writel(sscgr, base + STM32F4_RCC_SSCGR);
> +}
> +
>  static int stm32f4_pll_set_rate(struct clk_hw *hw, unsigned long rate,
>                                 unsigned long parent_rate)
>  {
> @@ -683,6 +732,9 @@ static int stm32f4_pll_set_rate(struct clk_hw *hw, un=
signed long rate,
> =20
>         writel(val, base + pll->offset);
> =20
> +       if (pll->ssc_enable)
> +               stm32f4_pll_set_ssc(hw, parent_rate, n);
> +
>         if (pll_state)
>                 stm32f4_pll_enable(hw);
> =20
> @@ -788,6 +840,87 @@ static struct clk_hw *clk_register_pll_div(const cha=
r *name,
>         return hw;
>  }
> =20
> +static int stm32f4_pll_init_ssc(struct clk_hw *hw, struct stm32f4_pll_ss=
c *conf)

__init

const conf?

> +{
> +       struct clk_gate *gate =3D to_clk_gate(hw);
> +       struct stm32f4_pll *pll =3D to_stm32f4_pll(gate);
> +       struct clk_hw *parent;
> +       unsigned long parent_rate;
> +       int pll_state;
> +       unsigned long n, val;
> +
> +       parent =3D clk_hw_get_parent(hw);
> +       if (!parent) {
> +               pr_err("%s: failed to get clock parent\n", __func__);
> +               return -ENODEV;
> +       }
> +
> +       parent_rate =3D clk_hw_get_rate(parent);
> +
> +       pll->ssc_enable =3D true;
> +       memcpy(&pll->ssc_conf, conf, sizeof(pll->ssc_conf));
> +
> +       pll_state =3D stm32f4_pll_is_enabled(hw);
> +
> +       if (pll_state)
> +               stm32f4_pll_disable(hw);
> +
> +       val =3D readl(base + pll->offset);
> +       n =3D FIELD_GET(STM32F4_RCC_PLLCFGR_N_MASK, val);
> +
> +       pr_debug("%s: pll: %s, parent: %s, parent-rate: %lu, n: %lu\n",
> +                __func__, clk_hw_get_name(hw), clk_hw_get_name(parent),
> +                parent_rate, n);
> +
> +       stm32f4_pll_set_ssc(hw, parent_rate, n);
> +
> +       if (pll_state)
> +               stm32f4_pll_enable(hw);
> +
> +       return 0;
> +}
> +
> +static int stm32f4_pll_ssc_parse_dt(struct device_node *np,

__init

> +                                   struct stm32f4_pll_ssc *conf)
> +{
> +       int ret;
> +       const char *s;
> +
> +       if (!conf)
> +               return -EINVAL;
> +
> +       ret =3D of_property_read_u32(np, "st,ssc-modfreq-hz", &conf->mod_=
freq);
> +       if (ret)
> +               return ret;
> +
> +       ret =3D of_property_read_u32(np, "st,ssc-moddepth-permyriad",
> +                                  &conf->mod_depth);
> +       if (ret) {
> +               pr_err("%pOF: missing st,ssc-moddepth-permyriad\n", np);
> +               return ret;
> +       }
> +
> +       ret =3D of_property_read_string(np, "st,ssc-modmethod", &s);
> +       if (ret) {
> +               pr_err("%pOF: missing st,ssc-modmethod\n", np);
> +               return ret;
> +       }
> +
> +       if (!strcmp(s, "down-spread")) {
> +               conf->mod_type =3D STM32F4_PLL_SSC_DOWN_SPREAD;
> +       } else if (!strcmp(s, "center-spread")) {
> +               conf->mod_type =3D STM32F4_PLL_SSC_CENTER_SPREAD;
> +       } else {
> +               pr_err("%pOF: wrong value (%s) for fsl,ssc-modmethod\n", =
np, s);
> +               return -EINVAL;
> +       }

Can you use match_string() like fwnode_property_match_property_string()
does?

> +
> +       pr_debug("%pOF: SSCG settings: mod_freq: %d, mod_depth: %d mod_me=
thod: %s [%d]\n",
> +                np, conf->mod_freq, conf->mod_depth, s, conf->mod_type);
> +
> +       return 0;
> +}
> +
>  static struct clk_hw *stm32f4_rcc_register_pll(const char *pllsrc,
>                 const struct stm32f4_pll_data *data,  spinlock_t *lock)
>  {

