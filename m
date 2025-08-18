Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFC46CA0EF1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Aug 2025 14:48:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qU3IHfk3ESbowA6n7pG8YXjjvkEH8f7CzBnMcPijEu4=; b=yatetElohJFaGl5vX3ow+UzM/T
	ZUaQcJEFpvUyJi4DlwUgChD9lzB/2JFto2j5/xWmNn+/RZlJQSh2s10ZQKW4wqIo7wiSO7qg9/eHc
	gMy+GTF6Ewxi6MqisJ405LVqc6FnTB+W2uMcEjphnf4U1CJteuOpjRugQZfO3AhtSoan/VcYH+yyf
	PF3tXGC9uxBm8GEzISJ8cOfWo+TF/bnSGAwsMHXqcjn+07vxePobm5n7pF4Do6SmDAapqPYGK7y5q
	hfdvAcmia9FfgwCeI58opGv5sBrGz5S1QS8FaArOSBX9W57ZhomjCAG0jHdhEF51VEi2I/2NpRomX
	qOb5GEkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo1AB-00000007oRK-01ZV;
	Mon, 18 Aug 2025 14:48:43 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unwFq-000000074L1-1ehl
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 Aug 2025 09:34:15 +0000
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 820F12416;
	Mon, 18 Aug 2025 11:33:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1755509594;
	bh=aXdSfAR4983BNp7JPSaitHLvzBXoEwpGjFaYcoiR100=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qFpZvREcnMuHPIGb3EM8skBbhb2ObaIU7jEuzNsB+cq8A5yVEnZH6ML/uK7/znBNF
	 ao4NfQQ/eQUGGOmHDSeL/+4mOxSY7VyVPD7WBv/oRu4Oc2z/c4FjolrY3X0WDKejMC
	 rbi9ExxsgMNJUcWGOMLNZrlaACJKMT0TQ3I4dz1s=
Date: Mon, 18 Aug 2025 12:33:49 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Inbaraj E <inbaraj.e@samsung.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, krzk@kernel.org,
	s.nawrocki@samsung.com, s.hauer@pengutronix.de, shawnguo@kernel.org,
	cw00.choi@samsung.com, rmfrfs@gmail.com, martink@posteo.de,
	mchehab@kernel.org, linux-fsd@tesla.com, will@kernel.org,
	catalin.marinas@arm.com, pankaj.dubey@samsung.com,
	shradha.t@samsung.com, ravi.patel@samsung.com,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, alim.akhtar@samsung.com,
	linux-samsung-soc@vger.kernel.org, kernel@puri.sm,
	kernel@pengutronix.de, festevam@gmail.com,
	linux-media@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 07/12] media: imx-mipi-csis: Add support to configure
 specific vc
Message-ID: <20250818093349.GC5862@pendragon.ideasonboard.com>
References: <20250814140943.22531-1-inbaraj.e@samsung.com>
 <CGME20250814141036epcas5p1fc02cea3f97534303673eb8453b6a18f@epcas5p1.samsung.com>
 <20250814140943.22531-8-inbaraj.e@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250814140943.22531-8-inbaraj.e@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250818_023414_573370_B621A57E 
X-CRM114-Status: GOOD (  21.34  )
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

Hi Inbaraj,

On Thu, Aug 14, 2025 at 07:39:38PM +0530, Inbaraj E wrote:
> MIPI_CSIS_V3_3 and MIPI_CSIS_V3_6_3 support streaming only on VC0.

That doesn't appear to be true, at least for MIPI_CSIS_V3_6_3. I have a
patch series that adds VC support for v3.6.3 in the i.MX8MP, and it has
been susccessfully tested.

> The
> MIPI_CSIS_V4_3 present in the FSD SoC supports streaming on any one VC
> out of four VCs. To extend support for the FSD SoC, add the ability to
> configure a specific VC. The FSD CSI Rx can configure any one VC and
> start streaming.
> 
> Signed-off-by: Inbaraj E <inbaraj.e@samsung.com>
> ---
>  drivers/media/platform/nxp/imx-mipi-csis.c | 17 +++++++++++------
>  1 file changed, 11 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/media/platform/nxp/imx-mipi-csis.c b/drivers/media/platform/nxp/imx-mipi-csis.c
> index a3e2c8ae332f..4f6c417fdf58 100644
> --- a/drivers/media/platform/nxp/imx-mipi-csis.c
> +++ b/drivers/media/platform/nxp/imx-mipi-csis.c
> @@ -54,7 +54,7 @@
>  
>  /* CSIS common control */
>  #define MIPI_CSIS_CMN_CTRL			0x04
> -#define MIPI_CSIS_CMN_CTRL_UPDATE_SHADOW	BIT(16)
> +#define MIPI_CSIS_CMN_CTRL_UPDATE_SHADOW(n)	BIT(((n) + 16))
>  #define MIPI_CSIS_CMN_CTRL_INTER_MODE		BIT(10)
>  #define MIPI_CSIS_CMN_CTRL_UPDATE_SHADOW_CTRL	BIT(2)
>  #define MIPI_CSIS_CMN_CTRL_RESET		BIT(1)
> @@ -319,6 +319,7 @@ struct mipi_csis_device {
>  		u32 hs_settle;
>  		u32 clk_settle;
>  	} debug;
> +	unsigned int vc;
>  };
>  
>  /* -----------------------------------------------------------------------------
> @@ -544,9 +545,10 @@ static void __mipi_csis_set_format(struct mipi_csis_device *csis,
>  				   const struct csis_pix_format *csis_fmt)
>  {
>  	u32 val;
> +	unsigned int vc = csis->vc;
>  
>  	/* Color format */
> -	val = mipi_csis_read(csis, MIPI_CSIS_ISP_CONFIG_CH(0));
> +	val = mipi_csis_read(csis, MIPI_CSIS_ISP_CONFIG_CH(vc));
>  	val &= ~(MIPI_CSIS_ISPCFG_ALIGN_32BIT | MIPI_CSIS_ISPCFG_FMT_MASK
>  		| MIPI_CSIS_ISPCFG_PIXEL_MASK);
>  
> @@ -567,11 +569,11 @@ static void __mipi_csis_set_format(struct mipi_csis_device *csis,
>  		val |= MIPI_CSIS_ISPCFG_PIXEL_MODE_DUAL;
>  
>  	val |= MIPI_CSIS_ISPCFG_FMT(csis_fmt->data_type);
> -	mipi_csis_write(csis, MIPI_CSIS_ISP_CONFIG_CH(0), val);
> +	mipi_csis_write(csis, MIPI_CSIS_ISP_CONFIG_CH(vc), val);
>  
>  	/* Pixel resolution */
>  	val = format->width | (format->height << 16);
> -	mipi_csis_write(csis, MIPI_CSIS_ISP_RESOL_CH(0), val);
> +	mipi_csis_write(csis, MIPI_CSIS_ISP_RESOL_CH(vc), val);
>  }
>  
>  static int mipi_csis_calculate_params(struct mipi_csis_device *csis,
> @@ -631,6 +633,7 @@ static void mipi_csis_set_params(struct mipi_csis_device *csis,
>  {
>  	int lanes = csis->bus.num_data_lanes;
>  	u32 val;
> +	unsigned int vc = csis->vc;
>  
>  	val = mipi_csis_read(csis, MIPI_CSIS_CMN_CTRL);
>  	val &= ~MIPI_CSIS_CMN_CTRL_LANE_NR_MASK;
> @@ -648,7 +651,7 @@ static void mipi_csis_set_params(struct mipi_csis_device *csis,
>  	val = (0 << MIPI_CSIS_ISP_SYNC_HSYNC_LINTV_OFFSET)
>  	    | (0 << MIPI_CSIS_ISP_SYNC_VSYNC_SINTV_OFFSET)
>  	    | (0 << MIPI_CSIS_ISP_SYNC_VSYNC_EINTV_OFFSET);
> -	mipi_csis_write(csis, MIPI_CSIS_ISP_SYNC_CH(0), val);
> +	mipi_csis_write(csis, MIPI_CSIS_ISP_SYNC_CH(vc), val);
>  
>  	val = mipi_csis_read(csis, MIPI_CSIS_CLK_CTRL);
>  	val |= MIPI_CSIS_CLK_CTRL_WCLK_SRC;
> @@ -669,7 +672,7 @@ static void mipi_csis_set_params(struct mipi_csis_device *csis,
>  	/* Update the shadow register. */
>  	val = mipi_csis_read(csis, MIPI_CSIS_CMN_CTRL);
>  	mipi_csis_write(csis, MIPI_CSIS_CMN_CTRL,
> -			val | MIPI_CSIS_CMN_CTRL_UPDATE_SHADOW |
> +			val | MIPI_CSIS_CMN_CTRL_UPDATE_SHADOW(vc) |
>  			MIPI_CSIS_CMN_CTRL_UPDATE_SHADOW_CTRL);
>  }
>  
> @@ -945,6 +948,8 @@ static int mipi_csis_s_stream(struct v4l2_subdev *sd, int enable)
>  	struct v4l2_subdev_state *state;
>  	int ret;
>  
> +	csis->vc = 0;
> +

Dynamic VC selection belongs to this patch, not patch 09/12. 09/12 does
too many different things, it has to be split into one patch per
feature.

>  	if (!enable) {
>  		v4l2_subdev_disable_streams(csis->source.sd,
>  					    csis->source.pad->index, BIT(0));

-- 
Regards,

Laurent Pinchart

