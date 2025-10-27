Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7155ECCF9EA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Oct 2025 12:07:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H0SAVufar34dqPsQApnujjfNGQh27m5wNL/Z82kLY+w=; b=Ibj7O3lX0qXunsPpv5G1QrSTpv
	iQ9Uy+sxos89T8ociGIOjH/YalhaVAX1/YEMXjHVHkFFVNd9CYgWjtrHKo8z5QtSaz5vIAG7jj84/
	GBkLfmCkV3S+PP49rPLG7ohkYm3fNABqRjDMVItORxi+X7j4k2s99ZVWEJP+YkITLtlJRsXihX6k6
	gNx3ZUxUiLqY+mJsZqGxkrA1f34iiCiY3ju+vANpOgT7e2oPIAMHaFtmr9aXEiaGc6fCMTac+KsSR
	F5KBs38qOmzrrs0pKiLc56HsDpF/mOINfa604iCFTqi5kXH2DjtBSp0cJ//rAJQcbfUx9QD63badH
	kEPUazaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDM0r-0000000DqtJ-06sp;
	Mon, 27 Oct 2025 12:07:49 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDM0q-0000000Dqt9-136P
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Oct 2025 12:07:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 69DCE603CF;
	Mon, 27 Oct 2025 12:07:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA6AAC4CEF1;
	Mon, 27 Oct 2025 12:07:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761566867;
	bh=DY9gNtPBaPxvw/fUF09Z+lcTcoaQyDC8QHcttPUo3ps=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nxJYWKqx8CRsPsL5V5XezWu5KjDpfK2lAC4C5atz6nliGnH2i343DtBZLhPIBQ11i
	 RSkeEKWAaag6ImWy9tT4+6H8wtzfEapQiA17vCxDSSfrtknnH7crGPFdnr2Rt9xxNm
	 i3B2cskAmbJsY08/JR/UaolXAYm6CsvgcLDLlflWRO98lasNBeFHLAsV8gnmyGSvX6
	 OLSdSsdr8nGH9YGu0PoeJ8EUptgG9O/GH9IbrMsmiDSBOHVZcEbMlqSqIr8v4dKZ04
	 CqdtVblPor9oNR6Ifq4KlPcAt3FWu4/g1nAv5pOhD6KffYJobvUP06t8xlRD+pQzZC
	 jRzDTzzDI+cPQ==
Date: Mon, 27 Oct 2025 12:07:40 +0000
From: Mark Brown <broonie@kernel.org>
To: Stefan Wahren <wahrenst@gmx.net>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	bcm-kernel-feedback-list@broadcom.com, Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Melissa Wen <mwen@igalia.com>,
	=?iso-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>,
	Maxime Ripard <mripard@kernel.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Stephen Boyd <sboyd@kernel.org>, kernel-dev@igalia.com,
	kernel-list@raspberrypi.com, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] ARM: dts: broadcom: rpi: Switch to V3D firmware clock
Message-ID: <ad07546f-0c2d-4bc2-b794-755b892c7328@sirena.org.uk>
References: <20251005113816.6721-1-wahrenst@gmx.net>
 <9ebda74e-e700-4fbe-bca5-382f92417a9c@sirena.org.uk>
 <a5e1e279-7e20-458d-a75f-787e0adbc9fe@gmx.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="0SFa+Q/+kIjXwdsS"
Content-Disposition: inline
In-Reply-To: <a5e1e279-7e20-458d-a75f-787e0adbc9fe@gmx.net>
X-Cookie: How do I get HOME?
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


--0SFa+Q/+kIjXwdsS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Oct 26, 2025 at 01:40:19AM +0200, Stefan Wahren wrote:
> Am 21.10.25 um 14:09 schrieb Mark Brown:

> > I'm seeing the GPU start to fail probing on the Raspberry Pi 4 in
> > today's pending-fixes:

> > # # v3d fec00000.gpu: probe with driver v3d failed with error -110
> > # not ok 1 +platform:fec00000.gpu

> > which bisects to this commit.  I'm not sure if that's just a preexisting
> > issue which is now being properly detected or if it's an actual issue,
> > I'm not testing the GPU at all so I couldn't tell you if it was actually
> > working.

> can you confirm that this issue is fixed by this commit?

> module: Fix device table module aliases [1]

> [1] - https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?h=next-20251024&id=9025688bf6d427e553aca911308cd92e92634f51

No.  This is happening in mainline (was originally reported against
pending-fixes) so wasn't affected by all the module breakage, that was
separate.

--0SFa+Q/+kIjXwdsS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmj/YIwACgkQJNaLcl1U
h9DG5Af+MfDiLASB1cei5SUP8kclRnDOSOmedyI6GMwgKQFZMQhhTC2h9Qmjzazc
hz3MzKDlsAe5Khrzy/Fd8gQs3KN2tiLzAP05giUQJltAFrr1TfItUPJnm1xDzmF4
pwJeFEzriYlolTYzTRo2cEHxUsVv71GUUGdueSV79y4seXfkCqsS5WpW8mtUgdRh
NMDUUkFF7Qo05NDNZgKGKYUiODZyzJZY0wcOe4bpmmZTlzUZUNe/uAkLtxLjvsgf
DtP+/fUhmjy4qXJva26y+LsY5+jtErK8Fv2kPlIXr/6QBSTR1kKvlTVJvR2BC8DC
UrROFHORS9qXaPmpvW0YjWJZ00E/YQ==
=CD72
-----END PGP SIGNATURE-----

--0SFa+Q/+kIjXwdsS--

