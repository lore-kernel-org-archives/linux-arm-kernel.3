Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64E24C02180
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jan 2025 01:02:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=WtseQk43hPu/y1TdKZa4CykZZ0+3CnLbf+gdN5rIcio=; b=HsKF9M+nwtIWEoQ6TvPNdL5ikN
	BA2yXAhvb8HFfx1JYqjZDt3KkBZHVoVbOcCYUgklls2tiXCmeQWaYlVzAmygx+rQzNjpyBy8MVA7k
	HOfcw2z9YtVes/bjYLwNv9glQXKm8+LIoOcXb8/BCXqu/TzAVgOL0T4lgVauhow54iFvFxDFQN6Oz
	Uf7wHXd5vlPo3if1Z3ShvalZHNw1whafCF4ONhciaZB8ZHkaa4kSAzHt8mNGkDkTuHv57m/+bWucE
	XFJPp3hhrRb/93REN39Fz00hlYZipVnawdSR3t+TLmEg3KHSeToG+5idFCr4/xoRPlrYC9m5tB1Xb
	RAfJ/IdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYEHC-0000000DV6R-3wmV;
	Thu, 16 Jan 2025 01:02:26 +0000
Received: from gandalf.ozlabs.org ([150.107.74.76] helo=mail.ozlabs.org)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYEFw-0000000DUwr-0JxX
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jan 2025 01:01:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1736989256;
	bh=WtseQk43hPu/y1TdKZa4CykZZ0+3CnLbf+gdN5rIcio=;
	h=Date:From:To:Cc:Subject:From;
	b=uZOZGyQsy/TxdOC4xD1p8CY0x1jezF5WncK6aWLezjDdZQdvnVn05uyLP4o1jiwnZ
	 haFPGtby2Gw/g69tqcqGGLVEbInfZJRKRCtSuIvp8T8i8VBc/dirD1C3iYYc+ugdKg
	 FiOeANv2fucIAwZmDEIWhx533oqz6GEznEcsj4HOokZgCBex9BS0r5zDcZ0esZqHh0
	 bvT7134aTQyDF/ho4DT6ff91xIAvCH6WiEnkwHZZqInJUVHQv4unDjAs2ropLaYwD2
	 Sk3Svpw2RG+wCE6LRjMiC/LBxxsURAKhYVaNdBpJNHCoVzpFvKRXAK7rUqtZs8LzcG
	 G8EUOWg4INolA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4YYPgW6XkLz4xRj;
	Thu, 16 Jan 2025 12:00:55 +1100 (AEDT)
Date: Thu, 16 Jan 2025 12:01:02 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Krzysztof Kozlowski <krzk@kernel.org>, Arnd Bergmann <arnd@arndb.de>
Cc: ARM <linux-arm-kernel@lists.infradead.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patches in the samsung-krzk tree
Message-ID: <20250116120102.6c848c63@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/UIedGggCiofjb4Ab2l/UtLY";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_170108_474683_2358314E 
X-CRM114-Status: UNSURE (   8.74  )
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

--Sig_/UIedGggCiofjb4Ab2l/UtLY
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commits are also in the arm-soc tree as different commits
(but the same patches):

  33ebc0fb73ba ("dt-bindings: soc: samsung: exynos-pmu: Add exynos990-pmu c=
ompatible")
  2dbf3f19da58 ("arm64: defconfig: enable Maxim TCPCI driver")

These are commits

  f16d91d8febf ("dt-bindings: soc: samsung: exynos-pmu: Add exynos990-pmu c=
ompatible")
  d2ca319822e0 ("arm64: defconfig: enable Maxim TCPCI driver")

in the arm-soc tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/UIedGggCiofjb4Ab2l/UtLY
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmeIWk4ACgkQAVBC80lX
0Gws3wf+Oj+gdN2myGizUDwvWyQp2sn7eteF+icSC4QHZyTFduUKaj/OhHS6uLfZ
Z5L++/s4ny6iMN6kf/OYu3i5ullTNSa7/N8CK3/u4H1wUXMKJ6yQQUe9oc8uPt8w
EyZ/e6PM+3Od5A5JcYb3v9vMkGuiQKM3uSb0X6cbAunCRSBuGKwuDWXafvwGwqw6
jAL+L3hGobqAuAC6HP+Ekh+X3ILWjf9OC8JWcPDHhncXCqa37W5c4WOPJEPFCtaF
CqESE0Tg9SRG4Xy42jzNHWpdyWaeNomyOZnao3MZB8olj0W8hKEE0zKFoJ4z0DMO
WgkQpIbWuudXiRj6gNwCvnivMwg73A==
=6fl4
-----END PGP SIGNATURE-----

--Sig_/UIedGggCiofjb4Ab2l/UtLY--

