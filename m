Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4361BCCFA18
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Nov 2025 01:51:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hYfwcXlk1yVhq5DVinFiJbUOXo8e/FkjNZ+187JUQvQ=; b=lIJSkZ8+45QmOmEW4RbBLBVTRf
	88XtjFF09FRj08zppO+c/tVDuGqaDjJNeNr/P+lhNblGMVHa/SbwwVDv8824JDTjSStvM16E0I58L
	civkc7sJV0worVM4M+NQZhj/VLbUS8VxOYwHNsf98MNCRRrK1skbEnfYic1g88drF0nLqo8SI3lgH
	2uxciWwDhEcjGAomLQeklPJ56yzl7zBUdd0SmdHYWNJ+f2aF+aRoUCl+/yOzVnMX/SNGU//QLuQAM
	zm5jMZ0+HhV1bK2HVA0T3j5oEJxYBplWJ8mEhPOeDd2D8M6Z1Fh2Q1HO4c0+ggyuyUfqAC/OftKdZ
	td+X7oYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ00x-00000007yiz-39cl;
	Wed, 12 Nov 2025 01:51:15 +0000
Received: from mail-m16.yeah.net ([220.197.32.16])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ00u-00000007yic-1jEF
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Nov 2025 01:51:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=hYfwcXlk1yVhq5DVinFiJbUOXo8e/FkjNZ+187JUQvQ=;
	b=g2OnEPAAzyP8npm4AZ+DsbfBUsKE+VOkkIsHbR8DM5R8ndnfTRN9gZOsm006g7
	1gy1K3u7D2+fX5wx+0jMYPvwLLbgT2EQLiigh52k0OxTyufcz35V4g8MERCGW4EV
	IwkqXZzqMk5ENaydSxSc6uknGetzcgC+qBNYW8fSqpGek=
Received: from dragon (unknown [])
	by gzsmtp3 (Coremail) with SMTP id M88vCgD3XBjz5xNpPSHPAQ--.5419S3;
	Wed, 12 Nov 2025 09:50:45 +0800 (CST)
Date: Wed, 12 Nov 2025 09:50:43 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Frank Li <Frank.li@nxp.com>, "robh@kernel.org" <robh@kernel.org>
Cc: Hongxing Zhu <hongxing.zhu@nxp.com>,
	"l.stach@pengutronix.de" <l.stach@pengutronix.de>,
	"lpieralisi@kernel.org" <lpieralisi@kernel.org>,
	"kwilczynski@kernel.org" <kwilczynski@kernel.org>,
	"mani@kernel.org" <mani@kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>,
	"bhelgaas@google.com" <bhelgaas@google.com>,
	"shawnguo@kernel.org" <shawnguo@kernel.org>,
	"s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
	"kernel@pengutronix.de" <kernel@pengutronix.de>,
	"festevam@gmail.com" <festevam@gmail.com>,
	"linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v6 01/11] arm64: dts: imx95-15x15-evk: Add
 supports-clkreq property to PCIe M.2 port
Message-ID: <aRPn89vIkmije-Ks@dragon>
References: <20251015030428.2980427-1-hongxing.zhu@nxp.com>
 <20251015030428.2980427-2-hongxing.zhu@nxp.com>
 <aRLhko0h1OZgvo2o@dragon>
 <AS8PR04MB8833D099959C62A97AC8CB868CCFA@AS8PR04MB8833.eurprd04.prod.outlook.com>
 <aRNf3TUTawixqGR1@lizhi-Precision-Tower-5810>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aRNf3TUTawixqGR1@lizhi-Precision-Tower-5810>
X-CM-TRANSID: M88vCgD3XBjz5xNpPSHPAQ--.5419S3
X-Coremail-Antispam: 1Uf129KBjvJXoWxZr4kWrWrZw1DtFy5JFW5Wrg_yoW5Zr4DpF
	WUGF4DGF18WFyrJwsFqFyFkFyDtwn3AFsI9r1DWryUtrZ0kF1FqF429rs3ur1Dtr48K3y0
	vF1qq3sag345Zr7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jbVysUUUUU=
X-Originating-IP: [117.80.155.87]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiORZWu2kT5-bznwAA3F
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251111_175112_840446_32876808 
X-CRM114-Status: GOOD (  26.96  )
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

On Tue, Nov 11, 2025 at 11:10:05AM -0500, Frank Li wrote:
> On Tue, Nov 11, 2025 at 08:02:35AM +0000, Hongxing Zhu wrote:
> > > -----Original Message-----
> > > From: Shawn Guo <shawnguo2@yeah.net>
> > > Sent: 2025年11月11日 15:11
> > > To: Hongxing Zhu <hongxing.zhu@nxp.com>
> > > Cc: Frank Li <frank.li@nxp.com>; l.stach@pengutronix.de;
> > > lpieralisi@kernel.org; kwilczynski@kernel.org; mani@kernel.org;
> > > robh@kernel.org; krzk+dt@kernel.org; conor+dt@kernel.org;
> > > bhelgaas@google.com; shawnguo@kernel.org; s.hauer@pengutronix.de;
> > > kernel@pengutronix.de; festevam@gmail.com; linux-pci@vger.kernel.org;
> > > linux-arm-kernel@lists.infradead.org; devicetree@vger.kernel.org;
> > > imx@lists.linux.dev; linux-kernel@vger.kernel.org
> > > Subject: Re: [PATCH v6 01/11] arm64: dts: imx95-15x15-evk: Add
> > > supports-clkreq property to PCIe M.2 port
> > >
> > > On Wed, Oct 15, 2025 at 11:04:18AM +0800, Richard Zhu wrote:
> > > > According to PCIe r6.1, sec 5.5.1.
> > > >
> > > > The following rules define how the L1.1 and L1.2 substates are entered:
> > > > Both the Upstream and Downstream Ports must monitor the logical state
> > > > of the CLKREQ# signal.
> > > >
> > > > Typical implement is using open drain, which connect RC's clkreq# to
> > > > EP's clkreq# together and pull up clkreq#.
> > > >
> > > > imx95-15x15-evk matches this requirement, so add supports-clkreq to
> > > > allow PCIe device enter ASPM L1 Sub-State.
> > > >
> > > > Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>
> > > > ---
> > > >  arch/arm64/boot/dts/freescale/imx95-15x15-evk.dts | 1 +
> > > >  1 file changed, 1 insertion(+)
> > > >
> > > > diff --git a/arch/arm64/boot/dts/freescale/imx95-15x15-evk.dts
> > > > b/arch/arm64/boot/dts/freescale/imx95-15x15-evk.dts
> > > > index 148243470dd4a..3ee032c154fa3 100644
> > > > --- a/arch/arm64/boot/dts/freescale/imx95-15x15-evk.dts
> > > > +++ b/arch/arm64/boot/dts/freescale/imx95-15x15-evk.dts
> > > > @@ -556,6 +556,7 @@ &pcie0 {
> > > >  	pinctrl-names = "default";
> > > >  	reset-gpio = <&gpio5 13 GPIO_ACTIVE_LOW>;
> > > >  	vpcie-supply = <&reg_m2_pwr>;
> > > > +	supports-clkreq;
> > >
> > > Is binding updated for this property?
> > >
> > > Shawn
> > >
> > Hi Shawn:
> > As I know that It's a documented binding property as below.
> > - supports-clkreq:
> >    If present this property specifies that CLKREQ signal routing exists from
> >    root port to downstream device and host bridge drivers can do programming
> >    which depends on CLKREQ signal existence. For example, programming root port
> >    not to advertise ASPM L1 Sub-States support if there is no CLKREQ signal.
> > ./Documentation/devicetree/bindings/pci/pci.txt
> 
> Shawn:
> 
> 	This file should be removed. It is already merge to Rob's dt-scheme
> as PCIe standard properties.
> 
> See: https://github.com/devicetree-org/dt-schema/blob/main/dtschema/schemas/pci/pci-bus-common.yaml

Ah, thanks!

Rob,

So it's no longer the case that kernel Documentation/devicetree/bindings
has all bindings documentation?  Or it's never been the case?  I used to
grep a property in the folder to see if it's documented or not.

Shawn


