Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CD5AC021B2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Feb 2025 15:47:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HlxdjvkWin6Z0nt+Lip1Lgk1ydVgGBVCgwtkSIWZxaE=; b=jZeGjB8Ns/A4wWbB/aWnmuo+4r
	zPvc9NbeF+8MXXozK4IJfFPmPbjFEgDzzG47Vb8jJ5FwbsvwpNQ/P2QFPGsLUdQUOu4tqy+en/KbD
	66ZRz41D6m4xcDhSmAWmXuYBESWPYn0t/cAaQHylIWJCQSGURtGASVZ3uKkfHvEiQpVmq1YtNE5ck
	G2jPahJru7BCa835Kc4xZB7AsDkU2fRRf4LTP6HU3B5V72pLn45t7TN5wpdKLgulegLHru3T+UF3u
	XEEijHPlLrFQdHKvzkwerBMGt+xgdt2TtL/ZC59A1/q8bjkwRqIA347cdScK2zyds86hh/1Zs4Y6Q
	rD7amx3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tl8ls-00000001ejh-3N8a;
	Thu, 20 Feb 2025 15:47:28 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tl8kN-00000001eET-400r
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Feb 2025 15:45:57 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1tl8k7-0003MS-Ml; Thu, 20 Feb 2025 16:45:39 +0100
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1tl8k7-001xUd-18;
	Thu, 20 Feb 2025 16:45:39 +0100
Received: from pza by lupine with local (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1tl8k7-000Clm-0p;
	Thu, 20 Feb 2025 16:45:39 +0100
Message-ID: <6e03b0c09c4e6d222670025c6540f73a0a0a819d.camel@pengutronix.de>
Subject: Re: [PATCH v2 8/8] imx_dsp_rproc: Use reset controller API to
 control the DSP
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>, Daniel Baluta
	 <daniel.baluta@nxp.com>, robh@kernel.org, shawnguo@kernel.org
Cc: krzk+dt@kernel.org, conor+dt@kernel.org, s.hauer@pengutronix.de, 
	kernel@pengutronix.de, festevam@gmail.com, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, mathieu.poirier@linaro.org, 
	shengjiu.wang@nxp.com, Frank.Li@nxp.com, peng.fan@nxp.com, 
	laurentiu.mihalcea@nxp.com, iuliana.prodan@nxp.com
Date: Thu, 20 Feb 2025 16:45:39 +0100
In-Reply-To: <c52e6c5c-f49e-4727-b669-086ae7cb0e1e@gmail.com>
References: <20250219192102.423850-1-daniel.baluta@nxp.com>
	 <20250219192102.423850-9-daniel.baluta@nxp.com>
	 <c52e6c5c-f49e-4727-b669-086ae7cb0e1e@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250220_074555_988294_7A044A03 
X-CRM114-Status: GOOD (  19.34  )
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

On Do, 2025-02-20 at 00:22 +0200, Laurentiu Mihalcea wrote:
>=20
> On 2/19/2025 9:21 PM, Daniel Baluta wrote:
> > Use the reset controller API to control the DSP on i.MX8MP. This way
> > we can have a better control of the resources and avoid using a syscon
> > to access the audiomix bits.
> >=20
> > Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
> > Reviewed-by: Peng Fan <peng.fan@nxp.com>
> > ---
> >  drivers/remoteproc/imx_dsp_rproc.c | 25 +++++++++++++++++--------
> >  drivers/remoteproc/imx_rproc.h     |  2 ++
> >  2 files changed, 19 insertions(+), 8 deletions(-)
> >=20
> > diff --git a/drivers/remoteproc/imx_dsp_rproc.c b/drivers/remoteproc/im=
x_dsp_rproc.c
> > index ea5024919c2f..631563e4f86d 100644
> > --- a/drivers/remoteproc/imx_dsp_rproc.c
> > +++ b/drivers/remoteproc/imx_dsp_rproc.c
> > @@ -19,6 +19,7 @@
> >  #include <linux/pm_runtime.h>
> >  #include <linux/regmap.h>
> >  #include <linux/remoteproc.h>
> > +#include <linux/reset.h>
> >  #include <linux/slab.h>
> > =20
> >  #include "imx_rproc.h"
> > @@ -111,6 +112,7 @@ enum imx_dsp_rp_mbox_messages {
> >   */
> >  struct imx_dsp_rproc {
> >  	struct regmap				*regmap;
> > +	struct reset_control			*reset;
>=20
> Maybe rename this to "stall"? There's also the DAP stuff that's actually =
used
> to reset the core so this might be a bit confusing?

So Run/Stall does not actually reset anything? Maybe then it should not
be modeled as a reset control. It looks to me like the
DAP_PWRCTL[CORERESET] bit in the Audio Processor Debug region would be
a much better fit.

regards
Philipp

