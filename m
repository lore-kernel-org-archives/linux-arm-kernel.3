Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10429C54ED0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 May 2025 08:08:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9ppj9PmljhSnv/Q/2BF+4qkTSC2zjD/oSdOtKPEv79Q=; b=mzZiRwxe+l8oZpiPBBKGFD65Kp
	GkWnkGtxmC3T961ISbGU1O0Gs/ndn0emCc5RJxi9PYrd7vmCPSkExU/FFcbe9huGnmaR0F+gAotY5
	lS8ThisF9PQC/MvSVshYuXdhgpb8ej9m25OubeMjcKy8SnhFml6l1HxdKXyxJvL0BkCaHq/X6HEKZ
	CKmuU67rfk3dJrJEIr4nK25AhsBPMpwJEUaGrM/sXNHeoWMMiddvuO0RnevrG3BDC+k7MNyJpnh+3
	F4t0Rc3o8rqT5K4tUsVDv+rUel52wG1issNGmQDJWpF/2KmF3BgLfBMxc3DD8dk2ag9yvhAgJ1vHH
	Gkx5AlDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uINS1-00000003GSp-2kXp;
	Fri, 23 May 2025 08:08:22 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIMG4-000000039na-30mt
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 23 May 2025 06:51:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=9ppj9PmljhSnv/Q/2BF+4qkTSC2zjD/oSdOtKPEv79Q=; b=pFvkWtp00EBAui02vwAKZqK4Wg
	7wP6GFwvrPw24aasn2453Kh+XlGbnh0XPUztJlZNVrfnyrUULV8rYbygKaI3RnQG9eBHJw/S7xm5Z
	HcPdR4mv1KWZhYp1xxenhInukW8czDMtVndq797LILQdpt9N8w+oEX1FipmduRpnVpcVzkRvrv0nb
	2wNP0v0nV2UqpeUyRPZlAsE8lxVCEbBAfWI8ar/jUUrsLFBkX0yMr8576+7QgJ1YO8MNzJlqs9X/i
	Jqp2MfepdGQ9qzSULSbfxHnhOvtLQi0ae8IyEfHUlE9+io0+QkA4/N2ieRrjRRxUeCvqliKBtrVCG
	obVjSbUg==;
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1uIMFy-00000001BRZ-384g
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 May 2025 06:51:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=9ppj
	9PmljhSnv/Q/2BF+4qkTSC2zjD/oSdOtKPEv79Q=; b=YQF9J7Bq2+hHfpdSPzSt
	dv7IidbOJRrc04gzzLHFWogxoU/pDTIZMReNonGAPgRj6lRAe6ZpjCAn0FKzyOmz
	dMbOm6P1cy04siXWpqErz+dqlehjSpq/EuLzYGPEvjGpznBnCGD1MkcjgJ3nTZXV
	Vj8OEDzFPKfDQnhuAlpYy9HmDZivCOUuLgmJIPc6p3CKNK62azziq8rFm/tqIS4c
	5KFpeE22ogxUc7rlYIWSxzx2aXTDrEf1gVzkyDXrGNWbja27+Mi+J64YzVCKg+LA
	hiMmXcvNelLitgbnvYn8l/DWiucMqbzX1AZ72RcuQ7ghNijo3gCdYY8edEalz9bG
	/w==
Received: (qmail 3936123 invoked from network); 23 May 2025 08:51:33 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 23 May 2025 08:51:33 +0200
X-UD-Smtp-Session: l3s3148p1@e1pVB8g1GuNehhrS
Date: Fri, 23 May 2025 08:51:32 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: long.yunjian@zte.com.cn
Cc: codrin.ciubotariu@microchip.com, andi.shyti@kernel.org,
	nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev, linux-i2c@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	mou.yi@zte.com.cn, xu.lifeng1@zte.com.cn, fang.yumeng@zte.com.cn,
	ouyang.maochun@zte.com.cn
Subject: Re: [PATCH] i2c: at91: Use str_read_write() helper
Message-ID: <aDAa9OqEak_s3lU8@ninjato>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	long.yunjian@zte.com.cn, codrin.ciubotariu@microchip.com,
	andi.shyti@kernel.org, nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com, claudiu.beznea@tuxon.dev,
	linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, mou.yi@zte.com.cn,
	xu.lifeng1@zte.com.cn, fang.yumeng@zte.com.cn,
	ouyang.maochun@zte.com.cn
References: <20250523141647052h8sceSvH_KRJYFgqd6iuJ@zte.com.cn>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Ir00NtPtgiJQh0DG"
Content-Disposition: inline
In-Reply-To: <20250523141647052h8sceSvH_KRJYFgqd6iuJ@zte.com.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250523_075151_089975_10179F5E 
X-CRM114-Status: UNSURE (   8.52  )
X-CRM114-Notice: Please train this message.
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


--Ir00NtPtgiJQh0DG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 23, 2025 at 02:16:47PM +0800, long.yunjian@zte.com.cn wrote:
> From: Yumeng Fang <fang.yumeng@zte.com.cn>
>=20
> Remove hard-coded strings by using the str_read_write() helper.
>=20
> Signed-off-by: Yumeng Fang <fang.yumeng@zte.com.cn>
> Signed-off-by: Yunjian Long <long.yunjian@zte.com.cn>

Thank you, but please fix this for the whole subsystem in a single
patch.


--Ir00NtPtgiJQh0DG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmgwGvAACgkQFA3kzBSg
KbaYkw/+NHM+h+v+Ctyr1yd3xUmRb1Gocb46PIHyk0al5SMQZcyfieWHdqtlKKXj
qCgNCf0hUp6MBrZo9PZQtaNnppUwbifI+bn7WrwwqyAXXouBXHx7LFtrTtFWQxG9
ZC6aPWKtdGHKv3tPyehquybCiu8UMz8VM0sTFQxOWV4fHMdXmeoE2vJe4IHVKZhr
0FG/jAnZHrMIZsiM+JDZP5q0zaDWGpFA0BZl6ckCc5wDq8tjsUQmjDrChTZ2eBUb
R984SIzy3E0m1JSKqCs3EdF7LZYITz8Yd/QgRn6FHdA11CZXvP3cXQxXxTDcTOss
8qoYrryy80beJY7CvlDXTi5Ke0A4ekokPK0HZVxzqby+5rWbnxmzesVFq7Sz6ZEd
nbFvrRBoZhJMuXnZOEkvXYez5eAkHt8kKwZ5UgfW6CjQ86pAT/kp2ntGsLEFL62d
imExiSAiTVOq8tilgJapIOtPySnTBmXg66AKxs8xUkQowsZqyPJrVPDFgCQRQVdj
U91XhRjLmtWJD52FV2ne1pytZcTKV6Bzp1NmFfFmgBLZIYBUaj25S69ybkHVFPNP
0xBxZvtTBs63wqTHu6DRNsGcscz3bQj9wIlON5Tk0PBw7PFEClw54WMnYnp/MUfj
pPwzoTOFdJ0r2Rkg1/UbnMK8syjhBPcplU9yNaJDdlCxeWteQkE=
=oDgL
-----END PGP SIGNATURE-----

--Ir00NtPtgiJQh0DG--

