Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF01BC87FCC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Jul 2025 01:39:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=5lGcmBFggX2/EX7NgsPu4LHxPbIwASKRZb0cci8Zq9w=; b=oSCeqH1wYLIXmTo4H6ZQ65pMwr
	ZcWbaQIROQTOxha/JKzRJHu4G4nUbD634Y3re93A/iVI+uD1WxGiH8+kzC246g6GtEvRWb3WPlgRF
	ulfKCEp09ZI3NWAfqzrGHfETeHujPeKKigy1OO94TS41FAcGFL3kGdJc0n6dlQlFqruIeLMDeIQru
	KX0U4Jk2TSZEVn+/oMRP/yLRtZOIXNX65N+OYjBWnO94AtFJxM5TH+m+yA67dPUXKraa9kinL/quZ
	xkFPuCNvBzRI9ItDoaci68qzRFIwdS6ToviqByGKm/EUD/lt8/Aw0nVVMm272a4dimXYJgoV1MDK4
	htBsXqWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uf7PJ-00000008pqd-1Wje;
	Fri, 25 Jul 2025 01:39:33 +0000
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uf7Mq-00000008phY-0vFg
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Jul 2025 01:37:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1753407240;
	bh=5lGcmBFggX2/EX7NgsPu4LHxPbIwASKRZb0cci8Zq9w=;
	h=Date:From:To:Cc:Subject:From;
	b=CLpekjQd1W72i4qVqOPtj9CZpUpiB+GIIe4khiErvWFACth4+Dwsn1G7dLOjFIydI
	 555cpJKI8YhT6SEl4nxsuQXwgSlb6v1ONfPpz0T4ZXym+yzrVOBwG2r0x00DkRYWnK
	 n+3cZ/DT1BdyJhDcxzwyT5x8PGgFgqXuE0g4CSe5eOCTj1lV2p/1mZmjhSnSBryrG0
	 7aYNvLVCcQ7UPr9QwUHoW5jtuNmCmvAStvy3rPSrOZrUqcKM9rmB3uCrqs/k8qEyA0
	 ORI6Zq6pjpulzNpdSGGBBgst/dZnUIuSgZRezDK5xvnEQ2v5sTqHhmU1xydavtX5Yq
	 yWU5D6qJazGrA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bp9Pz64MXz4wcd;
	Fri, 25 Jul 2025 11:33:59 +1000 (AEST)
Date: Fri, 25 Jul 2025 11:36:57 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Lee Jones <lee@kernel.org>, Arnd Bergmann <arnd@arndb.de>
Cc: ARM <linux-arm-kernel@lists.infradead.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patch in the mfd tree
Message-ID: <20250725113657.039aa5ce@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/s9uIwT4yh88XB24Cy90CIg6";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250724_183700_402873_2DB01C8C 
X-CRM114-Status: UNSURE (   9.33  )
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

--Sig_/s9uIwT4yh88XB24Cy90CIg6
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commit is also in the arm-soc tree as a different commit
(but the same patch):

  ba9ae011e837 ("soc: apple: rtkit: Make shmem_destroy optional")

This is commit

  0445eee835d6 ("soc: apple: rtkit: Make shmem_destroy optional")

in the arm-soc tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/s9uIwT4yh88XB24Cy90CIg6
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmiC37kACgkQAVBC80lX
0Gxo2ggAm67G0A1bDKYr+0wPYyNOjmJ9fZKp+ORRa4LfurvNh7Z8Mbbe/G0tScKc
eTMAUA5pliV4g2ScJkJ5ZJYJJeGJtFZfc6Tt9/0Qe0YRwukiRY5ObD1tysR3lQ5n
D7lS3fJLwIVwbKUzIbY4GDNPjKlFPr1haU+XHsTNu/7reiF7IjcfIdRh/SR/sYXu
IqD6APc1s7pT5l25y6CUZc2iGalvoW7yj6HyGOdAsLb8SM5Kfs5+6rGrO9Tu/7XI
tjERtb+/K+mR58TEmNMpZB7BUfieYTLEy5v5ZEDmM3f3L36TcwJnVl8JSMhKIhlM
9TW1huaPvVjVQPXrVwdDBtKERO2VpQ==
=R0sU
-----END PGP SIGNATURE-----

--Sig_/s9uIwT4yh88XB24Cy90CIg6--

