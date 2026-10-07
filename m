Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB39FCA5FFC
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Oct 2026 14:36:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=IIr/Aoc1Hs3lvHLCFBiOMQidFB5bfl16umvco5XedmY=; b=eH/euTlBpjlRdEfWEaPhwaiM1i
	XKNDD5m84aZRkdb1VANTsjeYcfaSdJRXK6QmbqqeqBX1VOhzHZuoVfXsIq2qJILr4AjpblHZUGM1u
	CYilzr3s8j0pESxMii/jA3A1B/SvZE7n/lr9PYk0EfrN0dtPHRI5LEMtRk3o3jOpuhI2ax5V6d568
	z1KkaBo0dphKs3dLdGoFF/9Mq++Z7EblsBPTbZ9rQJ4G5agz2r+qAIL19vATwuttvRjkZkyKil2Ye
	hZ2F8j8Hsfnu7lV/tq09xgD4S7eNF+lCTU7yZQ/g7/WWe4rWf3Z/t9DdOjEjWrU/tuYhGstg34/KR
	eh+gsGtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xESkT-00000002cvP-3iPb;
	Wed, 07 Oct 2026 14:36:02 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xESkS-00000002cvF-3reJ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Oct 2026 14:36:01 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 39EF6406FD;
	Wed,  7 Oct 2026 14:36:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DC5A1F0089B;
	Wed,  7 Oct 2026 14:35:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791383760;
	bh=IIr/Aoc1Hs3lvHLCFBiOMQidFB5bfl16umvco5XedmY=;
	h=Date:From:To:Cc:Subject;
	b=GBLPmq5rt9Jn/3UM0qjTFoHmGIKVO532Wu6JkLg3615fh9nHVSEPk+MkSaXxFpQMZ
	 niiv33Fbo7mrpHbhn1LSTWtELRUAdNfJALbn8ek6oMSfKXjLgTFt6u/9sBIl/x6WfS
	 PNjRpTjG4Erv8axilgxq43+f+ngulcAw0WouGa+Yrz+e0nJ+1awAwtJfxS8WzTgYFB
	 Bax1oYRSWQJWbhcEN3LupYcNA52XudAni4hRKJ3tiJvJLpfd9Rq9W1RYI5iuPYqbWN
	 S3nNhf0mee8BbhNJoQdllOOZVgpDOwsnpK+I/hxL4cR+cQVUfW1W0xel73SmaH8KQA
	 ongfBcoZ3PJ3w==
Date: Wed, 7 Oct 2026 22:35:55 +0800
From: Chen-Yu Tsai <wens@kernel.org>
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
	Jerome Brunet <jbrunet@baylibre.com>
Cc: Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>, linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
Subject: [GIT PULL] Allwinner Clock Changes for 7.4
Message-ID: <asZYyy4D2PkhjE3q@home.wens.tw>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="1oyjFqg1TWnhEdcA"
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


--1oyjFqg1TWnhEdcA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:

  Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git tags/sunxi-clk-for-7.4

for you to fetch changes up to 9ef62592b80c7ffb8cd987d889f659c1dc4f9f16:

  clk: sunxi-ng: ccu_common: Use readl_relaxed_poll_timeout_atomic for PLL lock (2026-09-20 17:32:54 +0800)

----------------------------------------------------------------
Allwinner Clock Changes for 7.4

Allwinner sunxi-ng clk library's single divider clk type gained support
for the update bit, and various single divider clks in the A523 driver
are converted to correctly use the single divider type.

The "wait for lock" helper is changed to use atomic MMIO polling, as it
could be used when timekeeping is not available yet, and *sleep() doesn't
work correctly

----------------------------------------------------------------
Alastair D'Silva (1):
      clk: sunxi-ng: ccu_common: Use readl_relaxed_poll_timeout_atomic for PLL lock

Junhui Liu (4):
      clk: sunxi-ng: div: Add feature support to M clock macro
      clk: sunxi-ng: sun55i-a523-ccu: Use M-only clocks for MBUS, IOMMU and DRAM
      clk: sunxi-ng: sun55i-a523-ccu: Use P-only clocks for high-speed timers
      clk: sunxi-ng: sun55i-a523-r-ccu: Use P-only clocks for timers

 drivers/clk/sunxi-ng/ccu-sun55i-a523-r.c |  37 ++++-----
 drivers/clk/sunxi-ng/ccu-sun55i-a523.c   | 128 ++++++++++++++-----------------
 drivers/clk/sunxi-ng/ccu_common.c        |   2 +-
 drivers/clk/sunxi-ng/ccu_div.h           |  18 ++++-
 4 files changed, 89 insertions(+), 96 deletions(-)

--1oyjFqg1TWnhEdcA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE2nN1m/hhnkhOWjtHOJpUIZwPJDAFAmrGWMsACgkQOJpUIZwP
JDC4ohAAissvzueqOTIR//65cJgKfRBNeqoxHplC0NeBFOUgYJqSPasSkstRD1I5
kCKz+00sKtPE+PCUB3PO3QzjOVv8BgeX0qDxjlvWc7GilD/Lz8dUXeHO8S12Gs6J
Cnvy9hg0i9frMxclrBfKzSP7uLCpcqI0qHEnKdbNgzLTTEm2MtPBXKhn8su7jI22
yORwt+ZhXFUztAQusXZ4d5P5xBTkJDE2ad63Mi9o7LgyFmawOu/lsDJV1090szLg
HEWpKg0SgcEoFGhRs2OA1ZVkOUl0rt9r/I/NxvX5XUbfPOF5T+hRmNtB3m4XxG0C
62UgGCseWIkVdyC4OFogJcG4iMHtWMtUZeWIVisfGRdehrlzljVittCjJrT2J2sS
jKdgFwNHEe/NYEQnHrwlN62Jm7pF8r+h2o69ZN8p3nOsYwhHhioSPhy0ksOqYvDT
o94pbMQOxaCBMWez0MoarttrDnSCQFDnNBIaVvEZSunI3LQHDSzx5XzO+jaH5rUH
LHwiZwJfat0fTDk3T6jmfNK5SE2xO0JwmLZhTav+hO8J6ND73zEmplpRU2AG2n89
Gs07Ah/YMRWD5GWOUqtSc9eQyM0tQln5RpFPIWrclIJEjXf5yHA/rOQb7v3dF7rl
G8Wq8w1nGo3q4Ew6iReWbxhtpVuPnQflIIat6JlL3rKBeniFMCs=
=R13c
-----END PGP SIGNATURE-----

--1oyjFqg1TWnhEdcA--

