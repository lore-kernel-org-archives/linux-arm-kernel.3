Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 693D2ECD6FE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Feb 2026 02:00:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Io27KHtBNCGgviHoWotu9rcqDFcod6jTDdsGFNSTLUk=; b=FoSqOh9Yc64nw4DzQNg7Tl7MHH
	nus9wVSAAJs1dbu+93fNQOnmSgWXSLbTszM2gDmMqbsU9vYG8XXKVXUvZ3gqCVT4ifsShGE6oYzb8
	5+vxWdQ6Bz5DnUSgVkquYjO+FtlIunD+wilURjrrDTxCTfxMZakBk49FSxPlV2FXXuXwn7y8wVYpK
	rc31ZOcFt4ocpWaLaP5pAeeJzGpw8LlBQyjfewd3AV0mSCjyu6vBCHt3NWe7DqpgcTL0LSmEJs3Cu
	bohnGldnh4qWipkCLjo8HPNe+J9SLREp8rhhjppR0drDa3yUr9WURRfUztM7b/QCcTDnd2T2VXrBc
	5pVcJ2Gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqM02-00000001IJj-3vtF;
	Thu, 12 Feb 2026 02:00:10 +0000
Received: from inva021.nxp.com ([92.121.34.21])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqM00-00000001IJP-1mUz
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Feb 2026 02:00:09 +0000
Received: from inva021.nxp.com (localhost [127.0.0.1])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id F04C2202EB3;
	Thu, 12 Feb 2026 03:00:03 +0100 (CET)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id C0C4A202EAF;
	Thu, 12 Feb 2026 03:00:03 +0100 (CET)
Received: from lsvm11u0000554.swis.ap-northeast-2.aws.nxp.com (lsvm11u0000554.swis.ap-northeast-2.aws.nxp.com [10.52.9.11])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id 7BAF0180007B;
	Thu, 12 Feb 2026 10:00:01 +0800 (+08)
Date: Thu, 12 Feb 2026 11:00:00 +0900
From: Yanan Yang <yanan.yang@nxp.com>
To: Frank Li <Frank.li@nxp.com>
Cc: Joseph Guo <qijian.guo@nxp.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, justin.jiang@nxp.com,
	Lei Xu <lei.xu@nxp.com>, Xiaofeng Wei <xiaofeng.wei@nxp.com>
Subject: Re: [PATCH v5 2/2] arm64: dts: freescale: add NXP FRDM-IMX91S board
 support
Message-ID: <aY00IISQGY8LmYOe@lsvm11u0000554.swis.ap-northeast-2.aws.nxp.com>
References: <20260210-imx91s-frdm-v5-0-b3e9a67d2285@nxp.com>
 <20260210-imx91s-frdm-v5-2-b3e9a67d2285@nxp.com>
 <aYtT9vOAYTYuTsC6@lizhi-Precision-Tower-5810>
 <9b223407-9218-4382-9968-6541cf485b9d@nxp.com>
 <aYygOtB1d3XYi_EB@lizhi-Precision-Tower-5810>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aYygOtB1d3XYi_EB@lizhi-Precision-Tower-5810>
X-Virus-Scanned: ClamAV using ClamSMTP
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260211_180008_608656_27DCE18A 
X-CRM114-Status: GOOD (  20.18  )
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

On Wed, Feb 11, 2026 at 10:28:58AM -0500, Frank Li wrote:
> On Wed, Feb 11, 2026 at 09:54:52AM +0800, Joseph Guo wrote:
> > On 2/10/2026 11:51 PM, Frank Li wrote:
> > > On Tue, Feb 10, 2026 at 07:47:55PM +0900, Yanan Yang wrote:
> > >> Add DeviceTree support for the NXP FRDM-IMX91S development board based
> > >> on the i.MX91 SoC. FRDM-IMX91S is a cost-optimized variant of FRDM-IMX91
> > >> and differs in memory, storage, Ethernet, and PMIC configuration:
> > >>
> > >> - 512MB LPDDR4 (FRDM-IMX91 uses 1GB)
> > >> - 256MB FlexSPI-NAND (FRDM-IMX91 uses 8GB eMMC)
> > >> - Single GbE port (FRDM-IMX91 has dual GbE)
> > >> - PMIC PF9453 (FRDM-IMX91 uses PCA9451A)
> > >
> > > Look like it is very similar with imx91-11x11-frdm boards.
> > >
> > > Can you create common dtsi for both boards
> > >
> > > imx91-11x11-fdrm-common.dtsi
> > >
> > > then imx91-11x11-fdrm-s.dts and imx91-11x11-frdm.dts included
> > > imx91-11x11-fdrm-common.dtsi.
> > >
> > > You can refer below method
> > > https://lore.kernel.org/imx/20260204083551.2867263-1-sherry.sun@nxp.com/
> > >
> > > Frank
> >
> > Hi Frank,
> >
> > I think the two boards are totally different.
> > They have different PMIC, no EMMC for FRDM-IMX91S and totally different pin assignment.
> > So if we create a common dtsi, there will be not much duplicate code can put in.
> 
> Okay. It will be good if diff imx91-11x11-fdrm-s.dts and imx91-11x11-frdm.dts
> to show what's percentage change.
> 
> Frank

Hi Frank,

Although both boards are FRDM platforms, they have significant
difference in hardware configuration of most peripherals, including
FlexCAN, GPIO Keys, memory capacity, Ethernet interface, FlexSPI, IOMUX
configuration, LPI2C and PMIC. Therefore, it is better to maintain
seperate DTS files for them. 

Yanan

> >
> > Regards,
> > Joseph

