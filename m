Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DBDECCF9E5
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 26 Oct 2025 22:28:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lE1i73FagqNwpGSUbMArT4DvvIaTNptTmLttvo1A3Qo=; b=s6b+ZlG0fQ/rIG/xL+HPm8e6+h
	wPY2aft+dgPv/gP16NMELkJT+DDE3LbGEB/la14kaHOUvlmFX32upNhlD25hBW7/hXiHH1t4ghWN5
	eHL4fhy2cDdUiujGk7FO8AArV//3jlZHXEOuCylEWv+MW8r5ryZSksXWuCpkftY353T1JSpbUsrRw
	lZY2aPwnjWtIrwP9w09FMNZsrfH8XVtk+GmGL3aV3EVycJXlInZGuRxwynZcqm+hRFLjDBHunp8vC
	MT5tpxLKiGWlb764nzKND3f10qEqwjJNucqncoONwxhxFO8WV/RElUWZLS4hKThjb7iSMGpIOEC+w
	BlJz+zXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vD9EE-0000000CogZ-0DJ7;
	Sun, 26 Oct 2025 22:28:46 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vD9EB-0000000Cofm-2CRE
	for linux-arm-kernel@lists.infradead.org;
	Sun, 26 Oct 2025 22:28:44 +0000
Received: from pendragon.ideasonboard.com (82-203-161-16.bb.dnainternet.fi [82.203.161.16])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id C0CFF1F0E;
	Sun, 26 Oct 2025 23:26:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1761517614;
	bh=VKQFo2wPNIL18CuB3qiB0jANg2tkXXNSpvhyiVgRsMc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=razqeGsBxSglcceb1F4Gdb98xf7ZRp6vHkqCOab9W65FnNoegiSim+m2Fk8fj/49C
	 MrM6YyoR7BoGpLT0pWLToks4e4XLehxL1gMaMbf2ifuo7vwxdXtfqEk5x0cK7Xt1FF
	 Th5s1naHJYqOzkVLYsfVdGGHKcErOyyYxSKhqZ8U=
Date: Mon, 27 Oct 2025 00:28:26 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Frank Li <Frank.li@nxp.com>
Cc: Guoniu Zhou <guoniu.zhou@nxp.com>, Rui Miguel Silva <rmfrfs@gmail.com>,
	Martin Kepplinger <martink@posteo.de>,
	Purism Kernel Team <kernel@puri.sm>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-media@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 2/4] media: imx8mq-mipi-csi2: Add output filed in
 csi2_pix_format
Message-ID: <20251026222826.GJ13023@pendragon.ideasonboard.com>
References: <20250820-csi2_imx8mq-v5-0-e04a6fc593bd@nxp.com>
 <20250820-csi2_imx8mq-v5-2-e04a6fc593bd@nxp.com>
 <aKXcPVQnQzCx6C5z@lizhi-Precision-Tower-5810>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aKXcPVQnQzCx6C5z@lizhi-Precision-Tower-5810>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251026_152843_725934_47653832 
X-CRM114-Status: GOOD (  20.46  )
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

On Wed, Aug 20, 2025 at 10:31:25AM -0400, Frank Li wrote:
> On Wed, Aug 20, 2025 at 07:04:57PM +0800, Guoniu Zhou wrote:
> > Add output filed in csi2_pix_format since the format on the
> > source pad might change due to unpacking.
> 
> Nit: wrap at 75 chars position
> 
> Add output filed in csi2_pix_format since the format on the source pad

s/filed/field/

> might change due to unpacking.
> 
> Treat 0 as meaning the output uses the same format as the input.
> 
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> 
> > Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
> > ---
> >  drivers/media/platform/nxp/imx8mq-mipi-csi2.c | 4 ++++
> >  1 file changed, 4 insertions(+)
> >
> > diff --git a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c b/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
> > index 85700655ecad334c61e9b5f9f073e10b6db2618f..ad7adc677e389e0f35b0cf63195279e197907f8c 100644
> > --- a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
> > +++ b/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
> > @@ -139,6 +139,7 @@ struct csi_state {
> >

A kerneldoc block would be good here to document the fields, it's not
very clear from the name what the output field is.

> >  struct csi2_pix_format {
> >  	u32 code;
> > +	u32 output;
> >  };
> >
> >  /* -----------------------------------------------------------------------------
> > @@ -634,6 +635,9 @@ static int imx8mq_mipi_csi_set_fmt(struct v4l2_subdev *sd,
> >  	fmt = v4l2_subdev_state_get_format(sd_state, MIPI_CSI2_PAD_SOURCE);
> >  	*fmt = sdformat->format;
> >
> > +	/* The format on the source pad might change due to unpacking. */
> > +	fmt->code = csi2_fmt->output ? : csi2_fmt->code;
> > +
> >  	return 0;
> >  }
> >

-- 
Regards,

Laurent Pinchart

