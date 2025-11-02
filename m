Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB67ACCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  2 Nov 2025 23:15:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iPDLad0rPcTcouBK+1hjAqE2lf0vV7HamEKY4mpfB9c=; b=ZCGJt7KLaVUz4p8CM6akJnM5xw
	/DC55M0ImZVnZNdfGUAJb7Kbkl6qHQ4Bknd4meS/RkJEyrZIERKnjEbkVD4irRQLDwnyD2pfzvK3V
	A9QX+2UlFy2lFg7p/sTVQ34RE/WXr3DqDplawp+bOUwNf2wqhcv9tGEzKnJxWShJ2EhKvdpYZK6Yv
	doSyA+HTsOPNgWSlgqVTbGGbRvrquw/E0nT+UN8JX6tf7gaodcL3bVNcHUcPpTTsoxmWAAg0YiMv1
	NIXrv1D8X9djqd/bNvIYAK7Oc29OBsUkB9nVxJHHbDefDrWoPed7nV3Ar+NRKhy0ZCDuNJcO4WwtM
	udDF6eMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFhHn-00000008vO5-0xIY;
	Sun, 02 Nov 2025 23:14:59 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFhHk-00000008vNh-1kt5
	for linux-arm-kernel@lists.infradead.org;
	Sun, 02 Nov 2025 23:14:57 +0000
Received: from pendragon.ideasonboard.com (82-203-160-149.bb.dnainternet.fi [82.203.160.149])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 326738BE;
	Mon,  3 Nov 2025 00:13:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1762125182;
	bh=kUr0faM6nmdPvF981v46JyOf4dm270I/HG8+3rNC3ok=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=POvKaHNIoRGL2MDfaf4h+sVBVTp/25n5QTk44MkrPN+bHGnQkSvs9/xku5f1aIP93
	 1bW22IONVmWJ4i0tgiSOBzj3GRepC2d7vjbbzqNvK3XBDWyIacsrdCmzImFAxuArkE
	 7KtorvEnqRRHFJPWiREarPEv37ZxQLecceM0y5rY=
Date: Mon, 3 Nov 2025 01:14:40 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: "G.N. Zhou" <guoniu.zhou@nxp.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Frank Li <frank.li@nxp.com>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [EXT] Re: [PATCH v2 2/5] media: nxp: imx8-isi: Simplify code by
 using helper macro
Message-ID: <20251102231440.GA1933@pendragon.ideasonboard.com>
References: <20250905-isi_imx93-v2-0-37db5f768c57@nxp.com>
 <20250905-isi_imx93-v2-2-37db5f768c57@nxp.com>
 <20250921221325.GB10540@pendragon.ideasonboard.com>
 <AS8PR04MB9080158655C3EA188BE7FE7AFA12A@AS8PR04MB9080.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <AS8PR04MB9080158655C3EA188BE7FE7AFA12A@AS8PR04MB9080.eurprd04.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251102_151456_599245_EF24C5E6 
X-CRM114-Status: GOOD (  24.90  )
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

On Mon, Sep 22, 2025 at 02:03:44AM +0000, G.N. Zhou wrote:
> On Monday, September 22, 2025 6:13 AM, Laurent Pinchart wrote:
> > On Fri, Sep 05, 2025 at 02:55:59PM +0800, Guoniu Zhou wrote:
> > > Simplify code by using helper macro FIELD_PREP() and GENMASK().
> > 
> > I'm not necessarily against this change, but how does it "simplify code"
> > ? There's no change in the code beside the macros, and they don't look
> > particularly simpler.
> 
> How about the message body change to " Make code more readable and easier to maintain by
> using the FIELD_PREP and GENMASK(). macro" and title change to "Refine code by using helper macro"?
> If you agree, I could apply it in next version.

No need to send a new version, I'll update the commit message myself.

> > > No functions changed.
> > >
> > > Reviewed-by: Frank Li <Frank.Li@nxp.com>
> > > Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
> > > ---
> > >  drivers/media/platform/nxp/imx8-isi/imx8-isi-gasket.c | 7 ++++---
> > >  1 file changed, 4 insertions(+), 3 deletions(-)
> > >
> > > diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-gasket.c
> > > b/drivers/media/platform/nxp/imx8-isi/imx8-isi-gasket.c
> > > index
> > >
> > f69c3b5d478209c083738477edf380e3f280c471..2f5e7299b537d612fb1fe668
> > 8c1b
> > > 75bfd2d6049b 100644
> > > --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-gasket.c
> > > +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-gasket.c
> > > @@ -3,6 +3,8 @@
> > >   * Copyright 2019-2023 NXP
> > >   */
> > >
> > > +#include <linux/bitfield.h>
> > > +#include <linux/bits.h>
> > >  #include <linux/regmap.h>
> > >
> > >  #include <media/mipi-csi2.h>
> > > @@ -16,8 +18,7 @@
> > >  #define GASKET_BASE(n)                               (0x0060 + (n) * 0x30)
> > >
> > >  #define GASKET_CTRL                          0x0000
> > > -#define GASKET_CTRL_DATA_TYPE(dt)            ((dt) << 8)
> > > -#define GASKET_CTRL_DATA_TYPE_MASK           (0x3f << 8)
> > > +#define GASKET_CTRL_DATA_TYPE(dt)            FIELD_PREP(GENMASK(13, 8),
> > (dt))
> > 
> > I think you can omit the parentheses around dt here, and around x below.
> 
> Ok, will apply in next version.
> 
> > 
> > >  #define GASKET_CTRL_DUAL_COMP_ENABLE         BIT(1)
> > >  #define GASKET_CTRL_ENABLE                   BIT(0)
> > >
> > > @@ -58,7 +59,7 @@ const struct mxc_gasket_ops mxc_imx8_gasket_ops = {
> > >   */
> > >
> > >  #define DISP_MIX_CAMERA_MUX                     0x30
> > > -#define DISP_MIX_CAMERA_MUX_DATA_TYPE(x)        (((x) & 0x3f) << 3)
> > > +#define DISP_MIX_CAMERA_MUX_DATA_TYPE(x)
> > FIELD_PREP(GENMASK(8, 3), (x))
> > >  #define DISP_MIX_CAMERA_MUX_GASKET_ENABLE       BIT(16)
> > >
> > >  static void mxc_imx93_gasket_enable(struct mxc_isi_dev *isi,

-- 
Regards,

Laurent Pinchart

