Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51C40C282D1
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Mar 2025 01:30:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=BJ9FQjBK0iPM9zCWhA27A3nTc/CYXoM2APiu0/H6r18=; b=RQ8UQ2w4H2TRPw9WULznQYkSUh
	/shwMlxNx3eeGi2raY0VV6rRjW+jFW8SUgSVCkePrmjTgZYU2YG9IvOFbe1cbCWCXQUt5Bo0388os
	OiIjxlgAKRNC/1JEzhNDTnMq9IsmPCMPgdNMI+5jC7fNOr8uyz3o3QAiNC9D45Mv6xH5v5qkTtY0v
	1PJjc2W4c4C7xRf2ctwO/mVoal2NHTZ6YLS82H1APVF/Vyhu7kVhsbWQZIANFuFUs3QJvTMlFAaWU
	NINrMqo+5qccqLrT7nqNmvRfxUdnlmjvzYAP7+Hp+rYgUj4k7GDGZ6S2K7QM/WkwVoa+P5Qb1kuEN
	PPmGzA2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqMY2-0000000CnyV-0IXo;
	Fri, 07 Mar 2025 01:30:46 +0000
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqMDx-0000000Ckkp-0qPL
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Mar 2025 01:10:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1741309796;
	bh=BJ9FQjBK0iPM9zCWhA27A3nTc/CYXoM2APiu0/H6r18=;
	h=Date:From:To:Cc:Subject:From;
	b=BdRgdTRyYrCbHAlFXg8AovE6WI2vZfqis6FemK1c84GL5HZUuRI6yRUVlWuNNW6zo
	 egn9uJkXrFkAahoTQSfEthy9BHkXcb+DnD4xjYTbwinpU3tTwsrdNTO4jDkU+9b7Sc
	 +FPLRju5fI+hvzw2e7YaOrysL3VCg5wGnJFRy1zogv8124p5VtbZ3FYUIVbxN6PtKs
	 o5gwZyMX9HJ0ABNhg0jpeHlJ0Cw/1UcUtUlxHiwWIIge3A5c11VAHq9kRXfivDTlVV
	 QFJlSo27tKf2hQ1wSse8FsHJdZM21CGx7Mv/bvyJycVJG28D7mi+ZS4OcFDMYvpPei
	 9c84dh0TMGSGw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Z87Vq2lVXz4x3d;
	Fri,  7 Mar 2025 12:09:55 +1100 (AEDT)
Date: Fri, 7 Mar 2025 12:09:54 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Florian Fainelli <f.fainelli@gmail.com>, Arnd Bergmann <arnd@arndb.de>
Cc: ARM <linux-arm-kernel@lists.infradead.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patch in the broadcom tree
Message-ID: <20250307120954.351dd8ae@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/B=r6jVDdyEw7VYbERN.W4G1";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_171001_612130_20EC1365 
X-CRM114-Status: UNSURE (   9.12  )
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

--Sig_/B=r6jVDdyEw7VYbERN.W4G1
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commit is also in the arm-soc-fixes tree as a different
commit (but the same patch):

  d0b7662f9a68 ("ARM: dts: bcm2711: Fix xHCI power-domain")

This is commit

  f44fa354a071 ("ARM: dts: bcm2711: Fix xHCI power-domain")

in the arm-soc-fixes tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/B=r6jVDdyEw7VYbERN.W4G1
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmfKR2IACgkQAVBC80lX
0GwqKgf/Vras2HyGkXQy8bLVkGjsZqBPaHc0hW+CFQwl8ZMBaKODtAbKzhcT7iUV
COIY2btPkafkZ1KgjJpjQHLL0aRtYybs8oGlP2ne9VWbrj6FODc9oppSnk7ceDIm
PX+eg93zbDEN99l99o1yPh12WcwOK+E7+ZaxRlA2OcgjpkWi81MdR89iAbjdEytF
/SaPM1FJgzY3QUBSYevG2mJVvipsmwTA23utc0wKIVmX0nUgfeqdYjDLkoT3w4bO
s4A7KcbgcwQSFB82+89gHhnf44fXGRVPpfew2z/aYS00EAJxzzq/3NErd2vgRBXh
Z1pith6W28hKPEz/0jHk5pRhOOtiHg==
=rEIt
-----END PGP SIGNATURE-----

--Sig_/B=r6jVDdyEw7VYbERN.W4G1--

