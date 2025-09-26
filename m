Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68BE3CAC5AE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Sep 2025 08:46:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:
	Subject:References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P+/taiDh5fogO0Q1eGjfIVQW2FvSS2ohgAptmEY4nrs=; b=ieyeMAmN4GS54rR9bKtAlvRP/U
	Yk5ogOWhuTuIbKX/YiTz/WDtNRp/7FEf+VrdDv1SlmiAq5cmX8Joem974iYAGfyS6bkC6XMz+13tO
	4ytuNbJhJuEyLFCIN8sVzMiMCt0VVn3eaH3jiMCAiPTV+Czt0etzxXGoenodHTlhuLqUjoOg5riLE
	Pbkz3dz/BCeBG81XMKcaH/2pai0xlFCusxqopkt/qeGxz1BMqF3yqUnjf1EY5tudjt6+6HB1RxNF4
	CDFlhrHbSYK30wfmFjBVtmHkL8VrOGdwDwfSsvuOuEoCmy4nYRsSHzCxRLtVf7amJh29esruPRX5W
	fIRKWHRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2463-0000000HH06-0now;
	Fri, 26 Sep 2025 08:46:31 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2461-0000000HGxy-05JB
	for linux-arm-kernel@lists.infradead.org;
	Fri, 26 Sep 2025 08:46:30 +0000
Received: from thinkpad.ideasonboard.com (cpc90716-aztw32-2-0-cust408.18-1.cable.virginm.net [86.26.101.153])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 43FF81807;
	Fri, 26 Sep 2025 10:45:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1758876301;
	bh=IUA1ANsoSDf4ynFNcNEX5PCTUFJtU9aJS/An4xPjPW4=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=ZrQsmMkvFij0yY31VIvySARzvzdhWNfhnXkQnUrONYi17lCK3I/2qDmzyhBdTSJxL
	 dN3HbjbpWxRuWVge+mXh5887a+MeWz59bmy6T+ocVoozAj0AHJ1zwKwW1L6iKWBrJi
	 GQ2d7SrtwAsUz2uQQAegMhsnMOBp5a89Epi8fOsY=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <aNW4zDRAREUZ7v8k@lizhi-Precision-Tower-5810>
References: <20250925-active-data-lanes-v4-0-8b54e3d5af6c@ideasonboard.com> <20250925-active-data-lanes-v4-3-8b54e3d5af6c@ideasonboard.com> <aNW4zDRAREUZ7v8k@lizhi-Precision-Tower-5810>
Subject: Re: [PATCH v4 3/4] media: imx-mipi-csis: Store the number of data_lanes configured in dt
From: Isaac Scott <isaac.scott@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Rui Miguel Silva <rmfrfs@gmail.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Martin Kepplinger <martink@posteo.de>, Purism Kernel Team <kernel@puri.sm>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
To: Frank Li <Frank.li@nxp.com>
Date: Fri, 26 Sep 2025 09:46:22 +0100
Message-ID: <175887638283.180868.8800087471301856681@isaac-ThinkPad-T16-Gen-2>
User-Agent: alot/0.10
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250926_014629_203447_55DC0BDF 
X-CRM114-Status: GOOD (  25.73  )
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

Thank you for your review!

Quoting Frank Li (2025-09-25 22:49:00)
> On Thu, Sep 25, 2025 at 04:54:28PM +0100, Isaac Scott wrote:
> > The number of active data lanes in use on a MIPI CSI2 bus is not
> > necessarily always the maximum. To allow us to configure the number of
> > data lanes actively in use, store the maximum to ensure we can configure
> > a number of data lanes that is supported.
> >
>=20
> This patch just add num_data_lanes, and use csis->num_data_lanes instead
> of bus.num_data_lanes.
>=20
> So commit message not reflect what you did
>=20
> "
> media: imx-mipi-csis: Add num_data_lanes in mipi_csis_device
>=20
> Add num_data_lanes field in mipi_csis_device, set equal to
> csis->bus.num_data_lanes. Prepare to support cases where the number of
> active data lanes differs from the maximum supported lanes.
>=20
> No functional changes.
> "

Yes, that is much better, thank you for your suggestions (on this and
the next patch), I'll wait to see if there are any other comments and
improve my commit messages in the next version.

Best wishes,
Isaac

>=20
> Frank
>=20
> > Signed-off-by: Isaac Scott <isaac.scott@ideasonboard.com>
> > ---
> >  drivers/media/platform/nxp/imx-mipi-csis.c | 11 +++++++----
> >  1 file changed, 7 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/media/platform/nxp/imx-mipi-csis.c b/drivers/media=
/platform/nxp/imx-mipi-csis.c
> > index 7c2a679dca2e..838a1ad123b5 100644
> > --- a/drivers/media/platform/nxp/imx-mipi-csis.c
> > +++ b/drivers/media/platform/nxp/imx-mipi-csis.c
> > @@ -351,6 +351,8 @@ struct mipi_csis_device {
> >       u32 hs_settle;
> >       u32 clk_settle;
> >
> > +     unsigned int num_data_lanes;
> > +
> >       spinlock_t slock;       /* Protect events */
> >       struct mipi_csis_event events[MIPI_CSIS_NUM_EVENTS];
> >       struct dentry *debugfs_root;
> > @@ -573,7 +575,7 @@ static void mipi_csis_system_enable(struct mipi_csi=
s_device *csis, int on)
> >       val =3D mipi_csis_read(csis, MIPI_CSIS_DPHY_CMN_CTRL);
> >       val &=3D ~MIPI_CSIS_DPHY_CMN_CTRL_ENABLE;
> >       if (on) {
> > -             mask =3D (1 << (csis->bus.num_data_lanes + 1)) - 1;
> > +             mask =3D (1 << (csis->num_data_lanes + 1)) - 1;
> >               val |=3D (mask & MIPI_CSIS_DPHY_CMN_CTRL_ENABLE);
> >       }
> >       mipi_csis_write(csis, MIPI_CSIS_DPHY_CMN_CTRL, val);
> > @@ -623,7 +625,7 @@ static int mipi_csis_calculate_params(struct mipi_c=
sis_device *csis,
> >
> >       /* Calculate the line rate from the pixel rate. */
> >       link_freq =3D v4l2_get_link_freq(csis->source.pad, csis_fmt->widt=
h,
> > -                                    csis->bus.num_data_lanes * 2);
> > +                                    csis->num_data_lanes * 2);
> >       if (link_freq < 0) {
> >               dev_err(csis->dev, "Unable to obtain link frequency: %d\n=
",
> >                       (int)link_freq);
> > @@ -668,7 +670,7 @@ static void mipi_csis_set_params(struct mipi_csis_d=
evice *csis,
> >                                const struct v4l2_mbus_framefmt *format,
> >                                const struct csis_pix_format *csis_fmt)
> >  {
> > -     int lanes =3D csis->bus.num_data_lanes;
> > +     int lanes =3D csis->num_data_lanes;
> >       u32 val;
> >
> >       val =3D mipi_csis_read(csis, MIPI_CSIS_CMN_CTRL);
> > @@ -1366,8 +1368,9 @@ static int mipi_csis_async_register(struct mipi_c=
sis_device *csis)
> >       }
> >
> >       csis->bus =3D vep.bus.mipi_csi2;
> > +     csis->num_data_lanes =3D csis->bus.num_data_lanes;
> >
> > -     dev_dbg(csis->dev, "data lanes: %d\n", csis->bus.num_data_lanes);
> > +     dev_dbg(csis->dev, "max data lanes: %d\n", csis->bus.num_data_lan=
es);
> >       dev_dbg(csis->dev, "flags: 0x%08x\n", csis->bus.flags);
> >
> >       asd =3D v4l2_async_nf_add_fwnode_remote(&csis->notifier, ep,
> >
> > --
> > 2.43.0
> >

