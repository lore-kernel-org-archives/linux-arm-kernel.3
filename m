Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 774CE10F92E5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 31 Mar 2026 16:15:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5CKY1ShayeyBKgTS9g5WXc+sjIt0plkwo3U2URkMkP8=; b=w/mzZ47iAUX+XIDa883YB9tLvD
	h6wjgCk02oEGDj5okHnI3/M1CgGAmhPTWkMlvgjr/x54jXg/1Hh5p42jBmM5mHtvnUtAHKULh0wr8
	V//R+WI9kO+AmHSu1xyfej8lDkNLxpR3xx4szrb6ctpPlMFiXPg8eqUJAS75B4f/s7hVhICjRZLsv
	s0GpHUGVckX4BB2cPAoQ5JZkckH8ccHt+cOd4ixAvgeSM5If326LLZJWK/kkZGlH+ED65N3nAFols
	ziI9SNw/4pNFfWgSFmGbGFFCgMleTUC8aE4MZ0moUshE7SKjHyMUAvcD/oCoDjg3dFwKNQoZkCqpf
	EmSewTow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7bkI-0000000DFIb-1k3T;
	Tue, 31 Mar 2026 16:15:14 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7bkG-0000000DFFq-0Bvb;
	Tue, 31 Mar 2026 16:15:13 +0000
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 9A4D1316;
	Tue, 31 Mar 2026 18:13:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1774973625;
	bh=X9DLUqDirxP78ERBWuBb7M9vy72FmkWGBKCvgxS6PLc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gufU9QZwxiaCy/dKK6MO/NyomEBr4hZr+Pkcj8H7Opvpck0RB3FSgTO0pRcHzk4ya
	 BnzveGIseVY7dND6ZjyPe9lrnsF8eOzNaTn3x2oK58K9awslOAgLdxZRr3LDPy33qB
	 BtP+0B18lDJElX4eAVxP3diMFYylOtUrlpEp8PEI=
Date: Tue, 31 Mar 2026 19:15:06 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <barnabas.pocze@ideasonboard.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Dafna Hirschfeld <dafna@fastmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>, linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] media: rkisp1: Add support for CAC
Message-ID: <20260331161506.GD3357297@killaraus.ideasonboard.com>
References: <20260323140216.1486161-1-barnabas.pocze@ideasonboard.com>
 <acP7qpa8TxGLKFiw@zed>
 <6c7ffd2d-94fa-4408-ac24-1e7adac95e5d@ideasonboard.com>
 <acu-j4hm0g8pTeAF@zed>
 <20260331133934.GC3357297@killaraus.ideasonboard.com>
 <5a7d1894-ee12-42b6-b40c-4d0e0b370974@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5a7d1894-ee12-42b6-b40c-4d0e0b370974@ideasonboard.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260331_091512_401103_4A021E32 
X-CRM114-Status: GOOD (  42.99  )
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

On Tue, Mar 31, 2026 at 05:24:38PM +0200, Barnabás Pőcze wrote:
> 2026. 03. 31. 15:39 keltezéssel, Laurent Pinchart írta:
> > On Tue, Mar 31, 2026 at 02:42:33PM +0200, Jacopo Mondi wrote:
> >> On Mon, Mar 30, 2026 at 04:40:18PM +0200, Barnabás Pőcze wrote:
> >>> 2026. 03. 25. 16:21 keltezéssel, Jacopo Mondi írta:
> >>>> On Mon, Mar 23, 2026 at 03:02:16PM +0100, Barnabás Pőcze wrote:
> >>>>> The CAC block implements chromatic aberration correction. Expose it to
> >>>>> userspace using the extensible parameters format. This was tested on the
> >>>>> i.MX8MP platform, but based on available documentation it is also present
> >>>>> in the RK3399 variant (V10). Thus presumably also in later versions,
> >>>>> so no feature flag is introduced.
> >>>>>
> >>>>> Signed-off-by: Barnabás Pőcze <barnabas.pocze@ideasonboard.com>
> >>>>
> >>>> Only minors..
> >>>>
> >>>>> ---
> >>>>>    .../platform/rockchip/rkisp1/rkisp1-params.c  |  69 ++++++++++++
> >>>>>    .../platform/rockchip/rkisp1/rkisp1-regs.h    |  21 +++-
> >>>>>    include/uapi/linux/rkisp1-config.h            | 106 +++++++++++++++++-
> >>>>>    3 files changed, 193 insertions(+), 3 deletions(-)
> >>>>>
> >>>>> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
> >>>>> index 6442436a5e428..b889af9dcee45 100644
> >>>>> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
> >>>>> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
> >>>>> @@ -64,6 +64,7 @@ union rkisp1_ext_params_config {
> >>>>>    	struct rkisp1_ext_params_compand_bls_config compand_bls;
> >>>>>    	struct rkisp1_ext_params_compand_curve_config compand_curve;
> >>>>>    	struct rkisp1_ext_params_wdr_config wdr;
> >>>>> +	struct rkisp1_ext_params_cac_config cac;
> >>>>>    };
> >>>>>
> >>>>>    enum rkisp1_params_formats {
> >>>>> @@ -1413,6 +1414,48 @@ static void rkisp1_wdr_config(struct rkisp1_params *params,
> >>>>>    				     RKISP1_CIF_ISP_WDR_TONE_CURVE_YM_MASK);
> >>>>>    }
> >>>>>
> >>>>> +static void
> >>>>> +rkisp1_cac_config(struct rkisp1_params *params,
> >>>>> +		  const struct rkisp1_cif_isp_cac_config *arg)
> >>>>
> >>>> Fits in one line without going over 80 cols
> >>>
> >>> This is what the other functions looks like, so went this this.
> >>
> >> It seems to me not all of them are broken, but only the ones that go
> >> over 80 cols
> 
> I think I misunderstood initially. Adjusted now.
> 
> >> in example:
> >>
> >> static void rkisp1_dpf_config(struct rkisp1_params *params,
> >> 			      const struct rkisp1_cif_isp_dpf_config *arg)
> >>
> >> A detail anyway, up to you
> >>
> >>>>> +{
> >>>>> +	u32 regval;
> > 
> > All other functions in this file name similar variables "val", "value"
> > or "reg_val". Let's not introduce a fourth one. I have a small
> > preference for "val", but that's not mandatory.
> 
> Adjusted.
> 
> >>>>> +
> >>>>> +	/*
> >>>>> +	 * The enable bit is in the same register (RKISP1_CIF_ISP_CAC_CTRL),
> >>>>> +	 * so only set the clipping mode, and do not modify the other bits.
> >>>>> +	 */
> >>>>> +	regval = rkisp1_read(params->rkisp1, RKISP1_CIF_ISP_CAC_CTRL);
> >>>>> +	regval &= ~(RKISP1_CIF_ISP_CAC_CTRL_H_CLIP_MODE |
> >>>>> +		    RKISP1_CIF_ISP_CAC_CTRL_V_CLIP_MODE);
> >>>>> +	regval |= FIELD_PREP(RKISP1_CIF_ISP_CAC_CTRL_H_CLIP_MODE, arg->h_clip_mode) |
> >>>>> +		  FIELD_PREP(RKISP1_CIF_ISP_CAC_CTRL_V_CLIP_MODE, arg->v_clip_mode);
> >>>>> +	rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_CAC_CTRL, regval);
> >>>>> +
> >>>>> +	regval = FIELD_PREP(RKISP1_CIF_ISP_CAC_COUNT_START_H_MASK, arg->h_count_start) |
> >>>>> +		 FIELD_PREP(RKISP1_CIF_ISP_CAC_COUNT_START_V_MASK, arg->v_count_start);
> >>>>> +	rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_CAC_COUNT_START, regval);
> >>>>> +
> >>>>> +	regval = FIELD_PREP(RKISP1_CIF_ISP_CAC_A_RED_MASK, arg->red[0]) |
> >>>>> +		 FIELD_PREP(RKISP1_CIF_ISP_CAC_A_BLUE_MASK, arg->blue[0]);
> >>>>> +	rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_CAC_A, regval);
> >>>>> +
> >>>>> +	regval = FIELD_PREP(RKISP1_CIF_ISP_CAC_B_RED_MASK, arg->red[1]) |
> >>>>> +		 FIELD_PREP(RKISP1_CIF_ISP_CAC_B_BLUE_MASK, arg->blue[1]);
> >>>>> +	rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_CAC_B, regval);
> >>>>> +
> >>>>> +	regval = FIELD_PREP(RKISP1_CIF_ISP_CAC_C_RED_MASK, arg->red[2]) |
> >>>>> +		 FIELD_PREP(RKISP1_CIF_ISP_CAC_C_BLUE_MASK, arg->blue[2]);
> >>>>> +	rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_CAC_C, regval);
> >>>>> +
> >>>>> +	regval = FIELD_PREP(RKISP1_CIF_ISP_CAC_X_NORM_NF_MASK, arg->x_nf) |
> >>>>> +		 FIELD_PREP(RKISP1_CIF_ISP_CAC_X_NORM_NS_MASK, arg->x_ns);
> >>>>> +	rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_CAC_X_NORM, regval);
> >>>>> +
> >>>>> +	regval = FIELD_PREP(RKISP1_CIF_ISP_CAC_Y_NORM_NF_MASK, arg->y_nf) |
> >>>>> +		 FIELD_PREP(RKISP1_CIF_ISP_CAC_Y_NORM_NS_MASK, arg->y_ns);
> >>>>> +	rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_CAC_Y_NORM, regval);
> >>>>> +}
> >>>>> +
> >>>>>    static void
> >>>>>    rkisp1_isp_isr_other_config(struct rkisp1_params *params,
> >>>>>    			    const struct rkisp1_params_cfg *new_params)
> >>>>> @@ -2089,6 +2132,25 @@ static void rkisp1_ext_params_wdr(struct rkisp1_params *params,
> >>>>>    				      RKISP1_CIF_ISP_WDR_CTRL_ENABLE);
> >>>>>    }
> >>>>>
> >>>>> +static void rkisp1_ext_params_cac(struct rkisp1_params *params,
> >>>>> +				  const union rkisp1_ext_params_config *block)
> >>>>> +{
> >>>>> +	const struct rkisp1_ext_params_cac_config *cac = &block->cac;
> >>>>> +
> >>>>> +	if (cac->header.flags & RKISP1_EXT_PARAMS_FL_BLOCK_DISABLE) {
> >>>>> +		rkisp1_param_clear_bits(params, RKISP1_CIF_ISP_CAC_CTRL,
> >>>>> +					RKISP1_CIF_ISP_CAC_CTRL_ENABLE);
> >>>>> +		return;
> >>>>> +	}
> >>>>> +
> >>>>> +	rkisp1_cac_config(params, &cac->config);
> >>>>> +
> >>>>> +	if ((cac->header.flags & RKISP1_EXT_PARAMS_FL_BLOCK_ENABLE) &&
> >>>>> +	    !(params->enabled_blocks & BIT(cac->header.type)))
> >>>>> +		rkisp1_param_set_bits(params, RKISP1_CIF_ISP_CAC_CTRL,
> >>>>> +				      RKISP1_CIF_ISP_CAC_CTRL_ENABLE);
> >>>>> +}
> >>>>> +
> >>>>>    typedef void (*rkisp1_block_handler)(struct rkisp1_params *params,
> >>>>>    			     const union rkisp1_ext_params_config *config);
> >>>>>
> >>>>> @@ -2185,6 +2247,10 @@ static const struct rkisp1_ext_params_handler {
> >>>>>    		.handler	= rkisp1_ext_params_wdr,
> >>>>>    		.group		= RKISP1_EXT_PARAMS_BLOCK_GROUP_OTHERS,
> >>>>>    	},
> >>>>> +	[RKISP1_EXT_PARAMS_BLOCK_TYPE_CAC] = {
> >>>>> +		.handler	= rkisp1_ext_params_cac,
> >>>>> +		.group		= RKISP1_EXT_PARAMS_BLOCK_GROUP_OTHERS,
> >>>>> +	},
> >>>>>    };
> >>>>>
> >>>>>    #define RKISP1_PARAMS_BLOCK_INFO(block, data) \
> >>>>> @@ -2215,6 +2281,7 @@ rkisp1_ext_params_block_types_info[] = {
> >>>>>    	RKISP1_PARAMS_BLOCK_INFO(COMPAND_EXPAND, compand_curve),
> >>>>>    	RKISP1_PARAMS_BLOCK_INFO(COMPAND_COMPRESS, compand_curve),
> >>>>>    	RKISP1_PARAMS_BLOCK_INFO(WDR, wdr),
> >>>>> +	RKISP1_PARAMS_BLOCK_INFO(CAC, cac),
> >>>>>    };
> >>>>>
> >>>>>    static_assert(ARRAY_SIZE(rkisp1_ext_params_handlers) ==
> >>>>> @@ -2474,6 +2541,8 @@ void rkisp1_params_disable(struct rkisp1_params *params)
> >>>>>    	rkisp1_ie_enable(params, false);
> >>>>>    	rkisp1_param_clear_bits(params, RKISP1_CIF_ISP_DPF_MODE,
> >>>>>    				RKISP1_CIF_ISP_DPF_MODE_EN);
> >>>>> +	rkisp1_param_clear_bits(params, RKISP1_CIF_ISP_CAC_CTRL,
> >>>>> +				RKISP1_CIF_ISP_CAC_CTRL_ENABLE);
> >>>>>    }
> >>>>>
> >>>>>    static const struct rkisp1_params_ops rkisp1_v10_params_ops = {
> >>>>> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-regs.h b/drivers/media/platform/rockchip/rkisp1/rkisp1-regs.h
> >>>>> index fbeb186cde0d5..8e25537459bbd 100644
> >>>>> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-regs.h
> >>>>> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-regs.h
> >>>>> @@ -724,6 +724,23 @@
> >>>>>    #define RKISP1_CIF_ISP_WDR_DMIN_STRENGTH_MASK		GENMASK(20, 16)
> >>>>>    #define RKISP1_CIF_ISP_WDR_DMIN_STRENGTH_MAX		16U
> >>>>>
> >>>>> +/* CAC */
> >>>>> +#define RKISP1_CIF_ISP_CAC_CTRL_ENABLE		BIT(0)
> >>>>> +#define RKISP1_CIF_ISP_CAC_CTRL_V_CLIP_MODE	GENMASK(2, 1)
> >>>>> +#define RKISP1_CIF_ISP_CAC_CTRL_H_CLIP_MODE	GENMASK(3, 3)
> > 
> > I'd go for BIT(3) as you use BIT(0) for the enable bit.
> 
> Adjusted.
> 
> >>>>> +#define RKISP1_CIF_ISP_CAC_COUNT_START_H_MASK	GENMASK(12, 0)
> >>>>> +#define RKISP1_CIF_ISP_CAC_COUNT_START_V_MASK	GENMASK(28, 16)
> >>>>> +#define RKISP1_CIF_ISP_CAC_A_RED_MASK		GENMASK(8, 0)
> >>>>> +#define RKISP1_CIF_ISP_CAC_A_BLUE_MASK		GENMASK(24, 16)
> >>>>> +#define RKISP1_CIF_ISP_CAC_B_RED_MASK		GENMASK(8, 0)
> >>>>> +#define RKISP1_CIF_ISP_CAC_B_BLUE_MASK		GENMASK(24, 16)
> >>>>> +#define RKISP1_CIF_ISP_CAC_C_RED_MASK		GENMASK(8, 0)
> >>>>> +#define RKISP1_CIF_ISP_CAC_C_BLUE_MASK		GENMASK(24, 16)
> >>>>
> >>>> All these masks for coefficients 0, 1 and 2 are identical. Maybe
> >>>> #define RKISP1_CIF_ISP_CAC_RED_MASK		GENMASK(8, 0)
> >>>> #define RKISP1_CIF_ISP_CAC_BLUE_MASK		GENMASK(24, 16)
> >>>>
> >>>> is enough
> >>>
> >>> Adjusted.
> >>>
> >>>>> +#define RKISP1_CIF_ISP_CAC_X_NORM_NF_MASK	GENMASK(4, 0)
> >>>>> +#define RKISP1_CIF_ISP_CAC_X_NORM_NS_MASK	GENMASK(19, 16)
> >>>>> +#define RKISP1_CIF_ISP_CAC_Y_NORM_NF_MASK	GENMASK(4, 0)
> >>>>> +#define RKISP1_CIF_ISP_CAC_Y_NORM_NS_MASK	GENMASK(19, 16)
> >>>
> >>> Did the same with these as well.
> >>
> >> Ah thanks!
> >>
> >>>>> +
> >>>>>    /* =================================================================== */
> >>>>>    /*                            CIF Registers                            */
> >>>>>    /* =================================================================== */
> >>>>> @@ -1196,8 +1213,8 @@
> >>>>>    #define RKISP1_CIF_ISP_CAC_A			(RKISP1_CIF_ISP_CAC_BASE + 0x00000008)
> >>>>>    #define RKISP1_CIF_ISP_CAC_B			(RKISP1_CIF_ISP_CAC_BASE + 0x0000000c)
> >>>>>    #define RKISP1_CIF_ISP_CAC_C			(RKISP1_CIF_ISP_CAC_BASE + 0x00000010)
> >>>>> -#define RKISP1_CIF_ISP_X_NORM			(RKISP1_CIF_ISP_CAC_BASE + 0x00000014)
> >>>>> -#define RKISP1_CIF_ISP_Y_NORM			(RKISP1_CIF_ISP_CAC_BASE + 0x00000018)
> >>>>> +#define RKISP1_CIF_ISP_CAC_X_NORM		(RKISP1_CIF_ISP_CAC_BASE + 0x00000014)
> >>>>> +#define RKISP1_CIF_ISP_CAC_Y_NORM		(RKISP1_CIF_ISP_CAC_BASE + 0x00000018)
> >>>>>
> >>>>>    #define RKISP1_CIF_ISP_EXP_BASE			0x00002600
> >>>>>    #define RKISP1_CIF_ISP_EXP_CTRL			(RKISP1_CIF_ISP_EXP_BASE + 0x00000000)
> >>>>> diff --git a/include/uapi/linux/rkisp1-config.h b/include/uapi/linux/rkisp1-config.h
> >>>>> index b2d2a71f7baff..d8acccaddd0e9 100644
> >>>>> --- a/include/uapi/linux/rkisp1-config.h
> >>>>> +++ b/include/uapi/linux/rkisp1-config.h
> >>>>> @@ -967,6 +967,92 @@ struct rkisp1_cif_isp_wdr_config {
> >>>>>    	__u8 use_iref;
> >>>>>    };
> >>>>>
> >>>>> +/*
> >>>>> + * enum rkisp1_cif_isp_cac_h_clip_mode - horizontal clipping mode
> >>>>> + *
> >>>>> + * @RKISP1_CIF_ISP_CAC_H_CLIP_MODE_4PX: +/- 4 pixels
> >>>>> + * @RKISP1_CIF_ISP_CAC_H_CLIP_MODE_4_5PX: +/- 4/5 pixels depending on bayer position
> >>>>> + */
> >>>>> +enum rkisp1_cif_isp_cac_h_clip_mode {
> >>>>> +	RKISP1_CIF_ISP_CAC_H_CLIP_MODE_4PX = 0,
> >>>>> +	RKISP1_CIF_ISP_CAC_H_CLIP_MODE_4_5PX = 1,
> >>>>> +};
> >>>>> +
> >>>>> +/**
> >>>>> + * enum rkisp1_cif_isp_cac_v_clip_mode - vertical clipping mode
> >>>>> + *
> >>>>> + * @RKISP1_CIF_ISP_CAC_V_CLIP_MODE_2PX: +/- 2 pixels
> >>>>> + * @RKISP1_CIF_ISP_CAC_V_CLIP_MODE_3PX: +/- 3 pixels
> >>>>> + * @RKISP1_CIF_ISP_CAC_V_CLIP_MODE_3_4PX: +/- 3/4 pixels depending on bayer position
> >>>>> + */
> >>>>> +enum rkisp1_cif_isp_cac_v_clip_mode {
> >>>>> +	RKISP1_CIF_ISP_CAC_V_CLIP_MODE_2PX = 0,
> >>>>> +	RKISP1_CIF_ISP_CAC_V_CLIP_MODE_3PX = 1,
> >>>>> +	RKISP1_CIF_ISP_CAC_V_CLIP_MODE_3_4PX = 2,
> >>>>> +};
> >>>>> +
> >>>>> +/**
> >>>>> + * struct rkisp1_cif_isp_cac_config - chromatic aberration correction configuration
> >>>>> + *
> >>>>> + * The correction is carried out by shifting the red and blue pixels relative
> >>>>> + * to the green ones, depending on the distance from the optical center:
> >>>>
> >>>> Yes, the distance to the center is one parameter, but the shifting
> >>>> amount depends on other things. I would drop the last part of the
> >>>> sentence and move the description of the two below fields after the
> >>>> text
> >>>
> >>> That's true, but within a specific image, the only varying quantity
> >>> is the distance, so I think it is important to emphasize that.
> >>>
> >>> And I also quite like this structure of
> >>>    - description of step
> >>>    - parameters of step
> >>>    - description of step
> >>>    ...
> >>>
> >>> so I would love to keep it like this, if that's ok?
> >>
> >> Ok!
> > 
> > Ack.
> > 
> >>>>> + *
> >>>>> + * @h_count_start: horizontal coordinate of the optical center (13-bit unsigned integer; [1,8191])
> >>>>> + * @v_count_start: vertical coordinate of the optical center (13-bit unsigned integer; [1,8191])
> >>>>
> >>>> so these could go just before @x_nf
> >>>>
> >>>>> + *
> >>>>> + * For each pixel, the x/y distances from the optical center are calculated and
> >>>>
> >>>> I forgot: did we establish that the correction is applied to the
> >>>> euclidean distance or to x and y separately ?
> >>>
> >>> Given that there are two sets of "normalization" parameters, the assumption is that
> >>> at least the x/y distances are transformed separately. I see two reasonable choices
> >>> after that: (a) use the two distances separately, (b) use the radial distance. The
> >>> documentation says (b). However, testing with sensor test patterns suggests that
> >>> it is not the case (a horizontal/vertical boundary between appropriately colored
> >>> regions should have a curvature after the transformation with appropriate parameters).
> >>
> >> I now recall that you have been able to shift just one plan when using
> >> the sensor's test pattern
> > 
> > I agree about the normalization, but it sounds really weird that the
> > hardware would then shift separately in the X and Y directions. Below
> > you document the radial correction formula, which looks correct to me.
> 
> I think so, too. But if it uses the radial distance, I would expect the shifting to happen
> along the radius. But that does not appear to be the case (e.g. y_nf=0 removes all vertical
> correction). This could be explained by saying that the shifting actually happens along the
> direction determined by the sum of the normalized distance vectors, but that seemed a bit
> far fetched to me.

It may not be that far fetched. The X and Y normalization factors are
separate to support non-square pixels. Taking for example a pixel whose
height is twice the width, the vertical distance in physical units is
twice the vertical distance in pixels. The vertical normalization factor
will be twice the horizontal factor to account for that and calculate a
radius in physical units (as the displacement caused by the chromatic
aberration depends on the physical distance to the image sensor). The
pixel displacement then needs to be converted back to pixel units.

Of course someone may point out that a normalization factor of 0 should
result in an infinite vertical displacement when converting back. The
above explanation may make no sense, or the hardware implementation may
take some shortcuts that result in no vertical displacement when y_nf is
0. It could be interesting to vary y_nf and see how the vertical
displacement evolves.

> And even with that, I would expect to be able to turn a straight line
> into a curve. Maybe I'm doing something wrong, but I can't recall ever being able to.
> 
> >>>>> + * then transformed into the [0,255] range based on the following formula:
> >>>>
> >>>> s/transformed/normalized ?
> >>>
> >>> To be honest I vastly prefer "transform" / "map" over "normalize" here.
> >>
> >> You're right here, the below formula doesn't normalize the
> >> distance in an interval but just re-scale it
> >>
> >>>>> + *
> >>>>> + *   (((d << 4) >> s) * f) >> 5
> >>>>> + *
> >>>>> + * where `d` is the distance, `s` and `f` are the normalization parameters:
> >>>>
> >>>> Can you use 'ns' and 'nf' to match the below ?
> >>>
> >>> Adjusted.
> >>
> >> Thanks!
> >>
> >>>>> + *
> >>>>> + * @x_nf: horizontal normalization scale parameter (5-bit unsigned integer; [0,31])
> >>>>> + * @x_ns: horizontal normalization shift parameter (4-bit unsigned integer; [0,15])
> >>>>> + *
> >>>>> + * @y_nf: vertical normalization scale parameter (5-bit unsigned integer; [0,31])
> >>>>> + * @y_ns: vertical normalization shift parameter (4-bit unsigned integer; [0,15])
> >>>>> + *
> >>>>> + * These parameters should be chosen based on the image resolution, the position
> >>>>> + * of the optical center, and the shape of pixels: so that no normalized distance
> >>>>
> >>>> s/pixels:/pixels/
> >>>
> >>> Replaced `:` with `,`.
> >>>
> >>>>> + * is larger than 255. If the pixels have square shape, the two sets of parameters
> >>>>> + * should be equal.
> > 
> > I wonder if we could have anisotropic lenses (from the point of view of
> > chromatic aberrations) with square pixels. We can deal with it later.
> 
> Right, this is what the documentation suggests, and I believe it is probably "correct enough"
> most of the time. But should I remove it?
> 
> >>>>> + *
> >>>>> + * The actual amount of correction is calculated with a third degree polynomial:
> >>>>> + *
> >>>>> + *   c[0] * r + c[1] * r^2 + c[2] * r^3
> >>>>> + *
> >>>>> + * where `c` is the set of coefficients for the given color, and `r` is distance:
> >>>>> + *
> >>>>> + * @red: red coefficients (5.4 two's complement; [-16,15.9375])
> >>>>> + * @blue: blue coefficients (5.4 two's complement; [-16,15.9375])
> >>>>> + *
> >>>>> + * Finally, the amount is clipped as requested:
> >>>>> + *
> >>>>> + * @h_clip_mode: maximum horizontal shift (from enum rkisp1_cif_isp_cac_h_clip_mode)
> >>>>> + * @v_clip_mode: maximum vertical shift (from enum rkisp1_cif_isp_cac_v_clip_mode)
> >>>>> + *
> >>>>> + * A positive result will shift away from the optical center, while a negative
> >>>>> + * one will shift towards the optical center. In the latter case, the pixel
> >>>>> + * values at the edges are duplicated.
> >>>>> + */
> >>>>> +struct rkisp1_cif_isp_cac_config {
> >>>>> +	__u8 h_clip_mode;
> >>>>> +	__u8 v_clip_mode;
> >>>>> +
> >>>>> +	__u16 h_count_start;
> >>>>> +	__u16 v_count_start;
> >>>>> +
> >>>>> +	__u16 red[3];
> >>>>> +	__u16 blue[3];
> >>>>> +
> >>>>> +	__u8 x_nf;
> >>>>> +	__u8 x_ns;
> >>>>> +
> >>>>> +	__u8 y_nf;
> >>>>> +	__u8 y_ns;
> >>>>> +};
> >>>>> +
> >>>>>    /*---------- PART2: Measurement Statistics ------------*/
> >>>>>
> >>>>>    /**
> >>>>> @@ -1161,6 +1247,7 @@ enum rkisp1_ext_params_block_type {
> >>>>>    	RKISP1_EXT_PARAMS_BLOCK_TYPE_COMPAND_EXPAND,
> >>>>>    	RKISP1_EXT_PARAMS_BLOCK_TYPE_COMPAND_COMPRESS,
> >>>>>    	RKISP1_EXT_PARAMS_BLOCK_TYPE_WDR,
> >>>>> +	RKISP1_EXT_PARAMS_BLOCK_TYPE_CAC,
> >>>>>    };
> >>>>>
> >>>>>    /* For backward compatibility */
> >>>>> @@ -1507,6 +1594,22 @@ struct rkisp1_ext_params_wdr_config {
> >>>>>    	struct rkisp1_cif_isp_wdr_config config;
> >>>>>    } __attribute__((aligned(8)));
> >>>>>
> >>>>> +/**
> >>>>> + * struct rkisp1_ext_params_cac_config - RkISP1 extensible params CAC config
> >>>>> + *
> >>>>> + * RkISP1 extensible parameters CAC block.
> >>>>> + * Identified by :c:type:`RKISP1_EXT_PARAMS_BLOCK_TYPE_CAC`.
> >>>>> + *
> >>>>> + * @header: The RkISP1 extensible parameters header, see
> >>>>> + *	    :c:type:`rkisp1_ext_params_block_header`
> >>>>> + * @config: CAC configuration, see
> >>>>> + *	    :c:type:`rkisp1_cif_isp_cac_config`
> >>>>> + */
> >>>>> +struct rkisp1_ext_params_cac_config {
> >>>>> +	struct rkisp1_ext_params_block_header header;
> >>>>> +	struct rkisp1_cif_isp_cac_config config;
> >>>>> +} __attribute__((aligned(8)));
> >>>>> +
> >>>>>    /*
> >>>>>     * The rkisp1_ext_params_compand_curve_config structure is counted twice as it
> >>>>>     * is used for both the COMPAND_EXPAND and COMPAND_COMPRESS block types.
> >>>>> @@ -1532,7 +1635,8 @@ struct rkisp1_ext_params_wdr_config {
> >>>>>    	sizeof(struct rkisp1_ext_params_compand_bls_config)		+\
> >>>>>    	sizeof(struct rkisp1_ext_params_compand_curve_config)		+\
> >>>>>    	sizeof(struct rkisp1_ext_params_compand_curve_config)		+\
> >>>>> -	sizeof(struct rkisp1_ext_params_wdr_config))
> >>>>> +	sizeof(struct rkisp1_ext_params_wdr_config)			+\
> >>>>> +	sizeof(struct rkisp1_ext_params_cac_config))
> >>>>
> >>>> All minors, please add
> >>>> Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> > 
> > and
> > 
> > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > 
> >>>>>
> >>>>>    /**
> >>>>>     * enum rksip1_ext_param_buffer_version - RkISP1 extensible parameters version

-- 
Regards,

Laurent Pinchart

