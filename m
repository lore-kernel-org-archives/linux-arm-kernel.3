Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59410CCF9E5
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 26 Oct 2025 22:12:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MXQk25ZVDx1M43+mr/XRzPNhvQidHGa6mJJkgYklrsY=; b=T3yNd5DPCwfXAJqbs7e3Yu7lks
	pV4qurPFM2DUZWO5LQwTYloYPVj60pxNESTH3KR6ibm05jdxaqi/OAH/orWFyJavN1Jh+7/45rd5R
	Lon4+Y0f3Ct/ndInFxRuZLj/Q5xb36bqttX8S332ASMuNpp0iIHeJcjQ+rU81tQCeKYoJhmEiTulr
	BG9gV7owPiPqJVL5qklp0DXtilxc8YEABdjZBCJGyuFbblTA3b0O69hD9Dbph6/In5Yhfpkybc9S5
	jhY22GGwhAsHq0EOXHh3Dvj5HZ8c0TjN2u5dUN1PkDh0O98GrlyJPRhBUz79KYluprRGxOurcLCtw
	GUkTqzIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vD8y9-0000000Cndt-40Jp;
	Sun, 26 Oct 2025 22:12:09 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vD8y7-0000000CndC-3IcV
	for linux-arm-kernel@lists.infradead.org;
	Sun, 26 Oct 2025 22:12:08 +0000
Received: from pendragon.ideasonboard.com (82-203-161-16.bb.dnainternet.fi [82.203.161.16])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id DD2EA1F0E;
	Sun, 26 Oct 2025 23:10:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1761516618;
	bh=2FItP0Jr2f51sPq6GWmj36Vulpiy8YWMunvCKYHvpME=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=N3fUNtwKJBmAVHGQzv0Xh1/8neLjL3T4tJVOxQHLUNcOEiS5jmGXuIdzTm4lq8aTV
	 mL5SyqSe9TKkk67L5lzXHsmls9HbvezFzy7lF1VhlzJBrRso+NDiXmXSzYmsBSN1Rr
	 08yIf6p1xYtyQ/nwbMmAz1lhZwQuMXaMAa2abYmE=
Date: Mon, 27 Oct 2025 00:11:49 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Frank Li <Frank.li@nxp.com>
Cc: Guoniu Zhou <guoniu.zhou@oss.nxp.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Guoniu Zhou <guoniu.zhou@nxp.com>
Subject: Re: [PATCH 2/3] media: nxp: imx8-isi: Keep the default value for
 BLANK_PXL field
Message-ID: <20251026221149.GH13023@pendragon.ideasonboard.com>
References: <20251024-isi_imx95-v1-0-3ad1af7c3d61@nxp.com>
 <20251024-isi_imx95-v1-2-3ad1af7c3d61@nxp.com>
 <aPuCHltyz9Ed7wcF@lizhi-Precision-Tower-5810>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aPuCHltyz9Ed7wcF@lizhi-Precision-Tower-5810>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251026_151207_970696_F8DE5DF7 
X-CRM114-Status: GOOD (  25.06  )
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

On Fri, Oct 24, 2025 at 09:41:50AM -0400, Frank Li wrote:
> On Fri, Oct 24, 2025 at 05:46:53PM +0800, Guoniu Zhou wrote:
> > From: Guoniu Zhou <guoniu.zhou@nxp.com>
> >
> > The field provides the value of the blank pixel to be inserted in the
> 
> The field BLANK_PXL provides
> 
> > image in case an overflow error occurs in the output buffers of the
> > channel. Its default value is 0xff, so no need to set again.
> >
> > Besides, the field only exist in i.MX8QM/XP ISI version. Other versions
> > like mscale series, remove the field since it won't send data to AXI bus

What's the mscale series ? Is that i.MX 8M ?

> > when overflow error occurs and set the field as reserved. i.MX9 series
> 
> mark BLANK_PXL as reserved. i.MX9 series use it for other purposes.
> 
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> 
> > use the field as other purposes.
> >
> > Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> > ---
> >  drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c | 6 ++----
> >  1 file changed, 2 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c
> > index 9225a7ac1c3ee7e42e64983982eb4b6c27e356fe..0187d4ab97e8e28fca9013f6864a094e08f2c570 100644
> > --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c
> > +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c
> > @@ -309,8 +309,8 @@ static void mxc_isi_channel_set_control(struct mxc_isi_pipe *pipe,
> >
> >  	val = mxc_isi_read(pipe, CHNL_CTRL);
> >  	val &= ~(CHNL_CTRL_CHNL_BYPASS | CHNL_CTRL_CHAIN_BUF_MASK |
> > -		 CHNL_CTRL_BLANK_PXL_MASK | CHNL_CTRL_SRC_TYPE_MASK |
> > -		 CHNL_CTRL_MIPI_VC_ID_MASK | CHNL_CTRL_SRC_INPUT_MASK);
> > +		 CHNL_CTRL_SRC_TYPE_MASK | CHNL_CTRL_MIPI_VC_ID_MASK |
> > +		 CHNL_CTRL_SRC_INPUT_MASK);
> >
> >  	/*
> >  	 * If no scaling or color space conversion is needed, bypass the
> > @@ -323,8 +323,6 @@ static void mxc_isi_channel_set_control(struct mxc_isi_pipe *pipe,
> >  	if (pipe->chained)
> >  		val |= CHNL_CTRL_CHAIN_BUF(CHNL_CTRL_CHAIN_BUF_2_CHAIN);
> >
> > -	val |= CHNL_CTRL_BLANK_PXL(0xff);
> > -
> >  	/* Input source (including VC configuration for CSI-2) */
> >  	if (input == MXC_ISI_INPUT_MEM) {
> >  		/*

-- 
Regards,

Laurent Pinchart

