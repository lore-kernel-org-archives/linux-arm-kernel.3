Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4769A1061B15
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Mar 2026 17:05:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rQBAiIEEggu8m01zbPxzjIlcT3opuPleKNK5cILRsHo=; b=29kjQIBjPdquJ4obTWmoOKkYVY
	nRqCoIs4g4G6aHGlltkmRFcuoO8lTkzjU71rvacYHRrLcE4smev3iXtkiegBuxLSfK8EF58Gl22ts
	Znwv/IjU/Qgj/KXFzGG6OvsXU0kbSml3eJ6d6avJwBi8/AtzdL8JKbDQwrkDDyQpXQLrmQZkZOV9b
	ZtBS9nEKEhDNPjrwCPrc+kpQcXl0+3PxLlkbtbfN3EAV53EG+76NBEh2pmLekhZUlJmgqly6RV2jH
	GQaDc9FQgtup3WOcw+7f1uLID9yq5NxEOqMHYtZ0VH20Pt6itXQKoeffiGQ15IxmkXTCSNT89pQe3
	/vO/gk0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7G3L-0000000Bg41-16Ee;
	Mon, 30 Mar 2026 17:05:27 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7G3J-0000000Bg3t-29dK
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Mar 2026 17:05:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9243760127;
	Mon, 30 Mar 2026 17:05:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59691C4CEF7;
	Mon, 30 Mar 2026 17:05:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774890324;
	bh=OFtDuFmsAEV2mQbq8ryV0+0J0YdGy5oZq6dDxXj1x3Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Tvxa/aqaN+wKCzER2P/+leTkpZMUSiJPc61rt3WJbW7IGVU8Iw4uPhyK78Gpcan24
	 9hHmPKOcK2A03Zdrb1OBgJQgMzvRkhDkwqQSBk/aYEU2Mp9QbgNj7R/4+NNQX16kC2
	 kzSjJ9Oq2HLYXJG2gUQg1+Pv3AvO0FIkWQMxz9aY0pwvu3a+7temfgn+7ZLfN2z7zI
	 KQ7qoX9BT9V+4601dsGVG1gga7DX+DrJuVG8aRqCyfv2TIUSoBoBGoV3Aa26qteggB
	 pkRlekyM3lUArwuaw1F8w31mEzIA/RLPqn4mJCJl6beuSck8ITp/ku7lOkDBP07Ca/
	 SZKmCZBr8HsgA==
Date: Mon, 30 Mar 2026 18:05:19 +0100
From: Mark Brown <broonie@kernel.org>
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>, Zenghui Yu <yuzenghui@huawei.com>,
	Sascha Bischoff <sascha.bischoff@arm.com>
Subject: Re: [PATCH 00/15] KVM: arm64: First batch of vgic-v5 related fixes
Message-ID: <687585f6-8948-4e71-bdb1-44af69417ff6@sirena.org.uk>
References: <20260326153530.3981879-1-maz@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="FEqMr0d8osX/JtEA"
Content-Disposition: inline
In-Reply-To: <20260326153530.3981879-1-maz@kernel.org>
X-Cookie: HUGH BEAUMONT died in 1982!!
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


--FEqMr0d8osX/JtEA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Mar 26, 2026 at 03:35:15PM +0000, Marc Zyngier wrote:
> Well, merging the first batch of vgic-v5 patches didn't go smoothly at
> all. We initially found a couple of regressions, but most of the crap
> was actually uncovered by everyone's new best friend (enemy?), the AI
> bot sitting behind sashiko.dev [1].

I threw this at my CI, nothing blew up though that's not testing any
GICv5 stuff particuarly.  FWIW:

Tested-by: Mark Brown <broonie@kernel..org>

--FEqMr0d8osX/JtEA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnKrU4ACgkQJNaLcl1U
h9AW3wf9EdXqIBsaQlQwQxuOvZ3k/PpuS/CZNW4ACvUO2DScpqwdQ0kqubK0wzr6
Kr0C7MKhZYadbDGhFYyVzPe7xXv4eCLm9UQgW/cxz+81H0eKEYqHEadi5vqcpx7h
CdL85S6ZoSQmX4MQAB3A7qgH47+a6ZCpklKWnhM07hSYdO4eBcLtDz3GgsC+gLIA
+ShtQ+egZ3fNVCGqbxCKumRMT3kB9p83xzlOZahLP/S9ZwMRX0KMEdbTmTlA0yUE
ZsN5c7jW6Ab6rQcwgBB9spUYPZ3eF6/OosLMDBupD/eeFtXazmKw+7D4ws+ha6nJ
5n6SHqstbRQoNg0wohXPl169w9a4Dw==
=eT1A
-----END PGP SIGNATURE-----

--FEqMr0d8osX/JtEA--

