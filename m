Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98C2FD77882
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Jan 2026 16:59:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KzGyTGdfcs6JrB/b1s3WnkUtfwQDZySDtpNtgRsYjSI=; b=NCWgMVX8JeQHRO6gYyKn1VuMeo
	NTIbtyn7JeMd54zyOg2MmeoSyzyHdBdfT/nN9x0Y9UEsLmaiT3QY1WLu34K60QFsmqkNnCnfz33zW
	328xoHARRDf4sQ3GMOjlJV++aYVwLQ2yl7IgBzyKylI7Dhl3MEUOEwWgkTAmyQNAfF8fL/+Jmp29u
	mXht76rUzjA23ZZT9w4KeAaOga7WotgTeHYF4hxbjFWVV8ImbkmvJvBVa/3jiX/3oNsBa53StjmkG
	eyZVEIoKd0MVlaiN6PXgL2Ot5x6AakUSh792QGlc1aAswGdmtP7KoLoNooJvKEbuOXDPFdDeR9tzg
	L+1zQaCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjKV4-00000009Fe4-0T6E;
	Fri, 23 Jan 2026 16:59:10 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjKV1-00000009Fdd-0ZjJ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Jan 2026 16:59:08 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <m.tretter@pengutronix.de>)
	id 1vjKUs-0003bz-UX; Fri, 23 Jan 2026 17:58:58 +0100
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <m.tretter@pengutronix.de>)
	id 1vjKUs-0027qZ-1F;
	Fri, 23 Jan 2026 17:58:57 +0100
Received: from mtr by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <m.tretter@pengutronix.de>)
	id 1vjKUr-00B4rI-1y;
	Fri, 23 Jan 2026 17:58:57 +0100
Date: Fri, 23 Jan 2026 17:58:57 +0100
From: Michael Tretter <m.tretter@pengutronix.de>
To: Steve Longerbeam <slongerbeam@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Hans Verkuil <hans.verkuil@cisco.com>, linux-media@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	stable@vger.kernel.org,
	Michael Tretter <michael.tretter@pengutronix.de>,
	Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH v2 0/2] media: staging: imx: fix multiple video input
Message-ID: <aXOo0cc07cRi7-rF@pengutronix.de>
Mail-Followup-To: Michael Tretter <m.tretter@pengutronix.de>,
	Steve Longerbeam <slongerbeam@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Hans Verkuil <hans.verkuil@cisco.com>, linux-media@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	stable@vger.kernel.org,
	Michael Tretter <michael.tretter@pengutronix.de>,
	Frank Li <Frank.Li@nxp.com>
References: <20251107-media-imx-fixes-v2-0-07d949964194@pengutronix.de>
 <aUPEs4wUHgAyMrPX@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aUPEs4wUHgAyMrPX@pengutronix.de>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: m.tretter@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260123_085907_174956_61372ACC 
X-CRM114-Status: GOOD (  23.36  )
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

On Thu, 18 Dec 2025 10:09:07 +0100, Michael Tretter wrote:
> On Fri, 07 Nov 2025 11:34:32 +0100, Michael Tretter wrote:
> > If the IMX media pipeline is configured to receive multiple video
> > inputs, the second input stream may be broken on start. This happens if
> > the IMX CSI hardware has to be reconfigured for the second stream, while
> > the first stream is already running.
> > 
> > The IMX CSI driver configures the IMX CSI in the link_validate callback.
> > The media pipeline is only validated on the first start. Thus, any later
> > start of the media pipeline skips the validation and directly starts
> > streaming. This may leave the hardware in an inconsistent state compared
> > to the driver configuration. Moving the hardware configuration to the
> > stream start to make sure that the hardware is configured correctly.
> > 
> > Patch 1 removes the caching of the upstream mbus_config in
> > csi_link_validate and explicitly request the mbus_config in csi_start,
> > to get rid of this implicit dependency.
> > 
> > Patch 2 actually moves the hardware register setting from
> > csi_link_validate to csi_start to fix the skipped hardware
> > reconfiguration.
> 
> Gentle ping.

Is there anything still missing to get these patches applied?

Michael

> > 
> > Signed-off-by: Michael Tretter <michael.tretter@pengutronix.de>
> > ---
> > Changes in v2:
> > - Document changed locking in commit message
> > - Link to v1: https://lore.kernel.org/r/20251105-media-imx-fixes-v1-0-99e48b4f5cbc@pengutronix.de
> > 
> > ---
> > Michael Tretter (2):
> >       media: staging: imx: request mbus_config in csi_start
> >       media: staging: imx: configure src_mux in csi_start
> > 
> >  drivers/staging/media/imx/imx-media-csi.c | 84 ++++++++++++++++++-------------
> >  1 file changed, 48 insertions(+), 36 deletions(-)
> > ---
> > base-commit: 27afd6e066cfd80ddbe22a4a11b99174ac89cced
> > change-id: 20251105-media-imx-fixes-acef77c7ba12

