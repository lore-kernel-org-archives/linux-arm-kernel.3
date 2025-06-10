Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADFDCC5B543
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Jun 2025 12:05:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:
	Subject:Cc:To:From:Message-Id:Date:Content-Type:Mime-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d87frpROuVlGjEVB2mDm08MDEd+CmIU52hSdyqvceiU=; b=ENfK1AmKnz6lu0H63oPMl/XAuj
	2lNZzbpqp+69ZFre9/DmHZrBYlSuu2dM612/AsfjMHHe4VJf8TcLw2kFJXq9WgFSXRG3BszAtNi/7
	iVzkS+OmON5A+6H4NX17gD3sO4ozm1esP0yItS20JP05TpA7Xn0vB2BTXFq0jIA1+xIbMbtnsKQMQ
	CgmWfuKL77AtmwkMJTKwefEetR4o8xcQidBM6lA8IGHAGF8xe3tRpQzGZpHfDi63VozoA9DKylaJc
	POz/NR3py5JQyTsEGSFHqauQPBd6wQvh9bTBul1Ont00UxkXtKWTPa9f5oQdAB2C1B+KrauZCB6He
	Mfmq8BwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOxjU-00000006iLv-08oB;
	Tue, 10 Jun 2025 12:05:36 +0000
Received: from out-171.mta0.migadu.com ([2001:41d0:1004:224b::ab])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOx8n-00000006e4q-0cig
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Jun 2025 11:27:42 +0000
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow.org; s=key1;
	t=1749554848;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=d87frpROuVlGjEVB2mDm08MDEd+CmIU52hSdyqvceiU=;
	b=qEphA0bypSgalnt0eO6vtYktEmcT1tqDQmDGVchsVK7Vutp9rmNvpR40+2CQme4157wFp2
	xAHP+DlDfd83sPJM3UB69HaZd04M0dDSTFUjuJRwcEKEc+JazVGgydcLufOrUyxnyLaiTJ
	pMiHUVkDm/+k0rwIrUhr5+opjCEzF2Pb8/kKG8mu2DAD8uyXFSEMSeDldf8z0L2S5sYsv+
	/5YayGjaSEFoS8uQkeaRCPYFWC0yGxk6GipS74DAdFkf+ltf1jhEKGCB31zq14SdxoubCl
	EckApz/WnAvBer+2JYvU3PZijI4uLTl1s+Yuz0FVmgK51RcGC7oMSWArIx4L4A==
Content-Type: multipart/signed;
 boundary=1a690bef81fb6f944ba894a0b6204d1559cb35f27fa37f9df3ad43d1b8ff;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Tue, 10 Jun 2025 13:27:13 +0200
Message-Id: <DAITFEPGXB6Z.38FAE9O9NSSLX@cknow.org>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Diederik de Haas" <didi.debian@cknow.org>
To: "Piotr Zalewski" <pZ010001011111@proton.me>
Cc: <hjc@rock-chips.com>, <heiko@sntech.de>, <andy.yan@rock-chips.com>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <simona@ffwll.ch>, "Dang Huynh"
 <danct12@riseup.net>, <dri-devel@lists.freedesktop.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-rockchip@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH drm-misc-next] rockchip/drm: vop2: don't check
 color_mgmt_changed in atomic_enable
References: <20241206192013.342692-3-pZ010001011111@proton.me>
 <DAEVDSTMWI1E.J454VZN0R9MA@cknow.org>
 <mArHDRo5bhIAjG8sDOR-kM7DsVdbXxxcC8hfuEEPfUWIdMwNnSUy8ZFoLis66DFSuIEq8TrnAxUGkyo5IUTGw3AG4k3vuVVz0fsoI27BAms=@proton.me> <DAH3S8O66J47.3NT18EJCXWKL9@cknow.org> <4z0y_F1ZT_xfO0-DwU-D5NwL3t3wHuGmivOB3QFjDsn0hzpz_hOeU63pRVBIgSU1j89jmYPq-TJHPqMCj3fAygwwX6IaPoVsqKqVi2jxmCc=@proton.me>
In-Reply-To: <4z0y_F1ZT_xfO0-DwU-D5NwL3t3wHuGmivOB3QFjDsn0hzpz_hOeU63pRVBIgSU1j89jmYPq-TJHPqMCj3fAygwwX6IaPoVsqKqVi2jxmCc=@proton.me>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_042741_319127_491C8B32 
X-CRM114-Status: GOOD (  27.36  )
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

--1a690bef81fb6f944ba894a0b6204d1559cb35f27fa37f9df3ad43d1b8ff
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi Piotr,

On Tue Jun 10, 2025 at 12:37 AM CEST, Piotr Zalewski wrote:
> Hi Diederik, sorry for late response

No need to be sorry :-)

(late? Less then 2 days vs my ~4 months before the git bisect ...)

>> Interesting that it also happened with drm=3Dy.
>
> I actually checked now and i don't have the issue with drm=3Dy, sorry for=
=20
> misinforming you all, hopefully no one's time was wasted.

Good to know, thanks :-)

>> > happened twice and at short interval and since this patch allows for g=
amma
>> > LUT update regardless of color_mgmt_changed state this makes DSP CTRL =
GAMMA
>> > LUT EN bit to be unset twice too. It seems that VOP does not like it. =
I
>>=20
>> Happy to see you found the cause :-)
>> Do you happen to know why it was unset twice? That sounds suboptimal.
>
> It is due to DRM modeset which can happens when CRTC (display) config cha=
nges=20
> "significantly". AFAIK modeset happens def. when you go out of suspend or
> display timings change. I might have been fooled by serial console last t=
ime
> as it does not appear to happen twice in short interval when i review the=
=20
> journal entries.
>
>> But (IIUC) setting a bit to a value it already has causing issues,
>> sounds surprising as well.
>
> Depends on what hardware does, when you write to a register it might caus=
e
> many other things to happen and seems like for vop2 it messes something u=
p.

I didn't know that, thanks.

> I made a second patch so that the first write is not permitted but all=20
> subsequent are permitted (regardless of lut en state) - issue disappeared=
=20
> too. So it might be that very first write to dsp lut disable happens too=
=20
> fast (in relation to something else)?. It is not intuitive because when d=
rm is
> a module it happens usually like ~second later.
>
> part of the log with drm=3Dy
> ```
> [    6.543099] rockchip-drm display-subsystem: [drm] GAMMA LUT DISABLE
> ```
>
> part of the log with drm=3Dm
> ```
> [    7.944120] rockchip-drm display-subsystem: [drm] GAMMA LUT DISABLE
> ```

My first (uneducated) hunch was a timing issue and ``=3Dm`` can reveal
issues which you wouldn't see with ``=3Dy``.
Andy already found an issue "that shouldn't happen" and my latest test
also had an unexpected result. So (eventually) we'll figure it out :-)

>> Sounds like a plan. It could be that this issue surfaced an underlaying
>> issue and if so, fixing that would be even better.
>
> When i have time this week I will check on what version of the kernel i=
=20
> tested gamma lut when i sent the patches and test there.

I think it would be beneficial if you'd do the tests that Andy asked
'me' to do too, so we can compare results.
FWIW: I have the 4GB RAM version.

Cheers,
  Diederik

--1a690bef81fb6f944ba894a0b6204d1559cb35f27fa37f9df3ad43d1b8ff
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQT1sUPBYsyGmi4usy/XblvOeH7bbgUCaEgWmQAKCRDXblvOeH7b
bga5AP46kC7i4GeX+4vWp7Yxj8oZG/p/M87NvkPeVbBlmVSxNwD/aKazZBYfZhA9
N8AQj5r2cn8N8/pLuRozO0FJiPY+iAk=
=thoO
-----END PGP SIGNATURE-----

--1a690bef81fb6f944ba894a0b6204d1559cb35f27fa37f9df3ad43d1b8ff--

