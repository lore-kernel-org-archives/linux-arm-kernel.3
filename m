Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAFB1E9D800
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  5 Apr 2026 14:17:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ydEAhHuV6/y/2QorPhqEgSBAqzKGvm8sqOPTyZBK1JU=; b=1EoBCOjJDZP1mR4tye1boJDI9C
	zKnsuQLRSgCPxeZdDIHj6Et9DDLC+Ct4MDVYuCKEtCbE14754N0dke7Rzc36GBx7YSMyyl12YN2Li
	Q+oek1etzFvWjmmgdkt84v4ivT/c7J6GKu69yAQL09GI00A9H3IiaGD4D4sg4czflzf1qTUz12L7B
	jDp4qE3xLcBbOvGJmxhfiRdZWnNOFklJ9HYW6DpAhh+R7rkMBn6wRMZDOUhN6cQK85lI7tQsHWWeM
	tdLFsQ5O4wHBmaWBhb/JAntUVtqVYxlRpGqWgUeBALf9DW8o2FeiDGAyMmMyLegvSe20+lCfMu8rt
	oorIhjoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9OIC-00000004FFI-1qVF;
	Sun, 05 Apr 2026 14:17:36 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9OIB-00000004FFB-09LQ
	for linux-arm-kernel@lists.infradead.org;
	Sun, 05 Apr 2026 14:17:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8277D6001A;
	Sun,  5 Apr 2026 14:17:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6424C116C6;
	Sun,  5 Apr 2026 14:17:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775398653;
	bh=9U9WUsLAwWkTw5pQIvu9c5gbXcp5l5B+VOel5/9aVmY=;
	h=Date:From:To:Cc:Subject:From;
	b=uHediHjYpa0ho5eVe6TQ7yGqI+eLes22P1nbtiBXZJGv/OaH44Pm3obIS50r++tsY
	 pt51dzu2Lw6zP6rO9HNKcGOF+qeKuJZ8fiJTpP6z+NBNjncLWY+1vj63xgOekn0NnW
	 paL2Vn7MyayzeyDFWo6YW99CzyTniuSRKUnFLFsJU5Oq/XUmWp5zUB/ktfynqpqcGN
	 fEWRbmO1khvAbUyhQPRY+IyHdrjaLYIGg4gTAd27ui6P9hENOqwGi7UN8UVFmBi165
	 raFl7skbcXTZhAsBeQ80KjmbHG3lr8SlxJfIt9EqkjnhM794cpkJI6MZBwBJKfIi05
	 qr2t3c3XX7VCg==
Date: Sun, 5 Apr 2026 22:17:28 +0800
From: Chen-Yu Tsai <wens@kernel.org>
To: Stephen Boyd <sboyd@kernel.org>
Cc: Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>, linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
Subject: [GIT PULL] Allwinner Clock Changes for 7.1
Message-ID: <adJu-NeYb70E-1yS@home.wens.tw>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="iK0ktflfZxsG4tRp"
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


--iK0ktflfZxsG4tRp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f:

  Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git tags/sunxi-clk-for-7.1

for you to fetch changes up to fb20ccf70cf695f178d7c32e2d33b376560df0ff:

  clk: sunxi-ng: sun55i-a523-r: Add missing r-spi module clock (2026-02-25 00:26:12 +0800)

----------------------------------------------------------------
Allwinner clk changes for 7.1

Just one change for this cycle, implementing support for the r-spi
module clock in the A523 PRCM block, which was somehow missing during
the initial bring-up.

----------------------------------------------------------------
Chen-Yu Tsai (1):
      clk: sunxi-ng: sun55i-a523-r: Add missing r-spi module clock

 drivers/clk/sunxi-ng/ccu-sun55i-a523-r.c | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

--iK0ktflfZxsG4tRp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE2nN1m/hhnkhOWjtHOJpUIZwPJDAFAmnSbvgACgkQOJpUIZwP
JDDZOhAAijVFzKd9NBwUv88FAjzYElGK7waUrgH5nFyyMQS2o2IraBPqBTuN4WDA
beoE6uuJxG6nikiJ01h5YVKQYS2Odxp+vWo8d2A+ttIc/eFDjtmxPsPqh0K8M6/u
7KdvgYyKYhOqoFOdiEM/3ABHThIyXgrZuVcU9tY5JzCnJFTVYb5Ta3gwLGF7rjIz
z2v35/wsWghdpoCxjoG05nWrX0fCu3lNWeybiQ+EYYm9ldYlGQ4bd7Bu2bzudje0
S+rig0W/ZTfeeDLLSIJoJll9BNy4K13Weaq8KdVn4XHp7iQue0JanBh7pm+7UzSP
L9T9hXtNj+Chf7wkP9NP2+0OznkF2gZmjBareeF5I3+n2lS3RxwkhUZRfOszfF8a
n10g1bx4Y3QV7JW3j9s+P3WGiubgd23dDpDdgkgOwNCOfHjDb3ZJ6v9Rlz4T5bct
r+qq728XoI0a/svGIgaCzOCOchPuJL/fohsDjvz6avBQv8ivj6b8FjzoxAVV0yF9
x7zR+XaTpXqkn2NHSr9KHJCumi01Zgac5kpN4Dhc6FZDqPZHTw4z+eeZFwrCCuRT
1pKs/Q7oAkIrf9ILQbOCL80IQWiMG7wp584TNCCl/HopLLtPoPAU9/o6OFf56K+Z
5uen/LuLCs0UasoAycKQWx3IqnX2xhQdFQ1F15NmgEvbcE3OblQ=
=7Km3
-----END PGP SIGNATURE-----

--iK0ktflfZxsG4tRp--

