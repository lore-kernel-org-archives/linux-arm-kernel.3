Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FA66C87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Aug 2025 01:11:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UR2wfIsxgI/WXxfNcnrFl4tqPIFZzMOsYTfomE3dfGw=; b=RgtSGSjAkTHoz4SRcVfYDbP4Wg
	aqiOt407q9s09z4heu93F8QllFn8ge9vRFnnQuteJNxGhvpJWeBPKaqsF0GDAK4FUJLhVilLOoAmJ
	htDW1X5qCn5Cpnsobuj9+UuFjvZsP1pY2GO918ZDdMfrZXXs7k9Rc+9qz5KpDXd3N6/HP3jfnPBs6
	qOcs2AP+Np/ia8EYo8C8w9Hi2LUCWcdXpTSnF4f7XfgmR1GB97usFPfPx9rwh1p6JPZKUqdYdmOUh
	i9KBj1X7YTbL1AeeDKEjI/GUtR9MssabLfxk5oodOuV4+UhCKLoLhyT+mCdRhWlCMIrxBQ0/Y8UxL
	gjNiifYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uj6D0-0000000BZ2S-2vgP;
	Tue, 05 Aug 2025 01:11:18 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uj6AQ-0000000BYsY-0gU7
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 Aug 2025 01:08:39 +0000
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 8AEC31775;
	Tue,  5 Aug 2025 03:07:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1754356068;
	bh=HRK77S8jj98fxjdYajHbsWPldKElX/RjHec2I/UjYD8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OCj9KBCayppPj1P1bSZyw8bSVTMcSmTyEs7pPkLC/y9oSKN/RiCxM8DHX8xHF9DT1
	 ntGfR6Rm6AFub/qKEuhdfR5QYghYPJ8KWEhDSF0ISH5hAgdzYKN8xJvh/layVF1/l/
	 Gr39JmEt0BsUqq/TJQI/06JcyIwuTYunZ8StyC3I=
Date: Tue, 5 Aug 2025 04:08:22 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Frank Li <Frank.Li@nxp.com>
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
Message-ID: <20250805010822.GC24627@pendragon.ideasonboard.com>
References: <20250729-imx8qxp_pcam-v4-0-4dfca4ed2f87@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250729-imx8qxp_pcam-v4-0-4dfca4ed2f87@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250804_180838_345576_8AE12F1B 
X-CRM114-Status: GOOD (  17.89  )
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

Thank you for the patches.

I've quite busy these days, and I don't believe I will have time to
review this series before coming back from OSS Europe at the beginning
of September. Let's see if anyone on CC could volunteer.

On Tue, Jul 29, 2025 at 12:06:21PM -0400, Frank Li wrote:
> Add parallel camera support for i.MX8 chips.
> 
> The below patch to add new format support to test ov5640 sensor
>    media: nxp: isi: add support for UYVY8_2X8 and YUYV8_2X8 bus codes
> 
> The bindings and driver for parallel CSI
>    dt-bindings: media: add i.MX parallel csi support
>    media: nxp: add V4L2 subdev driver for parallel CSI
> 
> DTS part need depend on previous MIPI CSI patches.
>   https://lore.kernel.org/imx/20250522-8qxp_camera-v5-13-d4be869fdb7e@nxp.com/
> 
>   arm64: dts: imx8: add parellel csi nodes
>   arm64: dts: imx8qxp-mek: add parallel ov5640 camera support
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> Changes in v4:
> - remove imx93 driver support since have not camera sensor module to do test now.
>   Add it later
> - Add new patch
>   media: v4l2-common: Add helper function v4l_get_required_align_by_bpp()
> - See each patche's change log for detail.
> - Link to v3: https://lore.kernel.org/r/20250708-imx8qxp_pcam-v3-0-c8533e405df1@nxp.com
> 
> Changes in v3:
> - replace CSI with CPI.
> - detail change see each patch's change logs
> - Link to v2: https://lore.kernel.org/r/20250703-imx8qxp_pcam-v2-0-188be85f06f1@nxp.com
> 
> Changes in v2:
> - remove patch media: nxp: isi: add support for UYVY8_2X8 and YUYV8_2X8 bus codes
>   because pcif controller convert 2x8 to 1x16 to match isi's input
> - rename comaptible string to fsl,imx8qxp-pcif
> - See each patches's change log for detail
> - Link to v1: https://lore.kernel.org/r/20250630-imx8qxp_pcam-v1-0-eccd38d99201@nxp.com
> 
> ---
> Alice Yuan (2):
>       dt-bindings: media: add i.MX parallel CPI support
>       media: nxp: add V4L2 subdev driver for camera parallel interface (CPI)
> 
> Frank Li (3):
>       media: v4l2-common: Add helper function v4l_get_required_align_by_bpp()
>       arm64: dts: imx8: add camera parallel interface (CPI) node
>       arm64: dts: imx8qxp-mek: add parallel ov5640 camera support
> 
>  .../devicetree/bindings/media/fsl,imx93-pcif.yaml  | 126 ++++
>  MAINTAINERS                                        |   2 +
>  arch/arm64/boot/dts/freescale/Makefile             |   3 +
>  arch/arm64/boot/dts/freescale/imx8-ss-img.dtsi     |  13 +
>  .../boot/dts/freescale/imx8qxp-mek-ov5640-cpi.dtso |  83 +++
>  arch/arm64/boot/dts/freescale/imx8qxp-ss-img.dtsi  |  27 +
>  drivers/media/platform/nxp/Kconfig                 |  11 +
>  drivers/media/platform/nxp/Makefile                |   1 +
>  drivers/media/platform/nxp/imx-parallel-cpi.c      | 728 +++++++++++++++++++++
>  include/media/v4l2-common.h                        |  30 +
>  10 files changed, 1024 insertions(+)
> ---
> base-commit: 37a294c6211bea9deb14bedd2dcce498935cbd4e
> change-id: 20250626-imx8qxp_pcam-d851238343c3

-- 
Regards,

Laurent Pinchart

