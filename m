Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5678C624D0
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 18:15:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e7plJxIygwISfSRDt4IRuRj0Ea3yUgy5TIf9N8SYgTA=; b=0X3xTWoh6PieKpMrA125CVWh+U
	uhzz/PLO2ZmUZpID49l89IuKfrLnJuuIuSyMm5MPCjRSbsTbeyyA6EO9FG2KDf46nfoOR1d6uAqTZ
	Zj2UHDDXv70AAWM9lglMschowcfabIIfHFXxYIoOSuEB9fvaYj5LHfDLCwZBjyMU6sTrgPcolqlrx
	VxbWq+buQj7q4JfgtCG31XUmJlFNWkm9YDCB9MZsmQIK+i+gZOtXEPCXHGQfHJ6q7y8x/ssBx+Du5
	E9F8Ip40VhNsGSs59eVVAy0BaXxxJC22hcNrvCLocGbNo0Mm0n4Tmyt4/QpVbwzzoo68s0sYaQEYN
	1JE5sBNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1T0W-0000000Cvn5-2C20;
	Tue, 01 Sep 2026 18:14:52 +0000
Received: from smtp.forwardemail.net ([121.127.44.73])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1T0T-0000000CvlM-1b8h
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Sep 2026 18:14:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: From: References:
 Cc: To: Subject: MIME-Version: Date: Message-ID; q=dns/txt;
 s=fe-e1b5cab7be; t=1788286487;
 bh=e7plJxIygwISfSRDt4IRuRj0Ea3yUgy5TIf9N8SYgTA=;
 b=nQBeSbhJ+7+EnuXnKofOhOWvneozte3SoBrNwGRb3YOyDXWfRO4tQttKSHTyfiQAQvLD9w+qw
 3iYT2hxPrxCux28UaFIFvO69cN/ycN8rG0BGvQBh6LH5WSU84SwEN0kdAN4WybmUfbDz76Kx0mM
 LDj71SsA7l0D+Y9IffLe88VPxfYjZhF1pyAOKtk0KGJxG+4JDfc2Ttwbc2p7D6gjiG7tr1OC7GN
 JIdkoMB/qOUd6RNrpztP+Sqi7rJGdgqEFc10wpS4lhxJUah99zhQ8qq+WATTae2LaysIYOKFK6i
 PeLS4JwIyGiigKpXYsyTdMV0e8u9h8ycJfh78tXe1BYQ==
X-Forward-Email-ID: 6a971609a9d0b3c06ff430dc
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 121.127.44.73
X-Forward-Email-Version: 2.14.0
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
Message-ID: <cddc47a2-81de-4978-9009-bdefeda2d3b5@kwiboo.se>
Date: Tue, 1 Sep 2026 20:14:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 12/15] phy: rockchip: inno-hdmi: Use the common
 Innosilicon PHY helpers
To: Michal Wilczynski <m.wilczynski@samsung.com>
Cc: Heiko Stuebner <heiko@sntech.de>, Vinod Koul <vkoul@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Lee Jones <lee@kernel.org>, Andy Yan <andy.yan@rock-chips.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Emil Renner Berthing <kernel@esmil.dk>, Hal Feng
 <hal.feng@starfivetech.com>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
 Conor Dooley <conor@kernel.org>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Dominique Belhachemi <db@domibel.de>,
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 mfd@lists.linux.dev, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-riscv@lists.infradead.org, Icenowy Zheng <uwu@icenowy.me>,
 Andy Yan <andyshrk@163.com>, Marek Szyprowski <m.szyprowski@samsung.com>,
 Maud Spierings <maudspierings@gocontroll.com>,
 Graham Markall <hello@big-grey.co.uk>
References: <20260828-jh7110-clean-send-v2-0-331680c8b9d1@samsung.com>
 <CGME20260828134835eucas1p27736632121c17e11f554e295994a7d8d@eucas1p2.samsung.com>
 <20260828-jh7110-clean-send-v2-12-331680c8b9d1@samsung.com>
Content-Language: en-US
From: Jonas Karlman <jonas@kwiboo.se>
In-Reply-To: <20260828-jh7110-clean-send-v2-12-331680c8b9d1@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260901_111449_825653_FF5367BE 
X-CRM114-Status: GOOD (  29.52  )
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

Hi Michal,

On 8/28/2026 3:47 PM, Michal Wilczynski wrote:
> The RK3328 pre-PLL programming, its table lookup and its recalc_rate and
> determine_rate implementations are the generic Innosilicon ones, so drop
> the local copies and use the shared helpers instead.

RK3528 and RK3538/RK3539 also seems to use the generic Innosilicon ones,
so we should hopefully also be able to use the helpers for those SoCs.

> 
> The RK3228 pre-PLL sits at different register addresses, so it keeps its
> own register level code and only shares the table lookup.
> 
> The register writes, their order and the values written are unchanged.
> No functional change intended.
> 
> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
> ---
>  drivers/phy/rockchip/Kconfig                  |   1 +
>  drivers/phy/rockchip/phy-rockchip-inno-hdmi.c | 127 +++++---------------------
>  2 files changed, 25 insertions(+), 103 deletions(-)
> 
> diff --git a/drivers/phy/rockchip/Kconfig b/drivers/phy/rockchip/Kconfig
> index 14698571b607590dc0e7a29f3b39eb9a5d4e3d25..9732c5be87717dc3ddbea1c60080952336a07af9 100644
> --- a/drivers/phy/rockchip/Kconfig
> +++ b/drivers/phy/rockchip/Kconfig
> @@ -34,6 +34,7 @@ config PHY_ROCKCHIP_INNO_HDMI
>  	depends on COMMON_CLK
>  	depends on HAS_IOMEM
>  	select GENERIC_PHY
> +	select PHY_INNO_HDMI
>  	help
>  	  Enable this to support the Rockchip Innosilicon HDMI PHY.
>  
> diff --git a/drivers/phy/rockchip/phy-rockchip-inno-hdmi.c b/drivers/phy/rockchip/phy-rockchip-inno-hdmi.c
> index 1483907413faa5ce1dc8614db05e6e929410404d..fae766607b0ea120b3adb36001387062f39a5c00 100644
> --- a/drivers/phy/rockchip/phy-rockchip-inno-hdmi.c
> +++ b/drivers/phy/rockchip/phy-rockchip-inno-hdmi.c
> @@ -17,6 +17,7 @@
>  #include <linux/of.h>
>  #include <linux/platform_device.h>
>  #include <linux/regmap.h>
> +#include <linux/phy/inno-hdmi-phy.h>
>  #include <linux/phy/phy.h>
>  #include <linux/slab.h>
>  
> @@ -240,6 +241,8 @@ struct inno_hdmi_phy {
>  	const struct inno_hdmi_phy_drv_data *plat_data;
>  	int chip_version;
>  
> +	struct inno_hdmi_phy_pre_pll pre_pll;
> +
>  	/* clk provider */
>  	struct clk_hw hw;
>  	struct clk *phyclk;
> @@ -247,21 +250,6 @@ struct inno_hdmi_phy {
>  	unsigned long tmdsclock;
>  };
>  
> -struct pre_pll_config {
> -	unsigned long pixclock;
> -	unsigned long tmdsclock;
> -	u8 prediv;
> -	u16 fbdiv;
> -	u8 tmds_div_a;
> -	u8 tmds_div_b;
> -	u8 tmds_div_c;
> -	u8 pclk_div_a;
> -	u8 pclk_div_b;
> -	u8 pclk_div_c;
> -	u8 pclk_div_d;
> -	u8 vco_div_5_en;
> -	u32 fracdiv;
> -};
>  
>  struct post_pll_config {
>  	unsigned long tmdsclock;
> @@ -290,7 +278,7 @@ struct inno_hdmi_phy_drv_data {
>  	const struct phy_config		*phy_cfg_table;
>  };
>  
> -static const struct pre_pll_config pre_pll_cfg_table[] = {
> +static const struct inno_hdmi_phy_pre_pll_config pre_pll_cfg_table[] = {
>  	{ 25175000,  25175000,  3,  125, 3, 1, 1,  1, 3, 3,  4, 0, 0xe00000},
>  	{ 25175000,  31468750,  1,   41, 0, 3, 3,  1, 3, 3,  4, 0, 0xf5554f},
>  	{ 27000000,  27000000,  1,   36, 0, 3, 3,  1, 2, 3,  4, 0,      0x0},
> @@ -673,20 +661,12 @@ static const struct phy_ops inno_hdmi_phy_ops = {
>  };
>  
>  static const
> -struct pre_pll_config *inno_hdmi_phy_get_pre_pll_cfg(struct inno_hdmi_phy *inno,
> -						     unsigned long rate)
> +struct inno_hdmi_phy_pre_pll_config *inno_hdmi_phy_get_pre_pll_cfg(struct inno_hdmi_phy *inno,
> +								   unsigned long rate)
>  {
> -	const struct pre_pll_config *cfg = pre_pll_cfg_table;
>  	unsigned long tmdsclock = inno_hdmi_phy_get_tmdsclk(inno, rate);
>  
> -	for (; cfg->pixclock != 0; cfg++)
> -		if (cfg->pixclock == rate && cfg->tmdsclock == tmdsclock)
> -			break;
> -
> -	if (cfg->pixclock == 0)
> -		return ERR_PTR(-EINVAL);
> -
> -	return cfg;
> +	return inno_hdmi_phy_pre_pll_lookup(&inno->pre_pll, rate, tmdsclock);

Please fully remove the local inno_hdmi_phy_get_pre_pll_cfg() helper and
call inno_hdmi_phy_pre_pll_lookup() in its place.

>  }
>  
>  static int inno_hdmi_phy_rk3228_clk_is_prepared(struct clk_hw *hw)
> @@ -752,7 +732,7 @@ unsigned long inno_hdmi_phy_rk3228_clk_recalc_rate(struct clk_hw *hw,
>  static int inno_hdmi_phy_rk3228_clk_determine_rate(struct clk_hw *hw,
>  						   struct clk_rate_request *req)
>  {
> -	const struct pre_pll_config *cfg = pre_pll_cfg_table;
> +	const struct inno_hdmi_phy_pre_pll_config *cfg = pre_pll_cfg_table;
>  
>  	req->rate = (req->rate / 1000) * 1000;
>  
> @@ -773,7 +753,7 @@ static int inno_hdmi_phy_rk3228_clk_set_rate(struct clk_hw *hw,
>  					     unsigned long parent_rate)
>  {
>  	struct inno_hdmi_phy *inno = to_inno_hdmi_phy(hw);
> -	const struct pre_pll_config *cfg;
> +	const struct inno_hdmi_phy_pre_pll_config *cfg;
>  	unsigned long tmdsclock = inno_hdmi_phy_get_tmdsclk(inno, rate);
>  	u32 v;
>  	int ret;
> @@ -870,39 +850,11 @@ unsigned long inno_hdmi_phy_rk3328_clk_recalc_rate(struct clk_hw *hw,
>  						   unsigned long parent_rate)
>  {
>  	struct inno_hdmi_phy *inno = to_inno_hdmi_phy(hw);
> -	unsigned long frac;
> -	u8 nd, no_a, no_b, no_d;
> -	u64 vco;
> -	u16 nf;
> -
> -	nd = inno_read(inno, 0xa1) & RK3328_PRE_PLL_PRE_DIV_MASK;
> -	nf = ((inno_read(inno, 0xa2) & RK3328_PRE_PLL_FB_DIV_11_8_MASK) << 8);
> -	nf |= inno_read(inno, 0xa3);
> -	vco = parent_rate * nf;
> -
> -	if (!(inno_read(inno, 0xa2) & RK3328_PRE_PLL_FRAC_DIV_DISABLE)) {
> -		frac = inno_read(inno, 0xd3) |
> -		       (inno_read(inno, 0xd2) << 8) |
> -		       (inno_read(inno, 0xd1) << 16);
> -		vco += DIV_ROUND_CLOSEST(parent_rate * frac, (1 << 24));
> -	}
>  
> -	if (inno_read(inno, 0xa0) & RK3328_PCLK_VCO_DIV_5_MASK) {
> -		do_div(vco, nd * 5);
> -	} else {
> -		no_a = inno_read(inno, 0xa5) & RK3328_PRE_PLL_PCLK_DIV_A_MASK;
> -		no_b = inno_read(inno, 0xa5) & RK3328_PRE_PLL_PCLK_DIV_B_MASK;
> -		no_b >>= RK3328_PRE_PLL_PCLK_DIV_B_SHIFT;
> -		no_b += 2;
> -		no_d = inno_read(inno, 0xa6) & RK3328_PRE_PLL_PCLK_DIV_D_MASK;
> -
> -		do_div(vco, (nd * (no_a == 1 ? no_b : no_a) * no_d * 2));
> -	}
> +	inno->pixclock = inno_hdmi_phy_pre_pll_recalc_rate(&inno->pre_pll,
> +							   parent_rate);
>  
> -	inno->pixclock = DIV_ROUND_CLOSEST((unsigned long)vco, 1000) * 1000;
> -
> -	dev_dbg(inno->dev, "%s rate %lu vco %llu\n",
> -		__func__, inno->pixclock, vco);
> +	dev_dbg(inno->dev, "%s rate %lu\n", __func__, inno->pixclock);

VCO should be between 1.4-3.2 GHz, we now loose this debug information.
This is a change that probably should be noted in the commit message.

>  
>  	return inno->pixclock;
>  }
> @@ -910,20 +862,9 @@ unsigned long inno_hdmi_phy_rk3328_clk_recalc_rate(struct clk_hw *hw,
>  static int inno_hdmi_phy_rk3328_clk_determine_rate(struct clk_hw *hw,
>  						   struct clk_rate_request *req)
>  {
> -	const struct pre_pll_config *cfg = pre_pll_cfg_table;
> -
> -	req->rate = (req->rate / 1000) * 1000;
> -
> -	for (; cfg->pixclock != 0; cfg++)
> -		if (cfg->pixclock == req->rate)
> -			break;
> -
> -	if (cfg->pixclock == 0)
> -		return -EINVAL;
> -
> -	req->rate = cfg->pixclock;
> +	struct inno_hdmi_phy *inno = to_inno_hdmi_phy(hw);
>  
> -	return 0;
> +	return inno_hdmi_phy_pre_pll_determine_rate(&inno->pre_pll, req);
>  }
>  
>  static int inno_hdmi_phy_rk3328_clk_set_rate(struct clk_hw *hw,
> @@ -931,9 +872,8 @@ static int inno_hdmi_phy_rk3328_clk_set_rate(struct clk_hw *hw,
>  					     unsigned long parent_rate)
>  {
>  	struct inno_hdmi_phy *inno = to_inno_hdmi_phy(hw);
> -	const struct pre_pll_config *cfg;
> +	const struct inno_hdmi_phy_pre_pll_config *cfg;
>  	unsigned long tmdsclock = inno_hdmi_phy_get_tmdsclk(inno, rate);
> -	u32 val;
>  	int ret;
>  
>  	dev_dbg(inno->dev, "%s rate %lu tmdsclk %lu\n",
> @@ -946,35 +886,11 @@ static int inno_hdmi_phy_rk3328_clk_set_rate(struct clk_hw *hw,
>  	if (IS_ERR(cfg))
>  		return PTR_ERR(cfg);
>  
> -	inno_update_bits(inno, 0xa0, RK3328_PRE_PLL_POWER_DOWN,
> -			 RK3328_PRE_PLL_POWER_DOWN);
> -
> -	/* Configure pre-pll */
> -	inno_update_bits(inno, 0xa0, RK3328_PCLK_VCO_DIV_5_MASK,
> -			 RK3328_PCLK_VCO_DIV_5(cfg->vco_div_5_en));
> -	inno_write(inno, 0xa1, RK3328_PRE_PLL_PRE_DIV(cfg->prediv));
> -
> -	val = RK3328_SPREAD_SPECTRUM_MOD_DISABLE;
> -	if (!cfg->fracdiv)
> -		val |= RK3328_PRE_PLL_FRAC_DIV_DISABLE;
> -	inno_write(inno, 0xa2, RK3328_PRE_PLL_FB_DIV_11_8(cfg->fbdiv) | val);
> -	inno_write(inno, 0xa3, RK3328_PRE_PLL_FB_DIV_7_0(cfg->fbdiv));
> -	inno_write(inno, 0xa5, RK3328_PRE_PLL_PCLK_DIV_A(cfg->pclk_div_a) |
> -		   RK3328_PRE_PLL_PCLK_DIV_B(cfg->pclk_div_b));
> -	inno_write(inno, 0xa6, RK3328_PRE_PLL_PCLK_DIV_C(cfg->pclk_div_c) |
> -		   RK3328_PRE_PLL_PCLK_DIV_D(cfg->pclk_div_d));
> -	inno_write(inno, 0xa4, RK3328_PRE_PLL_TMDSCLK_DIV_C(cfg->tmds_div_c) |
> -		   RK3328_PRE_PLL_TMDSCLK_DIV_A(cfg->tmds_div_a) |
> -		   RK3328_PRE_PLL_TMDSCLK_DIV_B(cfg->tmds_div_b));
> -	inno_write(inno, 0xd3, RK3328_PRE_PLL_FRAC_DIV_7_0(cfg->fracdiv));
> -	inno_write(inno, 0xd2, RK3328_PRE_PLL_FRAC_DIV_15_8(cfg->fracdiv));
> -	inno_write(inno, 0xd1, RK3328_PRE_PLL_FRAC_DIV_23_16(cfg->fracdiv));
> +	inno_hdmi_phy_pre_pll_power_down(&inno->pre_pll, true);
> +	inno_hdmi_phy_pre_pll_configure(&inno->pre_pll, cfg);
> +	inno_hdmi_phy_pre_pll_power_down(&inno->pre_pll, false);
>  
> -	inno_update_bits(inno, 0xa0, RK3328_PRE_PLL_POWER_DOWN, 0);

This should likely also remove all now unused RK3328 pre_pll related
macros.

Regards,
Jonas

> -
> -	/* Wait for Pre-PLL lock */
> -	ret = inno_poll(inno, 0xa9, val, val & RK3328_PRE_PLL_LOCK_STATUS,
> -			1000, 10000);
> +	ret = inno_hdmi_phy_pre_pll_wait_locked(&inno->pre_pll, 10000);
>  	if (ret) {
>  		dev_err(inno->dev, "Pre-PLL locking failed\n");
>  		return ret;
> @@ -1373,6 +1289,11 @@ static int inno_hdmi_phy_probe(struct platform_device *pdev)
>  	if (IS_ERR(inno->regmap))
>  		return PTR_ERR(inno->regmap);
>  
> +	/* The PHY block starts the register space on these SoCs. */
> +	inno->pre_pll.regmap = inno->regmap;
> +	inno->pre_pll.offset = 0;
> +	inno->pre_pll.table = pre_pll_cfg_table;
> +
>  	/* only the newer rk3328 hdmiphy has an interrupt */
>  	inno->irq = platform_get_irq(pdev, 0);
>  	if (inno->irq > 0) {
> 


