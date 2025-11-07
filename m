Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7878CCFA18
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Nov 2025 15:52:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c3Vswpijn/fHcEJQO2VeGXkaT5nX/VaBE7KE0Jscnuo=; b=FSSUocwMvc68MdjyQqowN6uOXA
	TjDxaxMiDorzQGbEEqJSRpdZhvZDhdDoS4c2qorjKf7qX4xYzPQqDFvb9h341rnqZGAuG1yuS4na5
	PXMRl3dDmv0dR/05mKlsA1WOPxA17ZKBkU2zDx6jok8ZZD9snZEXPjRTPVooef+hmimAGPkyOgdrA
	nunRGWBH7wey7lHu0hEMRADkC7J6MRUkuOX/qjVTeN6MoCUpYYO5tdqMuns6nbRpVaT57GeuFO3Q5
	HST8ZL2snow0aUNREnXb0cYyw+io4pHTdiC46wiQ+TZ7B37pSYocuYnKGP6bVDnp8tHbS7DxLaYjF
	zQXcIavA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHOl6-000000000lp-3IQj;
	Fri, 07 Nov 2025 15:52:16 +0000
Received: from mail11.truemail.it ([2001:4b7e:0:8::81])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHOl3-000000000kV-2UZZ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Nov 2025 15:52:16 +0000
Received: from francesco-nb (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 5A60C1FB9A;
	Fri,  7 Nov 2025 16:52:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1762530725;
	bh=c3Vswpijn/fHcEJQO2VeGXkaT5nX/VaBE7KE0Jscnuo=; h=From:To:Subject;
	b=JprloZHT7cxN62EH9YL28KwyMi9OOie063qzgXzS36wpar25HfqyxOOX+bR3nMlLi
	 g6K7xSOrvpSaxY0kCOl1mkA+3OaI3bBxmF75qVYIKSbRMKXPZTLXHk5SnfNEgnMMhm
	 oMKpvibF5zXZqXEaRZwsyRxtveBhFHMJ1ZeRQGCNHoNm6QnRczJd1QB67uWhavVr4x
	 jr3kRrML1EuSIJ3NE1PCs6cvxQU5+W97VcivX17XzEqfsEuejwlQy3h1T16mo1Or/s
	 RK5lOTyQ4eg6lxWqljiMOSwSRD9WFy8HV0151pUYcp5gMfhLIf3fOsVi6/ScDUXKng
	 lvvLxEB8VOjUw==
Date: Fri, 7 Nov 2025 16:52:01 +0100
From: Francesco Dolcini <francesco@dolcini.it>
To: Frank Li <Frank.li@nxp.com>
Cc: Francesco Dolcini <francesco@dolcini.it>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] ARM: dts: imx: move nand related property under
 nand@0
Message-ID: <20251107155201.GA119737@francesco-nb>
References: <20251104-gpmi_dts-v1-0-886865393d0f@nxp.com>
 <20251104-gpmi_dts-v1-3-886865393d0f@nxp.com>
 <20251105115538.GA17091@francesco-nb>
 <aQttQb5GesjUtBw6@lizhi-Precision-Tower-5810>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aQttQb5GesjUtBw6@lizhi-Precision-Tower-5810>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251107_075214_527456_DDE4609E 
X-CRM114-Status: GOOD (  23.88  )
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

Hello Frank,

On Wed, Nov 05, 2025 at 10:29:05AM -0500, Frank Li wrote:
> On Wed, Nov 05, 2025 at 12:55:38PM +0100, Francesco Dolcini wrote:
> > On Tue, Nov 04, 2025 at 05:27:14PM -0500, Frank Li wrote:
> > > Add child node nand@0 and move NAND related property under it to align
> > > modern nand-controller.yaml.
> > >
> > > Fix below CHECK_DTBS warnings:
> > >   arch/arm/boot/dts/nxp/imx/imx6ull-colibri-aster.dtb: nand-controller@1806000 (fsl,imx6q-gpmi-nand): Unevaluated properties are not allowed ('nand-ecc-mode', 'nand-ecc-step-size', 'nand-ecc-strength', 'nand-on-flash-bbt' were unexpected)
> > >         from schema $id: http://devicetree.org/schemas/mtd/gpmi-nand.yaml#
> > >
> > > Since 2019 year, commit
> > > (212e496935929 dt-bindings: mtd: Add YAML schemas for the generic NAND options)
> > > NAND related property is preferred located under nand@<n> even though only
> > > one NAND chip supported.
> > >
> > > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > > ---
> > >  arch/arm/boot/dts/nxp/imx/imx6-logicpd-som.dtsi           |  6 +++++-
> > >  arch/arm/boot/dts/nxp/imx/imx6qdl-icore.dtsi              |  6 +++++-
> > >  arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-pfla02.dtsi      |  6 +++++-
> > >  arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-phycore-som.dtsi |  6 +++++-
> > >  arch/arm/boot/dts/nxp/imx/imx6qdl-skov-cpu.dtsi           |  6 +++++-
> > >  arch/arm/boot/dts/nxp/imx/imx6qdl-tx6.dtsi                |  6 +++++-
> > >  arch/arm/boot/dts/nxp/imx/imx6ul-geam.dts                 |  6 +++++-
> > >  arch/arm/boot/dts/nxp/imx/imx6ul-isiot.dtsi               |  6 +++++-
> > >  arch/arm/boot/dts/nxp/imx/imx6ul-phytec-phycore-som.dtsi  |  6 +++++-
> > >  arch/arm/boot/dts/nxp/imx/imx6ul-tx6ul.dtsi               |  6 +++++-
> > >  arch/arm/boot/dts/nxp/imx/imx6ull-colibri.dtsi            | 12 ++++++++----
> > >  arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea.dtsi   | 12 ++++++++----
> > >  arch/arm/boot/dts/nxp/imx/imx6ull-myir-mys-6ulx.dtsi      |  6 +++++-
> > >  arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2.dts          |  6 +++++-
> > >  arch/arm/boot/dts/nxp/imx/imx7-colibri.dtsi               |  8 ++++++--
> > >  15 files changed, 82 insertions(+), 22 deletions(-)
> > >
> >
> > Was any of these changes tested? Is the driver able to cope with the
> > binding change?
> 
> I have not board to do direct test. This format is used at imx8 platform,
> which use the same gpmi driver.
> 
> This properties are parsed at mtd common part
> drivers/mtd/nand/raw/nand_base.c
> 
> If you have one of above board to test it, it will be appericated.

I did a minimal boot test, on colibri-imx6ull, and the board was booting
fine, with Linux 6.18.0-rc4 and this patch applied.

I am wondering if there is any impact with the bootloader, this DT is
used as it is also in U-Boot, and there the NAND driver is for sure
different. Any comment on this? I was not able to test this combination.

Francesco



