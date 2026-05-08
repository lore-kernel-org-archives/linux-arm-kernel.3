Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E72CACD3436
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 May 2026 14:51:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V/MorCIJowgGq0kdfl5dKhCBp2QF4Bdp3UjUYaZe3uY=; b=nuwqX7JiW99kmBAdaQ+D5WyVzx
	8om2m+BJhhGDo3aS7wcdcU6ZPmdE9HFzLAqR7Miu6buwx+CUUH45bTf0x82la24z1D/HMc3Ap/n9M
	cK87OPgyVaMq9S8yurZqf4+qZ4maESujrp+1Xq0p20EnQGkWQUacOWVY9HWEHU0GQC7qlTF132Kfv
	Aiinq1sd5ZcsHL60LJKRch2JcJRy3pEIR7XniTQtMSrhDdKpoY3x2ekZwUmomb8hRoZKUnNq3ozW+
	oJoVaLYoSkq8fD7N6o8t1gj0bR+eqTBDfiXuBkkTTyuoIndoHgzJNRM/ovXCDUO9cIWy3M0QFdVGs
	JFJKuo2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLMXa-00000006ij9-03nq;
	Fri, 08 May 2026 14:50:58 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLMXX-00000006iiu-3xv2
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 May 2026 14:50:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2A4E860052;
	Fri,  8 May 2026 14:50:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67AD3C2BCB0;
	Fri,  8 May 2026 14:50:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778251854;
	bh=V/MorCIJowgGq0kdfl5dKhCBp2QF4Bdp3UjUYaZe3uY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=msPO46FUpVbvsrtjvkWka4NOagz5lQTdyqrJ7etMn2isie18YNrfpUJihMmxeAjWt
	 uuw161Sawj0+Sc/t9PduioxD/009T6Z7ot/iRf3rlQ/xK1SUt05Ys+bcydhmoidNs7
	 sOyFN54qJLzxPWx3q9UtFSG752W7NlaRk+4rxVN8Vq147NvedYN3SMECnFQ1WWQYIT
	 mNt1imDlM5d6HEzPeBf2JcXR+Wv0y7rbg02vjR6UpHCYPJEVkt6j5njJ4+DkDcO1LO
	 EHPvlfSlRmgm7R/Z4u0Q6iaHSW1YKsbwZjMjRrIjWHsbpwntmvcd0GfZLvMSG/cJTb
	 3vY7e9c7mNPAA==
Date: Fri, 8 May 2026 15:50:50 +0100
From: Conor Dooley <conor@kernel.org>
To: nicolas.ferre@microchip.com
Cc: theo.lebrun@bootlin.com, conor.dooley@microchip.com,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>, netdev@vger.kernel.org,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MAINTAINERS: change maintainers for macb Ethernet driver
Message-ID: <20260508-destiny-rebuild-696b3cc5351e@spud>
References: <20260507120444.9733-1-nicolas.ferre@microchip.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="YuRWKIYUnF3dShEU"
Content-Disposition: inline
In-Reply-To: <20260507120444.9733-1-nicolas.ferre@microchip.com>
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


--YuRWKIYUnF3dShEU
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 07, 2026 at 02:04:44PM +0200, nicolas.ferre@microchip.com wrote:
> From: Nicolas Ferre <nicolas.ferre@microchip.com>
>=20
> I would like to hand over the macb maintenance to Th=E9o, as I'm unable to
> keep up with the recent flow of patches for this driver. After speaking
> with Claudiu, he indicated that he is in the same position as me.
> To help with this work, Conor has agreed to act as a reviewer.

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--YuRWKIYUnF3dShEU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaf34OAAKCRB4tDGHoIJi
0t5MAQCuHQM95qauXKbkc5Lh0Wl6BX2vRWdNx4y0VYRFbMYA0AEA11GH9Tu6qf9y
Gx40wZdDmOZCExgih0FSom6VfGxGKAE=
=krFu
-----END PGP SIGNATURE-----

--YuRWKIYUnF3dShEU--

