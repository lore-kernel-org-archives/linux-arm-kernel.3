Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3217CA1013
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Sep 2025 20:19:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PByJ7k8MypBjr8KylepCawZGFe+rnZUkeGFV381LFME=; b=heWanc8D/I+ZODVtWRdMEt3x4d
	QyQ6SjSFNgdg9tYDgI4s/VMvl7v2MsjHI4vwqULLlEUbxOw1i4CQqhsRUlYAa+0MMDvM5dWqo6Vb/
	l4MbH4VK68rnlmfMd3zS+NOJzAg0NsNemJSrQsBdUW/cW+C7TMPnITiqofJ8vzklLPf5JIrw8Scc7
	rXB4FI52F9LYHAdeWRP7x5DzcnlMXNsEc7pLBFk0OFzBp8COrO7D/Uzt07O+msdeKnbcY41/rupfp
	nbON3gBtKj7WT+V4+rG6PeL4WgxDZ8Fv3t9Nm1yuUnXqMDGNb9U7UoJbsyFBzTOGHUenlB7dni1Ce
	58UTh+WQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzL6e-0000000160R-3Z2D;
	Thu, 18 Sep 2025 20:19:52 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzL6d-00000001600-1k7J
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Sep 2025 20:19:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8BAD7601D5;
	Thu, 18 Sep 2025 20:19:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67BB3C4CEE7;
	Thu, 18 Sep 2025 20:19:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758226790;
	bh=5v643+f4mhCNNCitIuEUQGOWs/3qK3dOdQaqXP7H++4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=c1TtGk9acaMHlhl0KnNwMmIZrnQ53Ie/77CghdF9h5mKWNNTrynrlDVej9cl6SlbK
	 rKUGUQrMokaXsmp5tBp5dRYtlunEd1tzcwHZlhwBRdmjvmyGETbHRsJPANiXi9N5Vt
	 5TJgn0hLF/ICqJ4d2uixvrAOp7R4K+nRoFQeISZ5JaCPp9dS9PTpxknVeb8Vjj1Sm4
	 BuNCZTPhVTVLnCQ6sDpE01BlgX8WnBMVmQNPQa3HzRHOGkqIcn62VYnZcS6sWTj8tN
	 Su1qCm7a1pAsKvJrq4wGAy1uwdyNskLZcYn/QvcZ25WDw8M/njUbzjbLNRKbJCzQPC
	 B2SIqSKLAv7xw==
Date: Thu, 18 Sep 2025 21:19:44 +0100
From: Mark Brown <broonie@kernel.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Herve Codina <herve.codina@bootlin.com>,
	Qiang Zhao <qiang.zhao@nxp.com>,
	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org
Subject: Re: [PATCH RESEND v3 0/4] ASoC: fsl: fsl_qmc_audio: Reduce amount of
 interrupts
Message-ID: <d735d395-d56f-448e-8bfc-4fdc9bcffd9d@sirena.org.uk>
References: <cover.1758209158.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="OG03h1ZJQmsi4o6W"
Content-Disposition: inline
In-Reply-To: <cover.1758209158.git.christophe.leroy@csgroup.eu>
X-Cookie: Victory uber allies!
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


--OG03h1ZJQmsi4o6W
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Sep 18, 2025 at 05:34:07PM +0200, Christophe Leroy wrote:
> This is a RESEND of v3 sent one month ago, see:
> https://lore.kernel.org/all/cover.1754993232.git.christophe.leroy@csgroup.eu/

That's a link to v2 which had substantial review comments and build
issues...  I did actually go searching for v3 and didn't see similar
there though.

--OG03h1ZJQmsi4o6W
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmjMaV8ACgkQJNaLcl1U
h9CZvgf8CPU7RnocQ9l6sM8liGp/RotKn2IBpogMBPMA+/oJ0/jeIohYua1IvRlB
LYkPh0mbBziixdS5LLfoaIUwuOA1yaXmQp1VNwQWY9ECun37kSxQI64up7mVJV4H
5YMl9DNWJzDAEYBeVbKPIfZ7dykLyMd/d/63kRyz4LBaQE6s7eLArLZBcKdtuitu
4oX7hZm6NoxmftnYwv3vcrtpcR72IulbhSEAWSCBazblbL3iay2O/Y8oyM2B274L
1ndxpotDDaK+ghauhqvnJeSousc0gEmQ7GNa5085nl9zKj0aigIBKZa9zc9/JvLf
6zbu7eCxY4m0Xv4b6uBM7Nz4QDAC+g==
=xY/X
-----END PGP SIGNATURE-----

--OG03h1ZJQmsi4o6W--

