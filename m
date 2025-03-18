Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D72A3C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Mar 2025 00:56:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=d7Jy5p5z9GCVX/nrV24oFxCR4XhMykM8P4W1MmsWpTU=; b=V23FNBNfO0aRbmGiPjn+D8EAz0
	YDMQWHsgAGUXahGhyveyO80P2CcGZA5Hd5/SULoLDYg7oMyt/XNLAwt0/WB1TiLWZo1ZXvQmbODDZ
	NXpa8hVRjvoCtVx+PwdDX2FZC5E8+6bo69nyFWwhrMoSqhqzWvKsuhArQaHzDHKVoMi55FNo0Hh0N
	MSpIWoozFrKUs/1vtL4GY4QgR4/ox1d1+l9qJjnQy7Ec8mKNxK1zAf6o87Zy1tEdrDpgqD7tO+nGh
	MEUePmquKRR0DkJ5rE/xLA5eOOrBBES7xd0Qpi4wlbhOo4ljZZuV+X5jEb87TXnAnUvL4SDp3IJLw
	W4mHJsZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuLFb-00000004IR4-3S2T;
	Tue, 18 Mar 2025 00:56:11 +0000
Received: from gandalf.ozlabs.org ([150.107.74.76] helo=mail.ozlabs.org)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuLDu-00000004ID3-3S4t
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Mar 2025 00:54:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1742259262;
	bh=d7Jy5p5z9GCVX/nrV24oFxCR4XhMykM8P4W1MmsWpTU=;
	h=Date:From:To:Cc:Subject:From;
	b=g0B+aYh3jXchfS54W+zspenJeIj/v5uKghtsC+nMWSn3pXevY2ZLOXLhMu7ltkNDr
	 t5SYrhbn8B5JSedhmY8LDuXDNok5LBCIpgfZEE18VLlP+1alfR5f564Q/h8dgnnFae
	 EQwgOzsLhin0aPymrFhZxHngUcPZc+APEPRw6i5utthCHHXihQ6sxRf0s228sAdmL+
	 S8VmPNcZaFHldLhw8NDJ+nLcJ5arFzZahWgWxbTWUPlfBttXDrWWhqsi2KICSRxHBM
	 Scgnb6DSd9iUPMIwRQKAiieRV14Kam8yFJPi8c7O7ncMZbIGLPjFqL28eO4n1D6yNU
	 rD5aARgXXvAkQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZGtdm6cLLz4wnp;
	Tue, 18 Mar 2025 11:54:20 +1100 (AEDT)
Date: Tue, 18 Mar 2025 11:54:19 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Kevin Hilman <khilman@baylibre.com>, Arnd Bergmann <arnd@arndb.de>
Cc: ARM <linux-arm-kernel@lists.infradead.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patch in the omap tree
Message-ID: <20250318115419.53442fce@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/GyS5PWTOv7lEnLYQwhaSAt=";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_175427_129617_17C47306 
X-CRM114-Status: UNSURE (   8.90  )
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

--Sig_/GyS5PWTOv7lEnLYQwhaSAt=
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commit is also in the arm-soc-fixes tree as a different
commit (but the same patch):

  c2a5f8c4f28f ("ARM: OMAP1: select CONFIG_GENERIC_IRQ_CHIP")

This is commit

  98f3ab18a0a5 ("ARM: OMAP1: select CONFIG_GENERIC_IRQ_CHIP")

in the arm-soc fixes tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/GyS5PWTOv7lEnLYQwhaSAt=
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmfYxDsACgkQAVBC80lX
0GxZ7gf9EVa5YyMhA2eFkrV70jnl1DUE8w33WPAh3HTioLvopneQvWltgf4W6VOb
q4CvSmEadc+occOdQZMTDyTE467Sb///oHda6HyOP0nG2eQp5pFbEE9AkuiCgldk
ZQzf2NrIsdHgGcZ2GwoM2ZalPEVOFUrUolLDHXdNvBLhh+Kdtcr2AjMCfVeVmP38
EAx8e5COjtniKXP/70tOUUBdNf/NgafGd9kyRTc1cMtsTqQ9Jd4nvHCELiTRKEzn
AInoY9zpAXUv8gpLnCJxdYvTtTcqbXZKjQs1RcFrxN/gQnqxhyUemEE47fq2MLIA
Oi9F/GhDeOFag4a09qjkW/jkFKOEJA==
=fgij
-----END PGP SIGNATURE-----

--Sig_/GyS5PWTOv7lEnLYQwhaSAt=--

