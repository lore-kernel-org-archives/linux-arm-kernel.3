Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55A6FC83F36
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Jul 2025 19:19:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=0wdzDfNo6t4GtAMMOS9zdlNPM5eTe4a8LKhRf+azlUo=; b=26aRtIVYpomYRMBNOemmt1PqCi
	Mp4uier/ZbiXM1kD3PcwyYYblrALLgvBCoxBhJYyvqGH4PBtpqY8+og4kc5Na5Amfloer0iniZ9gA
	iBKb1pubrK9UD9cik6EbJCXi7/klwQZSnY4wMe5MX2cSskqS6SAeJGuNf2cZf/+XHj0Vf61WSe/wE
	zlZfNh5TMsXQwVncHCZ4d92BCcWLLIIfUkLuHdJGsxOOTY7wSyv2DuStblwm/FEdIEQJelyPx6gtK
	DwbW42wTxyO+aq2N7TuWrF5IiI52/ScFMJKb8QX0wU5hXSKOK1TrIf61j/L5VEMFB4QNW30C1oLCn
	LPkjUa7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ublBc-000000061eU-0s5R;
	Tue, 15 Jul 2025 19:19:32 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubj34-00000005nHs-11kA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Jul 2025 17:02:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A727961465;
	Tue, 15 Jul 2025 17:02:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39E73C4CEE3;
	Tue, 15 Jul 2025 17:02:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752598953;
	bh=aUCJyXQ5/raMpoER4Fy00O2WoEBZyeIcEdSA9QVD9g8=;
	h=Date:From:To:Cc:Subject:From;
	b=BIryMHG7k90MxQfXIHYMyS/lpgobYPy5dq1BV1SZYWXDJYLKmPQXV2CDjvJGHBcK2
	 8GtLcL6m3C1lBd8K5lq+mwygA9wYoMBgF9rAaVMeZCV6XAHj+xk5if3X6p8Yt++pWI
	 frzxamAnIkBOgTaYO+XP1KQ9PltVIfpIYHgs+9ecXB2Q8nKh4Ljaxf2+d8gAKN5Rna
	 FGKwfgB1F8vMG8az2IQf00lu7TSh21C0RsbxYXerX4j9m0PmDSGw5hAKwdzP3g1iA4
	 yi/8yb1q7JoOC13cFhcPCoBhEm+/KbjZS9oQJOCTNuUbrfSHJWYqWE+N0W87hRCFHM
	 aLtxluZYYUKuQ==
Received: by wens.tw (Postfix, from userid 1000)
	id 07AEC5FB53; Wed, 16 Jul 2025 01:02:31 +0800 (CST)
Date: Wed, 16 Jul 2025 01:02:31 +0800
From: Chen-Yu Tsai <wens@kernel.org>
To: soc@kernel.org
Cc: Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>, linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] Allwinner fixes for 6.16
Message-ID: <aHaJp8ut6z9Ds_qn@wens.tw>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="RLQuYqrQwKO1rDBZ"
Content-Disposition: inline
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


--RLQuYqrQwKO1rDBZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The following changes since commit 19272b37aa4f83ca52bdf9c16d5d81bdd1354494:

  Linux 6.16-rc1 (2025-06-08 13:44:43 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git tags/sunxi-fixes-for-6.16

for you to fetch changes up to a46b4822bed08d15a856966357a4b12273751cd3:

  arm64: dts: allwinner: a523: Rename emac0 to gmac0 (2025-07-09 00:19:44 +0800)

----------------------------------------------------------------
Allwinner fixes for 6.16

Only one fix:

Correct the name of the A523's EMAC0 to GMAC0, as seen in the SoC's
datasheets. The matching DT binding change is in the net tree.

----------------------------------------------------------------
Chen-Yu Tsai (1):
      arm64: dts: allwinner: a523: Rename emac0 to gmac0

 arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi          | 6 +++---
 arch/arm64/boot/dts/allwinner/sun55i-a527-cubie-a5e.dts | 4 ++--
 arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dts | 4 ++--
 3 files changed, 7 insertions(+), 7 deletions(-)

--RLQuYqrQwKO1rDBZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE2nN1m/hhnkhOWjtHOJpUIZwPJDAFAmh2iaYACgkQOJpUIZwP
JDC0cxAApv7b6yHKWL+NGNQHegSmBgNQuVo/m8wRxS0pOAh3aiwgf7tZmdZRUHVq
OhD3DzU7NOUBhr5A4t+ZLwASp6doe49D3jhqQdlJw3c0w6R5rVb+1rix9ulQg6sA
wXu7wCyt9soLWPohQ9m7TVWP4xi/WZDB9i6tTInNNXDBHafp7yf2uyB4YnlU/kzS
6oz1QcM11XDx3N/ULGMqrGdYYf+lvHlAsZyqQRE9QYnnDgqJH+x9cAhM+brGKNSA
UEl6/yNBSc5GqTmk3SA5t/ISYNuVWS3kc7wvY5Jdbn1YRf+Gr/Dg8ODG0iRR+hr2
QI11WN9e9/CxcQ/X3zonC2hqsrlSTEjs9Hzu0yspGCSaYpIJ/L3zrwcDT4cRvUzp
tTvmUQu/CPH0IjTqddvzl4J5genhagj9htBvnxcMtNkXve6CnHFl/+GckZZQZwTC
t+iBuqqb3393hkErefqDbqrwbKS+iMJSENYjPLnKIK4nLy4VpAY168A2TzCbPTkK
20HH87TTy13LnFG9Pd56LKbys7rSCGYBYtk8p61rqjR67GaQdC4F9Jt5a76IcRlo
XlS226w8sz79CQ98axn8uTIbx+HJnvdS3zV219cwtOAEQUNKp0koxdSYGmYWMkyk
9JpgiYkt8/KHwVDqF9UrRJaLmBjmHcL7xkqP+0Zpel6VTsD2SiM=
=8no+
-----END PGP SIGNATURE-----

--RLQuYqrQwKO1rDBZ--

