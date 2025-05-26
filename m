Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24F53C54FC6
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 May 2025 04:06:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=F+nRG37SpRcnjpSd/OETYbq1EiO3SBiZAKrhwFVPnyo=; b=KcQy7DL+KZH4d5jH00KsNLcJm2
	Ef9F+mZIMtrwblU5+zf8Myk4+A0gBmHhHtPCvi5b/xvdSD7q3+xhRumksvxkHbja6/4rA528nu+vi
	o1p/r8/OtzBErWlYQLFgfLin7MAIzWV7TYsrcPjsoLLOGEj0VrqsYQ54JQU57Gvcdn1aydp085q8X
	PK4oxKJ4IRItRm2VhKef9DJAqQrHIO/ZgM6ESBiDLnIoaFzQzEQ3skg6TVXjRn9tRExcrgW26RzSO
	+cuqnWsUKJtK1P0c3eitfdKjchS0T9bzKiN3aaqP6G2w0/Jz8KOdks9jybVsUoqFIsDCQoXoqDMQB
	+yWIq+OA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJP6U-000000082Vt-34hC;
	Mon, 26 May 2025 04:06:22 +0000
Received: from gandalf.ozlabs.org ([150.107.74.76] helo=mail.ozlabs.org)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJP4L-000000082Ny-3g2E
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 May 2025 04:04:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1748232242;
	bh=F+nRG37SpRcnjpSd/OETYbq1EiO3SBiZAKrhwFVPnyo=;
	h=Date:From:To:Cc:Subject:From;
	b=fYoDOP7yzZqtOkRzXIxm+6IpgIQ4l2qeLqNzUUwAKksxnmxOLxKbiZhfNOC+g3jGx
	 c34bYygLp6v8tUVxOEIP1E634R1/F7GegLuclpqguIJbJHG317Bgxkhqat3FRSmxn+
	 Y6X3iCyW5wAbIEkHBJfWCw0Hw0nimg+Y6GFKYibqQXqqfkKzlIGlE+uO464cIRfpMJ
	 FtkIX954rBlMffRv3DVx883HIEHPwzJ+AmUPj3A+h4L2W+RwfHLcfPSEIzHxcNZwJR
	 go6KVeZjVUCTx/BTcpKvgEaL1I5qn1OSxisIbfwDg2fwIjyDnx5jcKydwIiNeC1aEw
	 IqKKJ7CIRM4fQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4b5MZn59sBz4wbV;
	Mon, 26 May 2025 14:04:01 +1000 (AEST)
Date: Mon, 26 May 2025 14:04:00 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Lee Jones <lee@kernel.org>, Arnd Bergmann <arnd@arndb.de>
Cc: ARM <linux-arm-kernel@lists.infradead.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patch in the mfd tree
Message-ID: <20250526140400.54ac8a6c@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/GiMdUWencATi/G0+tRQw5iU";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250525_210410_190564_5A577054 
X-CRM114-Status: UNSURE (   9.11  )
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

--Sig_/GiMdUWencATi/G0+tRQw5iU
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commit is also in the arm-soc tree as a different commit
(but the same patch):

  0ffcf5f1e41c ("dt-bindings: mfd: qcom,tcsr: Add compatible for ipq5018")

This is commit

  1d2c5d5f3f44 ("dt-bindings: mfd: qcom,tcsr: Add compatible for ipq5018")

in the arm-soc tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/GiMdUWencATi/G0+tRQw5iU
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmgz6DAACgkQAVBC80lX
0Gw4igf/Y1lIfyP/CrdlXV98mwYWR3zXbxjuBgQALmyhxhGukvqBCr7/SZO5l4he
TJiJz3G2u0E6bI0cbJhsONaoGnYZOq+GjXO8MGRab4hlCKN5bJKrH5B7r8Mxc8I9
8+pgKOYAHXQ/V7VX6nX+vOwI0srw15R0a1nlcAVHU5fPnUWkYiBiBerUvS+VdPXn
Hg78VwEyvH89B8LOBhtdDgjrjezvK1uU6VBOYXewOU08onDl71oHRYqQQszBKVLM
KMqxMIi0OSmBFnQQO9Qfa/XfMn1LSueP7smTxIlX79GSo3i9rsAHiT1LzYERYK1W
DttfJhK9J+Bu4aAZWIDdgutO46UtWA==
=+nIT
-----END PGP SIGNATURE-----

--Sig_/GiMdUWencATi/G0+tRQw5iU--

