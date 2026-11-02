Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 222B1606A32E
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 23:47:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=m8N8jAkX;
	dkim=pass (2048-bit key, unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=BIhlPwgR
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=ty+T3XKGmQYOgpyPiETes65zSCPu5bc1Y40kzLsM+Z8=; b=m8N8jAkX/A7R54aa3l4HdMh7tt
	S5SmVZp+dRTPptVLPX4sgIXY85Kkty7w7Zf7Cs9R8vdOtLaZ/nW5ZAEAgc09oabw5/UDSouCdIqPP
	+hQDytvMq6rPXZthAsRLxgZKmpZXFGqn6/Q+T9/7+bfFBGlYM1heJn5uFNwiHuXch248Cg+A7K8+e
	G+Fems2Z1IKNUdJ3mWWiKi5yk/AMdHQTt3IitnNHDwjyVNgGHNMoNQJ8ux3n1Puy9qKlZ3HQ6o5hJ
	Ai9Rd0p3xWkdBf+niPvBfPqnZyVuRWelRZWmciakkdgkkAfI/WorHVpzVK6rX1rQEzq854/FjPiWS
	00fikuIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO1jr-00000000gIw-3g3U;
	Mon, 02 Nov 2026 23:46:55 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO1jo-00000000gIB-1LpD;
	Mon, 02 Nov 2026 23:46:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1793663209;
	bh=ty+T3XKGmQYOgpyPiETes65zSCPu5bc1Y40kzLsM+Z8=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=BIhlPwgRRY3F/IaF1fS8kAt+VANxVHaHGXCPMqX+n7qfMf7cA036ILScaswubJMGw
	 0rwafOK4h1CZP7wtJTSJPgtSX6uFLuj1qLEYg8/Xzy1Nl0G+S6zuWn9yCQj0JjhF8m
	 +VGIbbFtPqPM11kmIPW3PkA4uAcaI11GhgYQmcoIpMljQY4ejPorij3WHxQzIYrKx7
	 GPYOrmMHRULsEAAk7umRTzCt29ZxXbImiQr7yCj/CIvDRTsCUyhOs7MIg4xNmlP+IU
	 FDGepeqcnDgSeypnQu2pN7fq7plyspkIH2GWGhl4YmFBhcIpq1njBmKKl5t979mgM/
	 4oajkQSMs+fhQ==
Received: from [100.64.0.214] (unknown [100.64.0.214])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 2002417E0390;
	Tue, 03 Nov 2026 00:46:48 +0100 (CET)
Message-ID: <425fde43eebc2ef0ae9003eb2d97660136ef5867.camel@collabora.com>
Subject: Re: [PATCH] media: rkisp1: Depend on PM
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Igor Velkov <iav@iav.lv>, Laurent Pinchart
	 <laurent.pinchart@ideasonboard.com>
Cc: Dafna Hirschfeld <dafna@fastmail.com>, Mauro Carvalho Chehab
	 <mchehab@kernel.org>, Hans Verkuil <hverkuil@kernel.org>, Heiko Stuebner
	 <heiko@sntech.de>, linux-media@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Date: Mon, 02 Nov 2026 18:46:46 -0500
In-Reply-To: <20261103005500.rkisp1-pm-reply-1@iav.lv>
References: <20261102-rkisp1-depends-on-pm-v1-1-35a26cb2bbce@iav.lv>
	 <20261102223316.GB3548113@killaraus.ideasonboard.com>
	 <20261103005500.rkisp1-pm-reply-1@iav.lv>
Autocrypt: addr=nicolas.dufresne@collabora.com; prefer-encrypt=mutual;
 keydata=mDMEaCN2ixYJKwYBBAHaRw8BAQdAM0EHepTful3JOIzcPv6ekHOenE1u0vDG1gdHFrChD
 /e0J05pY29sYXMgRHVmcmVzbmUgPG5pY29sYXNAbmR1ZnJlc25lLmNhPoicBBMWCgBEAhsDBQsJCA
 cCAiICBhUKCQgLAgQWAgMBAh4HAheABQkJZfd1FiEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrjo
 CGQEACgkQ2UGUUSlgcvQlQwD/RjpU1SZYcKG6pnfnQ8ivgtTkGDRUJ8gP3fK7+XUjRNIA/iXfhXMN
 abIWxO2oCXKf3TdD7aQ4070KO6zSxIcxgNQFtDFOaWNvbGFzIER1ZnJlc25lIDxuaWNvbGFzLmR1Z
 nJlc25lQGNvbGxhYm9yYS5jb20+iJkEExYKAEECGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4
 AWIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaCyyxgUJCWX3dQAKCRDZQZRRKWBy9ARJAP96pFmLffZ
 smBUpkyVBfFAf+zq6BJt769R0al3kHvUKdgD9G7KAHuioxD2v6SX7idpIazjzx8b8rfzwTWyOQWHC
 AAS0LU5pY29sYXMgRHVmcmVzbmUgPG5pY29sYXMuZHVmcmVzbmVAZ21haWwuY29tPoiZBBMWCgBBF
 iEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrGYCGwMFCQll93UFCwkIBwICIgIGFQoJCAsCBBYCAw
 ECHgcCF4AACgkQ2UGUUSlgcvRObgD/YnQjfi4+L8f4fI7p1pPMTwRTcaRdy6aqkKEmKsCArzQBAK8
 bRLv9QjuqsE6oQZra/RB4widZPvphs78H0P6NmpIJ
Organization: Collabora Canada
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-jcH9UJn3eOaIV2OYZiSi"
User-Agent: Evolution 3.60.2 (3.60.2-2.fc44) 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_154652_543978_7334E607 
X-CRM114-Status: GOOD (  11.63  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


--=-jcH9UJn3eOaIV2OYZiSi
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le mardi 03 novembre 2026 =C3=A0 02:55 +0200, Igor Velkov a =C3=A9crit=C2=
=A0:
> On Mon, Nov 02, 2026, Laurent Pinchart wrote:
> > > ARCH_ROCKCHIP and arm64 ARCH_MXC select PM,
> >=20
> > Why do we need this patch then ?
>=20
> Only COMPILE_TEST builds reach PM=3Dn, and there the driver still binds a=
nd
> probe reads RKISP1_CIF_VI_ID with the clocks off. Nicolas asked to close
> the PM=3Dn case per driver [1]; rkcif already depends on PM. If you'd rat=
her
> leave COMPILE_TEST-only configs alone, I'll drop it.
>=20
> [1] https://lore.kernel.org/r/8aafdbbf04a0d939c6b4d7d5577d97bb58d1c439.ca=
mel@collabora.com


The rkvdec coded was using macros capable of supporting both, so it was log=
ical
to make that functional, though if non of the Rockchip ARCH (32bit and 64bi=
t)
can be built without PM, then indeed we can drop.

Nicolas

--=-jcH9UJn3eOaIV2OYZiSi
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaukg5gAKCRDZQZRRKWBy
9KzzAP0WbgVMiRisPpibeaf/Klw5w9dNDtHpqE1NzL69xToaAAD/XGscCptiBTeA
cRT7n+ehVuzM2UT1sfTakdJgafrP7gQ=
=uzM9
-----END PGP SIGNATURE-----

--=-jcH9UJn3eOaIV2OYZiSi--

