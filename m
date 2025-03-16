Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 726CFC28B2F
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 16 Mar 2025 23:29:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=tlZ6DSNgDKIfcL+uxKhjn0E0cjYFmBYfcKaYiLOkozM=; b=IbPIFKDJyvQvR3qOaOnwIUPsJH
	3bE3CvBVeWSTAMsHjC1wBhVUIHIo2R651olcWb7UKYQLDBUhh5ccmcglaAHST56vJOYCRA5jScYRT
	IzyYPYJ8k2Wj1h6GGG6DG3n67seHYCinLVle/UYF+dQVDVERN2vSqh9EPn6pWGVviT5xLSYWQjj8j
	4YGD5rVM2OHFwW2RBrhG4UR50oSyps9ebcu5+d5aRYnqMH1hr0E1Z8vSIo2yzEdeT+6Jw/h4jgEWJ
	YDksQTDObJfSVpB9+xabik+9GyQarXapksVabSw7UEtexGPWSIM/oicCxEQTZ8LywB/DS4TX74zZS
	GLfTyizQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ttxPX-00000000ixO-3rnJ;
	Sun, 16 Mar 2025 23:28:51 +0000
Received: from gandalf.ozlabs.org ([150.107.74.76] helo=mail.ozlabs.org)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ttxNn-00000000imh-2Isy
	for linux-arm-kernel@lists.infradead.org;
	Sun, 16 Mar 2025 23:27:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1742167613;
	bh=tlZ6DSNgDKIfcL+uxKhjn0E0cjYFmBYfcKaYiLOkozM=;
	h=Date:From:To:Cc:Subject:From;
	b=h7VCvoBySJJ8T5bqCG2Hhm8xPDDqyQAnyuBwaog02dxZHdqXe3bXSMFG9o20u/yWC
	 VctkxdUu+k+rtchQBlXeeR9ArPvajDkLwyJS/kByMK8ggtzLRf2vgGuE/rAmvvuW3/
	 /ejcMM+b0J0xqpfalXh94rGd8pVDuCHXsZFec4IWXAfKzY+CkRvxbndRvBXYFjm8H1
	 y9M28sIzytsfG3Yq8ckgb2Vzm4VtJPJC+Y89LT7oxOb168LxIDJGNcasX2I75H/o7K
	 wjvXFe41DxvJa+9CW62pTkafpi/WqLAY8BJRv+W8u1kFv7bErrGBupDXBCR49j/48V
	 xuK0e7ZlMB5rA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZGDlJ0pk6z4wnp;
	Mon, 17 Mar 2025 10:26:52 +1100 (AEDT)
Date: Mon, 17 Mar 2025 10:26:51 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Krzysztof Kozlowski <krzk@kernel.org>, Arnd Bergmann <arnd@arndb.de>
Cc: ARM <linux-arm-kernel@lists.infradead.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patch in the drivers-memory-fixes tree
Message-ID: <20250317102651.37c64e42@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/9gKmwGkEWS0FApJI.JfhCsM";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250316_162704_903840_BD61EE58 
X-CRM114-Status: UNSURE (   8.83  )
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

--Sig_/9gKmwGkEWS0FApJI.JfhCsM
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commit is also in the arm-soc-fixes tree as a different
commit (but the same patch):

  304e6c02b76f ("memory: omap-gpmc: drop no compatible check")

This is commit

  edcccc6892f6 ("memory: omap-gpmc: drop no compatible check")

in the arm-soc-fixes tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/9gKmwGkEWS0FApJI.JfhCsM
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmfXXjsACgkQAVBC80lX
0GyxCgf+Ps9FrIvUG8t7s7gXc4DaITlZQTKtYmBdkbXerx7v+r6q6am0qRKHZ5h2
S2pEibEUIyNy8Ycp1IcVVbEU/VyDjETaoL5mFqrX3NIKgRvOc92B+m0TUIYnTd5v
wzw1rPiQAwmTDX/yE550Q07cx5WKhQOyfalZoKglkALMwikQYN037JhOTw/QxYhq
U2VjotpkGUYPMqDD7EpI7hq20O0zUMpc9uFHGy8SqmEKiz6Qvxbv/aklgn2n5exJ
K+y3wsGq2Nd87++Hmbwa9FrnLcagmbmNTmecjfDbZiDVubOJgFT6Gtl6KIYd6IsU
FUs8nDaOaEQdt5Bh/Pzh2xLjyJw10Q==
=gm35
-----END PGP SIGNATURE-----

--Sig_/9gKmwGkEWS0FApJI.JfhCsM--

