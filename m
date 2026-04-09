Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DA84F364A6
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Apr 2026 17:18:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HuFzJNSe92ZbK719IrP04TfAlTlYaF7G54D6Y5FaOtk=; b=fgsFK0z7+SdBmxsVh7byaTjUy2
	5BoNZLT3FG3zpSRpplnM8aKP0i0sCVfzYjsihXk22Foa64ookUUlQAACZnK/1FXwobfWpl5NZrDwG
	JM6p2i4exdsJdm+lC6u+vTSbfuBvWLE5ZP7kC+ISQX+GgQVeNmCTj/FwcouZ8X1M0N+6jggnBKsFw
	vH0ycPp4bVXLW8qaxiN5BLGW0OiV8K9gxdIda2zcNu6o0iUNFZSvumwj6sdOe7izhOdePHMneCi1T
	3QrrMkt+f8fZ0ZNaIDtzZmdSqgt9W6c5wVKhIjftJvJdMs6iEcn3hIei6lLo5pYZ8mZqtfcSW87jw
	nxsOrs0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAt0s-0000000B0oa-3A2O;
	Thu, 09 Apr 2026 17:17:54 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAt0p-0000000B0nB-24Zk
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Apr 2026 17:17:53 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <m.tretter@pengutronix.de>)
	id 1wAt0g-0004hp-82; Thu, 09 Apr 2026 19:17:42 +0200
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <m.tretter@pengutronix.de>)
	id 1wAt0f-004YXC-2f;
	Thu, 09 Apr 2026 19:17:41 +0200
Received: from mtr by pty.whiteo.stw.pengutronix.de with local (Exim 4.98.2)
	(envelope-from <m.tretter@pengutronix.de>)
	id 1wAt0f-0000000H9Cg-2yeW;
	Thu, 09 Apr 2026 19:17:41 +0200
Date: Thu, 9 Apr 2026 19:17:41 +0200
From: Michael Tretter <m.tretter@pengutronix.de>
To: Frank Li <Frank.li@nxp.com>
Cc: Hans Verkuil <hverkuil+cisco@kernel.org>,
	Steve Longerbeam <slongerbeam@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>, linux-media@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH v2 0/3] media: imx-csi: cleanup media pipeline start
Message-ID: <adffNaI6hQbc1mAO@pengutronix.de>
Mail-Followup-To: Michael Tretter <m.tretter@pengutronix.de>,
	Frank Li <Frank.li@nxp.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Steve Longerbeam <slongerbeam@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>, linux-media@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	linux-staging@lists.linux.dev
References: <20251218-media-imx-cleanup-v2-0-9e3e3c269f7f@pengutronix.de>
 <aXOoc0lvAtPt0fAL@pengutronix.de>
 <aco5Ei1B4vJWKMMj@pengutronix.de>
 <acqK9Ms_eRxg59Xa@lizhi-Precision-Tower-5810>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <acqK9Ms_eRxg59Xa@lizhi-Precision-Tower-5810>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: m.tretter@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260409_101751_533764_A6B73037 
X-CRM114-Status: GOOD (  27.88  )
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

On Mon, 30 Mar 2026 10:38:44 -0400, Frank Li wrote:
> On Mon, Mar 30, 2026 at 10:49:22AM +0200, Michael Tretter wrote:
> > Hi Hans,
> >
> > On Fri, 23 Jan 2026 17:57:23 +0100, Michael Tretter wrote:
> > > On Thu, 18 Dec 2025 10:23:48 +0100, Michael Tretter wrote:
> > > > The imx media device currently assumes that there is only a single media
> > > > pipeline. However, the media graph has multiple imx capture devices.
> > > > These may be started separately on media pipelines if they don't cause
> > > > conflicts in the media graph.
> > > >
> > > > Move the media pipeline from the media device to the capture devices to
> > > > properly track and handle multiple media pipelines for the imx-csi.
> > > > Refactor the code to start the media pipeline from the driver to help
> > > > the reader.
> > >
> >
> > Could you take a look and apply this series for the imx-media driver,
> > too? The patches are already reviewed by Frank Li and Philipp Zabel.
> 
> Michael Tretter:
> 
> Sorry, I will take care imx's stage driver. I already sent pull-request,
> which included your other two patches.

Thanks for taking care! I found the other two patches in the
media-committers repository.

> 
> Do you have others patches, which need me take care. I am not sure if
> there are chance to send 2nd pull request for 7.1.

Currently, I have only the patches in this series.

Michael

> > >
> > > >
> > > > Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
> > > > ---
> > > > Changes in v2:
> > > > - Improve code readability in Patch 2
> > > > - Update commit message of Patch 3 as suggested by Frank Li
> > > > - Link to v1: https://patch.msgid.link/20251107-media-imx-cleanup-v1-0-f82a693c28f4@pengutronix.de
> > > >
> > > > ---
> > > > Michael Tretter (3):
> > > >       media: imx-csi: move media_pipeline to video device
> > > >       media: imx-csi: explicitly start media pipeline on pad 0
> > > >       media: imx-csi: use media_pad_is_streaming helper
> > > >
> > > >  drivers/staging/media/imx/imx-media-capture.c |  8 ++++----
> > > >  drivers/staging/media/imx/imx-media-utils.c   | 12 ++++++++----
> > > >  drivers/staging/media/imx/imx-media.h         |  7 ++++---
> > > >  3 files changed, 16 insertions(+), 11 deletions(-)
> > > > ---
> > > > base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
> > > > change-id: 20251107-media-imx-cleanup-9022d941ae44

