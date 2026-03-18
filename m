Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F7EB103E167
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Mar 2026 12:01:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=epCFq2BTlzixzKsJy22lWovTv48FBCtOM5lqUoKM9y4=; b=xUxZu/e8lajl5ln33dz8sNmqBH
	wGSFwHwyBnqAlP+kM2Flny0ScYM+/wxtjQ0pKSHh0HHORvfMYEbxDzmPfYghcAvs+LxsMiW7gtSJW
	+J3OggNip2d2SIQAmUIfCbzM4zi6wP6M7mb55I4qIbwiY0Cm/+uLuF57kw8zJuXisphmdSk9Y0rX7
	oW4zUB0x3Os2f7jWSIz9Hex7vOmHokoLZxG4cd+AfF++PzFTXK88fhTQJc09wrIoIXVi1QCLOjG6I
	F/6gSvLGfTafcw/Nyr34Iwzf7mX9cxnBVwc6K1tLAoTwKMT1nYXzWhwYQJYABSTVUgUmyfkG+fjAR
	G+6OkI8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2paP-00000008M7Z-1chs;
	Wed, 18 Mar 2026 12:01:17 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2paM-00000008M6C-1QwI
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Mar 2026 12:01:15 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <m.tretter@pengutronix.de>)
	id 1w2paC-0004ZJ-N1; Wed, 18 Mar 2026 13:01:04 +0100
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <m.tretter@pengutronix.de>)
	id 1w2paC-000tur-1G;
	Wed, 18 Mar 2026 13:01:04 +0100
Received: from mtr by pty.whiteo.stw.pengutronix.de with local (Exim 4.98.2)
	(envelope-from <m.tretter@pengutronix.de>)
	id 1w2paC-000000099ZW-1872;
	Wed, 18 Mar 2026 13:01:04 +0100
Date: Wed, 18 Mar 2026 13:01:04 +0100
From: Michael Tretter <m.tretter@pengutronix.de>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Hans Verkuil <hverkuil@kernel.org>
Cc: Steve Longerbeam <slongerbeam@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-media@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	stable@vger.kernel.org,
	Michael Tretter <michael.tretter@pengutronix.de>,
	Frank Li <Frank.li@nxp.com>
Subject: Re: [PATCH v2 0/2] media: staging: imx: fix multiple video input
Message-ID: <abqUAKj83Xaz0RzM@pengutronix.de>
Mail-Followup-To: Michael Tretter <m.tretter@pengutronix.de>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	Steve Longerbeam <slongerbeam@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-media@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	stable@vger.kernel.org,
	Michael Tretter <michael.tretter@pengutronix.de>,
	Frank Li <Frank.li@nxp.com>
References: <20251107-media-imx-fixes-v2-0-07d949964194@pengutronix.de>
 <aUPEs4wUHgAyMrPX@pengutronix.de>
 <aXOo0cc07cRi7-rF@pengutronix.de>
 <aXPNRbXBt2PRdFe4@lizhi-Precision-Tower-5810>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aXPNRbXBt2PRdFe4@lizhi-Precision-Tower-5810>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: m.tretter@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260318_050114_380875_EC03B521 
X-CRM114-Status: GOOD (  28.11  )
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

Hi Laurent, hi Hans,

On Fri, 23 Jan 2026 14:34:29 -0500, Frank Li wrote:
> On Fri, Jan 23, 2026 at 05:58:57PM +0100, Michael Tretter wrote:
> > On Thu, 18 Dec 2025 10:09:07 +0100, Michael Tretter wrote:
> > > On Fri, 07 Nov 2025 11:34:32 +0100, Michael Tretter wrote:
> > > > If the IMX media pipeline is configured to receive multiple video
> > > > inputs, the second input stream may be broken on start. This happens if
> > > > the IMX CSI hardware has to be reconfigured for the second stream, while
> > > > the first stream is already running.
> > > >
> > > > The IMX CSI driver configures the IMX CSI in the link_validate callback.
> > > > The media pipeline is only validated on the first start. Thus, any later
> > > > start of the media pipeline skips the validation and directly starts
> > > > streaming. This may leave the hardware in an inconsistent state compared
> > > > to the driver configuration. Moving the hardware configuration to the
> > > > stream start to make sure that the hardware is configured correctly.
> > > >
> > > > Patch 1 removes the caching of the upstream mbus_config in
> > > > csi_link_validate and explicitly request the mbus_config in csi_start,
> > > > to get rid of this implicit dependency.
> > > >
> > > > Patch 2 actually moves the hardware register setting from
> > > > csi_link_validate to csi_start to fix the skipped hardware
> > > > reconfiguration.
> > >
> > > Gentle ping.
> >
> > Is there anything still missing to get these patches applied?

I'm not entirely sure, who is responsible for applying patches for
media-imx. You handled the last few patches for this driver. Maybe you
could apply these patches, too?

I also sent another series [0] for media-imx. Can you handle this other
series, as well?

Michael

[0] https://lore.kernel.org/linux-media/20251218-media-imx-cleanup-v2-0-9e3e3c269f7f@pengutronix.de/

> > > >
> > > > Signed-off-by: Michael Tretter <michael.tretter@pengutronix.de>
> > > > ---
> > > > Changes in v2:
> > > > - Document changed locking in commit message
> > > > - Link to v1: https://lore.kernel.org/r/20251105-media-imx-fixes-v1-0-99e48b4f5cbc@pengutronix.de
> > > >
> > > > ---
> > > > Michael Tretter (2):
> > > >       media: staging: imx: request mbus_config in csi_start
> > > >       media: staging: imx: configure src_mux in csi_start
> > > >
> > > >  drivers/staging/media/imx/imx-media-csi.c | 84 ++++++++++++++++++-------------
> > > >  1 file changed, 48 insertions(+), 36 deletions(-)
> > > > ---
> > > > base-commit: 27afd6e066cfd80ddbe22a4a11b99174ac89cced
> > > > change-id: 20251105-media-imx-fixes-acef77c7ba12
> 

