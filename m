Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6C97C55182
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 16:17:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=A+cBZhhBZSCKE4IdtwhAxDZSjkPHDuynJdWQOz9V520=; b=l0noqYtTK+QIEjxlDtArQKzLrH
	czCMPjWn78UWRWxPjn5kZS9JhRCCtfiaSi2LcGx+6Y4rmkh4MhuvCYy76N6xezNeHwCfSqKfCnFSN
	Tzs2UjSKiNS6WhMwuJy1mOQjvB9RVlpcki7J3azs2oiA1XCIfyHX7n3z2Zh2U9DhJy782G1rpXf7j
	yfdNgJLvtwFOc4SjemP9rbenoZ5Fni8/+TRlQqZLZtLbE2QI5y6eeFEDo6Ovimc/gziaqClOUDJaP
	+LtwPT+sQiIdmPZ3SCheQJBWmMd6BXTQgD27HkT4ysiudmAi5/vt7u5t6ozc8pIiewIIHzIzfliSi
	bsZaO3Yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqvME-000000004Ax-0zKZ;
	Mon, 03 Aug 2026 16:17:42 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqvMD-000000004Ai-1i6V
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Aug 2026 16:17:41 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id D6CA860A5F;
	Mon,  3 Aug 2026 16:17:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3EE081F00A3A;
	Mon,  3 Aug 2026 16:17:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785773860;
	bh=A+cBZhhBZSCKE4IdtwhAxDZSjkPHDuynJdWQOz9V520=;
	h=Date:From:To:Cc:Subject;
	b=UOyKTfG45IPjNnMKWv7vUMmDrJgsSLTrKCOAKvNBZ/KTPg4iqP3acA4sjyy7Q8984
	 uWIEQq/WxVMq999fB3M+Ps4JyMgddDPIgBwWBxUhkbRCsGFlPEF9fDez7ofD2USmYt
	 +lH5k4ReJhNQTNaYhNc1hS4wJni5SoLM2couTke2CTJLwZad4ZjEVXO1TLwW4lUP65
	 tWqZY4dEwQy5VMm7YTyzlv/PYMbRr8AV4cmTzehTsHxoowaAK92oE/b9wH7C1f9uXI
	 4fHHVzs0TgBRqoRpDC+mwP9q89o0kJi71wTLf9H6I/2YMT38Qx2pIRez9Oriskyl66
	 Mgs8+MTBRx/kA==
Date: Tue, 4 Aug 2026 00:17:36 +0800
From: Chen-Yu Tsai <wens@kernel.org>
To: soc@kernel.org
Cc: Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>, linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] Allwinner Defconfig Changes for 7.3
Message-ID: <anC_IPRrMwKHzc0e@home.wens.tw>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="N6IGr/i5M61X8Dyu"
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


--N6IGr/i5M61X8Dyu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The following changes since commit dc59e4fea9d83f03bad6bddf3fa2e52491777482:

  Linux 7.2-rc1 (2026-06-28 12:01:31 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git tags/sunxi-config-for-7.3

for you to fetch changes up to b4158103c45386ab30ba7624bee17ebf33940baa:

  arm64: defconfig: Enable Allwinner LRADC input driver (2026-06-29 23:45:57 +0800)

----------------------------------------------------------------
Allwinner defconfig changes for 7.3

Enable the LRADC for arm64_defconfig.

----------------------------------------------------------------
Alexander Sverdlin (1):
      arm64: defconfig: Enable Allwinner LRADC input driver

 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

--N6IGr/i5M61X8Dyu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE2nN1m/hhnkhOWjtHOJpUIZwPJDAFAmpwvyAACgkQOJpUIZwP
JDDWfg/+O6qUdq8k2l9tLd/v48ARXPwuUAiWsOYAAHyjp5dkPycUHAJJu24BCISB
hmJCm4BKCcuh8oc3qwzXcMACY4gLRSXwNOdyX9eiCVNbPbwZ9GTyt4fMc3Tn4FTY
5iAxxTKd72/9g0Q0cfjUffzBR2Ldk3SrLdu+UXQ/LnnCd9ihwbax9oerSvcapnuv
ixv8PW4QXXODUV4M4dfkgNLlCSL5d0USPI8eZdeyUoWzH5w2C/JiEA8UzGSLQfw+
pEZO0GHSYPq6X24spMcK1XjOf7hwxcPTh8LewV57cRm93Wl8NUMiTKMi/C3npkqm
l9GVRoCLn9WNad1DQ7OhssBpWf8shpV4cHyH4bBq23Gw06xaMrx1d2LmuqJYcxa3
NYj3TCrl0Uqxl3zRCVj3VRNZOlc3a9DE6cw2Y1vpzBGamLWfeQ+zrzhWK4bCUufO
J5LUwbpqv02xccbKkltyTQYrwmgeF0KfSPieSBugct1NVXzXGYcotsXJ3+BXiFUw
6YkPrWiaFyl7AxR3oT/sDsGgPLJzDdXskvKepSB07DOjIOZGX2HW8kL2jh4j1ryP
HJStaiEBUPB+Ztx14hvlHdSAVDkyGE1VWu+deuDcGD2oBtEECrRO8B4YyG/CP63g
w/N5izI4vmdMAp9EWHkmtC5BWO0Q40mN5DVtIM8W8cMteuyF9y8=
=b3X3
-----END PGP SIGNATURE-----

--N6IGr/i5M61X8Dyu--

