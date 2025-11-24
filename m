Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09A70CFD313
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Nov 2025 03:42:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=NDGS1yCpLaNN7o590n+Lz0xRZ3tB9cTX2CI1dXohAw0=; b=p9dhwnC/R3TQnhXv4ouPqpTM3v
	vY48/dWq++43i70T/0F8GYppHpCW7OlZsMXx5BxCEUKXsentaGUe2l0jykl++nRFF3HJPeyC5puBC
	s7qjl0YJrF91USLvq65vYIMFfz90A0VKMSKpfWy+gNi/soTu1ieZFld5Q7BxMllMpRzBdvez7MXoJ
	aLmGqKx79pAsQJflh091yg5RZP72mtFPJMSaGdyFyxsbVzCnu+akToZwFqD8kNiFPGRgHXVxxdF7p
	uUtNLECBdKLXI+6ETK9n2KFCOqIWxAeMCaDC4ZQ2yACWUJ8OlD2ADDPBrJrVE7j2ZtCGuajTfSRoj
	nJ0PjibA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNNTB-0000000B2b5-0xHk;
	Mon, 24 Nov 2025 03:42:29 +0000
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNNT7-0000000B2ad-3k2F
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Nov 2025 03:42:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1763955733;
	bh=NDGS1yCpLaNN7o590n+Lz0xRZ3tB9cTX2CI1dXohAw0=;
	h=Date:From:To:Cc:Subject:From;
	b=T9yaaZVQFjRxEjnRbWBJ8Ydb0LAYMiMp/c/tWbaijAk7yL++Ta2QrrC21ioZEeV4x
	 sgUYdiImjIJaba1oWpmmEUJU46T+kvyxkkR8zFT9p4ZADyUST2NaB4eCcdLYZuweNe
	 pW3yGk9ZNhtxZS+u5DR4XcT0nHt8hdf075JJehoo34tzukGFyXu0WdogjmTHH7fKms
	 GWyYX3okZwJxUil9g88lFNH4NE2qyaZ4PGXSkncOEhQtmu0nsmh1P84hAjD0mHh62m
	 zbMoo6XIAsdOGBAx060mIeyHBetBmhMeCfRnxYBwvehJSe7tbuoSC6hodu2o7ZGymi
	 ApZbwIeejw9aA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4dFBTb6mZFz4w8x;
	Mon, 24 Nov 2025 14:42:11 +1100 (AEDT)
Date: Mon, 24 Nov 2025 14:42:11 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Chanwoo Choi <cw00.choi@samsung.com>, Arnd Bergmann <arnd@arndb.de>
Cc: ARM <linux-arm-kernel@lists.infradead.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patch in the devfreq tree
Message-ID: <20251124144211.56c661f4@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/jD8Vala98244er0.8QCa0Bg";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251123_194226_098938_8B68FAE4 
X-CRM114-Status: UNSURE (   9.91  )
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

--Sig_/jD8Vala98244er0.8QCa0Bg
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commit is also in the arm-soc tree as a different commit
(but the same patch):

  a5aca75b173e ("dt-bindings: devfreq: tegra30-actmon: Add Tegra124 fallbac=
k for Tegra210")

This is commit

  22c788aec2ef ("dt-bindings: devfreq: tegra30-actmon: Add Tegra124 fallbac=
k for Tegra210")

in the arm-soc tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/jD8Vala98244er0.8QCa0Bg
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmkj1BMACgkQAVBC80lX
0Gw39gf+LdiAS9JFDQN7UNqwQyia1ZGKSvL6odimqxrj0z2FAxOE+wLEOZhR09SK
CE3TupasmdWIr2Wiy79EBjrgJojb0co+4XpvJfsREN89EJgPeJ1Ws9fI9ZWDSgHd
o/+LMPKCVwNlib0mTm93dYJYmmA4BTxEDNhzS7PBE6IvjkNPRW341mDKEFgZi1Sq
biONopyqzeglvPymOu3UYKW2yfOlz7oDQVBxFYXIPRrgEwtPulg4KUK7bLWygDZq
rhYYrUd0g9UngzUWwRQsVRDXYVT9BwzxCgYJanN0nKK8hC6Nuu3hN6GIGH8YXqzB
8C3YBSYkFQEy+WAzGqHXR6giQSwa8Q==
=ffP2
-----END PGP SIGNATURE-----

--Sig_/jD8Vala98244er0.8QCa0Bg--

