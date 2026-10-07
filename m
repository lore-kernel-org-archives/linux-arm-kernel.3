Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 214D9CA6007
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Oct 2026 14:37:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=sIcv331wntNvMfBhP0jH3BFhPY14ilEwGB4AgDf0gDw=; b=VLvnv+Ha8sGC2Zv6PJ0vdQCak9
	PIdZZa6HTrtiHJLe22BAci3ZFeHYVmRO251VXPvv5Dk3+8jdcBV3n3LAvAE6VJqO90RfCsaL5hk5r
	uB9v8GqIKE11YCpHADEF4Aov0Nl6zzpoFWUJun79U7ixVEMl5zU3OiPPbnkizlcZKmufaxdB4PULA
	Sg1h+aTtfku8blG1IOf2c+TErh9cE98Ayk0EgpZ56egF8RxE+5co1Nm8kbqU+Czcm1KgsRPXl8oaS
	svRz1sTzDilnzJra2w9V2bZoLfPs6dFR++PRsoovG6wKAtmq/QtqVKAYjSNeQcHAwWm6Ky176vO7T
	56dP2dcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xESm3-00000002dAD-24R4;
	Wed, 07 Oct 2026 14:37:39 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xESm1-00000002dA7-43ND
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Oct 2026 14:37:38 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A79C5418CD;
	Wed,  7 Oct 2026 14:37:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C13C1F0089C;
	Wed,  7 Oct 2026 14:37:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791383857;
	bh=sIcv331wntNvMfBhP0jH3BFhPY14ilEwGB4AgDf0gDw=;
	h=Date:From:To:Cc:Subject;
	b=jee8JM5Is6ioiatnT8WCeH8cVVygoBaSeClOvKBrFIG4byCR3bo+bY8KlfXjAutcG
	 JtaVGigOhRpRkVVg+w+yRjMPOh7VAdxx4wjltjIru+enJC+4AgYn8NxtxcLAvL9xuU
	 sUzWaVLstyfsR7q0VV1hsFeJwCAe86XIsNPBtgj18Yk2GXtlYQB0SdGfg5BwIkYRey
	 g0Zu2wHg/UKFEINFHXFiIc+d20sjFKxcW9eJsnNp54AB1SvooEh7+dOkzIBfv62PsT
	 3hCqMtbLp2mE6V253nKxsd8AfBRPp9lrX9nbboF1m/mNtI+L2RMF/6WY2qXCyFFL9V
	 3AR5veNkagYWg==
Date: Wed, 7 Oct 2026 22:37:33 +0800
From: Chen-Yu Tsai <wens@kernel.org>
To: soc@kernel.org
Cc: Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>, linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] Allwinner DT Changes for 7.4
Message-ID: <asZZLRnqygKV8hMl@home.wens.tw>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="BDuy6gkAhz2wqgtr"
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


--BDuy6gkAhz2wqgtr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:

  Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git tags/sunxi-dt-for-7.4

for you to fetch changes up to eabc3c090e81ea329b2c7530ca655a70228dfaa4:

  arm64: dts: allwinner: sun50i-h616: Add video engine (2026-10-06 05:27:57 +0800)

----------------------------------------------------------------
Allwinner Device Tree Changes for 7.4

Main changes: H616 gained its video codec engine, while H6's video codec
engine device node was corrected. OrangePi PC2 got Ethernet LEDs added.

In addition, A20 .dtsi got a whitespace cleanup.

New boards:
- Teclast P80 tablet based on A133 SoC

----------------------------------------------------------------
Aleksander Jan Bajkowski (1):
      arm64: dts: allwinner: h5: OrangePi PC2: add ethernet LEDs

Andre Przywara (3):
      dt-bindings: vendor-prefixes: Add vendor prefix for Teclast
      dt-bindings: arm: sunxi: Add two Teclast tablets
      arm64: dts: allwinner: A133: add basic support for Teclast P80 tablet

Chen-Yu Tsai (2):
      arm64: dts: allwinner: sun50i-h6: Add missing SRAM region for video engine
      arm64: dts: allwinner: sun50i-h6: Add missing IOMMU for video engine

Jernej Skrabec (1):
      arm64: dts: allwinner: sun50i-h616: Add video engine

Krzysztof Kozlowski (1):
      ARM: dts: allwinner: sun7i-a20: Replace spaces indentation with tabs

 Documentation/devicetree/bindings/arm/sunxi.yaml   |  10 +
 .../devicetree/bindings/vendor-prefixes.yaml       |   2 +
 arch/arm/boot/dts/allwinner/sun7i-a20.dtsi         |   2 +-
 arch/arm64/boot/dts/allwinner/Makefile             |   1 +
 .../boot/dts/allwinner/sun50i-a133-teclast-p80.dts | 205 +++++++++++++++++++++
 .../boot/dts/allwinner/sun50i-h5-orangepi-pc2.dts  |  22 +++
 arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi       |   4 +-
 arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi     |  12 ++
 8 files changed, 255 insertions(+), 3 deletions(-)
 create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-a133-teclast-p80.dts

--BDuy6gkAhz2wqgtr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE2nN1m/hhnkhOWjtHOJpUIZwPJDAFAmrGWS0ACgkQOJpUIZwP
JDB7thAAzfuPpQJgPM5QtwD7lAPzkFkl2siC+HZymBCvAjn43et7WNCVhOts+qtf
/l1eZGn9BDDM8rlgbqNTuTfrq6T7nxZLt2jxRfhKx1bXyZOqb4IwnzrV6PmDXEFg
xIJoSze93VCErjCbhkH6hMbbHM4oxQo/KLUwK8MJjTHdjZZ8UfPerbX6hgYZ9q3p
AcKC1jM3gvdBI886mx853wNlLGFq68kycX7hItpX3R6cO0Ql54jIP5Wc2WWoj+A4
F8oSVI295y4sfvfzIK8erNW6OBQ+7vFR8lymUwOp4DqhIXdwBu0uQD4OxrUCbTka
Y5BJ25gXS+fVE8fmtFdEGZHSu3oLL2/ZXUOycVEeO49ZaTrnl2xSxBmmMU2BFO3w
kv15oh2qRNy1XOZsxRthsa4+BxhJ9iwZX3vQV6ArSFxs86uaLoCNt5R8SShDqU6z
vwAQk0I1DbT2QWz0Z3rqH1zXWOoqR4T+0FK6vm1ISkmTdsW5onuj+ztQikthPcQK
nJrRoy58zN2N/n0un99JKPqEpclCW/1j4aqxi94JnxEGVUVtCBvqfDczQxnbBotI
gFcwMtoYAfXzDApfme7ZCE7IMTYiR+uAjpeZI5ZfPPn1exD2ZBnjZYPKBhM1a/gu
n5Baa2QN5Gr2jWHzcWd154wOZkBs7uhhUh81SGjS0n5RekpycHQ=
=bJ0u
-----END PGP SIGNATURE-----

--BDuy6gkAhz2wqgtr--

