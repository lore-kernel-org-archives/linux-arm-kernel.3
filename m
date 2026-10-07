Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1572FCA5FFF
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Oct 2026 08:25:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AV4b7TDs1QryDsNnBsMpSOE1EhNt5PGbHrDuxEwaO6I=; b=trQPbuYOR2cbTlN0F0Tj226GB8
	K7DW6qpg4ENZo+moi1kXwut0TSLw0cR691sgI5IwFoDgRdPNdLRHB8H8aUSVu1UREG4KjJAwD/eD/
	KfFXdOYPekOicx2MMs/SnwRt78VMQQo+ZavzfOPKsp6E4XaC1Q/X2iA6fwG3GAFDA/tSJzo9bo0+z
	0/XpPP6OagDIZYQUIsa0Z/IKmEqU0pbmfEGr2qFta4uKB8PhAtSiwtWXd36Grx9HKr0vYOKVuGtoQ
	+4itBB8LRk6LC0ZzyCmzja5wqV04P0mqykuc8iAOxsqxntDGkjRiC9fpZBxdh1d5awDxlij6d7hN2
	az3KAxaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEMxj-00000001wGo-2Qie;
	Wed, 07 Oct 2026 08:25:19 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEMxh-00000001wGf-40qq
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Oct 2026 08:25:18 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 590AA43988;
	Wed,  7 Oct 2026 08:25:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12F891F0089B;
	Wed,  7 Oct 2026 08:25:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791361517;
	bh=AV4b7TDs1QryDsNnBsMpSOE1EhNt5PGbHrDuxEwaO6I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=cM9wvGugpSdaZ5yqOKIpgSEImCOyhgX/aqN0dRZZwYkqtXanohguE7EG4YMPqofBX
	 wDUmc9VG72VFs7i7xER+GCnio/TN2f62vDeUQAwpYm87chX+UMTzine/AFMyMx5rtF
	 vwkFLptmcPwTFyTbJnfRyRMIwz/LMFNDQhoOuqgU/+K+k3RMRquU9cE6SwDsjFr/FR
	 SuuNR9JmnaW/nVR2qR1UH8b+WccXxEGZvbSIhs7s932CtgeOBA2bHTRZOjZC9UrSuG
	 gkRicdv6u4k629MTLyYiA+mf568KIPGeLat/nT17KlcB2av7qoLNMFHxjQStOM2CDu
	 4DcoFUp86da1g==
Received: by traversing.sirena.org.uk (Postfix, from userid 1000)
	id 41C82186248E; Wed, 07 Oct 2026 09:25:14 +0100 (BST)
Date: Wed, 7 Oct 2026 10:25:14 +0200
From: Mark Brown <broonie@kernel.org>
To: Jeremy Linton <jeremy.linton@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kbuild@vger.kernel.org,
	linux-modules@vger.kernel.org, jpoimboe@kernel.org,
	nathan@kernel.org, nsc@kernel.org, mcgrof@kernel.org,
	petr.pavlu@suse.com, da.gomez@kernel.org, samitolvanen@google.com,
	atomlin@atomlin.com, ndesaulniers@google.com, mark.rutland@arm.com,
	will@kernel.org, catalin.marinas@arm.com, ardb@kernel.org,
	Emanuele.Rocca@arm.com, linux-kernel@vger.kernel.org
Subject: Re: [RFC 0/3]  kbuild: modules: Fixup arm64 BTI relocations
Message-ID: <asYB6uwzbNTGv2Td@sirena.org.uk>
References: <20261006221815.2823252-1-jeremy.linton@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="VDG7eEdWMOyvQRMd"
Content-Disposition: inline
In-Reply-To: <20261006221815.2823252-1-jeremy.linton@arm.com>
X-Cookie: Use the Force, Luke.
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


--VDG7eEdWMOyvQRMd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Oct 06, 2026 at 05:18:12PM -0500, Jeremy Linton wrote:
> The kernel module loader, the arm64 ABI, GCC/Clang, and the static
> linkers operate with slightly different assumptions about which
> functions require BTI landing pads.

Ard has a series which resolves this in the kernel's module loader:

   https://lore.kernel.org/r/20261005110511.157016-4-ardb+git@google.com


--VDG7eEdWMOyvQRMd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmrGAeMACgkQJNaLcl1U
h9Dtogf/YeJAfcWSiZMI18mNhDCluml9tNwRZyaPkGqGdZCujAmo2HpwPGHBAPAW
SNs0juN9tLR2gBo1ZAspzv9k4/Lq2jIjpEisTo/A9Nht6ZPu3ZWExOhxbwgEYt1O
QARJYk0lnSzJSZpys5PKXgfj77xTdaWsgRoExp/YL9+Mg5ORQuf0DJSUR9gUxRnX
FZCCZT8CF3AqbsL7xb6eJnmnc6auqEIEFtP1U5m2+LP5fuEu3lcbmNNIcM5BXwoo
aJuRBaomHnj9o8OfIKFuaNkU5ILBhYkB1Q627Jm/pVojaSEozyoPadZRfvxQAl6Q
/TW1oq1yrf0NpN8S9Fqa+kOGIexbZQ==
=Kq5m
-----END PGP SIGNATURE-----

--VDG7eEdWMOyvQRMd--

