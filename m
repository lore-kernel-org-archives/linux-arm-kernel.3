Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28A56C5B543
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Jun 2025 09:46:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2aDOVsXZyzKU8vuWttCueOe5SPtog226gwz3hdC0Fu0=; b=zxwssc8d1MnvaolFhOXawJO3OR
	5cdwFeuEC2SvDxwezOOoeEpUk8SQTFk9aYWqeSzFwmKcznR2Bgq2aNj2PJUt0aCyUs00oijXImavg
	RLkpSIW9MMJmes0GEjVgziy+pQF1xrHaZjFdX/KRnno1IRGgVcSWbFIiDHPR4QzTGlHEC2BRxYzdY
	2Xfy8iFgaJ9rJ8pFEwjoIWOez1JFSZeOI4qzOJ2ItCDG2OjtY9rBMAfR4XEbxsrm6ppX3Dj6I9kkM
	2bjtSeaNrxERla8HNhAWxwGQknsHF1EmaXz8VG3W8iXj2sQ/lGwsIesrBgxtj4NKnDZQlRMOSmYJJ
	VAwH/64g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOvYL-00000006Nzu-1sle;
	Tue, 10 Jun 2025 09:45:57 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOv67-00000006Ija-1evR
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Jun 2025 09:16:48 +0000
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 879462EC;
	Tue, 10 Jun 2025 11:16:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1749546997;
	bh=Q+OZ7g6V3LXKnAvLoFoKYNotBv9+t1H/YpraEjFfDH8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mwaWdgOMzZ3jGsW3vKdoubdUvUz6vxEm26kcAdWngSNwWWCEWCnXdLQhrNpTT6PoY
	 yaSKMOmokriJadwM+gXm+VaZtOPbnwUYTi6LzSEVCKp6ExzH4JUSGjuRffnEWx5tgR
	 +KJmCp2UrVKWhFaywTlrFJKoV2LcgHv1ZSWgzIaY=
Date: Tue, 10 Jun 2025 12:16:32 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: linux-media@vger.kernel.org, Isaac Scott <isaac.scott@ideasonboard.com>,
	Rui Miguel Silva <rmfrfs@gmail.com>,
	Martin Kepplinger <martink@posteo.de>,
	Purism Kernel Team <kernel@puri.sm>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/8] media: imx-mipi-csis: Rename register macros to
 match reference manual
Message-ID: <20250610091632.GM27510@pendragon.ideasonboard.com>
References: <20250608235840.23871-1-laurent.pinchart@ideasonboard.com>
 <20250608235840.23871-2-laurent.pinchart@ideasonboard.com>
 <3358871.aeNJFYEL58@steina-w>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <3358871.aeNJFYEL58@steina-w>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_021647_574964_A2348D94 
X-CRM114-Status: GOOD (  26.41  )
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

On Tue, Jun 10, 2025 at 11:10:54AM +0200, Alexander Stein wrote:
> Am Montag, 9. Juni 2025, 01:58:33 CEST schrieb Laurent Pinchart:
> > The CSIS driver uses register macro names that do not match the
> > reference manual of the i.MX7[DS] and i.MX8M[MNP] SoCs in which the CSIS
> > is integrated. Rename them to match the documentation, making the code
> > easier to read alongside the reference manuals.
> > 
> > One of the misnamed register fields is MIPI_CSIS_INT_SRC_ERR_UNKNOWN,
> > which led to the corresponding event being logged as "Unknown Error".
> > The correct register field name is MIPI_CSIS_INT_SRC_ERR_ID, documented
> > as "Unknown ID error". Update the event description accordingly.
> > 
> > While at it, also replace a few *_OFFSET macros with parametric macros
> > for consistency, and add the missing MIPI_CSIS_ISP_RESOL_VRESOL and
> > MIPI_CSIS_ISP_RESOL_HRESOL register field macros.
> > 
> > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > ---
> >  drivers/media/platform/nxp/imx-mipi-csis.c | 69 +++++++++++-----------
> >  1 file changed, 36 insertions(+), 33 deletions(-)
> > 
> > diff --git a/drivers/media/platform/nxp/imx-mipi-csis.c b/drivers/media/platform/nxp/imx-mipi-csis.c
> > index 2beb5f43c2c0..d59666ef7545 100644
> > --- a/drivers/media/platform/nxp/imx-mipi-csis.c
> > +++ b/drivers/media/platform/nxp/imx-mipi-csis.c
> > @@ -55,13 +55,13 @@
> >  /* CSIS common control */
> >  #define MIPI_CSIS_CMN_CTRL			0x04
> >  #define MIPI_CSIS_CMN_CTRL_UPDATE_SHADOW	BIT(16)
> > -#define MIPI_CSIS_CMN_CTRL_INTER_MODE		BIT(10)
> > +#define MIPI_CSIS_CMN_CTRL_INTERLEAVE_MODE_NONE	(0 << 10)
> > +#define MIPI_CSIS_CMN_CTRL_INTERLEAVE_MODE_DT	(1 << 10)
> > +#define MIPI_CSIS_CMN_CTRL_LANE_NUMBER(n)	((n) << 8)
> > +#define MIPI_CSIS_CMN_CTRL_LANE_NUMBER_MASK	(3 << 8)
> >  #define MIPI_CSIS_CMN_CTRL_UPDATE_SHADOW_CTRL	BIT(2)
> > -#define MIPI_CSIS_CMN_CTRL_RESET		BIT(1)
> > -#define MIPI_CSIS_CMN_CTRL_ENABLE		BIT(0)
> > -
> > -#define MIPI_CSIS_CMN_CTRL_LANE_NR_OFFSET	8
> > -#define MIPI_CSIS_CMN_CTRL_LANE_NR_MASK		(3 << 8)
> > +#define MIPI_CSIS_CMN_CTRL_SW_RESET		BIT(1)
> > +#define MIPI_CSIS_CMN_CTRL_CSI_EN		BIT(0)
> >  
> >  /* CSIS clock control */
> >  #define MIPI_CSIS_CLK_CTRL			0x08
> > @@ -87,7 +87,7 @@
> >  #define MIPI_CSIS_INT_MSK_ERR_WRONG_CFG		BIT(3)
> >  #define MIPI_CSIS_INT_MSK_ERR_ECC		BIT(2)
> >  #define MIPI_CSIS_INT_MSK_ERR_CRC		BIT(1)
> > -#define MIPI_CSIS_INT_MSK_ERR_UNKNOWN		BIT(0)
> > +#define MIPI_CSIS_INT_MSK_ERR_ID		BIT(0)
> >  
> >  /* CSIS Interrupt source */
> >  #define MIPI_CSIS_INT_SRC			0x14
> > @@ -107,7 +107,7 @@
> >  #define MIPI_CSIS_INT_SRC_ERR_WRONG_CFG		BIT(3)
> >  #define MIPI_CSIS_INT_SRC_ERR_ECC		BIT(2)
> >  #define MIPI_CSIS_INT_SRC_ERR_CRC		BIT(1)
> > -#define MIPI_CSIS_INT_SRC_ERR_UNKNOWN		BIT(0)
> > +#define MIPI_CSIS_INT_SRC_ERR_ID		BIT(0)
> >  #define MIPI_CSIS_INT_SRC_ERRORS		0xfffff
> >  
> >  /* D-PHY status control */
> > @@ -123,8 +123,8 @@
> >  #define MIPI_CSIS_DPHY_CMN_CTRL_HSSETTLE_MASK	GENMASK(31, 24)
> >  #define MIPI_CSIS_DPHY_CMN_CTRL_CLKSETTLE(n)	((n) << 22)
> >  #define MIPI_CSIS_DPHY_CMN_CTRL_CLKSETTLE_MASK	GENMASK(23, 22)
> > -#define MIPI_CSIS_DPHY_CMN_CTRL_DPDN_SWAP_CLK	BIT(6)
> > -#define MIPI_CSIS_DPHY_CMN_CTRL_DPDN_SWAP_DAT	BIT(5)
> > +#define MIPI_CSIS_DPHY_CMN_CTRL_S_DPDN_SWAP_CLK	BIT(6)
> > +#define MIPI_CSIS_DPHY_CMN_CTRL_S_DPDN_SWAP_DAT	BIT(5)
> >  #define MIPI_CSIS_DPHY_CMN_CTRL_ENABLE_DAT	BIT(1)
> >  #define MIPI_CSIS_DPHY_CMN_CTRL_ENABLE_CLK	BIT(0)
> >  #define MIPI_CSIS_DPHY_CMN_CTRL_ENABLE		(0x1f << 0)
> > @@ -179,21 +179,23 @@
> >  #define MIPI_CSIS_ISPCFG_PIXEL_MODE_SINGLE	(0 << 12)
> >  #define MIPI_CSIS_ISPCFG_PIXEL_MODE_DUAL	(1 << 12)
> >  #define MIPI_CSIS_ISPCFG_PIXEL_MODE_QUAD	(2 << 12)	/* i.MX8M[MNP] only */
> > -#define MIPI_CSIS_ISPCFG_PIXEL_MASK		(3 << 12)
> > -#define MIPI_CSIS_ISPCFG_ALIGN_32BIT		BIT(11)
> > -#define MIPI_CSIS_ISPCFG_FMT(fmt)		((fmt) << 2)
> > -#define MIPI_CSIS_ISPCFG_FMT_MASK		(0x3f << 2)
> > +#define MIPI_CSIS_ISPCFG_PIXEL_MODE_MASK	(3 << 12)
> > +#define MIPI_CSIS_ISPCFG_PARALLEL		BIT(11)
> > +#define MIPI_CSIS_ISPCFG_DATAFORMAT(fmt)	((fmt) << 2)
> > +#define MIPI_CSIS_ISPCFG_DATAFORMAT_MASK	(0x3f << 2)
> >  
> >  /* ISP Image Resolution register */
> >  #define MIPI_CSIS_ISP_RESOL_CH(n)		(0x44 + (n) * 0x10)
> > +#define MIPI_CSIS_ISP_RESOL_VRESOL(n)		((n) << 16)
> > +#define MIPI_CSIS_ISP_RESOL_HRESOL(n)		((n) << 0)
> >  #define CSIS_MAX_PIX_WIDTH			0xffff
> >  #define CSIS_MAX_PIX_HEIGHT			0xffff
> >  
> >  /* ISP SYNC register */
> >  #define MIPI_CSIS_ISP_SYNC_CH(n)		(0x48 + (n) * 0x10)
> > -#define MIPI_CSIS_ISP_SYNC_HSYNC_LINTV_OFFSET	18
> > -#define MIPI_CSIS_ISP_SYNC_VSYNC_SINTV_OFFSET	12
> > -#define MIPI_CSIS_ISP_SYNC_VSYNC_EINTV_OFFSET	0
> > +#define MIPI_CSIS_ISP_SYNC_HSYNC_LINTV(n)	((n) << 18)
> > +#define MIPI_CSIS_ISP_SYNC_VSYNC_SINTV(n)	((n) << 12)
> > +#define MIPI_CSIS_ISP_SYNC_VSYNC_EINTV(n)	((n) << 0)
> >  
> >  /* ISP shadow registers */
> >  #define MIPI_CSIS_SDW_CONFIG_CH(n)		(0x80 + (n) * 0x10)
> > @@ -246,7 +248,7 @@ static const struct mipi_csis_event mipi_csis_events[] = {
> >  	{ false, MIPI_CSIS_INT_SRC_ERR_WRONG_CFG,	"Wrong Configuration Error" },
> >  	{ false, MIPI_CSIS_INT_SRC_ERR_ECC,		"ECC Error" },
> >  	{ false, MIPI_CSIS_INT_SRC_ERR_CRC,		"CRC Error" },
> > -	{ false, MIPI_CSIS_INT_SRC_ERR_UNKNOWN,		"Unknown Error" },
> > +	{ false, MIPI_CSIS_INT_SRC_ERR_ID,		"Unknown ID Error" },
> >  	{ true, MIPI_CSIS_DBG_INTR_SRC_DT_NOT_SUPPORT,	"Data Type Not Supported" },
> >  	{ true, MIPI_CSIS_DBG_INTR_SRC_DT_IGNORE,	"Data Type Ignored" },
> >  	{ true, MIPI_CSIS_DBG_INTR_SRC_ERR_FRAME_SIZE,	"Frame Size Error" },
> > @@ -517,7 +519,7 @@ static void mipi_csis_sw_reset(struct mipi_csis_device *csis)
> >  	u32 val = mipi_csis_read(csis, MIPI_CSIS_CMN_CTRL);
> >  
> >  	mipi_csis_write(csis, MIPI_CSIS_CMN_CTRL,
> > -			val | MIPI_CSIS_CMN_CTRL_RESET);
> > +			val | MIPI_CSIS_CMN_CTRL_SW_RESET);
> >  	usleep_range(10, 20);
> >  }
> >  
> > @@ -527,9 +529,9 @@ static void mipi_csis_system_enable(struct mipi_csis_device *csis, int on)
> >  
> >  	val = mipi_csis_read(csis, MIPI_CSIS_CMN_CTRL);
> >  	if (on)
> > -		val |= MIPI_CSIS_CMN_CTRL_ENABLE;
> > +		val |= MIPI_CSIS_CMN_CTRL_CSI_EN;
> >  	else
> > -		val &= ~MIPI_CSIS_CMN_CTRL_ENABLE;
> > +		val &= ~MIPI_CSIS_CMN_CTRL_CSI_EN;
> >  	mipi_csis_write(csis, MIPI_CSIS_CMN_CTRL, val);
> >  
> >  	val = mipi_csis_read(csis, MIPI_CSIS_DPHY_CMN_CTRL);
> > @@ -549,8 +551,8 @@ static void __mipi_csis_set_format(struct mipi_csis_device *csis,
> >  
> >  	/* Color format */
> >  	val = mipi_csis_read(csis, MIPI_CSIS_ISP_CONFIG_CH(0));
> > -	val &= ~(MIPI_CSIS_ISPCFG_ALIGN_32BIT | MIPI_CSIS_ISPCFG_FMT_MASK
> > -		| MIPI_CSIS_ISPCFG_PIXEL_MASK);
> > +	val &= ~(MIPI_CSIS_ISPCFG_PARALLEL | MIPI_CSIS_ISPCFG_PIXEL_MODE_MASK |
> > +		 MIPI_CSIS_ISPCFG_DATAFORMAT_MASK);
> >  
> >  	/*
> >  	 * YUV 4:2:2 can be transferred with 8 or 16 bits per clock sample
> > @@ -568,12 +570,13 @@ static void __mipi_csis_set_format(struct mipi_csis_device *csis,
> >  	if (csis_fmt->data_type == MIPI_CSI2_DT_YUV422_8B)
> >  		val |= MIPI_CSIS_ISPCFG_PIXEL_MODE_DUAL;
> >  
> > -	val |= MIPI_CSIS_ISPCFG_FMT(csis_fmt->data_type);
> > +	val |= MIPI_CSIS_ISPCFG_DATAFORMAT(csis_fmt->data_type);
> >  	mipi_csis_write(csis, MIPI_CSIS_ISP_CONFIG_CH(0), val);
> >  
> >  	/* Pixel resolution */
> > -	val = format->width | (format->height << 16);
> > -	mipi_csis_write(csis, MIPI_CSIS_ISP_RESOL_CH(0), val);
> > +	mipi_csis_write(csis, MIPI_CSIS_ISP_RESOL_CH(0),
> > +			MIPI_CSIS_ISP_RESOL_VRESOL(format->height) |
> > +			MIPI_CSIS_ISP_RESOL_HRESOL(format->width));
> >  }
> >  
> >  static int mipi_csis_calculate_params(struct mipi_csis_device *csis,
> > @@ -635,10 +638,10 @@ static void mipi_csis_set_params(struct mipi_csis_device *csis,
> >  	u32 val;
> >  
> >  	val = mipi_csis_read(csis, MIPI_CSIS_CMN_CTRL);
> > -	val &= ~MIPI_CSIS_CMN_CTRL_LANE_NR_MASK;
> > -	val |= (lanes - 1) << MIPI_CSIS_CMN_CTRL_LANE_NR_OFFSET;
> > +	val &= ~MIPI_CSIS_CMN_CTRL_LANE_NUMBER_MASK;
> > +	val |= MIPI_CSIS_CMN_CTRL_LANE_NUMBER(lanes - 1);
> >  	if (csis->info->version == MIPI_CSIS_V3_3)
> > -		val |= MIPI_CSIS_CMN_CTRL_INTER_MODE;
> > +		val |= MIPI_CSIS_CMN_CTRL_INTERLEAVE_MODE_DT;
> 
> Mh, what about i.MX8MP which also has these bitfield defined, but is
> not a MIPI_CSIS_V3_3 core?

Short answer: no idea yet. Has anyone been able to capture embedded data
through the ISI on the i.MX8MP ?

> >  	mipi_csis_write(csis, MIPI_CSIS_CMN_CTRL, val);
> >  
> >  	__mipi_csis_set_format(csis, format, csis_fmt);
> > @@ -647,10 +650,10 @@ static void mipi_csis_set_params(struct mipi_csis_device *csis,
> >  			MIPI_CSIS_DPHY_CMN_CTRL_HSSETTLE(csis->hs_settle) |
> >  			MIPI_CSIS_DPHY_CMN_CTRL_CLKSETTLE(csis->clk_settle));
> >  
> > -	val = (0 << MIPI_CSIS_ISP_SYNC_HSYNC_LINTV_OFFSET)
> > -	    | (0 << MIPI_CSIS_ISP_SYNC_VSYNC_SINTV_OFFSET)
> > -	    | (0 << MIPI_CSIS_ISP_SYNC_VSYNC_EINTV_OFFSET);
> > -	mipi_csis_write(csis, MIPI_CSIS_ISP_SYNC_CH(0), val);
> > +	mipi_csis_write(csis, MIPI_CSIS_ISP_SYNC_CH(0),
> > +			MIPI_CSIS_ISP_SYNC_HSYNC_LINTV(0) |
> > +			MIPI_CSIS_ISP_SYNC_VSYNC_SINTV(0) |
> > +			MIPI_CSIS_ISP_SYNC_VSYNC_EINTV(0));
> >  
> >  	val = mipi_csis_read(csis, MIPI_CSIS_CLK_CTRL);
> >  	val |= MIPI_CSIS_CLK_CTRL_WCLK_SRC;

-- 
Regards,

Laurent Pinchart

