Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24BB5C369D1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Apr 2025 11:57:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eE54B0ulpkm+aWxhU2oeljTklX7QgI2Tl/j95Hz43BU=; b=kJuGccTpgZ06DnKnYDTXxwowzE
	XwGtrBd2aQcUDbu82f2LYo7XRc8b417W34CJpGwvgce4Hy6tswQ+qbIe1IkJ9TtIYll8i7JpccWCd
	TjxwKje6MomNL9Qw+WJMYO0j/Gf2SAI77jVv1KJv04aiNZmzXHZZIVaX51N76+F7DGxaxHnkgUQkI
	IUabKknWh0hnf6lP1hOspHO7Aj9IIzUYDtg3v5RBurBrLpXsZw/3I+PaX3M8sO/yEhrtKcqmrsCSW
	Aao6TFsc0ovJ5Th6nWgJrBK8MSrGFfzGqmuIYNCJc3Kxid09zG1Qdr4Y3EfIL7ukvl62DnJs+Anpt
	lWMLdqRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8Hgj-0000000H2VX-1hGH;
	Fri, 25 Apr 2025 11:57:49 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8G8n-0000000Ghl9-1YvA
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Apr 2025 10:18:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1745576318;
	bh=+WMDRHwIxjNdFWZib1N8x93fRIjfmI7anWK8oxtytUg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=fS8OBStgXmEHPXUtgkQM6i6oldyGjHhVXAffJrz40OrrJDixFwzubm2Jjg2v2cmUv
	 LmnmNqmFur9E5HCtxdfibtsa36Vxyr+lqMpHBeDveVhs5fy0gzCs33TzLPPMof0iw4
	 ylrUroQH9zIEk5hXM3LaumCgjzrFtrshAOKLj5zW5YghhblY17lEoGLTUcdSfVYaV0
	 EXmuYNQYKhv0cRLgc+ntPLmiHduEjMltKTcEDNshKbQKBpkrggTkKwLq+n9vOLU3Ky
	 C7Ad1vqexnj6rH7xkvQOSaU0XBCmXcaei5EN+/YyIst8AG3onO9rnByzIXpJuk8wc7
	 VmN2qkPkqiYTQ==
Received: from eldfell (unknown [194.136.85.206])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: pq)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 4D41617E0F66;
	Fri, 25 Apr 2025 12:18:38 +0200 (CEST)
Date: Fri, 25 Apr 2025 13:18:17 +0300
From: Pekka Paalanen <pekka.paalanen@collabora.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Geert Uytterhoeven
 <geert@linux-m68k.org>, Vishal Sagar <vishal.sagar@amd.com>, Anatoliy
 Klymenko <anatoliy.klymenko@amd.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Michal Simek <michal.simek@amd.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Dmitry Baryshkov
 <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v4 03/11] drm/fourcc: Add DRM_FORMAT_Y8
Message-ID: <20250425131817.01b7f7d9@eldfell>
In-Reply-To: <c432aca1-cbab-476c-ba3a-e0d9cc940da7@ideasonboard.com>
References: <20250326-xilinx-formats-v4-0-322a300c6d72@ideasonboard.com>
	<20250326-xilinx-formats-v4-3-322a300c6d72@ideasonboard.com>
	<CAMuHMdXM1B1c=62EpcuUdpdpaBRZSJLXb1GBB0egzp7Fyeo5-w@mail.gmail.com>
	<b195971c-52e6-463e-a440-83dde4346e65@ideasonboard.com>
	<20250327112009.6b4dc430@eldfell>
	<b5cf15a4-7c65-4718-9c39-a4c86179ba4c@ideasonboard.com>
	<20250327175842.130c0386@eldfell>
	<CAMuHMdVEpTVWmwrYt+G-QSWucT91goUcFor9qbo5rZ+X2jnRog@mail.gmail.com>
	<20250331105446.098f0fbe@eldfell>
	<20250331082135.GB13690@pendragon.ideasonboard.com>
	<20250331135337.61934003@eldfell>
	<20250401162732.731ef774@eldfell>
	<73bd6628-374d-417f-a30f-88a4b1d157bb@ideasonboard.com>
	<20250417111315.62a749e5@eldfell>
	<c432aca1-cbab-476c-ba3a-e0d9cc940da7@ideasonboard.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/+HlgRhuvMGsiYHXtWjVBSQu";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250425_031841_569044_7159CEBC 
X-CRM114-Status: GOOD (  17.84  )
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

--Sig_/+HlgRhuvMGsiYHXtWjVBSQu
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Fri, 25 Apr 2025 11:38:28 +0300
Tomi Valkeinen <tomi.valkeinen@ideasonboard.com> wrote:

> Hi Pekka,
>=20
> On 17/04/2025 11:13, Pekka Paalanen wrote:
> >> My understanding is that the Y-only pixel formats behave in a well
> >> defined way (or, as well defined as the YUV formats), and there's
> >> nothing more to add here. Is that right? =20
> >=20
> > There are two things:
> >=20
> > - Y8 follows COLOR_RANGE property, just like all other YUV formats.
> > - Y8 implies that Cb and Cr are both neutral (0.0 in nominal values).
> >=20
> > I'd like these explicitly written down, so that they become obvious to
> > everyone. I suspect either one might be easy to forget when writing
> > code and taking shortcuts without thinking. =20
>=20
> I didn't find a suitable place in the docs for this, but would this, in=20
> the drm_fourcc.h, be enough:
>=20
> /*
>   * Y-only (greyscale) formats
>   *
>   * The Y-only formats are handled similarly to the YCbCr formats in the=
=20
> display
>   * pipeline, with the Cb and Cr implicitly neutral (0.0 in nominal=20
> values). This
>   * also means that COLOR_RANGE property applies to the Y-only formats.
>   *
>   */
>=20
> #define DRM_FORMAT_Y8		fourcc_code('G', 'R', 'E', 'Y')  /* 8-bit Y-only */
> #define DRM_FORMAT_Y10_P32	fourcc_code('Y', 'P', 'A', '4')  /* [31:0]=20
> x:Y2:Y1:Y0 2:10:10:10 little endian */
>=20

Hi Tomi,

I would be very happy with that.


Thanks,
pq

--Sig_/+HlgRhuvMGsiYHXtWjVBSQu
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmgLYWkACgkQI1/ltBGq
qqeHUQ/+NfUcYS7wXohrzllZkrHLk6YwDQxQOoiRG6PixGDOwza/SPNNA28d2Qqm
CunihOWPP6oCU5c7R51Yt2fZtQZdk533eaPltmaU5YuW7g9Jk8xBvG1KFvwShJgi
O176UFzxV1TtkCwLyx04kj5Q29rDtJRbm21T84rBiEr+r6AEe007j4JGD58D84hm
b9vgIXy7qZ/68jXEawGdAJIianBu/SN3T95jZ1vrYJgr/RSF9cC7SVgoan5K2WoV
3MnXgBfTVqbyKMX3zMGW1NWARglgHqC+JEnd3TORbutORjS7PgRqGF7nY+vScvxt
9JAF3XtZ+CwA5HOXLRAdLLnCqGQEQ3OmArYyM/PRznbIiUOJGbxS0dYS4SgLkfPH
FGJCQIOq8yY9blh9pGnV5cwZJFwsVv1/LV6akaHKR2vzPFh4ii+Edy+oFMcoywwo
Rzoqgp/eMbEtPwL/NFCyKF4CmcBBJExuQer8z8NR/ovRXZ6KObrMi6LyPaeLcsZT
xq4ZSX2c62B+2bnUsCJeaYcYV0WyFUdQ0KBgf24At7Y3pYE4STRF3m7bUxz0Oql2
LpQZ7caiz6GKX89Q0aw7yLSWJSY+Euu/RldMWy5EIcXNGEhuZKq3xxVWpLVmK/gv
hpDZrDv8d23DBk5xM7VJSvWk6M7dBqbyl60f8RlvygNpPu/9rdQ=
=tC03
-----END PGP SIGNATURE-----

--Sig_/+HlgRhuvMGsiYHXtWjVBSQu--

