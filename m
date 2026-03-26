Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1104C10A62FE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Mar 2026 14:48:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:From:
	To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=STCGY5YHOLEvGsutamILGTDqfSYqg76iLIjjaraENt8=; b=YS3MWhEWVugziA3nYvaC9ijMS1
	zEXt07vPBHEFgE1hdxgoPj1a0zDcbd39iuiUdCV50m6pkLlq/oCOBpEcYnYt3+KGsKVNSlRxORG8y
	sqRFdMWSpQ9D5SLDYmSB5qEeg0apjSwBbRitPTYjD7O/V1aJMQr0tsCGkQopK1HuaAFcMivWOf+05
	4qy+VzcOjPxCOjyuy4VJjljN1i6EgotlrqQnhIpppdDj2/wQTblDDxLuj/2Em5PoIOxFEa2jnCULJ
	CggpWXYpLFi8XRPbWZrmApzdf6DD8kkPmCreznLAEiA1qqPCMqnjWjqCmKCnH4ioOrWTLk52coGNF
	zoxH+JOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5m0p-00000005gp2-1hNf;
	Thu, 26 Mar 2026 14:48:43 +0000
Received: from mail-106100.protonmail.ch ([79.135.106.100])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5m0m-00000005goG-0jIf
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Mar 2026 14:48:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
	s=protonmail; t=1774536517; x=1774795717;
	bh=STCGY5YHOLEvGsutamILGTDqfSYqg76iLIjjaraENt8=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=iEJK2fLOzv39D522tJ1BbmvDMT/bI4PTIQQZTLdKWlRtmZuv4GlehU80mG9Y2nldZ
	 TLcdW1upPixUdUfrd7ZYRfHun5asYa2rBQEC7r9PrHtAxFZ1f9c/k3PPUGLUu9vGFp
	 YTirRGzgo/fjnOyQ0j88+lg8jrGKOgRlDCB54neiVHn0+ACdpRRZEFzUf8FmWH94FV
	 XxyHcXIDpdvLoDNnR3SSyBbSz4RPcVu7s9Z7aON1l7mKcqNGqUylW+pX0YiFpZe29j
	 DIVmJpwscCjCuPxE8v3TF6GYjmFJkdqA4N3bW2uakw8YWGAGK0QLy543Z8I+7z4v+l
	 bgHLpqpBKDduw==
Date: Thu, 26 Mar 2026 14:48:34 +0000
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
From: Simon Ser <contact@emersion.fr>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>, Vishal Sagar <vishal.sagar@amd.com>, Anatoliy Klymenko <anatoliy.klymenko@amd.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Michal Simek <michal.simek@amd.com>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Geert Uytterhoeven <geert@linux-m68k.org>, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Pekka Paalanen <ppaalanen@gmail.com>, Dmitry Baryshkov <lumag@kernel.org>
Subject: Re: [PATCH v8 02/11] drm/fourcc: Add DRM_FORMAT_XV15/XV20
Message-ID: <0zcNsL9U3TBMN4-IhSQ5RH8kRnJMUnwP0f6LhriTxuKxp3r0oWtL6FMi4bSyZaOxknTGZmHYiBZ5Ef96ZO0y_5yEFjfwiKpFRLWWsuZ6RDw=@emersion.fr>
In-Reply-To: <67120b18-8763-4b93-b89f-7f919f38e08e@ideasonboard.com>
References: <20260128-xilinx-formats-v8-0-9ea8adb70269@ideasonboard.com> <20260128-xilinx-formats-v8-2-9ea8adb70269@ideasonboard.com> <K_oXHqtPM_1bdhpMkkQMreIZ9OFfJVpHO3GV_wzmK_PvjQEw4Qz3IMBhGDNVQllkLg_GQeMGyOi6wpIFaRjrNkHubTwWQm-wqvKYTi6zEA0=@emersion.fr> <67120b18-8763-4b93-b89f-7f919f38e08e@ideasonboard.com>
Feedback-ID: 1358184:user:proton
X-Pm-Message-ID: b32e0b863de1dbc358e061ddc4316a92e88c3e16
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_074840_853368_71611D3A 
X-CRM114-Status: GOOD (  17.21  )
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

On Friday, March 20th, 2026 at 11:37, Tomi Valkeinen <tomi.valkeinen@ideaso=
nboard.com> wrote:

> On 19/03/2026 17:15, Simon Ser wrote:
> > What is the difference between DRM_FORMAT_XV15 and DRM_FORMAT_P030?
>=20
> Good question. I thought the Cr & Cb are swapped between those formats.
>=20
> The VC4 driver uses HVS_PIXEL_ORDER_XYCBCR define, and the comment in
> drm_fourcc.h starts with "YCbCr420". So, CbCr. But then the comments
> then continue with CrCb.
>=20
> XV15/20 isn't super clear either, starting with "YCrCb" but then "Cb:Cr
> plane".
>=20
> The components in the plane descriptions look identical though, hinting
> they are the same. So to be sure, I tested it:
>=20
> I had test pattern support for XV15/20 in pykms, which I can test on a
> Xilinx board. P030 is a bit more difficult, as on RPi5 it requires
> DRM_FORMAT_MOD_BROADCOM_SAND128. But with a linear -> SAND128 converter,
> I was able to test linear NV12 converted to NV12+SAND128 and shown on
> the screen (just for reference), and similarly linear XV15 ->
> P030+SAND128. And, indeed, the linear XV15 test pattern shows correctly
> on screen when converted to SAND128. So afaics XV15 is indeed identical
> to P030, and I can drop XV15.
>=20
> This then brings up the question about XV20. That format doesn't exist
> yet, but should it then be named similarly to P030? However, I have no
> idea what P030 means, so I don't know what a 2x1 subsampled P030 would
> be called...
>=20
> Thoughts/ideas? Or just keep XV20?

I've replied with some ideas on the new version's thread :)

