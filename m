Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4454510A62D2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Mar 2026 13:55:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:From:
	To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c7GysOWWyI49BgSyflC0GvQahJMzLXH7DggqPDsDW+0=; b=BCpAbtPJ6AV+UsOYOTBSw74wOc
	f60U4Zc3zzcAmVOONiI1K/2aHDlUkzFnn63/avrLzNF4/swU9QDHHXtoEmA+PnEE/ah4irjo2sSvQ
	gO1RPx4PlDV7k0iZV9qiBs9kpl/btCm0guE+t57CDEpL0H9pDlQOoPc+j0JtXrVjMC5xRElJAWyPs
	w6gZVJadxcjLTzmX4hvBxd1M3vA9uOgczREfpL84/oWItY5kU/mEKJVJxnCNZY8HxUsK5B+db1JgY
	I7h49YgsJ4MvivV3ujsVcojZlXftjsr+rB6lwut0ceuq0UIn23+sPFFib5v2//LAnPvwB46K9DhvQ
	Kr89HrTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5lBM-00000005aNT-3x7l;
	Thu, 26 Mar 2026 13:55:32 +0000
Received: from mail-106105.protonmail.ch ([79.135.106.105])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5lBJ-00000005aMz-1xa0
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Mar 2026 13:55:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
	s=protonmail; t=1774533323; x=1774792523;
	bh=c7GysOWWyI49BgSyflC0GvQahJMzLXH7DggqPDsDW+0=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=DVLBtxKrOB0Fnd2rp80AtsSauSbUo140hj09qD4tgS3kYpsTBIfdg7pgAmGM0K/cn
	 gb1heltniJ2cTZMGmUNHJDUrDHEm21aTP2Fy0U7xawvl+qdtD4X8NAoNlrbTMjQBnj
	 gNjDeDaWahBdgzne8ETn3Kl4TmgGfYSYr7PiQ+o3Yq4BuwbM/Kx1LhftK7eVzcw6ME
	 K7k4uylwyYnT4KE8bt+RQX7Ehv+6hyNxZJKVgj4+eJ7pt1xuLebkvVs1FwVQhpwaHr
	 kUOZJEdortD1t136+YIh8W+LV9T9YdylSDBuiiDHe4fCRWdDWiDKZJ4OBwK9An1lls
	 kDBgVX8pjhC1Q==
Date: Thu, 26 Mar 2026 13:55:18 +0000
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
From: Simon Ser <contact@emersion.fr>
Cc: Vishal Sagar <vishal.sagar@amd.com>, Anatoliy Klymenko <anatoliy.klymenko@amd.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Michal Simek <michal.simek@amd.com>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Geert Uytterhoeven <geert@linux-m68k.org>, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Pekka Paalanen <ppaalanen@gmail.com>, Pekka Paalanen <pekka.paalanen@collabora.com>
Subject: Re: [PATCH v8 04/11] drm/fourcc: Add DRM_FORMAT_Y10_P32
Message-ID: <tdkWFF71nLgRvNFp-OQtohBXQL6tLPCOKUUOaMDR0YyvFjmZ40KCDeM5NrBeev1BKVurfJ5UdBhcUTUjW6x5qbuSang4S2qZ5sTBbQSNum8=@emersion.fr>
In-Reply-To: <d0728f98-f964-4321-a34a-022f28f268cc@ideasonboard.com>
References: <20260128-xilinx-formats-v8-0-9ea8adb70269@ideasonboard.com> <20260128-xilinx-formats-v8-4-9ea8adb70269@ideasonboard.com> <5zkelJBm0aeSnp__adMEfjOl_GAg7G_W1GyDWix8dQ48gqSmuM1if1c2Vz_xPNNpKy8_SiUh4l7WRs-12b8_DkD0PUWLdCwubo2k_DLh5eE=@emersion.fr> <d0728f98-f964-4321-a34a-022f28f268cc@ideasonboard.com>
Feedback-ID: 1358184:user:proton
X-Pm-Message-ID: 91e26191d2ffb68d0f86cf59163c92c8ee1971b0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_065530_160873_D63BC643 
X-CRM114-Status: GOOD (  18.40  )
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

On Friday, March 20th, 2026 at 11:48, Tomi Valkeinen <tomi.valkeinen@ideaso=
nboard.com> wrote:

> Hi,
>=20
> On 19/03/2026 16:59, Simon Ser wrote:
> > On Wednesday, January 28th, 2026 at 18:25, Tomi Valkeinen <tomi.valkein=
en@ideasonboard.com> wrote:
> >
> >> Add Y10_P32, a 10 bit greyscale format, with 3 pixels packed into
> >> 32-bit container.
> >>
> >> The fourcc for the format is 'YPA4', which comes from Y - Y only, P -
> >> packed, A - 10 (as in 0xA), 4 - 4 bytes.
> >
> > I know we aren't super consistent about DRM format names, but=E2=80=
=A6 this _P32
> > suffix doesn't make sense to me: we never had it before, and a lot of
> > DRM formats are packed (in the Vulkan sense [1]), so I'm not sure why
> > this one would need it.
> >
> > What's special about this one is that it's the first (AFAIK) which has
> > 3 pixels per block. Some YCbCr formats are sub-sampled, but always use =
a
> > square block.
> >
> > I would suggest something like YYYX1010102. We use the "channels
> > followed by bits per component" pattern elsewhere.
> I'm ok with that. But wouldn't it be XYYY2101010 instead?

Oh yes, indeed.

> And then we just wait for someone to add a x:Y0:Y1:Y2 format (instead of
> x:Y2:Y1:Y0). Should we be more specific, and already make this one
> XY2Y1Y0_2101010...

Looking at all existing YCbCr formats, they all use the Y2-Y1-Y0 ordering,
none of them use the reverse. So I'd say it's safe enough to just leave it
out and treat it as the default. We can think of a new pattern if/when we
hit the reverse case.

