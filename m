Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B132C71136
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Jun 2025 18:01:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=grDbEJCqwmwEu2KncBowOfZqj2yNoiJ/Z3B+QMeJmkc=; b=l+x2zPpl4IIURcebtz6e9f0wIa
	f6/WYGFBHooicXEdD2Fr6EB2FQU91jL+OQEkmeZxKh2+s/BwpM/5kZHuNRRVAzZdIVrj/Ea2PguxP
	HOnwWDdemAYi39ZVNipo9ByN080u85zYNHGS8rMj1ha8UGMGYH2UwyT4Jk4m3/8UhyAGWDeeX5NFr
	HVWIIiD3gYfIpOJhyYgX966pVblCs0ed6M4eddKd87y7XiXUqLjgN74lX4t0s6HQbXja77ypW5wX9
	ziMnpDhpDRNjKjFmJ8sO/EHh5pnS+8DCvbCBDCaKIW64u+41orZr8YXbw3EO0MjShZMSw5KVyH4Z5
	iCkwDh7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPPky-0000000Ao5R-3ZFZ;
	Wed, 11 Jun 2025 18:01:00 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPMOF-0000000A64u-4BeI
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Jun 2025 14:25:21 +0000
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 23B992329;
	Wed, 11 Jun 2025 16:25:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1749651908;
	bh=ydw5XstCOj0yxT3ihCpLEUcyvE3z56cERDKWAm+csSg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JZcUDvbJTHLRCMKztArv5XRBV2UHFvGOjmfkOUZFrAhTDdy9AxA7voYcK2/vHn6Nu
	 WyMEobdEFcsh1Q9xpCzPWwsRiRv8z60zykAImLj8Brf+fdGkALvw/eDug2eansN/FX
	 dBXPhuJWGeeBKrFPsRq82hjT9uHQJ3lRkp960daM=
Date: Wed, 11 Jun 2025 17:25:03 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Frank Li <Frank.li@nxp.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rui Miguel Silva <rmfrfs@gmail.com>,
	Martin Kepplinger <martink@posteo.de>,
	Purism Kernel Team <kernel@puri.sm>, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Robert Chiras <robert.chiras@nxp.com>,
	"Guoniu.zhou" <guoniu.zhou@nxp.com>
Subject: Re: [PATCH v5 00/13] media: imx8: add camera support
Message-ID: <20250611142503.GB22730@pendragon.ideasonboard.com>
References: <20250522-8qxp_camera-v5-0-d4be869fdb7e@nxp.com>
 <aEcUGXeAdf/gBBFX@lizhi-Precision-Tower-5810>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aEcUGXeAdf/gBBFX@lizhi-Precision-Tower-5810>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_072520_181800_473B5356 
X-CRM114-Status: GOOD (  25.16  )
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

On Mon, Jun 09, 2025 at 01:04:25PM -0400, Frank Li wrote:
> On Thu, May 22, 2025 at 01:56:38PM -0400, Frank Li wrote:
> > Add SCU reset driver for i.MX8QM/i.MX8QXP.
> > Update binding doc.
> > Update driver for imx8qxp and imx8qm.
> > Add dts files for it.
> >
> > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> 
> Laurent Pinchart:
> 
> 	Do you have chance to check these patches? Only below patch
> media: nxp: imx8-isi: Use devm_clk_bulk_get_all() to fetch clocks
> missed your review tag.

I've just pinged Rob in the v4 thread.

> 	DT team member still have not any comments about your concern by
> use devm_clk_bulk_get_all(). I have quite confidence about this
> devm_clk_bulk_get_all(), many drivers already switched to use
> devm_clk_bulk_get_all() recently.
> 
> 	Do you need me rebase to v6.16-rc1?

The patches apply cleanly on v6.16-rc1, no need to rebase. I'll wait a
few more days for Rob's reply.

> > Changes in v5:
> > - collect Laurent Pinchart's review tags
> > - remove empty endpoint in dts
> >
> > Changes in v4:
> > - Add 4 clean up patches
> > 	media: nxp: imx8-isi: Remove unused offset in mxc_isi_reg and use BIT() macro for mask
> > 	media: nxp: imx8-isi: Use dev_err_probe() simplify code
> > 	media: nxp: imx8-isi: Remove redundant check for dma_set_mask_and_coherent()
> > 	media: nxp: imx8-isi: Use devm_clk_bulk_get_all() to fetch clocks
> > - rebase to v6.15-rc1.
> > - Remove scu reset patches, which already in linux-next
> > - Remove patch
> > 	 Add fixed clock node clock-xtal24m to prepare to add camera support.
> > - other detail change log see each patch's change log
> > - Link to v3: https://lore.kernel.org/r/20250210-8qxp_camera-v3-0-324f5105accc@nxp.com
> >
> > Changes in v3:
> > - Remove phy driver parts.
> > - csr is dedicate for mipi csi2, so add it as second register space. csr is
> > mixed with PHY and link control with csi2.
> > - Link to v2: https://lore.kernel.org/r/20250205-8qxp_camera-v2-0-731a3edf2744@nxp.com
> >
> > Changes in v2:
> > - move scu reset binding doc to top scu doc.
> > - isi use seperate binding doc for imx8qxp and imx8qm.
> > - phy and csi2, compatible string 8qm fallback to qxp
> > - remove internal review tags
> > - Link to v1: https://lore.kernel.org/r/20250131-8qxp_camera-v1-0-319402ab606a@nxp.com
> >
> > ---
> > Frank Li (10):
> >       media: dt-bindings: Add binding doc for i.MX8QXP and i.MX8QM ISI
> >       media: nxp: imx8-isi: Allow num_sources to be greater than num_sink
> >       media: nxp: imx8-isi: Remove unused offset in mxc_isi_reg and use BIT() macro for mask
> >       media: nxp: imx8-isi: Use devm_clk_bulk_get_all() to fetch clocks
> >       media: nxp: imx8-isi: Remove redundant check for dma_set_mask_and_coherent()
> >       media: nxp: imx8-isi: Use dev_err_probe() to simplify code
> >       media: imx8mq-mipi-csi2: Add support for i.MX8QXP
> >       arm64: dts: imx8: add capture controller for i.MX8's img subsystem
> >       arm64: dts: imx8q: add linux,cma node for imx8qm-mek and imx8qxp-mek
> >       arm64: dts: imx8q: add camera ov5640 support for imx8qm-mek and imx8qxp-mek
> >
> > Guoniu.zhou (1):
> >       media: imx8mq-mipi-csi2: Add imx8mq_plat_data for different compatible strings
> >
> > Robert Chiras (2):
> >       media: imx8-isi: Add support for i.MX8QM and i.MX8QXP
> >       media: dt-bindings: nxp,imx8mq-mipi-csi2: Add i.MX8QM(QXP) compatible strings
> >
> >  .../devicetree/bindings/media/fsl,imx8qm-isi.yaml  | 117 +++++++
> >  .../devicetree/bindings/media/fsl,imx8qxp-isi.yaml | 106 ++++++
> >  .../bindings/media/nxp,imx8mq-mipi-csi2.yaml       |  38 ++-
> >  MAINTAINERS                                        |   1 +
> >  arch/arm64/boot/dts/freescale/Makefile             |  11 +
> >  arch/arm64/boot/dts/freescale/imx8-ss-img.dtsi     | 362 +++++++++++++++++++++
> >  .../boot/dts/freescale/imx8qm-mek-ov5640-csi0.dtso |  64 ++++
> >  .../boot/dts/freescale/imx8qm-mek-ov5640-csi1.dtso |  64 ++++
> >  arch/arm64/boot/dts/freescale/imx8qm-mek.dts       |  67 ++++
> >  arch/arm64/boot/dts/freescale/imx8qm-ss-img.dtsi   |  79 +++++
> >  arch/arm64/boot/dts/freescale/imx8qm.dtsi          |   5 +
> >  .../boot/dts/freescale/imx8qxp-mek-ov5640-csi.dtso |  63 ++++
> >  arch/arm64/boot/dts/freescale/imx8qxp-mek.dts      |  45 +++
> >  arch/arm64/boot/dts/freescale/imx8qxp-ss-img.dtsi  |  83 +++++
> >  arch/arm64/boot/dts/freescale/imx8qxp.dtsi         |   5 +
> >  .../media/platform/nxp/imx8-isi/imx8-isi-core.c    | 135 ++++----
> >  .../media/platform/nxp/imx8-isi/imx8-isi-core.h    |   6 +-
> >  .../platform/nxp/imx8-isi/imx8-isi-crossbar.c      |   8 +-
> >  drivers/media/platform/nxp/imx8mq-mipi-csi2.c      | 169 +++++++++-
> >  19 files changed, 1334 insertions(+), 94 deletions(-)
> > ---
> > base-commit: ae1fdcf4b210cd66ac7e97b24219c160e4bb7be5
> > change-id: 20250114-8qxp_camera-c1af5749d304

-- 
Regards,

Laurent Pinchart

