Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35DFCC5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 May 2025 21:20:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=CgpXzOfc2xUcMwIKm+QAbawu8Yo3oj916tKaRT9eqjs=; b=SN4oiPx29EelXNcTSu5y/8jG6w
	HRz8B1LiTduf4c9E1MG1zkUWI8018vyjdKw/QP57VHslnQKGYNW4Y78EquA1XCHCAstfUrzrIcg96
	dv//3zO28VlUsk0uMXRcXNtwlszxlBU/Jr1UC/xQYG5J8oOa0qD4OPATYHzvXupsYZ+Rhc7nGX1GQ
	6JJ3dK9gZtgv34j7z8N2FDazA+FKNPpPNh30NY8ETGM7xbtdfNl4LX5PBBBumHaswmXmRaFGl+/AL
	scK7DqhiqQXojUPyeyOUmh10rvsgWfZKXc0N4sfs6D6LY7qCeTe9p4LMXO4u9rgFKD6G0If+R8q2v
	mIDLRqlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKOCL-0000000E8L4-0jas;
	Wed, 28 May 2025 21:20:29 +0000
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKOAB-0000000E8Bo-0EIN
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 May 2025 21:18:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1748467091;
	bh=CgpXzOfc2xUcMwIKm+QAbawu8Yo3oj916tKaRT9eqjs=;
	h=Date:From:To:Cc:Subject:From;
	b=YwfJM+Wpos/VY1TI8pipU/Gm/0hVMG6m7CcVwhRv7PQR7LDh4PQQYtmAJ4oqokflh
	 gJPdMDN4rNdeDIo3hIDIgYXwsKQVpxlc1awhZrKtKJRgLpCX+pIh7ZPJeM1gouDqfH
	 ySqLDKH7pKp0Knty9cFYa6ytStzwdyC+XPEQnVQmghgeSWoJdmcHacgjc4CrFUtPDV
	 6dPdCW87hnflti4mXt1nvQ7GqtW3B9pmqMMsW5NXdUghGBzsO6IQs+wGeuQGOm104F
	 3Q9yCQtTRBAmzcaEqN8eFVruppDiTH7jAr1SOcP+ea4uExWpuPNTKvjk2CTrUhmEE5
	 ZR+/w/NeTaKPg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4b72R709N7z4wcT;
	Thu, 29 May 2025 07:18:10 +1000 (AEST)
Date: Thu, 29 May 2025 07:18:09 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Arnd Bergmann <arnd@arndb.de>
Cc: ARM <linux-arm-kernel@lists.infradead.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patch in the arm-soc tree
Message-ID: <20250529071809.482ab217@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/RijOY7O_/dforjHEQ6Op8aJ";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250528_141815_240027_5D62667E 
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

--Sig_/RijOY7O_/dforjHEQ6Op8aJ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commit is also in Linus Torvalds' tree as a different commit
(but the same patch):

  0d4d6e699a4a ("media: dt-bindings: Document Tegra186 and Tegra194 cec")

This is commit

  5bc68bd3826e ("media: dt-bindings: Document Tegra186 and Tegra194 cec")

in Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/RijOY7O_/dforjHEQ6Op8aJ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmg3fZEACgkQAVBC80lX
0GwhdAf/VqaUCB1YfJQaW63il3bVi4EqL1R31N+d724vaAdqMqwIvIWsyo2eufOg
BpTbD8fjOQh97Ewz2qdOceuFhjmdnC2z2F1qmaV0eg2uHMjj6Z4RGkh1usUv/xSl
9hzF1hhT8FJ9R3BBn36MunHKOQ1eKuWjq7o5pbWgMrnfrG7NBEFVu2nPZbOGYnvr
2md+BDzSDieUz9SWl9gl46zpueMEGwP4B41C8hITQUWJjW6BJ70C1vJxNtQE6Np+
88FTE4p+gadxihCGY3TVpeUhgi2E2KZS/nOGn9Le6sMtkQ/s4O74YLc5VDBSXj6Z
dhk1yMneEhtsrqfNNbgzwaalS6YO8Q==
=l5nZ
-----END PGP SIGNATURE-----

--Sig_/RijOY7O_/dforjHEQ6Op8aJ--

