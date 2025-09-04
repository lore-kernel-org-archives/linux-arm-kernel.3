Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B1F0CA1002
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Sep 2025 10:54:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Z94ywxLihlP5imbl3FU1jjKwYYCzYT7fwycWOKoAX7s=; b=GKaYt+Taif4lxywv8NaJBrERwR
	sgk/uyCi3x6KisP+iQBk8penUGiZ+rWRWZjw3D4J/6poXLICTVkE4FmBADu1sdMH5Jd+/aR951kfh
	Wo1ZFd/zyIKn7JIhuWQOJyxSNNerezynC8aaK3e/TuEpDBxoLpnS+3gDoI6GuKFMxraHUR/vZI7Yo
	dmUq0KGhK0cPmSDCNygNu5cFjT5+XXasP+5LMCp9gIEGV4eEsSHjQIuSQ4tpgbZ9PIezCesOm6ABm
	ICVEaWJECCxFpvtYyMXN2ZnKQ7TLBeS872QLTLzPPUtXE/NgfQNAWIbaAYGLaIchU07M6aQd7ajMX
	VNwh0BNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uu7bF-0000000B1pv-0x0b;
	Thu, 04 Sep 2025 10:53:54 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uu6Yj-0000000AeaM-0z0l
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Sep 2025 09:47:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:mime-version:content-type; s=k1; bh=Z94ywxLihlP5imbl3FU1jjKwYYC
	zYT7fwycWOKoAX7s=; b=Bd1UXp993IfnsYG251n/negH7uTJHbLI7dgi/rjn/GN
	IUjLMOu0lewDU5/rZkpfTVRSS9HaYcNK3hg6A+ounw3N2mcIv6VKBdNHMKQhdiS1
	Ima1sNLahAkVTCVRx55o+IjehFgMi78M8wyGnmOFeNrPB/a/Ed0Sz/oEQsev/XYB
	IbEyG+bCugWaXGS5hi3cEvmpNF3mOU2E2P+R72trHgstDImBXK/mg9N3ycvzwX+s
	lE7wWbv9Q2UEzOwcUrSIUPSRc169/wDs9osF7OM4A8midxD1pfRnjP1Jgv1btyCc
	+dpkymv9Z4c3QYn6RcHfn9W9zJjNtu1tm2nDpjDP2vA==
Received: (qmail 3617510 invoked from network); 4 Sep 2025 11:47:06 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 4 Sep 2025 11:47:06 +0200
X-UD-Smtp-Session: l3s3148p1@vUWhmvY9xC5tKPNb
Date: Thu, 4 Sep 2025 11:47:05 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: soc@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PULL REQUEST RESEND] i2c-gpio-fixes-for-6.18
Message-ID: <aLlgGdrFEjh26knK@shikoro>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="FVwHWn2AG0eyJRbl"
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_024714_131088_3FB12B27 
X-CRM114-Status: GOOD (  11.54  )
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


--FVwHWn2AG0eyJRbl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

this is a resend because I used an old address for the SoC mailing list.
Sorry for the noise!

Happy hacking,

   Wolfram


The following changes since commit 1b237f190eb3d36f52dffe07a40b5eb210280e00:

  Linux 6.17-rc3 (2025-08-24 12:04:12 -0400)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git tags/i2c-gpio-fixes-for-6.18

for you to fetch changes up to ed8c952aee4183ac866a83397e12ceb99493c6ad:

  ARM: dts: stm32: use recent scl/sda gpio bindings (2025-08-28 12:33:26 +0200)

----------------------------------------------------------------
i2c-gpio-fixes-for-6.18

We have dedictaded bindings for scl/sda nowadays. Switch away from the
deprecated plain 'gpios' property.

----------------------------------------------------------------
Wolfram Sang (2):
      ARM: dts: cirrus: ep7211: use recent scl/sda gpio bindings
      ARM: dts: stm32: use recent scl/sda gpio bindings


with much appreciated quality assurance from
----------------------------------------------------------------
Linus Walleij (2):
      (Rev.) ARM: dts: stm32: use recent scl/sda gpio bindings
      (Rev.) ARM: dts: cirrus: ep7211: use recent scl/sda gpio bindings

 arch/arm/boot/dts/cirrus/ep7211-edb7211.dts | 4 ++--
 arch/arm/boot/dts/st/ste-nomadik-s8815.dts  | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

--FVwHWn2AG0eyJRbl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmi5YBkACgkQFA3kzBSg
Kbag2hAAqxotRdcs2jDfUxL9ubnQ3k/TfkhqOEeU1mI7gF/zyC/egI96lb496+F6
Z4eatokRljKjTBvsfZefc8ppw+/JipizoFqZNSyqWeAMj3dXpFTh3KXkIBo7zRxl
mGcHl5hYkFiR2E+EuCPvMP+CudsqnkWPOMT23JDsWquEmfC+zGEjFbUpx/d1MlPW
sbsYvlY7Jep5WcNDwjgHVejf+XEnZNgsJnbmZUPuNhyFVXLQOQQheRqV/GyoQthn
UFQYBQt9ZL/lbR+timthvUuXP+6CGcdeVNk1AzO0DBjNbbyV4UweCiM8KaLFSRa0
WlOQUSg1sQh2ZPcZ2UURyt1NpvhefA8sw6K7NZZwXn7irkY2skmesElwSfZWcePH
+7wBwlZN+B6U3Lx18oWCrp6TkQhhBkSXpNhXbYSFttOmgsE8iBFPasfwarX1E6A+
epiPhWLYR+MvamKftL+A5EdA1m3JL2fZcslNQlrdxWC+xMag4+hNzWRvjsVuI58f
r7EP1IejZ8YZSljzXS/U+onzO7AGoFB3Uktk2r7/ztCW9t9ejEAWpEl92HJVnxyf
0lr+ZEwAtX9SH0b4D2Bk/QWxBN9k1Es/FtqnCjTsvcK4DiTaz29zYdWQyL+xmBtW
UblRFgKUZvJ9UCeYC00A+oDPOCVudy4G1FXgTDwANfFt6SRdd+k=
=1Vdc
-----END PGP SIGNATURE-----

--FVwHWn2AG0eyJRbl--

