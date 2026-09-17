Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AE5CC982CF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 12:10:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mKjsFpB6jwr7wMWoJ78ZFWtD8MGuhFV57vssMVJYZzY=; b=3VyELqGkdadwx/5Ik8QktuvOoI
	tFNo9GWNLxuMH2xPQ+vn2fYbYzYdE+9ZHkwlC6VgSyT4a9eec7wE/brYEjPDR+2oSZadvXMW9kMGL
	ohLeQ30xNVZTATcnABRmFwHATYxnOh3Kgoc/LXix+ob/rtdpw7maMWaZyzvwd+3KWTtsIhiQPHfZs
	UCLJV+nZd1hl4QunOQ8+m3D/0EN+VDmANj5PRpOsSk2wDQO5YF+CWJgVYvkgrSiSJkVaRjAXQytJN
	1hAaS5bbHopJvfDUmxZLKMF5WDkIq8cW/2rccnTZDVB6Pl6mMWfxmXvqBkAPw7KTpoR6xxPcHOcEK
	rRbt8ehw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7AwC-0000000BFxt-0ssN;
	Thu, 17 Sep 2026 12:10:00 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Aw8-0000000BFxQ-2Opn
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 12:09:58 +0000
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2505726CF;
	Thu, 17 Sep 2026 14:08:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1789646890;
	bh=YSUw6AYQlpCx82S4qpDEzxcG4DE/YEviLxFC0Ymvx3E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=o7G8FZ/hOwdQOujtMAOm5FePU3dG5oP+IXOFBBhNqaC7ABrSMy/umq4pNzJB+c/K6
	 Zod4K0czm1r3cdez1i0c8X0OZhOvAslAfXFzIQ3MvHtPgjuKaDBWgEHjVQ7qgHGa1r
	 NByD4KeT5VtZ6RKIMXbYjDqg+sBSEu5BnT80uebk=
Date: Thu, 17 Sep 2026 15:09:50 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: arash golgol <arash.golgol@gmail.com>
Cc: Hans Verkuil <hverkuil+cisco@kernel.org>, linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	yong.deng@magewell.com, paulk@sys-base.io, mchehab@kernel.org,
	wens@kernel.org, jernej.skrabec@gmail.com, samuel@sholland.org
Subject: Re: [PATCH v1 0/3] media: sunxi: Resend active-state conversions
Message-ID: <20260917120950.GA44274@killaraus.ideasonboard.com>
References: <20260804072630.28745-1-arash.golgol@gmail.com>
 <CAMxPZkgk4+idrZowJ1z-ddAzaD-hx-NJP+KSj8pUrSfL0HH4aQ@mail.gmail.com>
 <CAMxPZkhjurfpPvvymamJqTuia8CtFw1gRyYA4KBwFcQoH5jz3A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMxPZkhjurfpPvvymamJqTuia8CtFw1gRyYA4KBwFcQoH5jz3A@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_050956_779062_8F18187F 
X-CRM114-Status: GOOD (  24.83  )
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

Hi Arash,

Your patches have been merged in
https://gitlab.freedesktop.org/linux-media/media-committers. I'm sorry
it took so long. I really appreciate the work you've done here.

On Mon, Sep 07, 2026 at 08:15:02AM +0330, arash golgol wrote:
> On Wed, Aug 12, 2026 at 9:50 AM arash golgol wrote:
> > On Tue, Aug 4, 2026 at 10:57 AM Arash Golgol wrote:
> > >
> > > These three patches convert the sun6i-mipi-csi2, sun8i-a83t-mipi-csi2,
> > > and sun6i-csi bridge drivers to use the V4L2 subdev active state API.
> > >
> > > Each patch has already received review and testing individually in
> > > previous postings (see the changelog and links within each patch for
> > > that history), but none have been picked up and none currently have
> > > a delegate on patchwork. Resending together to make it easier to
> > > review and apply as a group.
> > >
> > > No code changes since the last posted version of each patch.
> > >
> > > Arash Golgol (3):
> > >   media: sun6i-mipi-csi2: Use V4L2 subdev active state
> > >   media: sun8i-a83t-mipi-csi2: Use V4L2 subdev active state
> > >   media: sun6i-csi: bridge: Use V4L2 subdev active state
> > >
> > >  .../sunxi/sun6i-csi/sun6i_csi_bridge.c        | 155 ++++++++----------
> > >  .../sunxi/sun6i-csi/sun6i_csi_bridge.h        |   9 -
> > >  .../sunxi/sun6i-csi/sun6i_csi_capture.c       |  27 ++-
> > >  .../sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.c   | 107 ++++++------
> > >  .../sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.h   |   2 -
> > >  .../sun8i_a83t_mipi_csi2.c                    | 112 +++++++------
> > >  .../sun8i_a83t_mipi_csi2.h                    |   2 -
> > >  7 files changed, 194 insertions(+), 220 deletions(-)
> > >
> > > --
> > > 2.34.1
> >
> > I've been trying to get these patches merged for a while.
> > Multiple pings and followups have been sent, but they haven't
> > been applied yet. This series is just a collection of my
> > individual patches.
> >
> > All patches have full Reviewed-by/Tested-by coverage from
> > Laurent Pinchart and Paul Kocialkowski. Current status of all
> > patches are still New in patchwork, without a delegate.
> >
> > Link: https://patchwork.linuxtv.org/project/linux-media/list/?series=28738
> >
> > Given the review is complete, would you be able to pick these
> > up, or let me know if something else is blocking them?
> 
> Just following up on this series.
> Link to series:
> https://patchwork.linuxtv.org/project/linux-media/list/?series=28738

-- 
Regards,

Laurent Pinchart

