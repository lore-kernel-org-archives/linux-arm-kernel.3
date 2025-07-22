Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C57AC83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Jul 2025 23:53:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=rFLT+SZL2lnoHRgvDZSzdIXwzoOFqOZM/J0nc7Kd06A=; b=nbKrl/MfMMiG5C5EQcrd8b1TZw
	5OmNSCV6EtiXmb96FAFtKmOBlAANccRB3S5p4R+FOaWfBSQBn1Hu3jMRRQQ/McReU7OQcqWa34vsI
	GZhZABXf0jR5ywrWVDNRSGOiap2rkBt4OxQb6el2CuwjDFtjiGCI3vpQokDz1GSNotIHAe/GZeEkK
	d9ElwO5YtFlOtTcx/VdTZ6dDpHIjwm+jEMaoUsIpbI3RH3zeergXeZNFzG2NQ7ah9YEEJI/4rTC3Z
	P8+ITfmtYy3i9MOcQiog5bnlu3GEW0W5yrQKicSe+vOXU8qgbkLpvMPU0dPKobpnWZLg70XlAF3Tu
	SflTB5yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueMnr-00000003hFc-083O;
	Tue, 22 Jul 2025 23:53:47 +0000
Received: from gandalf.ozlabs.org ([150.107.74.76] helo=mail.ozlabs.org)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueMlM-00000003h1u-2Z6L
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Jul 2025 23:51:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1753228107;
	bh=rFLT+SZL2lnoHRgvDZSzdIXwzoOFqOZM/J0nc7Kd06A=;
	h=Date:From:To:Cc:Subject:From;
	b=cX1LCA9EWTvEukeVI/CIUA9T61cB3vvBhyN3D6GZTaGITpTC5jZQiMP+M0XDJv8sr
	 cIsCZSb8yrkwn+4wVz+dJvjKk45DpqI7RfFu6KfdRHCvdubGRnXTiXus4nBm0sPwb8
	 9MbYjz3mPcSBkcwK5LtFHmJ2EMFzYboSn/WsJ98ZmIhU4TA+ReKZX1doYIdXkn06KF
	 jNby971zU+HN88zoyKmlF1ktxHLUSrneWJVvPApjclJP7Pxx59qbOURLzNFXBG8vHE
	 zIeXwS9xtJtsddyrAQi7UjlYMsZNzD2xLiNMqPjMvX782mPGVdfdRl04N73p80g2na
	 Cv131KXY58RpQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bmv971KSRz4wbY;
	Wed, 23 Jul 2025 09:48:27 +1000 (AEST)
Date: Wed, 23 Jul 2025 09:51:10 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Kevin Hilman <khilman@baylibre.com>, Arnd Bergmann <arnd@arndb.de>
Cc: ARM <linux-arm-kernel@lists.infradead.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patches in the omap tree
Message-ID: <20250723095110.2038c205@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/9Jjba41b6jUujwXjIUhf+dV";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250722_165112_796020_AB23D25D 
X-CRM114-Status: UNSURE (   8.53  )
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

--Sig_/9Jjba41b6jUujwXjIUhf+dV
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commits are also in the arm-soc tree as different commits
(but the same patches):

  0711a8dcea2a ("bus: del unnecessary init var")
  536407b5b87d ("arm: multi_v7_defconfig: Enable TPS65219 regulator")
  299c277aa74c ("arm: omap2plus_defconfig: Enable TPS65219 regulator")

These are commits

  8adc8e1657e1 ("bus: del unnecessary init var")
  acbf491e07ad ("arm: multi_v7_defconfig: Enable TPS65219 regulator")
  d50faff72218 ("arm: omap2plus_defconfig: Enable TPS65219 regulator")

in the arm-soc tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/9Jjba41b6jUujwXjIUhf+dV
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmiAI+4ACgkQAVBC80lX
0GxvPQf/a/LXGMlP3GXcKR+2jPIo52PRVCiO3jTFD2NbPtZWPW0ITEw89cPDxvlw
u5lj8RvNnr8ZnBr4onOCR2GCmCIyzKpP6E0eKnc8HElUXpBnj2/iEryc1v947Wq7
s7SgLQWSfHQJl4UEd/Cb2SY4mSyxHNWjl9+ITMsYqQSMbgtq2inWhrJgMahwyulL
/e5GmweKtHzoDRHLD4S+QxLI29byL12U7toysLGQumhpX3ESMPkHd55IZhOu2qtq
nJJZ0hPshcLqN2Lzlr58QC5oLwyEXdI3AbUHeIAUhKKKwtvlY6VxhaG1e8MFFx4E
qDm+WMYh0Rm8Vntfv7PI3b5LDZ72pw==
=Gpci
-----END PGP SIGNATURE-----

--Sig_/9Jjba41b6jUujwXjIUhf+dV--

