Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5A96CCD184
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Oct 2025 12:35:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+tDudZUHvl8k24xVpvdCqu0hRwQS3DHiCIYgfQZ1jks=; b=LtHaZHeeT+SWRdQvpL1QaSRCJ7
	G3wDSRTcnyWtx5IPueCea/MiGHl0aUASBRdXI8NMfecqqKfKmEGJEKTwANCkUogRFlYHJrJgQdJRV
	OBeDqRa8lp1wlV0HWqwhhg04dVBVINnCamhSwJoQWXpLOyGc83O2hZPxjl/s4yCs6/cXiCaRXPzub
	CeDhugShq5ZCrVDVTJpqjXBbu9HAfcOYfyNQidKrlptL12ctZVGqQHmEngYyrgQIQxh7IT/0vFshf
	kbqCeOOnmhtqSiYV6Okc9WNxj4lGM5cMopZWeqy1FBc5BvdKDmkGBSRAKrsb9CF/62a9PejLRlBkD
	caioQ3YQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8eFM-0000000GGYl-2pjD;
	Tue, 14 Oct 2025 12:35:20 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8eFL-0000000GGYa-2mac;
	Tue, 14 Oct 2025 12:35:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 33F86622BF;
	Tue, 14 Oct 2025 12:35:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4438C113D0;
	Tue, 14 Oct 2025 12:35:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760445316;
	bh=OglqYXM5gyVnfpoYuVb+zV5hz/W1Vl9+ARMyr+0WbGw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lRx3vTWNBxv6d5kpQ7a+9oj+0o7lHIZ2qIzdRfQ4B2vbByNg7J2Xi4OJZclAzcVx/
	 J2IAggSjs7wYlXqSaBYxSeXHuoggrkJ2HG9zsOPnMCDszeLhfMObE2hVGHfLKe61NT
	 CIjZ6/syIKWmkLcpNm9nzmEfA/dQLuG4tCxL7a51qDcfatjBY04jtHBEB5LYUNzjFx
	 X0VPhvtIYqTduRfMP/SEIdwcGumSF9YR0Js1EqDprBGu73IXGirDu2ibMC7/BqxmGA
	 T7nx8YAxgFor4ii99Cm9S2/sxeOKgJeyR6ZnKTgfuibcBoTPmsRDX3DHvLDVVtnSzv
	 Kp38JB9W+LMdA==
Date: Tue, 14 Oct 2025 13:35:11 +0100
From: Mark Brown <broonie@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	linux-mediatek@lists.infradead.org, lee@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, matthias.bgg@gmail.com,
	lgirdwood@gmail.com, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com, wenst@chromium.org,
	igor.belwon@mentallysanemainliners.org
Subject: Re: [PATCH v8 4/9] regulator: Add support for MediaTek MT6363 SPMI
 PMIC Regulators
Message-ID: <bcf1004d-802a-4b48-9aab-0a4e39274037@sirena.org.uk>
References: <20251003091158.26748-1-angelogioacchino.delregno@collabora.com>
 <20251003091158.26748-5-angelogioacchino.delregno@collabora.com>
 <5635636.31r3eYUQgx@workhorse>
 <ac809179-7192-4218-8b13-86b9252652f4@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Wn5Uvbbd3mnsI5Zl"
Content-Disposition: inline
In-Reply-To: <ac809179-7192-4218-8b13-86b9252652f4@collabora.com>
X-Cookie: Go 'way!  You're bothering me!
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


--Wn5Uvbbd3mnsI5Zl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Oct 14, 2025 at 01:35:37PM +0200, AngeloGioacchino Del Regno wrote:
> Il 09/10/25 16:41, Nicolas Frattaroli ha scritto:

> > Just initialise ret to 0 at the start of the function scope when
> > you declare it. You've already missed an uninitialised use once,
> > and playing these branch games is just asking for more trouble
> > in the future. There's no micro-optimisation you're doing here,
> > clang produces the same assembly for both zero initialised and
> > the else branch version you're doing here.

> It's not about micro-optimization. Double initialization is a bad coding practice.

Yes, if you just set the value at the start of the function then the
compiler won't be able to tell if you messed up the logic somewhere
later.  Sure, the warning is gone but that also includes cases where the
compiler is telling you about an actual problem.

--Wn5Uvbbd3mnsI5Zl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmjuQ34ACgkQJNaLcl1U
h9C5jwf/XU13FSuJxf8T6RtyRPNXGOvljyrxJ6DklBvAU42vkhAKd19/Gv8HQSYJ
vBoncLDbmzjUzf0Eo8ciSWrShl2MjmlDmg72ZTQpebIO+DszBkL6A2Ikreff9HcL
0OhH91cshDMWzgd2R00tC8PDORmTljNrqWted4qwYIbUrbOpZK7kfmgtXa/f06md
fX+/uU6SJ2ojk0apfoLg/avXygk0WgcSyelVofWOrXOQFqv7WDjHDjRBnBqavlK6
O0lOjIoOYcuNylri623mMDDsAWlxDQjST8SYW2vzxW51oVgi4ctPxzgnnmBwi4vq
LegSnOySQBMW+QhVHbhCEQt3pYf86g==
=YAVv
-----END PGP SIGNATURE-----

--Wn5Uvbbd3mnsI5Zl--

