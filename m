Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CF91D637CE
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Nov 2024 22:18:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ViyKi74fZbZqqauFcX8QRPGItIFrBUPGLG5QeGrfiaA=; b=Zf9LSdBVB3/9czzsD5bNSoaV65
	oie1jhzUFdaPZF2IpTv0NZ5mjP55CD0S3lkJTBLFof9MMmBDuKaroAHkBWrWAbGZ36qRiArkMQfZN
	zr8YETzDJSGt6FSRmAUGvfg7Ft7bFVFjsiaYM9vIRjMsfKr6vH0lAbmwt4hKM7qSuxKXvRo0liaK1
	EJ+mHqHRP99bxAdkceh4I0Ns5GOJHNA5xhA8MagSl6EsqhCcVRKID+OKms1sxuvsXPnwUPtoMgrHv
	DW7cnrOIWEG2z3zIJg5i6eGVwQ+SBZ1eXYDNXkcv8vT2PilFaPaR08yNcIoMEvwj8gISvCSkYTkhr
	wBpRmV1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBLgX-000000089YP-2olM;
	Wed, 13 Nov 2024 22:18:01 +0000
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBLZO-000000088g7-0W40
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 Nov 2024 22:10:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1731535824;
	bh=ViyKi74fZbZqqauFcX8QRPGItIFrBUPGLG5QeGrfiaA=;
	h=Date:From:To:Cc:Subject:From;
	b=Kl5ovlMKoBCcdQRrsrJtRT9TYzJ5z9rX472UURoP5vGFyURzT/imRdSdNoYLd3mvg
	 6YgehizkWl6TIefCUQ/toCziWR2ITekQpUz+4YpUq6d/MDB/G25lZ5ci0S8jO8FxvT
	 +bx7TkzZ2xMq/eiZWBvvqqxUp3zzhgNLhTN8y5tNJiMIwlTRW5lOMB7qEJ0DGCJMl8
	 A05ftQ5yYWzXrCFdmTlH3205OZ16PAFk1YmTZsklDp2tTiBYoMkdhoxXjTcopl3bjn
	 V5u7HZQeI07MufOP2Wr9D8zS3lJRquGzidryKG7KFP51WZgBUSLD+Ft+TWcSOMV1H6
	 q7Q5CS9jr6HwQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Xpcsp6GLlz4w2L;
	Thu, 14 Nov 2024 09:10:22 +1100 (AEDT)
Date: Thu, 14 Nov 2024 09:10:23 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: David Miller <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Olof Johansson <olof@lixom.net>, Arnd
 Bergmann <arnd@arndb.de>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, ARM
 <linux-arm-kernel@lists.infradead.org>, Networking
 <netdev@vger.kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patch in the net tree
Message-ID: <20241114091023.50a38dfe@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/CQy0aclGX8m_lk/oRNHiW9V";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241113_141038_491968_84AE7648 
X-CRM114-Status: UNSURE (   9.25  )
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

--Sig_/CQy0aclGX8m_lk/oRNHiW9V
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commit is also in the arm-soc-fixes tree as a different
commit (but the same patch):

  2b99b2532593 ("MAINTAINERS: Re-add cancelled Renesas driver sections")

This is commit

  124f4f1a1869 ("MAINTAINERS: Re-add cancelled Renesas driver sections")

in the arm-soc-fixes tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/CQy0aclGX8m_lk/oRNHiW9V
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmc1I88ACgkQAVBC80lX
0Gy5uQf+Pi/A9DUv8c2l2hDBnMVogOGKG6l7eP7S0wn2Q2JL4CY7oNHknSKv6YAI
CY7tODPcGLyoisPCgbKT3OMy0HWWxVFLK63V3pXEpuqa7P+8v6xfuQfXzHd3btgS
9q5SJOLqEQke4PXv415E36+f7/cgJuNR7mb4p3Ev3quHluGR2iRAYBCIHVXB6p7y
5aafOzipahGZ9ZxDwT5kdUcEbVaAaAioC9dVGB8Ng1KVjN8raB06kr1AXwJ/w5j6
172IGXjz+EjGpkLSwoYFADQ7xkOZX7fIn2rFzddoKhmpUJJlAD5J5iiKJ7iFjI5C
LuvZLn6APNhjafrYkUqz3O+J8dJB0w==
=dUdn
-----END PGP SIGNATURE-----

--Sig_/CQy0aclGX8m_lk/oRNHiW9V--

