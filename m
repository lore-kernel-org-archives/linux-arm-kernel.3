Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCDD4CA0FE4
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Aug 2025 00:27:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F//dNsf765+zWMqPOL3BTjSfYbLZtm5MUs2oW6VjGnM=; b=HUwn2UbotcoFoXpZKkws1t4RVm
	9T8D/7rd2ApauEZeX7K/Wl/Gtom6nHSsHaokd7iurS/3XZ0KrIJnqhp/U1uuY7GYzZxrLpSUdvofz
	VJMSmZqrz00/nOCtGfMl4BodEt902CLUmnsIfr/AEMF1oanLuhZyYckYfOLb0iiiiTjS3aJSeBcZS
	azpP67ZJbGTprviERB4Di9h14TPtpyZUpddMOLJQW3QNtdpGaT62009G502hPElXxTY1u+/9HzI1D
	Vw57uV+YHOCNIgbhe3vcDE6GVLxTQVNQALGj0baywRUX24/a+iuv5328tLEG158Ds8XxlbSXWU4/6
	SHxWpv3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upFcV-000000011XQ-40Sc;
	Fri, 22 Aug 2025 00:27:03 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up8N2-0000000HZHD-2vJz
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 Aug 2025 16:42:37 +0000
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 90996250;
	Thu, 21 Aug 2025 18:41:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1755794495;
	bh=mz/fzJfmTWZ3LEOoonwuE3DtZoZyUjRc0Upb01ff0/s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UkVD6LzPl7FviU9HWcFXl+NqtHgD8s/cXbhJhTU0pUpl9UP78ZfzW6Z0AA/9CEj9S
	 lrPPftwEJ2KHqe7VOKaJjxgmATDyX92cRxpcokCc6ic9cxPZ8zA4sUckubRjexP6LW
	 LXI5VgowhlmEXMyFB2eGzm84WdvPUJ+LQ3tcOR54=
Date: Thu, 21 Aug 2025 19:42:11 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Frank Li <Frank.li@nxp.com>
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
Subject: Re: [PATCH v2 12/12] arm64: dts: imx8mp: Specify the number of
 channels for CSI-2 receivers
Message-ID: <20250821164211.GC29629@pendragon.ideasonboard.com>
References: <20250821000944.27849-1-laurent.pinchart@ideasonboard.com>
 <20250821000944.27849-13-laurent.pinchart@ideasonboard.com>
 <aKdCp9INuUeQVFbV@lizhi-Precision-Tower-5810>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aKdCp9INuUeQVFbV@lizhi-Precision-Tower-5810>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_094236_872993_E19D7CE6 
X-CRM114-Status: GOOD (  15.44  )
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

On Thu, Aug 21, 2025 at 12:00:39PM -0400, Frank Li wrote:
> On Thu, Aug 21, 2025 at 03:09:44AM +0300, Laurent Pinchart wrote:
> > The CSI-2 receivers in the i.MX8MP have 3 output channels. Specify this
> > in the device tree, to enable support for more than one channel in
> > drivers.
> 
> dt descript hardware, not driver

Yes, but the whole point is to make use of the information in drivers
:-)

I'll just drop the "in drivers" part.

> Specify this to reflect actual hardware feature.
> 
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> 
> > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > ---
> >  arch/arm64/boot/dts/freescale/imx8mp.dtsi | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> > index bb24dba7338e..1e52840078df 100644
> > --- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> > +++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> > @@ -1764,6 +1764,7 @@ mipi_csi_0: csi@32e40000 {
> >  				assigned-clock-parents = <&clk IMX8MP_SYS_PLL2_250M>,
> >  							 <&clk IMX8MP_CLK_24M>;
> >  				power-domains = <&media_blk_ctrl IMX8MP_MEDIABLK_PD_MIPI_CSI2_1>;
> > +				fsl,num-channels = <3>;
> >  				status = "disabled";
> >
> >  				ports {
> > @@ -1799,6 +1800,7 @@ mipi_csi_1: csi@32e50000 {
> >  				assigned-clock-parents = <&clk IMX8MP_SYS_PLL2_250M>,
> >  							 <&clk IMX8MP_CLK_24M>;
> >  				power-domains = <&media_blk_ctrl IMX8MP_MEDIABLK_PD_MIPI_CSI2_2>;
> > +				fsl,num-channels = <3>;
> >  				status = "disabled";
> >
> >  				ports {

-- 
Regards,

Laurent Pinchart

