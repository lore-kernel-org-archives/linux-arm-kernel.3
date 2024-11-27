Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DC25D6ACF7
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Nov 2024 16:58:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mtfe2NOqbCfz3psjWYNHrEDGlK5BP7RRwd1d/jmG0i8=; b=UPEsiCRZx0WJtHweLAc+DnWKGT
	J5CZ1PB78KYljdJPc/qtMScfRANAQA/DbsaNxp//cCoJRmJmcOtK9pl87VfwmnW+dOG8bRGSPM+Vu
	n5dIBwLARPlRG05QWZpZbHzbpGf/0oUM9dX6aQBmEYf60yq957/211m5NN2uoHELtrAi9UWCwVnp4
	6JED3QUoTqPx3Sq5sPbhvrd8Bx60wGUNh7r9tSL6JoLOl+Ac5/sh1MuhnlpEzvaqo6iEuAANobE9O
	bIoKoYFvVxT0Z5zYHL9TsdgXan3VRki0ZqUde5SXcwaxM4zE8p6LMlkZ1w4TFK23w1ozdhSkIpqKJ
	QeURS80g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGLMs-0000000DhkK-1VnD;
	Wed, 27 Nov 2024 16:58:22 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGLCY-0000000Dfzh-3N3A
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 Nov 2024 16:47:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id DC4F55C57A0;
	Wed, 27 Nov 2024 16:46:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45BE1C4CECC;
	Wed, 27 Nov 2024 16:47:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732726061;
	bh=mtfe2NOqbCfz3psjWYNHrEDGlK5BP7RRwd1d/jmG0i8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Jo0dS/iE43Xopq61VTauW2oll8xOcEy4XbKNEIFKp0Ns08bD8aFAC/CmNodV9zHC4
	 pqxYJXfPzR+0oS/duUzo1y4EX34bcP7wFr0/qX7q1f2H6XXrQRRKAmXolZJobiUc0Q
	 RKMxKPzOoY1rgXdYKKHSEgHAs0Ee3kfktmr1UdZZ02X9V9w3R2Dl9/9JzoQZ8GXKa2
	 q5p9yMvashONZg8Q6Kt36cjZhwmTbOYHsKuOdgs3ElMdInmOAkypl8Rq5aZybgr1NQ
	 jT36ze5dALgUteYGLkG0BfwrIwia5AQ0u14fke701toKPWUqqIfhwUj1kSS77UZfXy
	 /DGyFocdDFRXQ==
Date: Wed, 27 Nov 2024 16:47:36 +0000
From: Mark Brown <broonie@kernel.org>
To: Frieder Schrempf <frieder@fris.de>
Cc: linux-arm-kernel@lists.infradead.org, Marek Vasut <marex@denx.de>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>, Robin Gong <yibin.gong@nxp.com>,
	Frieder Schrempf <frieder.schrempf@kontron.de>,
	Joy Zou <joy.zou@nxp.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v2 01/11] Revert "regulator: pca9450: Add sd-vsel GPIO"
Message-ID: <26ddcc86-7583-4402-b6b3-7c4cbe63ed94@sirena.org.uk>
References: <20241127164337.613915-1-frieder@fris.de>
 <20241127164337.613915-2-frieder@fris.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3CfSZ6vXPVxUCjFn"
Content-Disposition: inline
In-Reply-To: <20241127164337.613915-2-frieder@fris.de>
X-Cookie: Every path has its puddle.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241127_084742_886609_F8443D23 
X-CRM114-Status: GOOD (  12.32  )
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


--3CfSZ6vXPVxUCjFn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 27, 2024 at 05:42:17PM +0100, Frieder Schrempf wrote:
> From: Frieder Schrempf <frieder.schrempf@kontron.de>
>=20
> This reverts commit 27866e3e8a7e93494f8374f48061aa73ee46ceb2.

Please submit patches using subject lines reflecting the style for the
subsystem, this makes it easier for people to identify relevant patches.
Look at what existing commits in the area you're changing are doing and
make sure your subject lines visually resemble what they're doing.
There's no need to resubmit to fix this alone.

Please include human readable descriptions of things like commits and
issues being discussed in e-mail in your mails, this makes them much
easier for humans to read especially when they have no internet access.
I do frequently catch up on my mail on flights or while otherwise
travelling so this is even more pressing for me than just being about
making things a bit easier to read.

--3CfSZ6vXPVxUCjFn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmdHTScACgkQJNaLcl1U
h9C+fAf/fKV4GhE/U5x7gXRxMU7czUWQW1GbYGA8bZbpLHcgcVDGVEEUJiRKslTw
hWxbJLpvXt/X0j7Rwque58R1TXNfOBGS9dPReC19VaAL26/rxDLnGHpBGVMefIaD
B1v4QwukgYJXksR6Cr9hyVqBo1pFk37ehoOy/IYuxkJOcjFFeHLx1LHD2fVonrMP
yye3VusjeAQqPIEf5c+g/PLRrpsnHrO76FeE18z7AxFqrmzuxbW0JWJsE88xnYQO
COgKxP+jGKxhd6CvCdTpIRt9LnTh6AU2sWtZHQmgtbRy/7vPJ0BSJ+F4g3pbCrza
zBLTQvZPwdsRRgOFHQUMm6SICETdZQ==
=D4p/
-----END PGP SIGNATURE-----

--3CfSZ6vXPVxUCjFn--

