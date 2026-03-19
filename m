Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7368A1090225
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Mar 2026 13:28:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qeRMOmBWoU+udjskCvznZb/F9IJh4w9Y760n/htxYqU=; b=Y6/93xM+KHH/ogwjzYYm0AvWmT
	Bby8MFAulEDnZ8/sftd2PJzoUM/NG1x5HIfGV7EDx0xIvK2pOfSXOyiAy41AlF2jj/o385+o3GTxI
	a+0teXHegDHsJHCSO2vCvXxkPDbtxyxc8Qd6ZnbNvQbnSKcBugvFJw7auTSUxuXqM6X+HVIeVmS4U
	wPDja5qSTEx+tbu6OGVPGIs5MfvvrxIjisCmqDdmzE4W+d3Gc0zoy8L8d3nSp/INK7tVXryUeqZu0
	qrZYOmeH4LTL7YTYjxaNlQTSOZ3kYhCjMXioqmrnCV/9CeedDmYXXgA4m6Qxeav0QfMTlpwMUzytK
	5hv/4vpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3DQa-0000000AgfD-0gUG;
	Thu, 19 Mar 2026 13:28:44 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3DQZ-0000000Agf4-0p8W;
	Thu, 19 Mar 2026 13:28:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 44EF260053;
	Thu, 19 Mar 2026 13:28:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20593C19424;
	Thu, 19 Mar 2026 13:28:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773926922;
	bh=qeRMOmBWoU+udjskCvznZb/F9IJh4w9Y760n/htxYqU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WAeGmcupqRVOK7ZepO6CxgpvecrhLQqtO/PzF2Cg+wtRgQP40UZKdictfYYwhZGUX
	 jY6tBP/DWVWdzKFSLHMSMKQup3cH6sPuyKGeMQBl8AhA52uHjyN4y3Yg4+YqydDS9C
	 teMf5dMkagMVOQ2/z75Wjn9MgqOBj1DCixnGpibzZCIqJ9AugKnOTSCrO9dziKuuPH
	 hoVd2BPHnzVwG3xwT+UFG+vNz4m2/gGORBH9eZahtdq5ew3azn2BpLlxQgmQEEkrbK
	 ti9FOIpLH0CC78dRp+gOmvajc5Lpfkj/sb/d9BjbQmkkGD5b+IYnvz2QWDPZ8meYes
	 A5UqFtZrjn3WQ==
Date: Thu, 19 Mar 2026 13:28:36 +0000
From: Mark Brown <broonie@kernel.org>
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	"Rob Herring (Arm)" <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] ARM: dts: broadcom: bcm2835-rpi: Move the firmware
 node down 1 level
Message-ID: <b93488f5-abe1-4019-a558-5117b14a5f49@sirena.org.uk>
References: <20260114015810.701076-2-robh@kernel.org>
 <CGME20260114182227eucas1p16eee8f1fbf41f998214b89517793bb0c@eucas1p1.samsung.com>
 <a9a202c1-048f-473e-b8f4-6f0550bdba2c@broadcom.com>
 <86bce6c0-dbaf-4508-9f40-ff209c85a76d@samsung.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="I/vECaqBBurZUYNg"
Content-Disposition: inline
In-Reply-To: <86bce6c0-dbaf-4508-9f40-ff209c85a76d@samsung.com>
X-Cookie: A rolling stone gathers momentum.
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


--I/vECaqBBurZUYNg
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 19, 2026 at 12:19:59PM +0100, Marek Szyprowski wrote:

> Florian: I've noticed that the $subject patch has been applied to=20
> yesterday's linux-next as commit 0603d8af97ff, but the code applied in=20
> Your tree differs from what has been posted in this thread. See:

=2E..

> The "firmware" node in Your tree is=A0under "soc" node, but without addin=
g=20
> a "compatible =3D simple-mfd;" property there=A0it won't be populated, wh=
at=20
> breaks operation of all drivers requiring the firmware driver(s).

This includes the ethernet controller so all testing based on NFS root
is having a bad time :(

--I/vECaqBBurZUYNg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmm7+gMACgkQJNaLcl1U
h9A94Af+NYq1bDgru1ydnRtIVQj4MDIaTKWyad2QBljjAlqluVNRt5ZzWz7mQrJN
Z3HLgTPsCZfNxQU/5Wq5AaWs/3lERa5DIaIZK7EktJ+/t2sKQ98DbtgTyokzn7bh
uNmfLL0LRrZBEidzrNVMoQpG7RxoU6/0rggbIhwwoEH15VHiIrr6nIUKiI87R2zc
7yv6XORx6s+wAHMzbMTsYmLxFRTHEqMTnDEYcNVrAhKL87DNpCkNL6M8PxT/OerC
UDocBIbVJNpBd/rlONtOzfvPhccQDWQyDcplPhdrz8agWyCZsxv9yf+HIbAadCsk
KKRz8YL8ywO7bmws210RdzAOF3Xr5Q==
=eT69
-----END PGP SIGNATURE-----

--I/vECaqBBurZUYNg--

