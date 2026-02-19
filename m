Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60868E9A048
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Feb 2026 11:06:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GLgvoTeSEv0KYzv0TTCGY2/NZDXX2UaswB3eS6L3s2s=; b=M9g6gBIYwaxNZ6BhdEwMSFB/FO
	CaFLZuCBdX0u3UpeqbLIRJuNK22t29I3MHAUaIJP4SBVrC7paE5VGfcf0qgmjEsvBw7h596sTJz60
	ShSqDNkjz28kX/IC5YC2SIHnaP9yCk8+OYT3LYNIOZ9AHOssTcsEmNZf0LJ0uhGwjwbwjry0llQeM
	evCHTW4Psa3f1wJsP94GmNE32hhavwRMQ1rGREO/ma3FI0xcKpjx6s3FU01BQcRbc7D6FWLPkr2IE
	LC4ySpaR9jkTQ+SZY0Y+cp76E3XgI14H86Y7+SMezJeky560pemDoL0USjgOvfM9AJZTd4I/xWJPF
	A1YNXBaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vt1r4-0000000BG4j-3eZV;
	Thu, 19 Feb 2026 11:05:58 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vt1r3-0000000BG4M-0B6j
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Feb 2026 11:05:58 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <m.tretter@pengutronix.de>)
	id 1vt1qm-0002ZD-RQ; Thu, 19 Feb 2026 12:05:40 +0100
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <m.tretter@pengutronix.de>)
	id 1vt1qk-001Z64-1w;
	Thu, 19 Feb 2026 12:05:39 +0100
Received: from mtr by pty.whiteo.stw.pengutronix.de with local (Exim 4.98.2)
	(envelope-from <m.tretter@pengutronix.de>)
	id 1vt1ql-0000000BNhf-3WRj;
	Thu, 19 Feb 2026 12:05:39 +0100
Date: Thu, 19 Feb 2026 12:05:39 +0100
From: Michael Tretter <m.tretter@pengutronix.de>
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, dri-devel@lists.freedesktop.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/2] drm/imx: ipuv3-plane: support underlay plane
Message-ID: <aZbug8wq4NKOAhIe@pengutronix.de>
References: <20260216-drm-imx-underlay-plane-v1-0-2dcbd1fd4ef5@pengutronix.de>
 <20260216-drm-imx-underlay-plane-v1-2-2dcbd1fd4ef5@pengutronix.de>
 <0b980d087bfe54262cef61821cbd70f5b71fc592.camel@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <0b980d087bfe54262cef61821cbd70f5b71fc592.camel@pengutronix.de>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: m.tretter@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260219_030557_091089_664DF00F 
X-CRM114-Status: GOOD (  19.66  )
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

On Mon, 16 Feb 2026 14:18:41 +0100, Philipp Zabel wrote:
> On Mo, 2026-02-16 at 13:44 +0100, Michael Tretter wrote:
> > The IPUv3 overlay plane may be placed over or under the primary plane.
> > Use an immutable position of 1 for the primary plane and a mutable
> > position including 0 and 2 for the overlay plane, to allow placing the
> > overlay plane over and under the primary plane.
> > 
> > Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
> > ---
> >  drivers/gpu/drm/imx/ipuv3/ipuv3-plane.c | 12 +++++++-----
> >  1 file changed, 7 insertions(+), 5 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/imx/ipuv3/ipuv3-plane.c b/drivers/gpu/drm/imx/ipuv3/ipuv3-plane.c
> > index dfd036f3195e..ddad5ea92aad 100644
> > --- a/drivers/gpu/drm/imx/ipuv3/ipuv3-plane.c
> > +++ b/drivers/gpu/drm/imx/ipuv3/ipuv3-plane.c
> > @@ -890,7 +890,7 @@ struct ipu_plane *ipu_plane_init(struct drm_device *dev, struct ipu_soc *ipu,
> >  {
> >  	struct ipu_plane *ipu_plane;
> >  	const uint64_t *modifiers = ipu_format_modifiers;
> > -	unsigned int zpos = (type == DRM_PLANE_TYPE_PRIMARY) ? 0 : 1;
> > +	unsigned int primary_zpos = 1;
> >  	unsigned int format_count;
> >  	const uint32_t *formats;
> >  	int ret;
> > @@ -928,12 +928,14 @@ struct ipu_plane *ipu_plane_init(struct drm_device *dev, struct ipu_soc *ipu,
> >  	else
> >  		drm_plane_helper_add(&ipu_plane->base, &ipu_plane_helper_funcs);
> >  
> > -	if (dp == IPU_DP_FLOW_SYNC_BG || dp == IPU_DP_FLOW_SYNC_FG)
> > -		ret = drm_plane_create_zpos_property(&ipu_plane->base, zpos, 0,
> > -						     1);
> > +	if ((dp == IPU_DP_FLOW_SYNC_BG || dp == IPU_DP_FLOW_SYNC_FG) &&
> 
> These checks is not necessary anymore. The only overlay plane is (dp ==
> IPU_DP_FLOW_SYNC_FG).

Thanks! That's even better. I'll simplify the check in v2.

Michael

