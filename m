Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3109E77187
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Dec 2024 15:55:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pSlu/BBIudYr0HcsjIxDjIZ957cZmH03GPLkNU+y+0I=; b=THnw5UlZGjEVsWX4WFzaKBlQrV
	ceg/J1l468DK4gUefwp+Fw+eMbHyNJLVtFSeuepk7er4dZH29aaSVhQBHHJDPC0H1j7vBTXjVgokZ
	i2TU1AecysHuwvh4b6TYASj9Snektw9m9zBHZyNjiAdRgh729tyN5CwniD0uWf7OWPAS99KZzs4Kf
	P00xPhy1VUjFbBVzulqBnv0sdGXfRhhE7MKEaeU8gyVYTENFe30lmJwBA4MNSjnAxaChOatbhBDO5
	DvWcqWq8nzAvPFP2SnsWO/EmBX8cenkiuKfnscB9p/Ov0PasSPZcyWs9O6D3oJQGcAaOrEkCAfRUT
	TSShYgOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNwOe-0000000H6gu-3s83;
	Wed, 18 Dec 2024 15:55:36 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNwNI-0000000H6J8-2RC4
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Dec 2024 15:54:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D1BA65C6108;
	Wed, 18 Dec 2024 15:53:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C693EC4CECE;
	Wed, 18 Dec 2024 15:54:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734537251;
	bh=pSlu/BBIudYr0HcsjIxDjIZ957cZmH03GPLkNU+y+0I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FiWXzVstTfDPuetAI0WJBSGYcKYXwQYWFTqGaGF/4IkxTSuR8HCCYuX8zMtZ5ZgaQ
	 jXazgdhR9IM6k8XkjHJhqBsQO8LOq4OIQDmmuarHiwh1D7LO+QiUP/yHf1JSoUM7GR
	 DAKa8d2sP5qLRXFjKeyLYBA/IlgdL/advAwP1OIqMDqBnzun6EPbLq4Z/hNDQJd7ud
	 VYi1U4dW8nHMb9jNtRkkxkU32guFSr3VAezl/vzjZsn3YfM2OerBcBNaCvLB3yufeu
	 aNrS30VzUPyCmZRk3DJUtX4gWxuMtfqxGqDa8G7JY4kZiu79b+S/BlYgbxjQXH3CWW
	 yFKzLj6ptB3JQ==
Date: Wed, 18 Dec 2024 15:54:05 +0000
From: Mark Brown <broonie@kernel.org>
To: Frieder Schrempf <frieder@fris.de>
Cc: linux-arm-kernel@lists.infradead.org, Marek Vasut <marex@denx.de>,
	Conor Dooley <conor@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org,
	Frieder Schrempf <frieder.schrempf@kontron.de>,
	Bo Liu <liubo03@inspur.com>, Frank Li <Frank.Li@nxp.com>,
	Joy Zou <joy.zou@nxp.com>, Robin Gong <yibin.gong@nxp.com>
Subject: Re: [PATCH v3 3/9] Revert "regulator: pca9450: Add SD_VSEL GPIO for
 LDO5"
Message-ID: <5ddc7b3e-5d2f-4cf8-91e3-566008074ec0@sirena.org.uk>
References: <20241218152842.97483-1-frieder@fris.de>
 <20241218152842.97483-4-frieder@fris.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="9wxxBGoaBq2L09KF"
Content-Disposition: inline
In-Reply-To: <20241218152842.97483-4-frieder@fris.de>
X-Cookie: The heart is wiser than the intellect.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241218_075412_662883_6E9E901A 
X-CRM114-Status: GOOD (  12.37  )
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


--9wxxBGoaBq2L09KF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 18, 2024 at 04:27:26PM +0100, Frieder Schrempf wrote:
> From: Frieder Schrempf <frieder.schrempf@kontron.de>
>=20
> This reverts commit 8c67a11bae889f51fe5054364c3c789dfae3ad73.

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

--9wxxBGoaBq2L09KF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmdi8BwACgkQJNaLcl1U
h9CBDQf7BB6AUScR3IJfFYRRr3V4pJ2adoEiPijFVy43ZC4huBngqAEcAQVHuNqO
GDIz28u6QJyyeRgV5vQh4leEYJnh3qXSrg+ZAIA1MU0/35OI/btrw2BlDvrO+ogm
c52b2JFCD1GOGmHvWKpCcC735PZiXdPYfbXTWKswYcXulDLVZhnqOktHHYpaP68o
wLUdmmR0Hdv5nngTy5XC73UDCArkFUh/5feMgZfNXvKFxpc0BJhzYwemuuNY2ykH
dXwNO1u2Ure0YBttZH30rfYOE0oifuHn73dDUCPMPITloQPi0N3h7V9JSND5qv6U
f9YMq5dxdZqbdnClxTxm+IrXMupMZg==
=0mKY
-----END PGP SIGNATURE-----

--9wxxBGoaBq2L09KF--

