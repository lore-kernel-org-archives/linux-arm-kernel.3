Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FFA8C35FFF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Mar 2025 04:40:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ushL5W+VeHvW4BffGSspWfbl4+aCB66l1rd0jJFbSAg=; b=F+S9VyB+tYSVxhFTPt1+lKHYFh
	ijl9FLpAsas/YAozQCf9fFfd4LupJIrGIJoyl3towAtwlmFKxv2Tzp9DOvG9OSIo+7p2F8pnA9axv
	I215IcUBXKReWP30zSofgH/yEtp6pR0CNKIOaXkMov3yEmOC6ntITgT4OJZaMiIXdSoyWrs0ClXHg
	p0KSr4Q052jIK+kaz4OdnA5hvbNmS6/qLmFwNlW6swDotjtD+WvRlObmig62Hjhh3nubg5NRQFTkK
	nF20NC5w484KZwL5mJ7mg3DUAYBMSs8IS+rMMhx696kMHnpIFZQUwIWupFAxTfzm2Yy//0PxEImyV
	5GSj/Veg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvUAj-0000000DpK7-17OT;
	Fri, 21 Mar 2025 04:39:53 +0000
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvU90-0000000Dp9H-2Bd2
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Mar 2025 04:38:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1742531882;
	bh=ushL5W+VeHvW4BffGSspWfbl4+aCB66l1rd0jJFbSAg=;
	h=Date:From:To:Cc:Subject:From;
	b=BC4jotlI53A7NS14StTl6SLRHwIcKEe4Oo1kCmpeqAtPU6YBI5mAczFFDdShEa/+d
	 9Ydez6XWQeM7gUWECn+7I2e5Ghqy3ZH+qCs1HIvdT6+qT+oq1Ysq+RQvo6ewiNlFL2
	 lPjN+Aw9ef8Jlp9Gr4KNFTxU/9R9v56RFWdjkRfP4rKVZfVIA1NFhWscTcvv2LztX+
	 bEBtcmumfyvlYCKgbFYRgZ/gYXuBLytJPkXCl7o0vw446H6hFFu4gqvZWVeq46aXr4
	 XcDmWR8TRj9qu0AFeabrnI0dPsoZVFjtfvWH6j0eAm8PNj2Z1ASNHUqFkLaEsm6TZ5
	 kG9LcIg7tQ6OA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZJqST473Qz4x04;
	Fri, 21 Mar 2025 15:38:01 +1100 (AEDT)
Date: Fri, 21 Mar 2025 15:38:00 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Rob Herring <robh@kernel.org>, Arnd Bergmann <arnd@arndb.de>
Cc: ARM <linux-arm-kernel@lists.infradead.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patches in the devicetree tree
Message-ID: <20250321153800.639f03c5@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/SM+fZV1Wy.iWC/c2l=TYZY0";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250320_213806_701147_2E2BF0FD 
X-CRM114-Status: UNSURE (   8.30  )
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

--Sig_/SM+fZV1Wy.iWC/c2l=TYZY0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commits are also in the arm-soc tree as different commits
(but the same patches):

  a78f7a337bc7 ("docs: process: maintainer-soc-clean-dts: linux-next is dec=
isive")
  b31cc6af1bb1 ("docs: dt: submitting-patches: Document sending DTS patches=
")

These are commits

  a42d2d53a6d7 ("docs: process: maintainer-soc-clean-dts: linux-next is dec=
isive")
  d98d35d99e0f ("docs: dt: submitting-patches: Document sending DTS patches=
")

in the arm-soc tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/SM+fZV1Wy.iWC/c2l=TYZY0
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmfc7SkACgkQAVBC80lX
0GyiQQf+IEdK4lJz2x2U4ccIULDxBpj9EIJ0JvscfHrHhDKMzKh6hiANn2dfbDYU
xsIZL4OLqtU4dZ0Y6iVhiLAIPHNT2B9MPom338G1Hih0VQC8/DXV+7FjpdGh5Ac2
ZVTz2joJRPT258mZQvi1HSCWX6Vy1JAcp/JpKJtOGQxiQbpGoH5ZCw9uZi5T3Jbj
uD1l7+8dMcLfgYYz4+IaBc1LvriDKAvs4XP65mvkRP04d+k0L/ghhYI3DqbGyvFD
a7vF/LpmY45mLRSiW6uhkpylb6edalSs3TuFM/TV9xcBnksiqrrKZQFZA8C16PV/
Xd5d4kTH4u+yLAb7iOP/VlsVT7axqQ==
=LoLb
-----END PGP SIGNATURE-----

--Sig_/SM+fZV1Wy.iWC/c2l=TYZY0--

