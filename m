Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5696AE7716D
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Dec 2024 15:53:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dERsIp8tPP6UBc7oXjwNPGVHBsb0amguO+a1FAAuG18=; b=zQor1p6FeU6Yk+cJrUvr7ZwrNS
	jouTT9TYJePMeuAlqwZKSCwbx0DRfAk73wTDp8NcJlQUCYbbLW/6Fjlyj/j0ISUiwk1m/t1yvifar
	W6o71lr4KBKNPKr5dQhx8DnCJKLk1SOsk1woVY9lLDca9KtOpUed1T7frQxn+i7pIYxCn89tXg9SX
	pWnwP+z0d7bI+FJ3m8MdZlaGS/mhLn0PL8AEy7GHM+5IrGdsKoBxCLgj93MoJf+bWfELNlH/CRxGd
	I5BZmQy2zFkpDwEaJj+eOmALv1ysQ4of33aFrS6gZOPVFG3GvKQBFzhhZQ/PP7270CgRV+ZUhoOX6
	bVXGWRUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJEAi-0000000GdWl-2Fzj;
	Thu, 05 Dec 2024 15:53:44 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJE9g-0000000GdJH-3Aca
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Dec 2024 15:52:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id D5492A43E15;
	Thu,  5 Dec 2024 15:50:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73320C4CED1;
	Thu,  5 Dec 2024 15:52:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733413959;
	bh=dERsIp8tPP6UBc7oXjwNPGVHBsb0amguO+a1FAAuG18=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qo2GyXoT6wDZ2QYe4Qo0VoQgMoyqKWrYZxKnTo9kqONUlKcEhkuDqJwUpgnBTAe6U
	 HLIRDam9EaqDH33BMYnq+nZ5roxkSCLm0l0z1d6bdasYhZuWSX7dz5kR49LY9qOAkZ
	 gHizCodgge+XxZqcHumu+w0O9W92Hls518mpKISm0pAuW/xir9Q41j+k26FFmym5aJ
	 q5zyKcsbceUETA9Fs/U6+WOe7u7/m9c65UJb+j+/0TSFLjs6fle5+yWMZSh6BCKmYm
	 sHNMNnQYYmXg7xDc9pvi5dWUfEpnvQ8sytgaVpQ/UMLzWv2BvSRId8P8XM9ZcnoucO
	 +KA9oqETCKJFA==
Date: Thu, 5 Dec 2024 15:52:34 +0000
From: Mark Brown <broonie@kernel.org>
To: Mark Rutland <mark.rutland@arm.com>
Cc: Robin Murphy <robin.murphy@arm.com>, will@kernel.org,
	catalin.marinas@arm.com, joro@8bytes.org, jean-philippe@linaro.org,
	iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	joey.gouly@arm.com, ryan.roberts@arm.com
Subject: Re: [PATCH 2/2] arm64: cpufeature: Add GCS to cpucap_is_possible()
Message-ID: <1e967066-c89d-4b0d-b055-356cd688f72a@sirena.org.uk>
References: <68a37b00a720f0827cac0e4f40e4d3a688924054.1733406275.git.robin.murphy@arm.com>
 <416c7369fcdce4ebb2a8f12daae234507be27e38.1733406275.git.robin.murphy@arm.com>
 <051c017c-a60f-48a7-b09f-07f0f32e48e3@sirena.org.uk>
 <Z1HJiUg60kZP4zPb@J2N7QTR9R3>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="F/Mf2luQPazU5+IJ"
Content-Disposition: inline
In-Reply-To: <Z1HJiUg60kZP4zPb@J2N7QTR9R3>
X-Cookie: System checkpoint complete.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_075240_859036_612AA90B 
X-CRM114-Status: UNSURE (   9.77  )
X-CRM114-Notice: Please train this message.
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


--F/Mf2luQPazU5+IJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 05, 2024 at 03:40:57PM +0000, Mark Rutland wrote:

> In <asm/cpufeature.h>, only system_supports_gcs() and
> system_supports_haft() don't use cpucap_is_possible(); all the other
> IS_ENABLED() checks are for additional dependent properties, and rely on
> the base case being handled in cpucap_is_possible().

Ah, yes - I got lost in indirections while checking. =20

--F/Mf2luQPazU5+IJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmdRzEEACgkQJNaLcl1U
h9BXQAf/f+4Z3TtWSTR8bvwDVZvax9ZMbM1uwwp2GLZDtjBtjhDexKy3HJDeEUtf
ce0oxssvN755npxceLm4ANPv4cEaIxlPS4YVAXWEggLnKeJ7Cc4Z7yce7GU1xoth
FDdGLpRA4Pveg8htVRUtQrKh5PPNmgaoAnAlzqU1Y3xdymFiJES1oSwIMl7E8ocq
aSdSvUxRNUFhs8hca4f+294Z75oN/pNILeyBGfPXjWiazZRV0G9HVuZUNnRo0oPu
mkjDqKJEBBXdmdhj15B6QfbfbbV79ahUJTCjfrlHELUdILXm+bwNB2IUd/I5SVSn
RwUOSIsV1v0cTaR5BOOePyKSpVAzvQ==
=m5VG
-----END PGP SIGNATURE-----

--F/Mf2luQPazU5+IJ--

