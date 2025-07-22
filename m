Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02442C83F27
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Jul 2025 22:28:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Ct4LHIoK4jMUZEbprcTPdhuEbh2QXr6A2F7FmlF9nhA=; b=U3HKydDi3kD11Fn31sv1Z7BijP
	sQGTZeyosCSNtQi8EntSG2xFzC0E3F7nzh0XRyZpMOqUtYqYrUvazjZ1EW/zS6q+/rWrjYBbSWtkg
	rU+pCHLjP0ZPbGRH0cCMecfkEf4XIkOhItKGYpBwHXttRkclPQdh9R7WFkH9zH1Lp8BsqEYNoFnha
	doAfkQFLnoXhJFxEuSP1/+a69rFsJ3J6f2iBTWUYPjiqduUrNnWyABweiDqCnbqGyyDfvYSGk25/z
	N7JQ2w9Kzd0qq1Bolz7JLV+xGRFhKjAyU1Ot2GW7OttJ5JPegcbqeYPcu7w74G1fClWzUMHYfzuEa
	A3tHfnKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueLT1-00000003bIb-31zC;
	Tue, 22 Jul 2025 22:28:11 +0000
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueLQW-00000003b6U-0XkD
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Jul 2025 22:25:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1753222965;
	bh=Ct4LHIoK4jMUZEbprcTPdhuEbh2QXr6A2F7FmlF9nhA=;
	h=Date:From:To:Cc:Subject:From;
	b=EHTibmcpEGexpIHleeeHNENs7wAU/rUw4F3Ql2n5YFWVn9TkWhITv0Cp6Qcj3lpf5
	 h6AzSzGrEzo1/2QSxL8ByR18NkBrK2IepZIds6+M4hQZlmZrXvEb3you60jpOFfPav
	 Nu9zvThGi7Okk8FMeNJGfg6AH36Pa2wXo/0F0MIigfzuPjbKX4If1dSA5nC4VCVKVv
	 ihRrjziDkwfbghpTuMTtjyykXm/icMMG5vzbxO3tQ4oOaWApUi8w3TlmOr+kcXpb4/
	 C0TDLS1DgxscY2McWeA8Tbmm9lm/HJYuuIztdIX+crnqijKEukHI7DQYHE2gyU0DWC
	 zojMmrK6aZBDQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bmsGF2nFyz4w2D;
	Wed, 23 Jul 2025 08:22:44 +1000 (AEST)
Date: Wed, 23 Jul 2025 08:25:27 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Arnd Bergmann <arnd@arndb.de>
Cc: ARM <linux-arm-kernel@lists.infradead.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the arm-soc tree
Message-ID: <20250723082527.31bafc56@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/tx57dIAk6MugSyohkUUcM2H";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250722_152536_434647_01D91C3E 
X-CRM114-Status: UNSURE (   7.91  )
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

--Sig_/tx57dIAk6MugSyohkUUcM2H
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  12702f0c3834 ("soc: fsl: qe: convert set_multiple() to returning an integ=
er")

is missing a Signed-off-by from its committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/tx57dIAk6MugSyohkUUcM2H
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmiAD9cACgkQAVBC80lX
0GyZagf/ZHWj/491scqAW16aHlUBK2aPSwSWUZDSZxDs4+hqMRlSB6+dG0kE3VGO
ijxACYqCOLDBM9qFpeffJD+Bn6rJrVRM3nQpT1Mo+zMTBPAL3pzrH48Im0SSa3pK
1AnNd/wU946BmiCi/rnd4kC9PNS1piOcMKUA0Y7pNnclp+ymvB3s1LjPZRGp3SQG
ORXaZfSw833dUgcr6ZH6iPSbpb0KcFcQb/1OeOrn+qRuMiIDEiMt1hFC1wXH8qcU
svMk/oGYhiCv94X/x48nmH4n7fXR0ZM3m8sJO+Gt9FQvaxpBZsxfKUOMYkDLthl6
h0YX0RGajt1lZA5brN2PvtAk9511FA==
=OJIz
-----END PGP SIGNATURE-----

--Sig_/tx57dIAk6MugSyohkUUcM2H--

