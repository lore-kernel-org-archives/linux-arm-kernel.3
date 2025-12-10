Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F515D3B9A9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Dec 2025 09:07:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OAy+aa7u9snqXsTEo9sfMA2V7W7dOPt8U3WYNh3i1is=; b=GZXDn3KYGRHrQQWVBiKqnEgjgZ
	MCSyZnbeZn4tXtNDeSzJbl+I/GfQ3bwdTCAYHyDIa45jxjwymWSvtJsojxp7pbI1+8yMduocVGJXg
	IVgapQ5h5pOM21CfQgu280X5gaKewgLbV/qfhzo6ejKCfn6FaWg2v3MblfqyF7/NI7RwqLBm/qXj9
	cPGxZ4Iz9cu/yGWmmBkmtA9W9iKPLC0LonD4GwDDTWLc1Fr9FhQBj6Cgt9ljWfP14JHSTUsKIBzPb
	ididTau4F1v9OmSiQMOQq/WnE3ux00KvP/GEsAfd6HaK4eFZf5nu5vaZQKM+I80X7qbgo2+S4DLKv
	0qM0HmiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTGAW-0000000FGis-0vaS;
	Wed, 10 Dec 2025 09:07:32 +0000
Received: from inva021.nxp.com ([92.121.34.21])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTGAT-0000000FGiR-1wvG
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Dec 2025 09:07:30 +0000
Received: from inva021.nxp.com (localhost [127.0.0.1])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 1999F203110;
	Wed, 10 Dec 2025 10:07:27 +0100 (CET)
Received: from usswic1srsp001v.us-swic1.nxp.com (unknown [10.114.8.222])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id DC5F2201389;
	Wed, 10 Dec 2025 10:07:26 +0100 (CET)
Received: from lsvm07u0000156.swis.us-west-2.aws.nxp.com (lsvm07u0000156.swis.us-west-2.aws.nxp.com [10.45.140.59])
	by usswic1srsp001v.us-swic1.nxp.com (Postfix) with ESMTP id C6046180030F;
	Wed, 10 Dec 2025 01:07:25 -0800 (PST)
Date: Wed, 10 Dec 2025 01:07:25 -0800
From: Lei Xu <lei.xu@nxp.com>
To: Francesco Dolcini <francesco@dolcini.it>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, justin.jiang@nxp.com,
	qijian.guo@nxp.com
Subject: Re: [PATCH 2/2] arm64: dts: freescale: imx95: Add support for i.MX95
 15x15 FRDM board
Message-ID: <aTk4TY8WYSILvFjY@lsvm07u0000156.swis.us-west-2.aws.nxp.com>
References: <20251207-127-v1-0-5a2eeb69f150@nxp.com>
 <20251207-127-v1-2-5a2eeb69f150@nxp.com>
 <20251208065707.GA15128@francesco-nb>
 <aTkbyAHjrwzTsfO8@lsvm07u0000156.swis.us-west-2.aws.nxp.com>
 <20251210075927.GA13526@francesco-nb>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251210075927.GA13526@francesco-nb>
X-Virus-Scanned: ClamAV using ClamSMTP
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251210_010729_796204_FFCBC7FD 
X-CRM114-Status: GOOD (  22.09  )
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

On Wed, Dec 10, 2025 at 08:59:27AM +0100, Francesco Dolcini wrote:
> On Tue, Dec 09, 2025 at 11:05:44PM -0800, Lei Xu wrote:
> > On Mon, Dec 08, 2025 at 07:57:07AM +0100, Francesco Dolcini wrote:
> > > On Sun, Dec 07, 2025 at 05:26:06AM -0800, Lei Xu wrote:
> > > > The i.MX95 15x15 FRDM board is a compact and cost-effective development
> > > > platform based on the i.MX95 applications processor.
> > > 
> > > ...
> > > 
> > > > diff --git a/arch/arm64/boot/dts/freescale/imx95-15x15-frdm.dts b/arch/arm64/boot/dts/freescale/imx95-15x15-frdm.dts
> > > > new file mode 100644
> > > > index 000000000000..61e815c858b8
> > > > --- /dev/null
> > > > +++ b/arch/arm64/boot/dts/freescale/imx95-15x15-frdm.dts
> > > 
> > > ...
> > > 
> > > > +
> > > > +/* Default settings in i.mx95.dtsi are for i.MX95 19x19 package.
> > > > + * Override here for the i.MX95 15x15 package.
> > > > + */
> > > > +&netc_bus0 {
> > > > +	msi-map = <0x0 &its 0x60 0x1>,	//ENETC0 PF
> > > > +		  <0x10 &its 0x61 0x1>, //ENETC0 VF0
> > > > +		  <0x20 &its 0x62 0x1>, //ENETC0 VF1
> > > > +		  <0x40 &its 0x63 0x1>, //ENETC1 PF
> > > > +		  <0x50 &its 0x65 0x1>, //ENETC1 VF0
> > > > +		  <0x60 &its 0x66 0x1>, //ENETC1 VF1
> > > > +		  <0x80 &its 0x64 0x1>, //ENETC2 PF
> > > > +		  <0xc0 &its 0x67 0x1>; //NETC Timer
> > > > +	iommu-map = <0x0 &smmu 0x20 0x1>,
> > > > +		    <0x10 &smmu 0x21 0x1>,
> > > > +		    <0x20 &smmu 0x22 0x1>,
> > > > +		    <0x40 &smmu 0x23 0x1>,
> > > > +		    <0x50 &smmu 0x25 0x1>,
> > > > +		    <0x60 &smmu 0x26 0x1>,
> > > > +		    <0x80 &smmu 0x24 0x1>,
> > > > +		    <0xc0 &smmu 0x27 0x1>;
> > > > +};
> > > 
> > > If the 19x19 and 15x15 i.MX95 requires something different you should
> > > have a different soc dtsi. Probably creating a new imx95-$something
> > > dtsi, that includes the existing imx95.dtsi and override this property.
> > > 
> > > This solution does not scale, please fix it.
> > > 
> > > Francesco
> > >
> > 
> > Hello, Francesco
> > 
> > The original comment is misleading because this configuration applies
> > to the board rather than the SoC.
> 
> If this is a board configuration, why it is in imx95.dtsi in the first
> place?
> 
> In addition, I am interested in the topic, can you explain in more
> detail why this is needed and what is this achieving?
> 
> Francesco
>

These entries define MSI and IOMMU mappings for ENETC interfaces.
The i.MX95 SoC integrates three ENETC instances.
On the i.MX95 15x15 FRDM board, instances 0 and 1 are used,
while on the i.MX95 19x19 EVK board, instances 0 and 2 are utilized by
default. Therefore, the mapping configuration must be customized for each board.

Lei

