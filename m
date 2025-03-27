Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AAEBC36011
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Mar 2025 19:10:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OShI1N1GLwYyAybrwk0VqU+9nwZvmzUL7W590dOwUaE=; b=sitTEQ4RraNB7E91vMqRt8tRay
	/p1BYI3UZKDlTcA8MK6YWbgNnaByxlKnh7INCOZJcisH/laTB1WZ5zPMWii0BioTPoqi0JdVlb0Wf
	T5Ni0KAzsqZfd1dU4sd2Q28D7WO+wAou6SXnxfC1j+knmpcQ1/61f9CFoEjQgdG6Jvoyt37L6f+5S
	G4+9BUTosv56shAxkCS8J9V8ksfQ46BOJEzUR+DrnMw2LIU/yqOT/hxL4wt7kV+BKRSEunLCr9M0R
	QwsSz53ukUGePqsToUdRhztwDTPPT8s6VoN/KaLa9rRL95cAnI2AahShL6FYVLmQsQOPgspN2jMHG
	Ab4K1VAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txscp-0000000BnY4-2S3M;
	Thu, 27 Mar 2025 19:10:47 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txsUz-0000000BmiU-1IAA
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Mar 2025 19:02:42 +0000
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 90EBDF6;
	Thu, 27 Mar 2025 20:00:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1743102049;
	bh=JTga+ZYiNcpELw4y54+Pi3yVKvexG7sn/A4fJdlQJGw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ENODeLGpPEKSI8MBFpqjI7lZvvSd9MHFHL68HAOYDArbsOTUfdPR/UdtWB0EB5CT4
	 gDACEbOCy1Z5C/ZTPHJJ9IEpGMJki0MAw3XGn9WymDeucWzc2paNT+15USh5FieFdI
	 jvcLgOdSxM6U25X3/vSES7hWByFDTUeSXEfDsSmw=
Date: Thu, 27 Mar 2025 21:02:15 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dong Aisheng <aisheng.dong@nxp.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rui Miguel Silva <rmfrfs@gmail.com>,
	Martin Kepplinger <martink@posteo.de>,
	Purism Kernel Team <kernel@puri.sm>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
	Robert Chiras <robert.chiras@nxp.com>,
	"Guoniu.zhou" <guoniu.zhou@nxp.com>
Subject: Re: [PATCH v3 10/12] arm64: dts: imx8qm: add 24MHz clock-xtal24m
Message-ID: <20250327190215.GC22659@pendragon.ideasonboard.com>
References: <20250210-8qxp_camera-v3-0-324f5105accc@nxp.com>
 <20250210-8qxp_camera-v3-10-324f5105accc@nxp.com>
 <20250327185813.GA22659@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250327185813.GA22659@pendragon.ideasonboard.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250327_120241_483964_417E0E21 
X-CRM114-Status: GOOD (  20.27  )
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

On Thu, Mar 27, 2025 at 08:58:14PM +0200, Laurent Pinchart wrote:
> Hi Frank,
> 
> Thank you for the patch.
> 
> On Mon, Feb 10, 2025 at 03:59:29PM -0500, Frank Li wrote:
> > Add fixed clock node clock-xtal24m to prepare to add camera support.
> > 
> > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > ---
> > change from v1 to v3
> > - none
> > ---
> >  arch/arm64/boot/dts/freescale/imx8qm.dtsi | 7 +++++++
> >  1 file changed, 7 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/freescale/imx8qm.dtsi b/arch/arm64/boot/dts/freescale/imx8qm.dtsi
> > index c6a17a0d739c5..40cd45cd9f88f 100644
> > --- a/arch/arm64/boot/dts/freescale/imx8qm.dtsi
> > +++ b/arch/arm64/boot/dts/freescale/imx8qm.dtsi
> > @@ -590,6 +590,13 @@ mipi_pll_div2_clk: clock-controller-mipi-div2-pll {
> >  		clock-output-names = "mipi_pll_div2_clk";
> >  	};
> >  
> > +	xtal24m: clock-xtal24m {
> > +		compatible = "fixed-clock";
> > +		#clock-cells = <0>;
> > +		clock-frequency = <24000000>;
> > +		clock-output-names = "xtal_24MHz";
> > +	};
> 
> This is a clock oscillator mounted on the PCB, isn't it ? It shouldn't
> be in imx8qm.dtsi, but in board-specific DT sources.

You add fixed regulators to arch/arm64/boot/dts/freescale/imx8qm-mek.dts
and arch/arm64/boot/dts/freescale/imx8qxp-mek.dts in patch 12/12, the
additional of the fixed clock could go there too, in the same patch.

> > +
> >  	vpu_subsys_dsp: bus@55000000 {
> >  		compatible = "simple-bus";
> >  		#address-cells = <1>;

-- 
Regards,

Laurent Pinchart

