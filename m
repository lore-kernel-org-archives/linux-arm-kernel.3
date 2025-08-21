Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCB21CA0EFA
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Aug 2025 23:49:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MCZ0kjAgUkAIpsCpKchImse+J2pCgtoEVGXX3D5TZ6s=; b=JLF2rxqFx9ejImkhDNxy/ka0bk
	JhIMdxFioqddDbpeoyltLNxSs+xk1lr3gzsmOu3YZeCTuoGs+MNVrNFN/XTtpKfX5tPtSmVzaw3cG
	5QO5Wh+A1uAjIu0ijmBgKov/BpfDejCrX1J9RoCuauhF0gbOEUL7CtqG8Ps/wNrEVCJtXWMxk1FFj
	EgQT+I1F0nYvHwg7zL9kWUa053SSqZvY86zab8nT/+4suq8ubL4Skh/sx0/4uhT4fBuHKCnkNSNE7
	nzxn/uUq9qIJuwPp94iS9zByYoahLWVKOBWixIL85F6lCgGG5kWqB37Rx4eIB5hAS35goLkloH8uW
	X+xuCTkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upF1o-00000000xnG-0ZLm;
	Thu, 21 Aug 2025 23:49:08 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up7oG-0000000HVV2-1Mga
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 Aug 2025 16:06:41 +0000
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id A6157C78;
	Thu, 21 Aug 2025 18:05:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1755792337;
	bh=reNOgaI66JpG7BCmaKX/JcvTZ2uK0khXqFeK3NpfnDQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pFfDnDKmTxUVEqUGHNPN0kzSTpwjHEJtAD/4LerCKHwLoRSdRSlxa7oi0G8IOm3JK
	 B4lPhsBNxAv0fzDABC79KW8xpRLeh0s+capxkmRedX0aqwDj1jy7mOOUmiD/vdoO1y
	 3km2CpAPWVjOehJoS+ta2BSEXfVAC3+/4TZLHWe0=
Date: Thu, 21 Aug 2025 19:06:13 +0300
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
Subject: Re: [PATCH v2 05/12] media: imx-mipi-csis: Rename register macros to
 match reference manual
Message-ID: <20250821160613.GA29629@pendragon.ideasonboard.com>
References: <20250821000944.27849-1-laurent.pinchart@ideasonboard.com>
 <20250821000944.27849-6-laurent.pinchart@ideasonboard.com>
 <aKc6gzH5nyAeusu3@lizhi-Precision-Tower-5810>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aKc6gzH5nyAeusu3@lizhi-Precision-Tower-5810>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_090640_502694_CCF4D18D 
X-CRM114-Status: GOOD (  26.29  )
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

On Thu, Aug 21, 2025 at 11:25:55AM -0400, Frank Li wrote:
> On Thu, Aug 21, 2025 at 03:09:37AM +0300, Laurent Pinchart wrote:
> > The CSIS driver uses register macro names that do not match the
> > reference manual of the i.MX7[DS] and i.MX8M[MNP] SoCs in which the CSIS
> > is integrated. Rename them to match the documentation, making the code
> > easier to read alongside the reference manuals.
> >
> > One of the misnamed register fields is MIPI_CSIS_INT_SRC_ERR_UNKNOWN,
> > which led to the corresponding event being logged as "Unknown Error".
> > The correct register field name is MIPI_CSIS_INT_SRC_ERR_ID, documented
> > as "Unknown ID error". Update the event description accordingly.
> >
> > While at it, also replace a few *_OFFSET macros with parametric macros
> > for consistency, and add the missing MIPI_CSIS_ISP_RESOL_VRESOL and
> > MIPI_CSIS_ISP_RESOL_HRESOL register field macros.
> >
> > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > ---
> >  drivers/media/platform/nxp/imx-mipi-csis.c | 69 +++++++++++-----------
> >  1 file changed, 36 insertions(+), 33 deletions(-)
> >
> > diff --git a/drivers/media/platform/nxp/imx-mipi-csis.c b/drivers/media/platform/nxp/imx-mipi-csis.c
> > index 894d12fef519..1ca327e6be00 100644
> > --- a/drivers/media/platform/nxp/imx-mipi-csis.c
> > +++ b/drivers/media/platform/nxp/imx-mipi-csis.c
> > @@ -55,13 +55,13 @@
> >  /* CSIS common control */
> >  #define MIPI_CSIS_CMN_CTRL			0x04
> >  #define MIPI_CSIS_CMN_CTRL_UPDATE_SHADOW	BIT(16)
> > -#define MIPI_CSIS_CMN_CTRL_INTER_MODE		BIT(10)
> > +#define MIPI_CSIS_CMN_CTRL_INTERLEAVE_MODE_NONE	(0 << 10)
> > +#define MIPI_CSIS_CMN_CTRL_INTERLEAVE_MODE_DT	(1 << 10)
> 
> BIT(10)?

INTERLAVE_MODE is a 2-bit field. I'm working on a series that add
support for the VC interleave mode, which has value 2. I'll however drop
this change and keep BIT(10) for now, as the commit message doesn't
explain why this has been modified.

> > +#define MIPI_CSIS_CMN_CTRL_LANE_NUMBER(n)	((n) << 8)
> > +#define MIPI_CSIS_CMN_CTRL_LANE_NUMBER_MASK	(3 << 8)
> 
> GEN_MASK() is better here, And below other registers.

It is, but I wanted this patch to focus on the renames. I actually have
a patch in my branch to switch to GENMASK for all masks, I will add it
to the next version of this series.

> >  #define MIPI_CSIS_CMN_CTRL_UPDATE_SHADOW_CTRL	BIT(2)
> > -#define MIPI_CSIS_CMN_CTRL_RESET		BIT(1)
> > -#define MIPI_CSIS_CMN_CTRL_ENABLE		BIT(0)
> > -
> > -#define MIPI_CSIS_CMN_CTRL_LANE_NR_OFFSET	8
> > -#define MIPI_CSIS_CMN_CTRL_LANE_NR_MASK		(3 << 8)
> > +#define MIPI_CSIS_CMN_CTRL_SW_RESET		BIT(1)
> > +#define MIPI_CSIS_CMN_CTRL_CSI_EN		BIT(0)
> >
> >  /* CSIS clock control */
> ...

-- 
Regards,

Laurent Pinchart

