Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5C58FF885A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Apr 2026 20:07:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ev8aX7stxAx9Q7bxIzYbAML6rU3CMkG5o51TUX4ilvg=; b=l/v+zZLq3uuHt/q+zPRgzM14Qd
	ns/MZspRn64JxKWawC0vRguEzlTbnM4bWhVY9S2LSlTgBAdHnPK7u5q4RvXWIKK9KDiP02pj5QAO7
	X6GJD28iA0G7CwXXnmhMKi0G9W8HedBvt6LqocjPTpw7gNac7TfHHxU/ZFSD/hT6S+hvohbCBpC6+
	jJLqO4+7NhfxSIGE1saH8aYFobZei/oGnVIbA9fKPIQlfgRrhuOHLSGsfDWoMANzHQpWA9T8vE6Jr
	M81c01wNYhB7ALXTVGzaHPuh6s7XYyavRiggJjJYhS7rdpXLcwQTq1SQ7SAZrX73DCIQq/kiEn5X6
	BCtCF7Jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHoiF-00000002CD7-1VTl;
	Tue, 28 Apr 2026 20:07:19 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHoiD-00000002CBV-1trC;
	Tue, 28 Apr 2026 20:07:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1777406834;
	bh=Ev8aX7stxAx9Q7bxIzYbAML6rU3CMkG5o51TUX4ilvg=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=RGv6v9kuSEWj255hrs2/XxoBNOIndWTlAqF19bOAkE5QfhY35+T42ka4z+nV73Gz5
	 no0Ua2ivRTaBBrjB76rJJUxWHyqymsoGY8wq2MY/matZeHE9VM/jDXCIJk+X6Grib1
	 2V1ZkR8c1svVqiYRsDIm+RiQc44Pz2ebsnnc2Uk6G90xN8ZIsknQvtm21QV+p7Or5V
	 wGwjAkZt7E1P9gXNaUt3NjbimQSFvvahaO2vqGp79SAZ8NSsXg6dwu0RlMPNtiYFQy
	 9mclmS0+nc45vjs3SpkM/rUqoLTdCIjZEdWun9wZimShBe4KY2DuG6jVeccK7ycn0I
	 5osI5H2MJ718A==
Received: from [100.64.0.214] (unknown [100.64.0.214])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C1B5F17E1513;
	Tue, 28 Apr 2026 22:07:12 +0200 (CEST)
Message-ID: <9be87e9d1f24d67423d2062bd2e31284773fd286.camel@collabora.com>
Subject: Re: [PATCH v6 1/6] docs: uapi: media: Clarify HEVC slice_param
 bit_size, data_byte_offset
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>, Sakari Ailus	
 <sakari.ailus@linux.intel.com>, Laurent Pinchart	
 <laurent.pinchart@ideasonboard.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>,  Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,  Florian Fainelli
 <florian.fainelli@broadcom.com>, Broadcom internal kernel review list	
 <bcm-kernel-feedback-list@broadcom.com>, John Cox
 <john.cox@raspberrypi.com>,  Dom Cobley <dom@raspberrypi.com>, review list
 <kernel-list@raspberrypi.com>, Ezequiel Garcia	
 <ezequiel@vanguardiasur.com.ar>
Cc: John Cox <jc@kynesim.co.uk>, Stefan Wahren <wahrenst@gmx.net>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org
Date: Tue, 28 Apr 2026 16:07:11 -0400
In-Reply-To: <20260304-media-rpi-hevc-dec-v6-1-93868ae6dff8@raspberrypi.com>
References: <20260304-media-rpi-hevc-dec-v6-0-93868ae6dff8@raspberrypi.com>
	 <20260304-media-rpi-hevc-dec-v6-1-93868ae6dff8@raspberrypi.com>
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
	protocol="application/pgp-signature"; boundary="=-7EA+qBz5VcXUAxImbcuP"
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_130717_668765_C622F74A 
X-CRM114-Status: GOOD (  15.06  )
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


--=-7EA+qBz5VcXUAxImbcuP
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mercredi 04 mars 2026 =C3=A0 14:05 +0000, Dave Stevenson a =C3=A9crit=C2=
=A0:
> From: John Cox <john.cox@raspberrypi.com>
>=20
> Clarify exactly what bit_size and data_byte_offset mean when there are
> multiple slices in the bitstream data.
>=20
> Signed-off-by: John Cox <john.cox@raspberrypi.com>
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> ---
> =C2=A0Documentation/userspace-api/media/v4l/ext-ctrls-codec-stateless.rst=
 | 6 ++++--
> =C2=A01 file changed, 4 insertions(+), 2 deletions(-)
>=20
> diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-codec-statel=
ess.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-codec-stateless.r=
st
> index 3b1e05c6eb13..a54e8ea29440 100644
> --- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec-stateless.rst
> +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec-stateless.rst
> @@ -2399,10 +2399,12 @@ This structure contains all loop filter related p=
arameters. See sections
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0 * - __u32
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - ``bit_size``
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - Size (in bits) of the current slice dat=
a.
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - Size in bits of the slice_segment_data =
for the current slice including
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 any emulation prevention byte=
s.
> =C2=A0=C2=A0=C2=A0=C2=A0 * - __u32
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - ``data_byte_offset``
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - Offset (in byte) to the video data in t=
he current slice data.
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - Offset in bytes from the start of the c=
urrent v4l2_buffer to the start
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 of the slice_segment_data for=
 the current slice.
> =C2=A0=C2=A0=C2=A0=C2=A0 * - __u32
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - ``num_entry_point_offsets``
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - Specifies the number of entry poin=
t offset syntax elements in the slice header.

--=-7EA+qBz5VcXUAxImbcuP
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCafETbwAKCRDZQZRRKWBy
9Ap+AQDAwcqqlDsM/bas7xT/tgtXpUgO0TPivPBSGOOaKMBRrQEAzzS8JahEFtdO
ikRTjkOUHBpaoCFYVemwuzPvOAAutgc=
=Yyrz
-----END PGP SIGNATURE-----

--=-7EA+qBz5VcXUAxImbcuP--

