Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32775D3B9A9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Dec 2025 07:59:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=igHAM7gpcqVQ023jKZCGrSxBPCfNLJIiGNDNPhqNs6g=; b=k+AFW4hc7R9I1QJb+znDcHaDsm
	mYSTvnmuPxlUh0zXk8pxGNiHukmEF54khaHOvlbvkZKCYA6Lrw+TxBBwhIKdVcBN9/dtFJxCW0JGZ
	kxWumKa5GvA4vI4EmvKZzSHp1wy1MhtoUa3QSNommNRGTkEEKUkZ413NJIuIr8wUCxAs7XMFhihJK
	NGOu30Ar4SjKW2txZn3NaqHAhhMYK09Zhawy5+TBSuY6QfNS1RTuAGDMHxdBaCruY5HNuB76FKyh7
	GjY28ge4RshJDKmwTM+qQpazlAHP65rZUDMLuPZdZEH7mvrrICk6tNbz8cUiTCAcV2vCD9s0f789M
	OQRSX6ZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTF6m-0000000FDo9-3AxZ;
	Wed, 10 Dec 2025 07:59:36 +0000
Received: from mail11.truemail.it ([217.194.8.81])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTF6k-0000000FDnj-1tFX
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Dec 2025 07:59:35 +0000
Received: from francesco-nb (xcpe-178-82-120-96.dyn.res.sunrise.net [178.82.120.96])
	by mail11.truemail.it (Postfix) with ESMTPA id E40B91F928;
	Wed, 10 Dec 2025 08:59:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1765353572;
	bh=igHAM7gpcqVQ023jKZCGrSxBPCfNLJIiGNDNPhqNs6g=; h=From:To:Subject;
	b=FV9tK3GH9+oCoarJLRn2k2gThBeYpH0UtYAnzjnzrc+jMwk/3CQRKfr5y9zSvoR2v
	 yuY/U/ohMm+p9M4yvn9jbnNd7H9vbX7/pL7qf+zudusHBIQTjTCaIftiu/mWT+px1q
	 tRhfubMoLByJVVJw0QPH2drk874uNOS9xu1/44lJVwFVDrfyElZj3gYt45i2eKLz4J
	 NF/pZSp7Et9vS3zywYn+57F2ZzuHPWFwz1E3RCuRqm06z7fOc0hxAB5NEk+HeP7fX9
	 aJL8tk/maftlYWT9XAlBgH0ylXwT21/JCE/x+mn7ah3BIqZ1E2EzjYtRIPpPpYxTxW
	 CrZhRaKUw2duA==
Date: Wed, 10 Dec 2025 08:59:27 +0100
From: Francesco Dolcini <francesco@dolcini.it>
To: Lei Xu <lei.xu@nxp.com>
Cc: Francesco Dolcini <francesco@dolcini.it>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, justin.jiang@nxp.com,
	qijian.guo@nxp.com
Subject: Re: [PATCH 2/2] arm64: dts: freescale: imx95: Add support for i.MX95
 15x15 FRDM board
Message-ID: <20251210075927.GA13526@francesco-nb>
References: <20251207-127-v1-0-5a2eeb69f150@nxp.com>
 <20251207-127-v1-2-5a2eeb69f150@nxp.com>
 <20251208065707.GA15128@francesco-nb>
 <aTkbyAHjrwzTsfO8@lsvm07u0000156.swis.us-west-2.aws.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aTkbyAHjrwzTsfO8@lsvm07u0000156.swis.us-west-2.aws.nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251209_235934_674843_B1F1678E 
X-CRM114-Status: GOOD (  18.91  )
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

On Tue, Dec 09, 2025 at 11:05:44PM -0800, Lei Xu wrote:
> On Mon, Dec 08, 2025 at 07:57:07AM +0100, Francesco Dolcini wrote:
> > On Sun, Dec 07, 2025 at 05:26:06AM -0800, Lei Xu wrote:
> > > The i.MX95 15x15 FRDM board is a compact and cost-effective development
> > > platform based on the i.MX95 applications processor.
> > 
> > ...
> > 
> > > diff --git a/arch/arm64/boot/dts/freescale/imx95-15x15-frdm.dts b/arch/arm64/boot/dts/freescale/imx95-15x15-frdm.dts
> > > new file mode 100644
> > > index 000000000000..61e815c858b8
> > > --- /dev/null
> > > +++ b/arch/arm64/boot/dts/freescale/imx95-15x15-frdm.dts
> > 
> > ...
> > 
> > > +
> > > +/* Default settings in i.mx95.dtsi are for i.MX95 19x19 package.
> > > + * Override here for the i.MX95 15x15 package.
> > > + */
> > > +&netc_bus0 {
> > > +	msi-map = <0x0 &its 0x60 0x1>,	//ENETC0 PF
> > > +		  <0x10 &its 0x61 0x1>, //ENETC0 VF0
> > > +		  <0x20 &its 0x62 0x1>, //ENETC0 VF1
> > > +		  <0x40 &its 0x63 0x1>, //ENETC1 PF
> > > +		  <0x50 &its 0x65 0x1>, //ENETC1 VF0
> > > +		  <0x60 &its 0x66 0x1>, //ENETC1 VF1
> > > +		  <0x80 &its 0x64 0x1>, //ENETC2 PF
> > > +		  <0xc0 &its 0x67 0x1>; //NETC Timer
> > > +	iommu-map = <0x0 &smmu 0x20 0x1>,
> > > +		    <0x10 &smmu 0x21 0x1>,
> > > +		    <0x20 &smmu 0x22 0x1>,
> > > +		    <0x40 &smmu 0x23 0x1>,
> > > +		    <0x50 &smmu 0x25 0x1>,
> > > +		    <0x60 &smmu 0x26 0x1>,
> > > +		    <0x80 &smmu 0x24 0x1>,
> > > +		    <0xc0 &smmu 0x27 0x1>;
> > > +};
> > 
> > If the 19x19 and 15x15 i.MX95 requires something different you should
> > have a different soc dtsi. Probably creating a new imx95-$something
> > dtsi, that includes the existing imx95.dtsi and override this property.
> > 
> > This solution does not scale, please fix it.
> > 
> > Francesco
> >
> 
> Hello, Francesco
> 
> The original comment is misleading because this configuration applies
> to the board rather than the SoC.

If this is a board configuration, why it is in imx95.dtsi in the first
place?

In addition, I am interested in the topic, can you explain in more
detail why this is needed and what is this achieving?

Francesco


