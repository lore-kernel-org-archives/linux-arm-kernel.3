Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93F1DC02183
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jan 2025 20:19:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=yFCSW7wz4o/ITgK/3Tynj6PAj28gGaUe9sKFhXcRybY=; b=vFSDpqN3bcnmwLarync+xx7GFD
	7ZmfsLj7wg92IlqUwGNL9W7+OtqBCDBQVFpbOPMXhs3GWn8DWPFduB/QW9Me4a2Xy39YeckF0n39S
	/2OJ81bKxMLEkGtzbTHq9kLdHMBi8CrgQb0ZIHmi+CFsvhc+9WU4WsgKPn9Ri3VGVSnQZuFCLysXt
	pvp6qqNpFswz+jnVyJAETS1XclCEkkZfpLT/0evRi9s9sasEZF0maA4+IvDO/k+WksZu2qDgxuaXD
	nKG8sZoy5kpnMm4W1Dl++YGXtrjCUvYE1A2x1PCHB80magUE/psbbzLS7fqBsKxlo6SykcuXxnLiB
	dbgJvvxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYWKS-0000000FzSZ-2E7X;
	Thu, 16 Jan 2025 20:19:00 +0000
Received: from gandalf.ozlabs.org ([150.107.74.76] helo=mail.ozlabs.org)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYWIP-0000000Fz3l-2sSl
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jan 2025 20:16:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1737058600;
	bh=yFCSW7wz4o/ITgK/3Tynj6PAj28gGaUe9sKFhXcRybY=;
	h=Date:From:To:Cc:Subject:From;
	b=a0KGABqsh9KmV1BCeMVGfxCA5LKde2AwfIhyh2bW6jpOCw2zfd56w2Rp6uNb5m3J+
	 xblA8XP5Xpab1LU8Q1YAeLS67lA1mbyeEh2xX+yAEZ9Fa2KTNYjuVV7JNdIG8C4N5f
	 u/fxlvcWAl2FaFDVQ+ac9RUyOoWtaUd53pb3OW25DSUYVmuvAnSt9rKAj2dzRxOeyL
	 RQ5l4eKiB2wCBDeQ6JEngAhHRrA6CbahVpj3qObFuqJkXLSlSJl9CGyQODOO0329yo
	 srtsvneJ6Wn6BWt8jHiShrEQxBXJYZTyCzUtzSOMi8OlNnJuxv/Tw9cCIWxIX8C8K4
	 kegM6JK9fpPKA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4YYvK34WjMz4xT0;
	Fri, 17 Jan 2025 07:16:39 +1100 (AEDT)
Date: Fri, 17 Jan 2025 07:16:45 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Arnd Bergmann <arnd@arndb.de>, ARM
 <linux-arm-kernel@lists.infradead.org>
Cc: Mamta Shukla <mamta.shukla@leica-geosystems.com>, Dinh Nguyen
 <dinguyen@kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: Fixes tag needs some work in the arm-soc tree
Message-ID: <20250117071645.0da5361f@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/rPWwCV9cpdrRpn0UGqadoad";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250116_121654_080129_6401EC48 
X-CRM114-Status: GOOD (  10.16  )
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

--Sig_/rPWwCV9cpdrRpn0UGqadoad
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  62a40a0d5634 ("arm: dts: socfpga: use reset-name "stmmaceth-ocp" instead =
of "ahb"")

Fixes tag

  Fixes: 331085a423b ("arm64: dts: socfpga: change the reset-name of "stmma=
ceth-ocp" to "ahb")

has these problem(s):

  - SHA1 should be at least 12 digits long
    This can be fixed for the future by setting core.abbrev to 12 (or
    more) or (for git v2.11 or later) just making sure it is not set
    (or set to "auto").

--=20
Cheers,
Stephen Rothwell

--Sig_/rPWwCV9cpdrRpn0UGqadoad
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmeJaS0ACgkQAVBC80lX
0GxNeggAj2rZRvHIcHXzumRndsGl91Qayc3olGTr5S1ua3Q7zF2EmOqr5/ll9ERE
onwgwHRSf4itfcGtHxRt06UbOCmKmd8j3IxAQW7A9n1TVEXJ9eLQhjyJ0i7oRgtd
YAZnAWKSO/UTYYToQ2sFnWcBhWbmL22HLfdDOKN5F/K5cYD9jfKMNkgwyVooW4QX
x+lRsflrPuSxSFu0wQfVq9APeDIoW/yfmt/BzTYVQ+DU0s+Kq6TtHDEdf1HVYNnG
qWu9WvDw9KqBGLgBx+OV0bjDGUWaF+gzQnZakjtpBk1T9mCo/W+/cFx/TumID84/
C/T7I+gc9i2aROgzCoaPhPOzVNC+/A==
=nlMq
-----END PGP SIGNATURE-----

--Sig_/rPWwCV9cpdrRpn0UGqadoad--

