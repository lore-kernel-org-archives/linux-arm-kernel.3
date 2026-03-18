Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AA00103E170
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Mar 2026 12:37:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mwHJV1E8EPIdnQpKz841Xos1cwqhI/Djgt05vqp9cJE=; b=QWV8/YswX6jqvwR6U+QCQ5RG6Z
	QDTEsYG3Oyy89wTCPbXyowMmesPdQrxoai61uRPZ7D5SUWNFj+3UNEPy1BZ8pQD4Z0GpVreXV6xw/
	L0zFJoFggT4QaDc/4ct60ifg2svzxmj5NPQ2lmdiXXeLma+bInj/R1XfKb46OTw78ler/1j0mceT/
	0m4D43R9zYLHZCONVcc+ISFC3C9q1vwr2acYkdHLTK6S+eizlWHre6Dj9YEONLLp0lMerF4AAZZhC
	NljfrOo9rCxk6j+yRv1hZj2ZWRiUgdTLW0F8Kx3ujWJevb8jouRYaOlrxeUeEWNhFrg4m5+O8tXLO
	kYz+/ogA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2q8s-00000008Ofc-2j6d;
	Wed, 18 Mar 2026 12:36:54 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2q8p-00000008OdI-2nGL
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Mar 2026 12:36:53 +0000
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 72950308;
	Wed, 18 Mar 2026 13:35:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1773837333;
	bh=gJkOarkqeNqFiAqowEMJMqnQqZrj5iZoJNTJdDiOL4w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=q9kspBrTMBUX3jZiKr4U6vvXHQJz3taLkvyeKuD0N0+qePPY5mqUuQ+9lcruXL4m+
	 YYR5GvGa3S7My22X6fxaaTrAqdpAYNLl4BV+pVNQPnkVLdq9Xi4cfSVzotm20AzBJL
	 3fvo+Ii/5Zvd7iHEzNm1x8I/M8gju231SQ+/Muvc=
Date: Wed, 18 Mar 2026 14:36:44 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Michael Tretter <m.tretter@pengutronix.de>
Cc: Hans Verkuil <hverkuil@kernel.org>,
	Steve Longerbeam <slongerbeam@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-media@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	stable@vger.kernel.org,
	Michael Tretter <michael.tretter@pengutronix.de>,
	Frank Li <Frank.li@nxp.com>
Subject: Re: [PATCH v2 0/2] media: staging: imx: fix multiple video input
Message-ID: <20260318123644.GH408929@killaraus.ideasonboard.com>
References: <20251107-media-imx-fixes-v2-0-07d949964194@pengutronix.de>
 <aUPEs4wUHgAyMrPX@pengutronix.de>
 <aXOo0cc07cRi7-rF@pengutronix.de>
 <aXPNRbXBt2PRdFe4@lizhi-Precision-Tower-5810>
 <abqUAKj83Xaz0RzM@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <abqUAKj83Xaz0RzM@pengutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260318_053652_135308_51AA62C1 
X-CRM114-Status: GOOD (  30.38  )
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

On Wed, Mar 18, 2026 at 01:01:04PM +0100, Michael Tretter wrote:
> On Fri, 23 Jan 2026 14:34:29 -0500, Frank Li wrote:
> > On Fri, Jan 23, 2026 at 05:58:57PM +0100, Michael Tretter wrote:
> > > On Thu, 18 Dec 2025 10:09:07 +0100, Michael Tretter wrote:
> > > > On Fri, 07 Nov 2025 11:34:32 +0100, Michael Tretter wrote:
> > > > > If the IMX media pipeline is configured to receive multiple video
> > > > > inputs, the second input stream may be broken on start. This happens if
> > > > > the IMX CSI hardware has to be reconfigured for the second stream, while
> > > > > the first stream is already running.
> > > > >
> > > > > The IMX CSI driver configures the IMX CSI in the link_validate callback.
> > > > > The media pipeline is only validated on the first start. Thus, any later
> > > > > start of the media pipeline skips the validation and directly starts
> > > > > streaming. This may leave the hardware in an inconsistent state compared
> > > > > to the driver configuration. Moving the hardware configuration to the
> > > > > stream start to make sure that the hardware is configured correctly.
> > > > >
> > > > > Patch 1 removes the caching of the upstream mbus_config in
> > > > > csi_link_validate and explicitly request the mbus_config in csi_start,
> > > > > to get rid of this implicit dependency.
> > > > >
> > > > > Patch 2 actually moves the hardware register setting from
> > > > > csi_link_validate to csi_start to fix the skipped hardware
> > > > > reconfiguration.
> > > >
> > > > Gentle ping.
> > >
> > > Is there anything still missing to get these patches applied?
> 
> I'm not entirely sure, who is responsible for applying patches for
> media-imx. You handled the last few patches for this driver. Maybe you
> could apply these patches, too?
> 
> I also sent another series [0] for media-imx. Can you handle this other
> series, as well?

I don't have bandwidth to handle the i.MX6 camera code in staging, at
least for the parts that are not on their way out of staging (I really
want to help with imx6-mipi-csi2, but even there time is short). I'm
fine if Hans handles this series.

> [0] https://lore.kernel.org/linux-media/20251218-media-imx-cleanup-v2-0-9e3e3c269f7f@pengutronix.de/
> 
> > > > >
> > > > > Signed-off-by: Michael Tretter <michael.tretter@pengutronix.de>
> > > > > ---
> > > > > Changes in v2:
> > > > > - Document changed locking in commit message
> > > > > - Link to v1: https://lore.kernel.org/r/20251105-media-imx-fixes-v1-0-99e48b4f5cbc@pengutronix.de
> > > > >
> > > > > ---
> > > > > Michael Tretter (2):
> > > > >       media: staging: imx: request mbus_config in csi_start
> > > > >       media: staging: imx: configure src_mux in csi_start
> > > > >
> > > > >  drivers/staging/media/imx/imx-media-csi.c | 84 ++++++++++++++++++-------------
> > > > >  1 file changed, 48 insertions(+), 36 deletions(-)
> > > > > ---
> > > > > base-commit: 27afd6e066cfd80ddbe22a4a11b99174ac89cced
> > > > > change-id: 20251105-media-imx-fixes-acef77c7ba12

-- 
Regards,

Laurent Pinchart

