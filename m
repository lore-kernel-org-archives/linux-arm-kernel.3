Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9497C5AC80
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Aug 2026 11:28:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=76OBlRllQukl2KGsIFbL9M0f00XohXpr6dJeM2RToIU=; b=NLao0aPLcvnBAwxa+ZotdNz2s4
	IKz8pkexm4JqEK+DTl23UYxm+yYor2tfH88v8na/Lbj2kDWiEY6vEDQMpjJFawNCjnLjsKTN9HLZG
	IF/HfD/0+WKmrUoT4Rfp69BnXqguVo1Tc6rFzeqMlFw0+ZPAlvW79+2npo85MdFotAEbWrMuWEfj0
	SDVgODfPCe/JUTU9h1jTLJDM+/RERgUt1yqnzF9UnhWh/wPcBAYYd5QpibEhqpwoTU0dF78iyq4uX
	/ocj2z7o7GvDZmFdZag3GeWBH4ZPJBuhEN6WA0k7x1DidyCDeWL/a9b72wlHZ1JB0+aErHHiDfvPs
	NqENvBew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wt1h7-0000000AFKa-24tp;
	Sun, 09 Aug 2026 11:27:57 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wt1h5-0000000AFKM-1dsj
	for linux-arm-kernel@lists.infradead.org;
	Sun, 09 Aug 2026 11:27:55 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 86F3E60008;
	Sun,  9 Aug 2026 11:27:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78F671F000E9;
	Sun,  9 Aug 2026 11:27:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786274873;
	bh=76OBlRllQukl2KGsIFbL9M0f00XohXpr6dJeM2RToIU=;
	h=Date:From:To:Cc:Subject;
	b=eP9C/3y6y24WOmJTrwREp2bGdkQsVCDXU9zaHcS3ctuvP+2Few3IExLP7Xj03rdge
	 8u4coxr45PMVFBhQNKMLJAWxJD9eJJSLRch0vYBO7g19aQWVh+A53U8XTdqIDdj/9z
	 ggQDMhV9OJCRH27bQmKHeXkKrn38cA1Jjx3idtulwel6s2vq0kHyQxX/l5FTOdnIDT
	 GSA34qrY7lM5h74CDeAYWpqZsMiXEaMmEqMbUWBOYyvGWRueCqSBF4eGkIPfeVaIhi
	 Rc4pKpwkyj6aXRQkIQzRT6XnOdBGYTnmDOcvBoOe2BofHC7shygHv6xT1EsFu1lIas
	 DcJD1N87h57tQ==
Date: Sun, 9 Aug 2026 19:27:48 +0800
From: Chen-Yu Tsai <wens@kernel.org>
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
	Jerome Brunet <jbrunet@baylibre.com>
Cc: Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>, linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
Subject: [GIT PULL] Allwinner Clock Changes for 7.3
Message-ID: <anhkNLxcGaC41mgN@home.wens.tw>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="UlXJQYnsTt8nLmxn"
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


--UlXJQYnsTt8nLmxn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The following changes since commit dc59e4fea9d83f03bad6bddf3fa2e52491777482:

  Linux 7.2-rc1 (2026-06-28 12:01:31 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git tags/sunxi-clk-for-7.3

for you to fetch changes up to 0a136efc0fc2d53b1b1389b3c3fb0f76edca38bf:

  clk: sunxi-ng: sun6i-rtc: add a733 support (2026-07-24 00:02:02 +0800)

----------------------------------------------------------------
Allwinner clock changes for 7.3

Some cleanups to the Allwinner clock driver library and support for the
Allwinner A733 RTC clocks added.

----------------------------------------------------------------
Jerome Brunet (9):
      dt-bindings: rtc: sun6i: no clock-output-names on h616/r329
      dt-bindings: rtc: sun6i: add sun60i-a733 support
      clk: sunxi-ng: fix ccu probe clock unregister on error
      clk: sunxi-ng: sun6i-rtc: clean up DT usage
      clk: sunxi-ng: mux: remove unneeded export
      clk: sunxi-ng: mux: fix determine helper rate propagation
      clk: sunxi-ng: div: add read-only operation support
      clk: sunxi-ng: sun6i-rtc: split main oscillator div and gate
      clk: sunxi-ng: sun6i-rtc: add a733 support

Junhui Liu (1):
      clk: sunxi-ng: sun6i-rtc: Add feature bit for IOSC calibration

 .../bindings/rtc/allwinner,sun6i-a31-rtc.yaml      |  13 +++
 drivers/clk/sunxi-ng/ccu-sun6i-rtc.c               | 127 +++++++++++++++------
 drivers/clk/sunxi-ng/ccu-sun6i-rtc.h               |   3 +-
 drivers/clk/sunxi-ng/ccu_common.c                  |  12 +-
 drivers/clk/sunxi-ng/ccu_common.h                  |   1 +
 drivers/clk/sunxi-ng/ccu_div.c                     |  31 ++++-
 drivers/clk/sunxi-ng/ccu_div.h                     |   1 +
 drivers/clk/sunxi-ng/ccu_mux.c                     |  58 +++++-----
 include/dt-bindings/clock/sun6i-rtc.h              |   4 +
 9 files changed, 176 insertions(+), 74 deletions(-)

--UlXJQYnsTt8nLmxn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE2nN1m/hhnkhOWjtHOJpUIZwPJDAFAmp4ZDQACgkQOJpUIZwP
JDBw0RAAqBX1aclBYmeOIN1wSL1Gx5Q/jCJVMsB8Ig3bmWxieYklkiNprHiRY8Fc
UyWZbTCcAjFj1hOj5OrMHUlojLys2dBFyWORlRn2MmlXN8AH+n4U7pwN9d6J8aW6
j+4AUMY2D8S3B7Y57qq3Swr5f/oBYdILCBSzEz3B8tIux3nJUWHCSUzBIFl/Zv01
GVUJBpNdC77d5/a6n4ZwEx2EyaznGdD7bF0ETPpSGMuOyhwyVUt1JggYAyRaA1++
FpvBiXoF0DqkBxYQg8tL94UfnQkebsL+CNy+3C+8rJGr4M5dmVpCQMGwIS03JBiJ
YqbFRofPiuOABgHgiGkMe20gVrcV/fBLvr1HyeTbo4XyrzXciIODPfoNKERv15I0
Pdk4deUcZRP+jDM8UK23CpPpDE0Yx/waPUKMh3efw8okXpXACVj4Yiov+B+f81u6
2bsKn8O3KPrn7VEScedbsMzQU+K9RudMl2+MXdsRG6Hn3jbWegDIHvFZkkEgFS9H
7NU/1V2zRJ9XN/lqUmmTd34i7paHMOKOLkFXPf/bTgvi7FwZcG/Szo4XmqLREHAW
qu4owZ3cl5GzLAGTB6oacE3mKx01mmpODW2Bv2xTtbekqhzZ4CN5tm8EyboTD5nO
8+2JVsJ1WOhEVLXg/bBsVdeRYWqBvsTZu0RhvcJL7IshZfjOspM=
=IhP9
-----END PGP SIGNATURE-----

--UlXJQYnsTt8nLmxn--

