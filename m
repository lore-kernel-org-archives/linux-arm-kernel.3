Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CCF9CF2579
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Nov 2025 04:35:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Wn8xaDCsAATBL10km/g3TiBjGhEDjpxy/9SGKzuLoiY=; b=SsMkl8ePXERWutAWdWVzQblQF3
	Gam8vakmFz4tCXzA1VpUNqrF0YUKArBvfFq8ms0qBs9Yo1VjRkKh78sHLVfVRT1ncJ/9U8cVkot7Q
	YMwrcMMT2wH0sa55BYYZ1I8C/1iCse687WBaTH6o+v7WnD7nnC73oPjiiDIRd+nV5LTuY7AqopDDi
	xVJ72mL0D4MHTvfPnOZn5Bjn2GUOUmQS3x56fYaaj3SuLlx5B9IrN8j0+8XlBhb7TIaIgolsW0II2
	fGwjAwbJFy82+q1wL8vvn+mJrvxMM/yW07OL9Laxj/ZNJG/YmFlUttoR4JGD/0lS/xaMyBfTTWCQJ
	ZgUQomww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLZuc-00000001osy-1jSD;
	Wed, 19 Nov 2025 04:35:22 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLZua-00000001ory-1jSV
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Nov 2025 04:35:21 +0000
Received: from pendragon.ideasonboard.com (unknown [205.220.129.225])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 14E9EB5;
	Wed, 19 Nov 2025 05:33:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1763526795;
	bh=J5moTwiTxXOfuPBOlB1FvexbUDCLvBsjPBhAeKd7XO4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pW8dqBlCRTLwl4+7oKJAJYj+vbmdRGOjWy04Ez/Slz/refbqx64HU/eMXuPicXxXG
	 ctz5wvrwy7IhkY5n7hLu6xd17HzAVkF9CcR0+y8U5SdGcbzC3COkAHuKjyt9uEzEK9
	 FzPc69GC9LL8IY+mXbldtyPu9oD2tcnhnHh8+sEQ=
Date: Wed, 19 Nov 2025 13:34:51 +0900
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: Steve Longerbeam <slongerbeam@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/5] media: staging: media: imx6-mipi-csi2: replace
 spaces with tabs for alignment
Message-ID: <20251119043451.GA11519@pendragon.ideasonboard.com>
References: <20251111-stage-csi2-cleanup-v2-0-371bb951776f@nxp.com>
 <20251111-stage-csi2-cleanup-v2-1-371bb951776f@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251111-stage-csi2-cleanup-v2-1-371bb951776f@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251118_203520_596206_A1D3E306 
X-CRM114-Status: GOOD (  24.96  )
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

On Tue, Nov 11, 2025 at 04:42:13PM -0500, Frank Li wrote:
> Replace spaces with tabs to align register value definitions, making it
> easier to add new entries and maintain consistent formatting.
> 
> Also use a space between the type and field in struct csi2_dev.
> 
> No functional change.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
> changes in v2
> - struct use one space between type and field name.
> ---
>  drivers/staging/media/imx/imx6-mipi-csi2.c | 84 +++++++++++++++---------------
>  1 file changed, 42 insertions(+), 42 deletions(-)
> 
> diff --git a/drivers/staging/media/imx/imx6-mipi-csi2.c b/drivers/staging/media/imx/imx6-mipi-csi2.c
> index dd8c7b3233bccfc34b59e0f0ff813b36752e1526..1113ea2a37f03753423164069b95c049968cc0af 100644
> --- a/drivers/staging/media/imx/imx6-mipi-csi2.c
> +++ b/drivers/staging/media/imx/imx6-mipi-csi2.c
> @@ -23,65 +23,65 @@
>   * there must be 5 pads: 1 input pad from sensor, and
>   * the 4 virtual channel output pads
>   */
> -#define CSI2_SINK_PAD       0
> -#define CSI2_NUM_SINK_PADS  1
> -#define CSI2_NUM_SRC_PADS   4
> -#define CSI2_NUM_PADS       5
> +#define CSI2_SINK_PAD		0
> +#define CSI2_NUM_SINK_PADS	1
> +#define CSI2_NUM_SRC_PADS	4
> +#define CSI2_NUM_PADS		5
>  
>  /*
>   * The default maximum bit-rate per lane in Mbps, if the
>   * source subdev does not provide V4L2_CID_LINK_FREQ.
>   */
> -#define CSI2_DEFAULT_MAX_MBPS 849
> +#define CSI2_DEFAULT_MAX_MBPS	849
>  
>  struct csi2_dev {
> -	struct device          *dev;
> -	struct v4l2_subdev      sd;
> +	struct device *dev;
> +	struct v4l2_subdev sd;
>  	struct v4l2_async_notifier notifier;
> -	struct media_pad       pad[CSI2_NUM_PADS];
> -	struct clk             *dphy_clk;
> -	struct clk             *pllref_clk;
> -	struct clk             *pix_clk; /* what is this? */
> -	void __iomem           *base;
> +	struct media_pad pad[CSI2_NUM_PADS];
> +	struct clk *dphy_clk;
> +	struct clk *pllref_clk;
> +	struct clk *pix_clk; /* what is this? */
> +	void __iomem *base;
>  
> -	struct v4l2_subdev	*remote;
> -	unsigned int		remote_pad;
> -	unsigned short		data_lanes;
> +	struct v4l2_subdev *remote;
> +	unsigned int remote_pad;
> +	unsigned short data_lanes;
>  
>  	/* lock to protect all members below */
>  	struct mutex lock;
>  
>  	struct v4l2_mbus_framefmt format_mbus;
>  
> -	int                     stream_count;
> -	struct v4l2_subdev      *src_sd;
> -	bool                    sink_linked[CSI2_NUM_SRC_PADS];
> +	int stream_count;
> +	struct v4l2_subdev *src_sd;
> +	bool sink_linked[CSI2_NUM_SRC_PADS];
>  };
>  
>  #define DEVICE_NAME "imx6-mipi-csi2"
>  
>  /* Register offsets */
> -#define CSI2_VERSION            0x000
> -#define CSI2_N_LANES            0x004
> -#define CSI2_PHY_SHUTDOWNZ      0x008
> -#define CSI2_DPHY_RSTZ          0x00c
> -#define CSI2_RESETN             0x010
> -#define CSI2_PHY_STATE          0x014
> -#define PHY_STOPSTATEDATA_BIT   4
> -#define PHY_STOPSTATEDATA(n)    BIT(PHY_STOPSTATEDATA_BIT + (n))
> -#define PHY_RXCLKACTIVEHS       BIT(8)
> -#define PHY_RXULPSCLKNOT        BIT(9)
> -#define PHY_STOPSTATECLK        BIT(10)
> -#define CSI2_DATA_IDS_1         0x018
> -#define CSI2_DATA_IDS_2         0x01c
> -#define CSI2_ERR1               0x020
> -#define CSI2_ERR2               0x024
> -#define CSI2_MSK1               0x028
> -#define CSI2_MSK2               0x02c
> -#define CSI2_PHY_TST_CTRL0      0x030
> +#define CSI2_VERSION		0x000
> +#define CSI2_N_LANES		0x004
> +#define CSI2_PHY_SHUTDOWNZ	0x008
> +#define CSI2_DPHY_RSTZ		0x00c
> +#define CSI2_RESETN		0x010
> +#define CSI2_PHY_STATE		0x014
> +#define PHY_STOPSTATEDATA_BIT	4
> +#define PHY_STOPSTATEDATA(n)	BIT(PHY_STOPSTATEDATA_BIT + (n))
> +#define PHY_RXCLKACTIVEHS	BIT(8)
> +#define PHY_RXULPSCLKNOT	BIT(9)
> +#define PHY_STOPSTATECLK	BIT(10)
> +#define CSI2_DATA_IDS_1		0x018
> +#define CSI2_DATA_IDS_2		0x01c
> +#define CSI2_ERR1		0x020
> +#define CSI2_ERR2		0x024
> +#define CSI2_MSK1		0x028
> +#define CSI2_MSK2		0x02c
> +#define CSI2_PHY_TST_CTRL0	0x030
>  #define PHY_TESTCLR		BIT(0)
>  #define PHY_TESTCLK		BIT(1)
> -#define CSI2_PHY_TST_CTRL1      0x034
> +#define CSI2_PHY_TST_CTRL1	0x034
>  #define PHY_TESTEN		BIT(16)
>  /*
>   * i.MX CSI2IPU Gasket registers follow. The CSI2IPU gasket is
> @@ -106,13 +106,13 @@ static inline struct csi2_dev *notifier_to_dev(struct v4l2_async_notifier *n)
>   * reference manual is as follows:
>   *
>   * 1. Deassert presetn signal (global reset).
> - *        It's not clear what this "global reset" signal is (maybe APB
> - *        global reset), but in any case this step would be probably
> - *        be carried out during driver load in csi2_probe().
> + *	It's not clear what this "global reset" signal is (maybe APB
> + *	global reset), but in any case this step would be probably
> + *	be carried out during driver load in csi2_probe().
>   *
>   * 2. Configure MIPI Camera Sensor to put all Tx lanes in LP-11 state.
> - *        This must be carried out by the MIPI sensor's s_power(ON) subdev
> - *        op.
> + *	This must be carried out by the MIPI sensor's s_power(ON) subdev
> + *	op.
>   *
>   * 3. D-PHY initialization.
>   * 4. CSI2 Controller programming (Set N_LANES, deassert PHY_SHUTDOWNZ,

-- 
Regards,

Laurent Pinchart

