Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1816CE7718B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Dec 2024 16:03:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nBpJAK8X7ZLY8oUi1fJARaxUhH3m7eXAgWuPY2BqeaQ=; b=Q5SXVsgDHE6zy7LtDoFc6Hw2QV
	wfcTOkR4hXaJmZSqmR9vkqsp2uRXF7/tFJkSYechKR2xW6+O4oqPSdxdVijAYBJN7sZEGyftgv1zB
	VKT2f8eGmhNBoMZnr9cW/+HY8JHLHCq6WqL6AelRH7tuLIQBNoIyIKN06jfIoLRi2ZWPvIZIdDjZp
	FFy+/ENZ/6k4Bm7A6y/dbVOJMnkxdTe9Q45yabLQONDuSyv2ytm4xcnnezUf1Q0kG61lYJfjT7cCN
	dBFd/+qOLcaOMRyHexjCzlj1/lKFV72MM8d6ceBXbvNd3lUIW3AOpw83Nzt5pwhYRYe7bzYwAl7KR
	UZSk6/LA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tPktS-0000000AKq5-0GQS;
	Mon, 23 Dec 2024 16:02:54 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tPksG-0000000AKlF-00LZ;
	Mon, 23 Dec 2024 16:01:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 38BC55C5984;
	Mon, 23 Dec 2024 16:00:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE811C4CED3;
	Mon, 23 Dec 2024 16:00:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734969698;
	bh=nBpJAK8X7ZLY8oUi1fJARaxUhH3m7eXAgWuPY2BqeaQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=i7l+MfsS0jPk+6wParP2F3ri0mUbVXSeFfEp0yEJ8V9fWKERn91NvXMzBuJ+dPHyV
	 6IiZPNGFztxj7vPx1Y2emlT0ONbBUWomiEMBuc+qwOVqBnruyEVRK54nFfOCTS+THW
	 YdEU8zmwMjdadR+reTonDdW6hJ6AG9SsWSRlXlV2s5sF3i6rLgs1RkTXKebaN1RUeB
	 lfZB1hbLvNHX9kuO39PpopUiwN3g7eg/h2TXYq5qo0e1S2Ac+PXTscfP3h+foNT5kl
	 MVLD/hPr5u17TZh+u5z4TsDycwQ5y1H+6V4aQQfP1CMBSv75yu7JQeIQcsg/Bw4J0G
	 QrUBQIl7iMomQ==
Date: Mon, 23 Dec 2024 16:00:05 +0000
From: Mark Brown <broonie@kernel.org>
To: Alper Nebi Yasak <alpernebiyasak@gmail.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: mt6358-regulator does not probe automatically on MT8183 and
 MT8186 Chromebooks
Message-ID: <Z2mJBX4RqSiICchK@finisterre.sirena.org.uk>
References: <f3c6ea1d-da0f-40cc-ba70-7cabb5c3189f@gmail.com>
 <44580fb7-a0ab-41c9-a4e7-fe053742883a@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="XwzJtfa9mNhTRuA1"
Content-Disposition: inline
In-Reply-To: <44580fb7-a0ab-41c9-a4e7-fe053742883a@gmail.com>
X-Cookie: Editing is a rewording activity.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241223_080140_087769_D7B1A993 
X-CRM114-Status: GOOD (  10.29  )
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


--XwzJtfa9mNhTRuA1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Dec 22, 2024 at 12:30:57AM +0300, Alper Nebi Yasak wrote:

> I found this patch [1] from Matthias, sent around 2021 about adding an
> OF match table to the driver, which fixes this problem for my boards.

> [1]
> https://lore.kernel.org/linux-mediatek/20210112100659.19350-1-matthias.bgg@kernel.org/T/#u

As indicated in that thread the MFD should register the regulator
function driver with the name "mt6358-regulator" used by the driver,
then the existing MODULE_DEVICE_TABLE() will DTRT.

--XwzJtfa9mNhTRuA1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmdpiQEACgkQJNaLcl1U
h9BFagf/QOk/RG1j6WRQC1zd9h30PX/Xb7KH55NYe07bktOujvVBXGJj9TLVJyNZ
T7x7ldjTeqhwTTt7CaabxZXpTXFE1wGcf0szXgnOS1ao/Cvy0kpBSUOvADyfxz6w
a+rOPKNHW5G9EHlM2qidshD2OYzechI48ChJA3mLSh91noDU/KKyiV2LMabS4Bin
tRE+w3OMyhI9e5fQoAMLleTtgzv3M20TvOo+iMJwg0+/j99PSG54aev/KSf5Vj+3
tDKM0KvtjslI2JyBx7idWSlWN5WV9Kuf29Zcqdk4P5U5impq1HTgY9m7HGo99rrk
WwG65D96Vi/wzc6YCUakss6i1UXY5g==
=H6Ep
-----END PGP SIGNATURE-----

--XwzJtfa9mNhTRuA1--

