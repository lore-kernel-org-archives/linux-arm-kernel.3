Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20F1EC282D1
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Mar 2025 01:39:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=rxfohd/24q2m0TM0jOBNK8SiI0OJ/yR4konJCniJ330=; b=UijN5y38flI5JPiQJIpDXLZhjJ
	TlEdmHuvQRP9CAUBw90OYNJi0DoSY07azsvIrGNR+/CO6UhYzRQXXB5ZVkgDmcpgwcz7oPnPAapSz
	iBBXFXpXO/kqpqRPx03wZD9Gl+OusFY6Ra1QulfcQrSZvH+W08TSie5G0qChpDKUmeGVYuBRDRYv3
	KP6FtzzjUtzDKNBEOXIiemtUcekJfHjhuTjGjoxsYrfrE1T/oQeVS86hzGkR7M2K31A3hhf8loGad
	Wsz4ygyBMpMbBHc9GnADJe2JTlMA4hiFPdgiXfBdrTSgn+Cg2DL5bVZQp2LpNje9YSXuJJ5gts8Uy
	xm+urvkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqMfx-0000000CoyL-2iwM;
	Fri, 07 Mar 2025 01:38:57 +0000
Received: from gandalf.ozlabs.org ([150.107.74.76] helo=mail.ozlabs.org)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqMJ1-0000000Cm11-3BtN
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Mar 2025 01:15:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1741310113;
	bh=rxfohd/24q2m0TM0jOBNK8SiI0OJ/yR4konJCniJ330=;
	h=Date:From:To:Cc:Subject:From;
	b=okvB4MVOYZajPcs9G5Oln3/zTkauHrYQkfqRSTZ3/phgJHEEPbKJ0sE0V/9KKylJD
	 TLxxHqZp/S70nrn+ehB2HLUhXsz2HawWOaAtbIfi1nzXYNECMOXXDbpcYQPLvSjcos
	 I26qOBQUguQWyt1T1iloJpisACpXksHbq1VrTsP4+U+CaTqFSyVckOtVfamw/aCDJV
	 d9N2LCvp7J1QKoaLft/cVhHgJnN0KCwCAewiYCMQoj3eAPoM6sGXW1H3cYam6/oEAM
	 jz1LWq59IWyKNCFhMMsWFiTa2yca2DXbBjXjkglyiHAcx+lEbXwlq/OAzFnPkX3lKU
	 e1DpGevmz/S9A==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Z87cx0v3Hz4whq;
	Fri,  7 Mar 2025 12:15:12 +1100 (AEDT)
Date: Fri, 7 Mar 2025 12:15:12 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Colin Cross <ccross@android.com>, Thierry Reding <treding@nvidia.com>,
 Arnd Bergmann <arnd@arndb.de>
Cc: ARM <linux-arm-kernel@lists.infradead.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patch in the tegra tree
Message-ID: <20250307121512.5735349a@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/DjRuCVHZy0gCdu/6S+BRLEK";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_171515_945477_533A1334 
X-CRM114-Status: UNSURE (   9.01  )
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

--Sig_/DjRuCVHZy0gCdu/6S+BRLEK
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commit is also in the arm-soc tree as a different commit
(but the same patch):

  90a1dc90d08b ("arm64: tegra: Remove unused and undocumented "regulator-ra=
mp-delay-scale" property")

This is commit

  828678a1f638 ("arm64: dts: nvidia: Remove unused and undocumented "regula=
tor-ramp-delay-scale" property")

in the arm-soc tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/DjRuCVHZy0gCdu/6S+BRLEK
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmfKSKAACgkQAVBC80lX
0GxRMQf9Fv+jSV2kmmBDisN0YxBC0vJ8s/ufyPNnFsaJcZsq2qKxPhlWH5tveuco
AtG1SF6b18LESJgKY3Gg5L1hv0Ghx6rFSMHxPunTee7wkRBXsJquFt/SWQM9Kwm5
9dZOs+TVd6poHbwyB6Rf1DKx0bh0iMEvDOqXvHNzyZnepyfIWE2S2gSUPnJzNwg0
gibqrKqdcSNQCi2tNDloBA8Bw8NEp4oCABJQwTx9pysqkeIM1cAumy2fNz9JTAUt
X5gpxdvFPCn6B8x5//IKcZNEgC3PPnqe55RWBnTgFuW/WY+78RcTiRN8Q43l4cEx
8m6BP33llGIiSeXaZVKUsr5vHfmFXA==
=tXMm
-----END PGP SIGNATURE-----

--Sig_/DjRuCVHZy0gCdu/6S+BRLEK--

