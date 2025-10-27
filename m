Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEDD4CCF9E0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Oct 2025 08:50:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BQUQZvo7RWlRw2SyqZkuIdrF9j4YkFrZe8rnZtpiUFc=; b=qw2Gpta/99G+PTOmHHbmXxZHSt
	WSWequcd41avb2b9DBm9ZkdOufq27y/fGuwe2yCTZ/oWORaarbiR6UROHhrpxh7hU7D0bNFAhE9ss
	yTLC6myKx6ZnMtQj/TvG5N/oBuTo2YUeRA2B059W4Z7Q7zL0njcoA/XEtLqLzJ9n2FFFYPB+e0ir2
	R66QnMkCgffaF2Y9bB9J4f9cl0ylXM+OdlnUcD8WdNZCg/2QLvUOrxiqBGhslWUW7looorA7+wnpU
	FX62ln2HoPkMCA7IaiYiYU4rTKn2sQsz9CLaHQew4AgUNKjU0JFxRvDaWC4MJDLoqduSTmYgF53OU
	GGat61Mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDIvi-0000000DSBG-3czO;
	Mon, 27 Oct 2025 08:50:18 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDIvh-0000000DSAc-3xmi;
	Mon, 27 Oct 2025 08:50:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:Message-ID:
	Date:References:In-Reply-To:Subject:Cc:To:From:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=BQUQZvo7RWlRw2SyqZkuIdrF9j4YkFrZe8rnZtpiUFc=; b=BnGuzxQM+DYyHJSOyFtBWy2G+S
	CkVdOrYwmni83Nx89rybasISXUByopc/rcs7ZMHpeKZ6IgV0PEEnY0kreFnhnYfnMCQ7yEUpkWB6m
	szYi9yNFKlRDjcSXw3b6PmgbQ0wfqqQ33sEIJ0iPd+eY2YasemChkbUoABBuzaaRcIB4o6P+P7eg8
	XVzmlEUhVGjK0PyNt5SgLjkIDLOl7eeiPRqmX0AIywPSHuLqiD9KS9BePlfaIZWvs7LPYXoHCqptE
	KRl2lVYzLVyrT+m7GD47DKNOCwAMKxOsvJiGge9bocx2Np0SfjBH3j+AvQyKtTzGPt1OCrmY86kVX
	x2ShfzMQ==;
Received: from mgamail.intel.com ([192.198.163.7])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDI3s-00000001eIr-3zfV;
	Mon, 27 Oct 2025 07:54:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761555013; x=1793091013;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=lQFP5i4h0NhDRiG8WGVwpbu31fE0ocV55y7NMexkC28=;
  b=HViUNdh+HNEKYjyfH3EjX5DpO55fdlOKa3eEkOuJLVJ7D5QjQ0aAuq6v
   mWMlMoWvk6vFKDHfxC2bTIv2Knj0KTU8VP3vZY3Yj6Y5LUNCPsPrDow2u
   p0UrJQ9/oIWaICIeDRXjFixZlSPhmQLNnIVSEUeJCguKTDpL7d6avWhWV
   mf24sAiEU8GwfSpzzlAcBzYqooMJMIiYEY75wajRfbOKkokVX8tjvIKay
   9MVt4Rse8dKaScYtL2qR+71LX0B5ca5+wy5mGGKxofr96vJR2ntucmkAL
   LLIXGt+b5ixCKVt1of1UxWEgy59tHEovBKZKuPGNsGGgSNV/fluML34VQ
   Q==;
X-CSE-ConnectionGUID: 9nEW8RNdSa658/LCMAHc7g==
X-CSE-MsgGUID: nm8EuWS/RiylNL4ocPW0TQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="89101012"
X-IronPort-AV: E=Sophos;i="6.19,258,1754982000"; 
   d="scan'208";a="89101012"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2025 01:50:07 -0700
X-CSE-ConnectionGUID: RWdTYCHBRXaBnyFA3fxD1Q==
X-CSE-MsgGUID: hFLDCByJQnS1Drk++R66Ew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,258,1754982000"; 
   d="scan'208";a="184216145"
Received: from slindbla-desk.ger.corp.intel.com (HELO localhost) ([10.245.246.35])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2025 01:49:59 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: "Yury Norov (NVIDIA)" <yury.norov@gmail.com>, Linus Torvalds
 <torvalds@linux-foundation.org>, Linus Walleij <linus.walleij@linaro.org>,
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, Sandy Huang
 <hjc@rock-chips.com>, Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>,
 Andy Yan
 <andy.yan@rock-chips.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Shreeya Patel
 <shreeya.patel@collabora.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Jaehoon Chung <jh80.chung@samsung.com>, Ulf Hansson
 <ulf.hansson@linaro.org>, Nicolas Frattaroli
 <frattaroli.nicolas@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark
 Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai
 <tiwai@suse.com>, "Yury Norov (NVIDIA)" <yury.norov@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, kernel@collabora.com,
 linux-mmc@vger.kernel.org, linux-sound@vger.kernel.org
Cc: Rasmus Villemoes <linux@rasmusvillemoes.dk>
Subject: Re: [PATCH 11/21] drivers: don't use GENMASK() in FIELD_PREP_WM16()
In-Reply-To: <20251025164023.308884-12-yury.norov@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20251025164023.308884-1-yury.norov@gmail.com>
 <20251025164023.308884-12-yury.norov@gmail.com>
Date: Mon, 27 Oct 2025 10:49:56 +0200
Message-ID: <6e82c656573d436b6c53d242a0ed45007e5849ad@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_075441_340580_764569E7 
X-CRM114-Status: GOOD (  15.74  )
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

On Sat, 25 Oct 2025, "Yury Norov (NVIDIA)" <yury.norov@gmail.com> wrote:
> Recently added FIELD_PREP_WM16() in a few places uses GENMASK. It's
> confusing and may mislead readers. Switch to BITS() or FIRST_BITS()
> as appropriate.

GENMASK argument order matches how most specs I've ever looked at define
bits. It's high:low. I, for one, think it's silly to add another set of
macros purely to swap the argument order.

> Suggested-by: Linus Torvalds <torvalds@linux-foundation.org>
> Link: https://lore.kernel.org/all/CAHk-=whoOUsqPKb7OQwhQf9H_3=5sXGPJrDbfQfwLB3Bi13tcQ@mail.gmail.com/
> Signed-off-by: Yury Norov (NVIDIA) <yury.norov@gmail.com>
> ---
>  drivers/gpu/drm/rockchip/rockchip_lvds.h             | 2 +-
>  drivers/gpu/drm/rockchip/rockchip_vop2_reg.c         | 4 ++--
>  drivers/media/platform/synopsys/hdmirx/snps_hdmirx.h | 4 ++--
>  drivers/mmc/host/dw_mmc-rockchip.c                   | 4 ++--
>  drivers/soc/rockchip/grf.c                           | 4 ++--
>  sound/soc/rockchip/rockchip_i2s_tdm.h                | 2 +-
>  6 files changed, 10 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/gpu/drm/rockchip/rockchip_lvds.h b/drivers/gpu/drm/rockchip/rockchip_lvds.h
> index 2d92447d819b..e79e6031be59 100644
> --- a/drivers/gpu/drm/rockchip/rockchip_lvds.h
> +++ b/drivers/gpu/drm/rockchip/rockchip_lvds.h
> @@ -115,7 +115,7 @@
>  #define   PX30_LVDS_INVERT_DCLK(val)		FIELD_PREP_WM16(BIT(5), (val))
>  
>  #define PX30_LVDS_GRF_PD_VO_CON1		0x438
> -#define   PX30_LVDS_FORMAT(val)			FIELD_PREP_WM16(GENMASK(14, 13), (val))
> +#define   PX30_LVDS_FORMAT(val)			FIELD_PREP_WM16(BITS(13, 14), (val))

IMO this change would make more sense in defining register contents:

+#define   PX30_LVDS_FORMAT_MASK			GENMASK(14, 13)
-#define   PX30_LVDS_FORMAT(val)			FIELD_PREP_WM16(GENMASK(14, 13), (val))
+#define   PX30_LVDS_FORMAT(val)			FIELD_PREP_WM16(PX30_LVDS_FORMAT_MASK, (val))


BR,
Jani.


>  #define   PX30_LVDS_MODE_EN(val)		FIELD_PREP_WM16(BIT(12), (val))
>  #define   PX30_LVDS_MSBSEL(val)			FIELD_PREP_WM16(BIT(11), (val))
>  #define   PX30_LVDS_P2S_EN(val)			FIELD_PREP_WM16(BIT(6), (val))
> diff --git a/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c b/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c
> index 38c49030c7ab..438fea5f6f6d 100644
> --- a/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c
> +++ b/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c
> @@ -1698,7 +1698,7 @@ static unsigned long rk3588_set_intf_mux(struct vop2_video_port *vp, int id, u32
>  		val = rk3588_get_hdmi_pol(polflags);
>  		regmap_write(vop2->vop_grf, RK3588_GRF_VOP_CON2, FIELD_PREP_WM16(BIT(1), 1));
>  		regmap_write(vop2->vo1_grf, RK3588_GRF_VO1_CON0,
> -			     FIELD_PREP_WM16(GENMASK(6, 5), val));
> +			     FIELD_PREP_WM16(BITS(5, 6), val));
>  		break;
>  	case ROCKCHIP_VOP2_EP_HDMI1:
>  		div &= ~RK3588_DSP_IF_EDP_HDMI1_DCLK_DIV;
> @@ -1711,7 +1711,7 @@ static unsigned long rk3588_set_intf_mux(struct vop2_video_port *vp, int id, u32
>  		val = rk3588_get_hdmi_pol(polflags);
>  		regmap_write(vop2->vop_grf, RK3588_GRF_VOP_CON2, FIELD_PREP_WM16(BIT(4), 1));
>  		regmap_write(vop2->vo1_grf, RK3588_GRF_VO1_CON0,
> -			     FIELD_PREP_WM16(GENMASK(8, 7), val));
> +			     FIELD_PREP_WM16(BITS(7, 8), val));
>  		break;
>  	case ROCKCHIP_VOP2_EP_EDP0:
>  		div &= ~RK3588_DSP_IF_EDP_HDMI0_DCLK_DIV;
> diff --git a/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.h b/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.h
> index b13f58e31944..14df3f53ff8f 100644
> --- a/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.h
> +++ b/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.h
> @@ -12,8 +12,8 @@
>  #include <linux/bitops.h>
>  #include <linux/hw_bitfield.h>
>  
> -#define UPDATE(x, h, l)		FIELD_PREP(GENMASK((h), (l)), (x))
> -#define HIWORD_UPDATE(v, h, l)	FIELD_PREP_WM16(GENMASK((h), (l)), (v))
> +#define UPDATE(x, h, l)		FIELD_PREP(BITS((l), (h)), (x))
> +#define HIWORD_UPDATE(v, h, l)	FIELD_PREP_WM16(BITS((l), (h)), (v))
>  
>  /* SYS_GRF */
>  #define SYS_GRF_SOC_CON1			0x0304
> diff --git a/drivers/mmc/host/dw_mmc-rockchip.c b/drivers/mmc/host/dw_mmc-rockchip.c
> index 82dd906bb002..7fac1a7281bf 100644
> --- a/drivers/mmc/host/dw_mmc-rockchip.c
> +++ b/drivers/mmc/host/dw_mmc-rockchip.c
> @@ -148,10 +148,10 @@ static int rockchip_mmc_set_internal_phase(struct dw_mci *host, bool sample, int
>  
>  	if (sample)
>  		mci_writel(host, TIMING_CON1,
> -			   FIELD_PREP_WM16(GENMASK(11, 1), raw_value));
> +			   FIELD_PREP_WM16(BITS(1, 11), raw_value));
>  	else
>  		mci_writel(host, TIMING_CON0,
> -			   FIELD_PREP_WM16(GENMASK(11, 1), raw_value));
> +			   FIELD_PREP_WM16(BITS(1, 11), raw_value));
>  
>  	dev_dbg(host->dev, "set %s_phase(%d) delay_nums=%u actual_degrees=%d\n",
>  		sample ? "sample" : "drv", degrees, delay_num,
> diff --git a/drivers/soc/rockchip/grf.c b/drivers/soc/rockchip/grf.c
> index 344870da7675..89fd4a4c69eb 100644
> --- a/drivers/soc/rockchip/grf.c
> +++ b/drivers/soc/rockchip/grf.c
> @@ -125,8 +125,8 @@ static const struct rockchip_grf_info rk3566_pipegrf __initconst = {
>  #define RK3576_SYSGRF_SOC_CON1		0x0004
>  
>  static const struct rockchip_grf_value rk3576_defaults_sys_grf[] __initconst = {
> -	{ "i3c0 weakpull", RK3576_SYSGRF_SOC_CON1, FIELD_PREP_WM16_CONST(GENMASK(7, 6), 3) },
> -	{ "i3c1 weakpull", RK3576_SYSGRF_SOC_CON1, FIELD_PREP_WM16_CONST(GENMASK(9, 8), 3) },
> +	{ "i3c0 weakpull", RK3576_SYSGRF_SOC_CON1, FIELD_PREP_WM16_CONST(BITS(6, 7), 3) },
> +	{ "i3c1 weakpull", RK3576_SYSGRF_SOC_CON1, FIELD_PREP_WM16_CONST(BITS(8, 9), 3) },
>  };
>  
>  static const struct rockchip_grf_info rk3576_sysgrf __initconst = {
> diff --git a/sound/soc/rockchip/rockchip_i2s_tdm.h b/sound/soc/rockchip/rockchip_i2s_tdm.h
> index 0171e05ee886..eee6db372ee7 100644
> --- a/sound/soc/rockchip/rockchip_i2s_tdm.h
> +++ b/sound/soc/rockchip/rockchip_i2s_tdm.h
> @@ -287,7 +287,7 @@ enum {
>  #define I2S_TDM_RXCR	(0x0034)
>  #define I2S_CLKDIV	(0x0038)
>  
> -#define HIWORD_UPDATE(v, h, l)	(FIELD_PREP_WM16_CONST(GENMASK((h), (l)), (v)))
> +#define HIWORD_UPDATE(v, h, l)	(FIELD_PREP_WM16_CONST(BITS((l), (h)), (v)))
>  
>  /* PX30 GRF CONFIGS */
>  #define PX30_I2S0_CLK_IN_SRC_FROM_TX		HIWORD_UPDATE(1, 13, 12)

-- 
Jani Nikula, Intel

