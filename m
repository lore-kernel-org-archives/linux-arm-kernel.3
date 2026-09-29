Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 720E4CA5FA5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 18:16:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VqA5KD7T6CUdh/gnvAhmHBiLWsN4nMCl68qkHoiN4+I=; b=YtEfED7a5qP7Em/gx7bbFoU8RA
	fy2A6Hu4HEw+brzxQbv3jZ1eHR3fsvVW8y6S+fk/rRMkIuc9ymDm3rJFotYt3NrB9yKeEna9y2Ltn
	aAsrQd6aX7x15lwgVNYUnDmwmP4+JXPnoOspv3KC//n2E7677LM0DZSV00znoPIblfiWKQuXCEbGa
	WabGhNe4k38V/EWkE6j5zVr5PIXg1RYEUbVjp77jDc6UFuHQ6oQnXD12qAq9qxUBvuZ3v4s5mtTBf
	amOzt5jswNJDI7jmp5Lr/A6Kpe1Nxij1lCbPgtYzacUXUn7nnPjbcO5Q3Vu9A6v9UpnmyJrisfWN5
	HX4MDJ5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBcMz-00000004GMC-1EMg;
	Tue, 29 Sep 2026 18:16:01 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBcMx-00000004GLT-0Q04;
	Tue, 29 Sep 2026 18:15:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=VqA5KD7T6CUdh/gnvAhmHBiLWsN4nMCl68qkHoiN4+I=; b=Y1hXVF91KZ9Gae2OyNpbh2rnz4
	aqHD4Gcmy+TzFiCbX9Kg5VA3uz5SDrOBhaI4VBIrCNsuIpxCSqyYrhEFFmelAgXZGyYDXytgJ12Fq
	7tpT0yZ2qYIpoEidZO+vZtQdHtmzFld+u718Sb26otJKq/IoskG1ZHvY/CGlLT6O5JmNRe4R64QFi
	EbxGaUFsoC51f9lq0nkbZRol2C9NLT/PzrS4UBKOH5EYA4g13CAxU5+0na2/HZ5WFYL0jHHUsTc1K
	iy3fxT3xA6TGdQSSem8Yr4Da71LPufCXUSi4LJWUXSodHEavhxOFrSOd+utfENJRV9gASQNT6AlU7
	RHA+Wkdw==;
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xBcMt-00000002wPz-2L34;
	Tue, 29 Sep 2026 18:15:58 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1790705684; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=CbSTsuEIzMi8NQDvjEYx3+qKzuZPiaGg6yjSl2wL7fKDcqnU40Hcxv2p5UJCWQ4OCmyxQqaf8MbrkESheURSaQhiYlT3xscOMelbSvSc9ZjRmRVUYr7xqb5Aq/H5PT6xuy/8W3ld0XhktiDcm4YWdHPgw3k4CEb1V6E3xxBVFec=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1790705684; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=VqA5KD7T6CUdh/gnvAhmHBiLWsN4nMCl68qkHoiN4+I=; 
	b=H2yH23gEGGnPlLCTD+lmgXvD7FHqDagxEI69FkiR0OTKG76iq+p39A61mo5QC7OJI55fHjr1TBHdPgBokdMaHC+WVIkbtnYvSSB6m0RXkXYEUKdU+JTDlxa9tyels62rBo7KtKq5uhna2WMIta6faHwLbfPTNLY8iU/lAodzQXI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1790705684;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
	bh=VqA5KD7T6CUdh/gnvAhmHBiLWsN4nMCl68qkHoiN4+I=;
	b=M0M4pbef6ULbnfyRVPCBj57Llpuo6uG+9wRTfbaPJMvQiWVNzn0NEWgafMR24rfK
	qF6VmlEKQYOkC4ZfNio0OTumKLYG5uSb1AX18AZqP5mTSoLgPvUIjM3qajdmSVv/CRw
	Yxk5gk5CjN68cRDlwHYgXj3hNHBwxyeb7qQqPIFM=
Received: by smtp.zohomail.com with SMTPS id 17907056822681009.9156419401866;
	Tue, 29 Sep 2026 11:14:42 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
To: Michel =?UTF-8?B?RMOkbnplcg==?= <michel.daenzer@mailbox.org>,
 "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>,
 Daniel Stone <daniels@collabora.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Helge Deller <deller@gmx.de>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>, Sandy Huang <hjc@rock-chips.com>,
 Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>,
 Andy Yan <andy.yan@rock-chips.com>, Xaver Hugl <xaver.hugl@gmail.com>,
 Leo Li <sunpeng.li@amd.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-fbdev@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, kernel@collabora.com,
 Derek Foreman <derek.foreman@collabora.com>,
 wayland-devel@lists.freedesktop.org
Subject: Re: [PATCH RFC 13/25] drm: Add VRR target frame rate properties
Date: Tue, 29 Sep 2026 20:14:34 +0200
Message-ID: <SwRul6_8Tc-C-2oBT64DOg@collabora.com>
In-Reply-To: <164d00c2-e4cb-4962-8e4e-389ae77af943@amd.com>
References: <20260921-vrr-limiter-uapi-v1-0-2fcd7d011646@collabora.com>
 <3cf7143d-7013-4a3b-a831-96c3f125c2f6@mailbox.org>
 <164d00c2-e4cb-4962-8e4e-389ae77af943@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_191555_889866_0AF8FD9F 
X-CRM114-Status: GOOD (  31.43  )
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

On Tuesday, 29 September 2026 16:34:58 Central European Summer Time Leo Li =
wrote:
>=20
> On 2026-09-28 04:10, Michel D=C3=A4nzer wrote:
> >>> You can picture VRR limiting as always being active, but with a limit=
 rational
> >>> of 0 it uses the display's limit as per the EDID, which is what unlim=
ited game
> >>> mode is. So with how it's implemented right now in hdmi_validate_vrr(=
), your
> >>> example would set a maximum target, but leave the minimum at whatever=
 the
> >>> display defaults to.
> >>>
> >>> Now that I'm thinking through this, a possible problem is that
> >>> drm_crtc_helper_vrr_is_fixed_rate() operates on the user supplied lim=
its, but
> >>> if the display supplied lower limit is equal to the user supplied upp=
er limit,
> >>> then we have a fixed rate scenario without recognising it as such. I =
think I
> >>> need to have a ponder on what the least surprising behaviour for user=
space
> >>> is in that instance. The display limit stuff gets a bit complex due to
> >>> CinemaVRR and QMS TFRmin/TFRmax.
> >>>
> >>> I'll improve the documentation on the next revision to make the meani=
ngs more
> >>> explicit.
> >> Perhaps a simple way is to require simultaneous setting MIN and MAX pa=
irs?
> >> IOW, require userspace to set MIN and MAX simultaneously to >0, or =3D=
0. For example:
> >>
> >> if ((vrr_min_n =3D=3D 0 || vrr_min_d =3D=3D 0 ||
> >>      vrr_max_n =3D=3D 0 || vrr_max_d =3D=3D 0) &&
> >>     (vrr_min_n > 0 || vrr_max_n > 0))
> >> 	return -EINVAL;
> >> That way, it's never ambiguous what userspace has requested for the ra=
nge.
> >> They can copy the EDID supported range if they don't care about limiti=
ng one side, rather than leaving it at 0.
> > Determining the actual limits can be non-trivial (though I guess that m=
ight be fine as long as libdisplay-info can work them out), if user space g=
ets them wrong, it might accidentally apply a narrower limit than intended.
> >=20
> >=20
> >> It's then also clear if they requested a static Hz.
> > I do see the benefit of your suggestion for this though.
>=20
> Xaver and I were chatting about this at XDC, and yeah it'll be difficult
> to match KMD's monitor range, especially if KMD decides to patch it with
> quirks and whatnot.
>=20
> Since we are handing compositors control over vrr range, does it sound
> sensible to expose KMD's monitor range as a read-only property pair on
> the drm connector? We probably don't need a num/den pair for it, it's
> not like panels advertise fractional VRR ranges (right?).

Sounds good to me.

And yeah, we don't really need num/denom for it; the safe assumption is tha=
t the
minimum range is expressed with a denominator of 1.001 whereas the maximum =
range
is expressed with a numerator of 1. That's sort of non-obvious for userspace
though, so I'll need to do some thinking around the specified behaviour.

This sounds like a mainly theoretical concern but it's a real one, the most
common 1.001 rates we'll run into are likely 24/1.001 or 30/1.001 and those
are also very reasonable for a monitor to have as a lower limit. And when
they specify that lower limit, they'll do it as just the integer rounded
value, but seemingly expect them to be understood as the 1.001 value for
the lower limit.

> Fun fact: vrr_range is exposed today over debugfs for IGT testing
> https://elixir.bootlin.com/linux/v7.3-rc5/source/drivers/gpu/drm/drm_debu=
gfs.c#L586

Speaking of that, v2 will deduplicate my accidentally rebased-over
mostly duplicated EDID parsing and fix this function to report the
newly added vrr_min/vrr_max fields of the display_info. (Since
apparently monitor_range is populated by VESA and messing with it
may not be okay?)

Kind regards,
Nicolas Frattaroli

>=20
> Thanks,
> Leo
>=20
> >=20
> >=20
> > -- Earthling Michel D=C3=A4nzer \ GNOME / Xwayland / Mesa developer htt=
ps://redhat.com \ Libre software enthusiast
>=20
>=20





