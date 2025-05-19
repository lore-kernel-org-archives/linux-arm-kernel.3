Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB0ABC3ABDD
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 May 2025 19:55:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/8I4SWUDCIRTZj3Sh/4b5wvaTLCOFYR5oPMTXs4Ribs=; b=o2fM5QK4gJRRyyOReiCpAEgmCO
	69DlPa9Mvl5WSohNmjctRnSc5XVLxVdV+P0JpnJ8lsDPmoRWTbuo8gcERWi8LhMVXuk+oAKMzQxYJ
	mYovUu65oM344tUeh6pwVfuW6ssRBeyhTVoDUyUtA//CDCs2WUI/6SWCSCv35vbZbpbimvTvTZP+c
	O0BVP2229hwm8ZOqS3aEm5i3zIWOI8KQ9wIb2+NhVJn8tecAL61UxuTEkjy43bxSmBntbFxfmt1I+
	epXzUGO2gj+VVW700IXv4xhIWXEu9R6fdqkO8uJ4rQPZl5qslaycBTTdB90yiWAQkEtdJAtH/OuFp
	emKBNe1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH6aN-0000000AI81-1QKI;
	Mon, 19 May 2025 19:55:44 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH5ZQ-0000000AAxr-2tTK
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 May 2025 18:50:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=/8I4
	SWUDCIRTZj3Sh/4b5wvaTLCOFYR5oPMTXs4Ribs=; b=DOZIW3VWJI5Ettv3r7wM
	X+w4ad4y4+DAO9ZtCPahs8xUgOFCFzMFnLZrPoSY3IAxkDJ5rZav+V1xBWxrFq6Y
	rDBJp149eJ7/7z4kQtK7xUMRDbksB2dDqS7iB867e7CRoSUJ26J+ajXCUl/6+Z3s
	AjMbvbxE6aCyapWGSsQpvIRQnCkc16dJBcZQIUdKWrWeG1wA2p+wcN6GdB+XZa8t
	F+dgHXoyB2xKmTEOPNsejNv5i+SMm78i8ayHFhneVta9xzkVsKTXc91W5057u0mN
	tJWvOBQCVzxlK0n3XSXwtwJO/41Y0WeV6YZwPOn0vAQVbZ0AoiFmKzdB4C0hMYfs
	nA==
Received: (qmail 2603142 invoked from network); 19 May 2025 20:50:36 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 19 May 2025 20:50:36 +0200
X-UD-Smtp-Session: l3s3148p1@vph1m4E1ONRZz6uL
Date: Mon, 19 May 2025 20:50:35 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	linux-renesas-soc@vger.kernel.org, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	Herve Codina <herve.codina@bootlin.com>
Subject: Re: [PATCH 1/7] arm64: dts: exynos: use proper node names for GPIO
 based I2C busses
Message-ID: <aCt9e-rrOOR0C5HI@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	linux-renesas-soc@vger.kernel.org, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	Herve Codina <herve.codina@bootlin.com>
References: <20250519121512.5657-1-wsa+renesas@sang-engineering.com>
 <20250519121512.5657-2-wsa+renesas@sang-engineering.com>
 <006ee7d6-1289-4f4a-819d-9a5e5120db99@kernel.org>
 <aCtD7BH5N_uPGkq7@shikoro>
 <3f6e1b74-5d19-4194-b98b-91ab6f10446c@kernel.org>
 <aCtK1-Yn6u8-n8mU@shikoro>
 <e5a3ce2b-4ebe-44c9-9bf5-9f460d5e7fe8@kernel.org>
 <aCtbg0_vD07g394k@shikoro>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="WXFEbYeipUFU1N3a"
Content-Disposition: inline
In-Reply-To: <aCtbg0_vD07g394k@shikoro>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250519_115041_600947_25B3DD52 
X-CRM114-Status: GOOD (  11.88  )
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


--WXFEbYeipUFU1N3a
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 19, 2025 at 06:25:39PM +0200, Wolfram Sang wrote:
>=20
> > I think either we use i2c-X or commit 57138f5b8c92 ("schemas: i2c: Avoid
> > extra characters in i2c nodename pattern") from Herve was not correct
> > and needs to be fixed.
>=20
> I will look if I can fix dt-schema instead. Thanks for the pointer!

Found it! Patch sent.


--WXFEbYeipUFU1N3a
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmgrfXsACgkQFA3kzBSg
KbaZcQ//SdIH9JF6XLo4IUQMXcSxWyKNFCRI6fHKx5mLUOvqKnNbQi0zRPpssStd
dDLZZhMIVhmnb81NdZYAhf51ZcizGpb6JhoE2Ki/Q3czg3mROel0i5M00mOI4ELV
PUfpfTm4k4mZGsxSzaJt1rHvDJnCt4epll0PZ9zHwHmUe8QT7Tf9C5qi0F3BLx3W
XqgqN0Tuy8HmOXLqo4ZEeX8TbiuIbI8BRD0ONGPb7TZMHMpLVS7dhDH4v0ek8/Sk
jn1OYMI7P7ahAMJAtHp4r9JO3lw9nqiUZkYJsGiHVteuSqCRx5xsuMiRfXJr9VVg
KfvUf+vq14MrYQiCy57tNVq+Ma4nioo5cVWf92zmlHaVxWXDxire9jVwU26H1jvt
bfX+JnYAEe4BRck+zOzEW8RzthLEFtt+o+oqz1Eb2PbBDfGYvbYLJTr7OU6n7Snc
+1rdad/nbnFtUXFkmJUGuMghZjkLrMUv4Ok/f4XmZWvySuaBHdYtgZx+Y/AyVEbl
Gti58GL88aL0u+SdsFBk0K0IngEfrmJoJlvzBR5/9pX5miHDK74+jEI54wzHWC44
pldcix6/0kyzVed2HJArMJh39ytDwlsP+kNCEWQqMXddPgJVjQpHCdHUU7pGp8WP
MSkmFPIX/fp5yq9gZd/AJErEZOiJAvCzr/Tk8IKjw7EEoEhuk3I=
=59J0
-----END PGP SIGNATURE-----

--WXFEbYeipUFU1N3a--

