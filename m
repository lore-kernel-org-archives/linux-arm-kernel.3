Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81DA7C83F27
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Jul 2025 23:48:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=RcSuioHgqQvCMYpuNH5o7E0rW1clnpzbAkq57g8dlHs=; b=ASTFCxHejcP/Au/v+93AnGnBKX
	aBzB59hgqZLbtVhk70bp6h7GjKQton4uLmzZea1+Hv5eMR7Nygy3r59QFfHq2qIL2q2XrObqER4zP
	3YvG5SJQGpVnoeoLNjwhTODzto+7AsTjaCZm33cTDfi3bWy8KvkbdxVqlhFuGnO+sU/HBnroIWiQI
	hPL77lTl2EmXP7BClXAxBM5kkQ494d3tqmbIU1yFfjzYuv/T1HYTsYUmY1NR6muNuJMwLciwpp7cN
	X74y/Z9srZaVBuDSdDUptTj4qmX2C9XVhy3Nkujphq0vNsIFP8gu/fPwkF7MwGlqB5JRqTA59quG9
	va7NhCCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueMiw-00000003gua-0BcN;
	Tue, 22 Jul 2025 23:48:42 +0000
Received: from gandalf.ozlabs.org ([150.107.74.76] helo=mail.ozlabs.org)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueMgO-00000003goU-1to5
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Jul 2025 23:46:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1753227796;
	bh=RcSuioHgqQvCMYpuNH5o7E0rW1clnpzbAkq57g8dlHs=;
	h=Date:From:To:Cc:Subject:From;
	b=s6jcfCpUsBKTqHO4zuns4rOE2gE/EkPJ8Ps6wEQv9hscbZ3IIDlBwvgKI+un0wnoV
	 uOSCfKFFESl1RX2g8YkPFxKhkHjimIvdo9d7cM8SIETPnOGvpoGkR0PFeUEtGaJ8hv
	 55BfZn1Y/jSvHqpWMngX+kSVCHjJ2wQiaRK7QNQDdpWtA//ERPuetFrI4R0z1NYlCY
	 vllbD/v/JQ/kXYyaSiIWz6JVkm2JpIvgoeEiP9Cw6RMB+fq+kqclUKqS3Lq8rBHcWU
	 J6xntTfbpeA/b12ITSVaio+ovyqyn0ANtzna86MYREbG4cjNqUb1zQrALkJ0crok8C
	 nmC9imENwZU/Q==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bmv372pPKz4wbY;
	Wed, 23 Jul 2025 09:43:15 +1000 (AEST)
Date: Wed, 23 Jul 2025 09:45:58 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Christophe Leroy <christophe.leroy@csgroup.eu>, Arnd Bergmann
 <arnd@arndb.de>
Cc: ARM <linux-arm-kernel@lists.infradead.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patch in the fsl tree
Message-ID: <20250723094558.5bcfca69@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/WJAG2PuqecvQ03WJeBM4B/8";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250722_164604_846455_F5BC9589 
X-CRM114-Status: UNSURE (   9.04  )
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

--Sig_/WJAG2PuqecvQ03WJeBM4B/8
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commit is also in the arm-soc tree as a different commit
(but the same patch):

  8b3da0519ae6 ("soc: fsl: qe: convert set_multiple() to returning an integ=
er")

This is commit

  12702f0c3834 ("soc: fsl: qe: convert set_multiple() to returning an integ=
er")

in the arm-soc tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/WJAG2PuqecvQ03WJeBM4B/8
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmiAIrYACgkQAVBC80lX
0Gz8tAgAm64hSR4znmbazwp3rKdkOF6D+jSnwMdhch4uF3Uqf1MXN+YdkAaa7hOj
tuHgKe6uZ+olwXIP+dK7ZStD9GFcLCZ0hNc4Y3PZQJduvMJKtffSlwAqKBLVsDuQ
UuwqdTE09kHoCYebJR2eHiO0PI2gBOhY1OSOH/jFl+Kj7UlLzqNrGT4Lt1RU8sqX
6A+rVmFkHFaESbLP0oXC5u/zzifIXM5weeaXmHWEK8uyeB8WuloY9CWMcJGLhgbC
QkGC/CIK2422WnGG/9ORThsbENFwCUBhbJGuYGMnbTyMIw7XQWW035egC7XXt5BP
y8GiSa2aQanEXYgK4QHxdLdpwZczLw==
=SgVy
-----END PGP SIGNATURE-----

--Sig_/WJAG2PuqecvQ03WJeBM4B/8--

