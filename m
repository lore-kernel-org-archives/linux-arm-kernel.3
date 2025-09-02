Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 812D3CA1005
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Sep 2025 19:09:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t0gXVzHny3RB6NJEYrOgw3bVgkgn+ugNrx0knOWoBNI=; b=oL0cxIVh8jB+HGxQM5Sw/xnENh
	B9hcp8VdzWz2+d3i6R8U+zajjnzXI8JLI9yU12XZEQiY256XLDBWMOefKmmRJDm7copQDUZXmu7w4
	AvrmwoFBisofF8Io8N0SwbJhNrila9im2xHKlEHWpoTDLuItkIz/9BirIapUvBhYcP9xV/HAxlOWz
	a8JOucOfmD43Uk9pQ3Y8TPDJUT7h1ONQKsHT0bivI1+c9k270CdnKtEcZMpEYAD8W3EIucCWsJAHf
	z4mO7vmHkZ9brR0i6RQfAXvYMiHD1MUgDil2/XQmMNXiCYIYF+6xte618yej0aXfQEyPl9gT7tOi9
	uaxjEVuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utWNS-00000001Yzy-1Mv2;
	Tue, 02 Sep 2025 19:09:10 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utQIX-0000000HNW0-3l7c
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Sep 2025 12:39:43 +0000
Received: from pendragon.ideasonboard.com (230.215-178-91.adsl-dyn.isp.belgacom.be [91.178.215.230])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id E2CBAC77;
	Tue,  2 Sep 2025 14:38:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1756816713;
	bh=fDh1rVUT2E+ochpfHW3rbcGmXbzriJy5LeM0r503rOQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qI/pm+nyTRdTSb/7Rb4s47sNeX3rkfRajqHDsIhTgVyB1RPVsK4a2HCzeVoejFtno
	 zLQLi473VX3QOwsMYXfdQ05kxih5QZ002ZcLWIOzZM14EpP9LR031KCfQWa6xNEzCg
	 TqLklRigOu/paxTyDaviol5p6P+0SrWdWD+dP1bQ=
Date: Tue, 2 Sep 2025 14:39:20 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Frank Li <Frank.li@nxp.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rui Miguel Silva <rmfrfs@gmail.com>,
	Martin Kepplinger <martink@posteo.de>,
	Purism Kernel Team <kernel@puri.sm>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>, linux-media@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	Alice Yuan <alice.yuan@nxp.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Robert Chiras <robert.chiras@nxp.com>,
	Zhipeng Wang <zhipeng.wang_1@nxp.com>
Subject: Re: [PATCH v4 0/5] media: imx8qxp: add parallel camera support
Message-ID: <20250902123920.GM13448@pendragon.ideasonboard.com>
References: <20250729-imx8qxp_pcam-v4-0-4dfca4ed2f87@nxp.com>
 <20250805010822.GC24627@pendragon.ideasonboard.com>
 <aLbcpEZXm5G1Onq7@lizhi-Precision-Tower-5810>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aLbcpEZXm5G1Onq7@lizhi-Precision-Tower-5810>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250902_053942_081308_C2FF93D2 
X-CRM114-Status: GOOD (  27.27  )
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

Hi Frank,

On Tue, Sep 02, 2025 at 08:01:40AM -0400, Frank Li wrote:
> On Tue, Aug 05, 2025 at 04:08:22AM +0300, Laurent Pinchart wrote:
> > Hi Frank,
> >
> > Thank you for the patches.
> >
> > I've quite busy these days, and I don't believe I will have time to
> > review this series before coming back from OSS Europe at the beginning
> > of September. Let's see if anyone on CC could volunteer.
> 
> Laurent Pincha
> 	I hope you have good time at OSS.
> 
> 	Do you have chance to review this patch?

I'm going through my mail backlog, which is really big at the moment.
I'd like someone else to volunteer to review this series. It won't scale
if I have to review all NXP media patches in my spare time :-/

> > On Tue, Jul 29, 2025 at 12:06:21PM -0400, Frank Li wrote:
> > > Add parallel camera support for i.MX8 chips.
> > >
> > > The below patch to add new format support to test ov5640 sensor
> > >    media: nxp: isi: add support for UYVY8_2X8 and YUYV8_2X8 bus codes
> > >
> > > The bindings and driver for parallel CSI
> > >    dt-bindings: media: add i.MX parallel csi support
> > >    media: nxp: add V4L2 subdev driver for parallel CSI
> > >
> > > DTS part need depend on previous MIPI CSI patches.
> > >   https://lore.kernel.org/imx/20250522-8qxp_camera-v5-13-d4be869fdb7e@nxp.com/
> > >
> > >   arm64: dts: imx8: add parellel csi nodes
> > >   arm64: dts: imx8qxp-mek: add parallel ov5640 camera support
> > >
> > > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > > ---
> > > Changes in v4:
> > > - remove imx93 driver support since have not camera sensor module to do test now.
> > >   Add it later
> > > - Add new patch
> > >   media: v4l2-common: Add helper function v4l_get_required_align_by_bpp()
> > > - See each patche's change log for detail.
> > > - Link to v3: https://lore.kernel.org/r/20250708-imx8qxp_pcam-v3-0-c8533e405df1@nxp.com
> > >
> > > Changes in v3:
> > > - replace CSI with CPI.
> > > - detail change see each patch's change logs
> > > - Link to v2: https://lore.kernel.org/r/20250703-imx8qxp_pcam-v2-0-188be85f06f1@nxp.com
> > >
> > > Changes in v2:
> > > - remove patch media: nxp: isi: add support for UYVY8_2X8 and YUYV8_2X8 bus codes
> > >   because pcif controller convert 2x8 to 1x16 to match isi's input
> > > - rename comaptible string to fsl,imx8qxp-pcif
> > > - See each patches's change log for detail
> > > - Link to v1: https://lore.kernel.org/r/20250630-imx8qxp_pcam-v1-0-eccd38d99201@nxp.com
> > >
> > > ---
> > > Alice Yuan (2):
> > >       dt-bindings: media: add i.MX parallel CPI support
> > >       media: nxp: add V4L2 subdev driver for camera parallel interface (CPI)
> > >
> > > Frank Li (3):
> > >       media: v4l2-common: Add helper function v4l_get_required_align_by_bpp()
> > >       arm64: dts: imx8: add camera parallel interface (CPI) node
> > >       arm64: dts: imx8qxp-mek: add parallel ov5640 camera support
> > >
> > >  .../devicetree/bindings/media/fsl,imx93-pcif.yaml  | 126 ++++
> > >  MAINTAINERS                                        |   2 +
> > >  arch/arm64/boot/dts/freescale/Makefile             |   3 +
> > >  arch/arm64/boot/dts/freescale/imx8-ss-img.dtsi     |  13 +
> > >  .../boot/dts/freescale/imx8qxp-mek-ov5640-cpi.dtso |  83 +++
> > >  arch/arm64/boot/dts/freescale/imx8qxp-ss-img.dtsi  |  27 +
> > >  drivers/media/platform/nxp/Kconfig                 |  11 +
> > >  drivers/media/platform/nxp/Makefile                |   1 +
> > >  drivers/media/platform/nxp/imx-parallel-cpi.c      | 728 +++++++++++++++++++++
> > >  include/media/v4l2-common.h                        |  30 +
> > >  10 files changed, 1024 insertions(+)
> > > ---
> > > base-commit: 37a294c6211bea9deb14bedd2dcce498935cbd4e
> > > change-id: 20250626-imx8qxp_pcam-d851238343c3

-- 
Regards,

Laurent Pinchart

