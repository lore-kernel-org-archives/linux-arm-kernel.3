Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5823FCFD313
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Nov 2025 01:09:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=X27VJWRTlzjJuNH75gkWtR56bcx7Pze/Hk4wCFeBx4g=; b=MgE+NI6OUBucek15/ZMhYx4R7v
	rMJIRoyTF71JVt4fT44kTIRyeq+XGzqY2zEWSEJ7LLngRvYPc0HHxD3XXG+HHuQUNr2+WZO1KUWYe
	KI7d6LgY+cQNOft3BdnT8Py00jGCYfs4b182Dl6oU0tVLB6sMKZA7HLO1++3aLv3x1q/MvuqyyUvV
	oJ2mYlJ9fe/icCHgOQqX2KXhN80oLli4B78SU50rMHVWs4AriO+mTIKdaZT7fecbEyuhbOhAZoy3r
	T9dcwvsbdQ7LFo+pPAjI56An6oEUqFck4h1TVgU1pnT2tSICJ7QWvGq1wtOLHkV97/OjJVwnVJfdL
	6c+p3MTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNL53-0000000AtwX-47o9;
	Mon, 24 Nov 2025 01:09:25 +0000
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNL51-0000000Atvg-2f6n
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Nov 2025 01:09:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1763946555;
	bh=X27VJWRTlzjJuNH75gkWtR56bcx7Pze/Hk4wCFeBx4g=;
	h=Date:From:To:Cc:Subject:From;
	b=NeUqav8uVoO42LHbeU8p68axncapjzR+x4gV4Nvf18Rck409cWBBBxyASofBBP7Oj
	 BPjfr1/99gZ8MDS/3zk6Zz4iJSIz3ZhtFhRvfiOgCP+4o7OpFfmWSvMxj07UqKDFZg
	 iTrCkvkPxQYLp4sPme4ZXVI7Dgphz1Cuqsd9yHaB4xJmHamoWWgn92PdDjn+C/BBoi
	 d5GRORRoKB2ZCTGlc8zs39iRfcRS/ULsHiM1vq3Q0mYm3zYz5WD1xh3qpq34afCghJ
	 CTGuDW1CtCPlPVQ7QdqJcLr83PslPe+dzoZT2ho+Zp2zxE4U69WRyrbI+6MADHgCa7
	 QTTn5/PInbwyA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4dF7556X9Mz4w9q;
	Mon, 24 Nov 2025 12:09:13 +1100 (AEDT)
Date: Mon, 24 Nov 2025 12:09:13 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Krzysztof Kozlowski <krzk@kernel.org>, Arnd Bergmann <arnd@arndb.de>
Cc: ARM <linux-arm-kernel@lists.infradead.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patch in the samsung-krzk tree
Message-ID: <20251124120913.76374412@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/JUItA5i/RiOmGkuZJ/EMqd4";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251123_170923_873604_472D2AF4 
X-CRM114-Status: UNSURE (   9.57  )
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

--Sig_/JUItA5i/RiOmGkuZJ/EMqd4
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commit is also in the arm-soc tree as a different commit
(but the same patch):

  2e646b21df4c ("arm64: defconfig: enable Exynos ACPM clocks")

This is commit

  38c8787f1b81 ("arm64: defconfig: enable Exynos ACPM clocks")

in the arm-soc tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/JUItA5i/RiOmGkuZJ/EMqd4
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmkjsDkACgkQAVBC80lX
0Gy+nAf/fH7iMQKD/WP6wbSdS32Huu6UgZPyKoW3G24Hwi76qy3/KW8TNgKAG4lY
Qf4XBu66VTRCIxLKEzCYG3VRI6Ki2L1Ex7NROxyxcKtfleoxSjKrl9kQPs0ZLrwN
SRJqjDF9KNs7jZHNssQBw7aoJ0Bdv53xMRvKU4PZNqyPlW4x/4ORcQ0g4Ag+Llto
fEd5ChBVqdgWJujGG2g/32kbvqY0ExH/aD4KfuH2O+PASOnWUUNioUMW+0MkKti3
4+iRhdjokZJXurOz1lIIImGC5YhBViPB7SadhT89sDEi8KABHo8KiCLwpnK37BGT
ckRDefEyghge5vrm+E5THAZrakP2kA==
=Oshb
-----END PGP SIGNATURE-----

--Sig_/JUItA5i/RiOmGkuZJ/EMqd4--

