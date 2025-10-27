Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EC66CCF9E5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Oct 2025 20:53:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PpWJMkv1GotNjvJChkdBR4H/p47JF7KiPPhuGs2SFx8=; b=2UpZTc7nnsUlUxke8wUiEtHOwd
	HBzuc+dtYQD7i+94vqc3aYz/NyTWEBu5pUfpcDEaE/pOlFDFeYMlZNCluld491bAiKBvwC6NMN0uK
	dtuWcMq5p22Msl+1zS544nsdfeRxjhQ1dUKhnuAA/eNDXskek0MeC4EZ/N6CqduO9/CvE6No1WZuM
	6Yi4W26QsulSkyzvUxGbIuFvL6CJnLpLeTu1aKcKXmDPXjg/fjdlIEce4JL8Wdo5yZcGieANXGUsj
	JInsr5APF5ihYlrhKTrLP3avd+/cSLes2iELCPP2Cz81SkCY/Ah/slWQUhYsh1UovKZwAya6VGh7t
	JwTuVGLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDUDA-0000000Ekpb-3wsT;
	Mon, 27 Oct 2025 20:53:04 +0000
Received: from lahtoruutu.iki.fi ([2a0b:5c81:1c1::37])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDUD7-0000000Ekp9-362N;
	Mon, 27 Oct 2025 20:53:03 +0000
Received: from hillosipuli.retiisi.eu (91-158-51-183.elisa-laajakaista.fi [91.158.51.183])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4cwQgk56dlz49QHV;
	Mon, 27 Oct 2025 22:52:50 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
	t=1761598373;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=PpWJMkv1GotNjvJChkdBR4H/p47JF7KiPPhuGs2SFx8=;
	b=mHeCG0mLr+PonGVs7AXVtS9v7BMOalr0DxIpK71K9pR5OKogAS9QFr+vRcrN6Ep0Fl/djo
	tt6b3M7yxB0vK8GMRQRHs6/63qEDblKZKXHdNa8G63bS/Htfr28u0LHPADeIIgJNfuuXDZ
	6MZlFtUvJb4G4uR6upA3K5sKXzg6NnJPjrTwykuaBNbKWsmQcW03TgD8pqTdGkwlZeuMUt
	S/aLYP8naFX5yf+fj3L+l0MZRG7Q4oued6LK5bjxckv9ibk4Gk1rUxWN/wg7nVgGmrwEAb
	27lhhDE1LKclYYKK31nQ7p+qipmfAxYz3pJAIxgyOsAWGzWOzE6IWp8c2AVa3g==
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1761598373; a=rsa-sha256;
	cv=none;
	b=dBcShO51D0+TWSnpaZZPwCKi9AMmKwfhWpqszufIy7uzpIsER0cwSbrMxoPNQ1Apc7BayA
	5BAMnpv62tsL2BekP9Yemcy4sOG9LkJKcBAIDIaMU+Se9l7GgnaYVFsfcPips5wl9PuaU7
	x+aaqHOGix5946TDqbMZBfqPtnYtU/A6m/N64avIM8wJz+u/9zba9L8uwJslSLVzrvjpoD
	FiHObnRDapfC7Yll4xgrtUpnZRVHbSJCiAJEjUt9He3egOe6GE02fC39pD/XCRU6UD0BDn
	TCTRP8da2b4LYaD1dNugF2B/lHYBq1RgT8dlmlGPejc3qNaEPBdavM580oxRXQ==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=lahtoruutu; t=1761598373;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=PpWJMkv1GotNjvJChkdBR4H/p47JF7KiPPhuGs2SFx8=;
	b=EHOyX8RLjurWVZII3Sj0T8BzlBoH3T/kHmRQTV8PBsGVU6gyyUKub606IOAcYincrUxIeJ
	v3C52Tv4JyzcK6efVzw8FAEMe2osrfhoNcpOlKsLIOMaReuvR8sqRSwT5HQZf6ZsaHSRwQ
	/kWf8ns4Y8moblopczksARx7FRnpesf6YQRvsjUK1npadrRk6Rbp3KoR51Uzx0YWF96j83
	5RfNy7e/nvcoun6ynNpAj12FwEfHMz3qKg2ynHb6dkiC/31Sz3wGdqnt2DC+pG1PQeLxLb
	7ChVMMLIrxypHYGIo8/Ec+lknWGx6CGYtRDwwXnIeOElmPglXhMLTGBP2GDYgg==
Received: from valkosipuli.retiisi.eu (valkosipuli.local [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 7C671634C51;
	Mon, 27 Oct 2025 22:52:50 +0200 (EET)
Date: Mon, 27 Oct 2025 22:52:50 +0200
From: Sakari Ailus <sakari.ailus@iki.fi>
To: Frank Li <Frank.li@nxp.com>
Cc: Rui Miguel Silva <rmfrfs@gmail.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Martin Kepplinger <martink@posteo.de>,
	Purism Kernel Team <kernel@puri.sm>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Eugen Hristev <eugen.hristev@linaro.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>,
	Alice Yuan <alice.yuan@nxp.com>, Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Steve Longerbeam <slongerbeam@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH v3 17/31] media: synopsys: move imx6-mipi-csi2.c to
 synopsys/mipi-csi2.c
Message-ID: <aP_bogkrwIkbZIRh@valkosipuli.retiisi.eu>
References: <20250821-95_cam-v3-0-c9286fbb34b9@nxp.com>
 <20250821-95_cam-v3-17-c9286fbb34b9@nxp.com>
 <aP83D-ndmlv5Jns8@valkosipuli.retiisi.eu>
 <aP+fztk12FK4IWYK@lizhi-Precision-Tower-5810>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aP+fztk12FK4IWYK@lizhi-Precision-Tower-5810>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_135302_097204_A807E6FF 
X-CRM114-Status: GOOD (  24.08  )
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

On Mon, Oct 27, 2025 at 12:37:34PM -0400, Frank Li wrote:
> On Mon, Oct 27, 2025 at 11:10:39AM +0200, Sakari Ailus wrote:
> > Hi Frank,
> >
> > On Thu, Aug 21, 2025 at 04:15:52PM -0400, Frank Li wrote:
> > > Move dw MIPI CSI2 common part drivers/staging/media/imx/imx6-mipi-csi2.c
> > > under synopsys to let more SoC can reuse it.
> > >
> > > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > > ---
> > >  drivers/media/platform/synopsys/Kconfig                      | 12 ++++++++++++
> > >  drivers/media/platform/synopsys/Makefile                     |  2 ++
> > >  .../imx6-mipi-csi2.c => media/platform/synopsys/mipi-csi2.c} |  0
> > >  drivers/staging/media/imx/Kconfig                            |  1 +
> > >  drivers/staging/media/imx/Makefile                           |  2 +-
> > >  5 files changed, 16 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/media/platform/synopsys/Kconfig b/drivers/media/platform/synopsys/Kconfig
> > > index 4fd521f78425a96985fa3b6b017deef36631d1a9..e54dad835349d420dead6d5313c0623567c28c0b 100644
> > > --- a/drivers/media/platform/synopsys/Kconfig
> > > +++ b/drivers/media/platform/synopsys/Kconfig
> > > @@ -1,3 +1,15 @@
> > >  # SPDX-License-Identifier: GPL-2.0-only
> > >
> > > +config VIDEO_SYNOPSYS_MIPI_CSI2
> > > +        tristate "Synopsys DesignWare MIPI CSI2 Receiver common library"
> > > +        depends on VIDEO_DEV
> > > +        select MEDIA_CONTROLLER
> > > +        select VIDEO_V4L2_SUBDEV_API
> > > +        select VIDEOBUF2_DMA_CONTIG
> > > +        help
> > > +          Common library for MIPI CSI2 Controller.
> > > +
> > > +          To compile this driver as a module, choose M here. The module
> > > +          will be called synopsys_hdmirx
> > > +
> > >  source "drivers/media/platform/synopsys/hdmirx/Kconfig"
> > > diff --git a/drivers/media/platform/synopsys/Makefile b/drivers/media/platform/synopsys/Makefile
> > > index 3b12c574dd67c072901108d88cad64ca3a723938..045ed3177738e6d28aa223804b79e6774e141dc8 100644
> > > --- a/drivers/media/platform/synopsys/Makefile
> > > +++ b/drivers/media/platform/synopsys/Makefile
> > > @@ -1,2 +1,4 @@
> > >  # SPDX-License-Identifier: GPL-2.0-only
> > >  obj-y += hdmirx/
> > > +
> > > +obj-$(CONFIG_VIDEO_SYNOPSYS_MIPI_CSI2) += mipi-csi2.o
> >
> > Please give the module a more specific name.
> 
> How about dw-mipi-csi2.o? but it is already under synopsys. Our spec only
> show synopsys mipi csi2, and have not code naming for it.
> 
> Or mipi-csi2-v150.o (but it also supports more versions).
> 
> which one do you prefer?

I'd use dw-mipi-csi2.o.

-- 
Regards,

Sakari Ailus

