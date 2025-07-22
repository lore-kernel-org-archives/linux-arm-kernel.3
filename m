Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EFF0C83F27
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Jul 2025 23:56:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Kf8pNViSHD5rkHGaX8+81GayKFAihbKTrbLTqW/u/TA=; b=SXkw4r21+VdGyLSU98LrJlAnEe
	plpNk0dodssC3c9MOsCQYsKiS7Z5o5bj6dylvsK25bM8H/I9v1ge7IB3cyZLT9/IdDmwbauchr5AJ
	9E/2rzb8IFcrkh3yg/H9xLkK5pCKIHfGGtiv8kuGheBJCqz1uAiSf/kEoGrDU/BkidFO2BSLNR7nA
	XeXiiKd84Tf6AtWqcvlD4smvH2nap/0xz2ZZxwj7MwGG9iR2NY2Ek3wXKOFUgu1zL9xM6yj9ydEPd
	rlo+ZcyPAFGL/vERbcBbRWndslOyFCx4GhhLK6o19I8iN4LrjC3cgz/lekeXJHgZds8b7X3PBa9Y8
	ts/ugUCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueMqc-00000003hS1-3Ie0;
	Tue, 22 Jul 2025 23:56:38 +0000
Received: from gandalf.ozlabs.org ([150.107.74.76] helo=mail.ozlabs.org)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueMo8-00000003hHC-1uR1
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Jul 2025 23:54:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1753228279;
	bh=Kf8pNViSHD5rkHGaX8+81GayKFAihbKTrbLTqW/u/TA=;
	h=Date:From:To:Cc:Subject:From;
	b=QYnS1p8lQqeDmJXl85V0K2aLjMYi9wxkzNbXTBU9ZuoSWKkEco1NuH3v89SM2U0sk
	 tVFhAzc/sZd6WIxrAF34R0KupgFS6JEFS66CHyLv2xsmuF73U7pFGuH14+YfLALZ+g
	 zCSt0QUgBYL3u/XU6dqnmH9oY2UnbY3r6tBgi3Aaaday1beNNyMYT70EcmF/61lVmo
	 VRp/LYwHnoEs+ntcHnW004U8UCd16mV4W6mNeGkK4i6gXTvqykpE/rBVMCoPNvxS/n
	 NU89wPK7tKXXTmg2n62MIZu4kI1VIJEjatE8ueISwFRrSUQuak8MXNvWJDqbaJHdXs
	 RdRAMGgSkIhLA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bmvDR0kN3z4wbY;
	Wed, 23 Jul 2025 09:51:18 +1000 (AEST)
Date: Wed, 23 Jul 2025 09:54:01 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Heiko Stuebner <heiko@sntech.de>, Arnd Bergmann <arnd@arndb.de>
Cc: ARM <linux-arm-kernel@lists.infradead.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patch in the rockchip tree
Message-ID: <20250723095401.05a9633f@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/qdBrnNZEmUs5nT5iOP0BaPq";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250722_165404_639282_66CEC31D 
X-CRM114-Status: UNSURE (   9.58  )
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

--Sig_/qdBrnNZEmUs5nT5iOP0BaPq
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commit is also in the arm-soc-fixes tree as a different
commit (but the same patch):

  60d89a256079 ("arm64: dts: rockchip: Drop netdev led-triggers on NanoPi R=
5S")

This is commit

  912b1f2a796e ("arm64: dts: rockchip: Drop netdev led-triggers on NanoPi R=
5S")

in the arm-soc-fixes tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/qdBrnNZEmUs5nT5iOP0BaPq
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmiAJJkACgkQAVBC80lX
0Gz/WQf/fuMNFoXZkH3OJ/qd4uB8G1fWwIEpn329uCNZxlCSy9xv3FCDQDFph8jo
g8JkFhYWSzyW/1V6yWu1028b2IfwqUAE29Q4COT7CPuJ1MVkAsOP5arTquwZ+D6K
FcB5wc8lCR0bx2uUS6mFGDP2fzb4IFdeEwSBScnDYqscXux3G42TRoWSA4G1R0CG
2kZOwA6gFllQ9dDMwL46KBIYE1U8uVkdzA+rT3wZTeikmRyC0IYtHaM5I3D2QnFf
hqs1S+tnegZsa6KJOAOfDfByUZB7aU0SpFq8KkOndDXbfYAukTJEc2/RuJUsxpfn
26xxBwuLGCNXl+jrj1LKBy9zn4nVpg==
=+BVV
-----END PGP SIGNATURE-----

--Sig_/qdBrnNZEmUs5nT5iOP0BaPq--

