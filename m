Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2CFCCCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Nov 2025 08:28:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FbXPwhSt+htnwS9cyUZB+wlgW1z8D9YcUqzOr+LINw0=; b=R6emJhSRwUBdMtZOoN43iKSBjW
	9naDXqbNuVpMLUpF27J6tCLEYCu66ITUnJvb4WygahsOeCex/fYjDqre1qHFMyE2GYSsRatTBCeBx
	wrEoTwaNVEC67jKmLf9DfEbKdxta+V4Yua1PQ8KeBVPFfNYSkIqvXaU4RXxSUWcRnLuZAP8M+02Y5
	n0aRasCRW8k/ZGlx09UvvhbNLLqaoW181YZqRUZJl18LZfJcnPwyumIw3UUldnkD7Wig7spYXReJ8
	jjz4Tuu8ryRzN7GoS8FDeyH+3cMciY0C1f/pBmo65OtVC6inxikTtJifanxQqX9RSOTNtpGCjY2rz
	PQ25oe9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vINGV-00000004zHk-2Jup;
	Mon, 10 Nov 2025 08:28:43 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vINGS-00000004zGO-2LxN
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Nov 2025 08:28:41 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vINGJ-0006Rp-SA; Mon, 10 Nov 2025 09:28:31 +0100
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vINGJ-007zQw-2A;
	Mon, 10 Nov 2025 09:28:31 +0100
Received: from pza by lupine with local (Exim 4.98.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vINGJ-0000000049R-2T7U;
	Mon, 10 Nov 2025 09:28:31 +0100
Message-ID: <b198e853113e39397803d9651f7126566d269601.camel@pengutronix.de>
Subject: Re: [PATCH 1/6] media: staging: media: imx6-mipi-csi2: replace
 space with tab for alignment
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Frank Li <Frank.Li@nxp.com>, Steve Longerbeam <slongerbeam@gmail.com>, 
 Mauro Carvalho Chehab	 <mchehab@kernel.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer
 <s.hauer@pengutronix.de>, Pengutronix Kernel Team	 <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Cc: imx@lists.linux.dev, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Date: Mon, 10 Nov 2025 09:28:31 +0100
In-Reply-To: <20251107-stage-csi2-cleanup-v1-1-5d42535243ac@nxp.com>
References: <20251107-stage-csi2-cleanup-v1-0-5d42535243ac@nxp.com>
	 <20251107-stage-csi2-cleanup-v1-1-5d42535243ac@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1-1+deb13u1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251110_002840_595084_285A2E2E 
X-CRM114-Status: GOOD (  18.02  )
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

On Fr, 2025-11-07 at 15:44 -0500, Frank Li wrote:
> Replace space with tab to follow coding convention. No functional change.

Which convention? To be honest, this feels a bit like unnecessary churn
to me.

> Signed-off-by: Frank Li <Frank.Li@nxp.com>
>
> ---
>  drivers/staging/media/imx/imx6-mipi-csi2.c | 92 +++++++++++++++---------=
------
>  1 file changed, 46 insertions(+), 46 deletions(-)
>=20
> diff --git a/drivers/staging/media/imx/imx6-mipi-csi2.c b/drivers/staging=
/media/imx/imx6-mipi-csi2.c
> index dd8c7b3233bccfc34b59e0f0ff813b36752e1526..42256441b881d9f132ad7ff89=
9d6f1e35643b4ac 100644
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
> =20
>  /*
>   * The default maximum bit-rate per lane in Mbps, if the
>   * source subdev does not provide V4L2_CID_LINK_FREQ.
>   */
> -#define CSI2_DEFAULT_MAX_MBPS 849
> +#define CSI2_DEFAULT_MAX_MBPS	849

Personally, I like these changes.

>  struct csi2_dev {
> -	struct device          *dev;
> -	struct v4l2_subdev      sd;
> -	struct v4l2_async_notifier notifier;
> -	struct media_pad       pad[CSI2_NUM_PADS];
> -	struct clk             *dphy_clk;
> -	struct clk             *pllref_clk;
> -	struct clk             *pix_clk; /* what is this? */
> -	void __iomem           *base;
> -
> -	struct v4l2_subdev	*remote;
> -	unsigned int		remote_pad;
> -	unsigned short		data_lanes;
> +	struct device			*dev;
> +	struct v4l2_subdev		sd;
> +	struct v4l2_async_notifier	notifier;
> +	struct media_pad		pad[CSI2_NUM_PADS];
> +	struct clk			*dphy_clk;
> +	struct clk			*pllref_clk;
> +	struct clk			*pix_clk; /* what is this? */
> +	void __iomem			*base;
> +
> +	struct v4l2_subdev		*remote;
> +	unsigned int			remote_pad;
> +	unsigned short			data_lanes;
> =20
>  	/* lock to protect all members below */
> -	struct mutex lock;
> +	struct mutex			lock;
> =20
> -	struct v4l2_mbus_framefmt format_mbus;
> +	struct v4l2_mbus_framefmt	format_mbus;
> =20
> -	int                     stream_count;
> -	struct v4l2_subdev      *src_sd;
> -	bool                    sink_linked[CSI2_NUM_SRC_PADS];
> +	int				stream_count;
> +	struct v4l2_subdev		*src_sd;
> +	bool				sink_linked[CSI2_NUM_SRC_PADS];
>  };

Here I'd prefer just a single space between type and identifier.

regards
Philipp

