Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93C1FC0219B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Feb 2025 22:34:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=C+iJYXXOupleKOv5WMOquMy6igxqSaoLDoO3zL9tcXw=; b=cAaplWPaR9Hj9ioDmcidCqZBsz
	wlXPG2B5q8nsBfJYTAD8TTRYg41kpZImGAjHFSOubcdhGV6u/ijzkB23azf0nT1MgrYvk+3laPX6I
	Tj0R/h5bGIFeVJQOh4otTi46BMFTTIVK9r5XtleuX4OyNf68Rxkv5CwrYFTmgZ0qPoPFHYUUYTggW
	VT3xzHwYSoakbxVHnXGQeasb9NYm0CvCIPipQFpAOEh0SytQwj5j95yb0MBvgq3WzNLViQ6muFTij
	Rvrf6rCwOo9HeFdmgvnktuDFZt2ohGk+pNgaVvKutrmaanG50KmB7I/ujPjZdxGMMPQVv+Gdk/TMX
	5Z42PnXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thypV-00000005U3e-3Pp9;
	Tue, 11 Feb 2025 22:34:09 +0000
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thyo5-00000005Tr0-0ZMc
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Feb 2025 22:32:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1739313153;
	bh=C+iJYXXOupleKOv5WMOquMy6igxqSaoLDoO3zL9tcXw=;
	h=Date:From:To:Cc:Subject:From;
	b=EIqdOZfWLzWhxqs88T2pjJx5dIXl1U8Ev/Ej44HXVwjpi3f8aAif5R4h0ddUDbpRb
	 TFgkL5Ur/yy2eKMYHZyUA3g+eAtkuBPUrCTXWbZy/vBUKmwR258j4x2ka5ndGaEbDh
	 xoUvDdzwtXUxwtNF49h7E+xah4LH5tNFAKE90iqmAOHYTT/CQ58R2jrCxjqhijklQv
	 DetPFU7yt1RznT4J4gBJhduiza+FOJs+x1a1vaon1VZtfJBvXx7T02TvXcRlEQa2qQ
	 wD5c4H1t9x09vdspDMISRS3fACtx84tytDKPmatpE18I1o0mPDGn1mlywEvecwNw+O
	 7/S7ZRxPDre5w==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Ysx5r5zlvz4w2K;
	Wed, 12 Feb 2025 09:32:32 +1100 (AEDT)
Date: Wed, 12 Feb 2025 09:31:47 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Arnd Bergmann <arnd@arndb.de>, ARM
 <linux-arm-kernel@lists.infradead.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: failure fetching the arm-soc-fixes tree
Message-ID: <20250212093147.02ddbf2e@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/7bAHXIpg/Vq18Kp++s6zoCL";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_143241_531370_E117B44E 
X-CRM114-Status: UNSURE (   7.59  )
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

--Sig_/7bAHXIpg/Vq18Kp++s6zoCL
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Fetching the arm-soc-fixes tree
(git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git#arm/fixes)
fails like this:

fatal: couldn't find remote ref refs/heads/arm/fixes

--=20
Cheers,
Stephen Rothwell

--Sig_/7bAHXIpg/Vq18Kp++s6zoCL
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmerz9MACgkQAVBC80lX
0Gyaawf/c3wic5cNc71Tpj5XCgk0xoXuFmJLJtRz5TcrRGe1ZRIQERkItly1fddY
/qN0DEZ2lvCB20cte59VC4meGdr1FWChjUK99UjN11/kZl+GrjLx1pVN8OBkhpFc
91u8VzTBPTv7dfNAvXplT2fihm+zT0zwsKLZ4LVJ7NOyP0hVf9qwNQlJ9+ZXNRaC
W/sfx2Q3KkMtRNRZZf3C4E0Y3z/m619ZKiKLLaMuYmfv8vtrGDnQGSGzSQbXh+zx
wYKXcVOwgzGqXkowmEzEpl/rFHVrPnPvZWidgx9Xt2rFkhxLfrIwEyJPeUBjROK6
pVoHNlZoI5m+WiSgQ8XcuI9yHQ9xdQ==
=8o5S
-----END PGP SIGNATURE-----

--Sig_/7bAHXIpg/Vq18Kp++s6zoCL--

