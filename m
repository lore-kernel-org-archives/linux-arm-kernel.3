Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7E56CCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Nov 2025 11:18:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fj2SbyxXmiKjzW12lEreh+2amPcsYkSH41R8tYD90kA=; b=rD+qEkbqQMjwqo4L2/CQUSCq97
	DJuBHLIFS29s+0bDJdsoIgT/Dh3xmSfEKOPUmr9pjIHKwzlENXPnxll+6WjvAQHq499lxiZVO48X8
	rOQ6+L6rLN7BKbgfm2/epqv2ogElkeYAbdIdH27xhaf/VMhQ/BQD9v1H/XTJDNpCagaEL1/Lnjw2M
	gUMoNtytPYwJB9U68bgjgMZPy9hgnypXwzBzK9DXiMXRGi9leDOwhrHZXSDEefqJfW7HiSRH+1Wsk
	NoP1iVsoQTmtDkhaEAvPj7agxHPa07q5m/vg0NY6nQC94Zh3Y90Q94XTwCaKNU33L9uk37OS2vw79
	K7Wtdlkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGF3O-0000000BhWZ-1Jl3;
	Tue, 04 Nov 2025 11:18:22 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGF3N-0000000BhWP-0CbS;
	Tue, 04 Nov 2025 11:18:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 43032601E9;
	Tue,  4 Nov 2025 11:18:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B317C116D0;
	Tue,  4 Nov 2025 11:18:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762255099;
	bh=fj2SbyxXmiKjzW12lEreh+2amPcsYkSH41R8tYD90kA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ODIrewYxNyso5c2rt/VaDZXqgu/poQAMspD22EfeDrIJbVyn4oYhMRhMiLZ3qAgQM
	 646/Ez+EWV9QVIhoNBw2pROpZDEOiCXfsf1Lw9CMtAdzROmReaKwBQitI8cITstrBR
	 R2YkRwgMMe/di/6klhrmqWO8JOxOKDx8Y00TCmnERpBx2G4GCyXGA3TgsPV3CRKlRS
	 Xn54IYZ1CudQXLGmYh9j0tPVxXQOVFvgz+dc15piV3SyStL/Hca+G7MDF2oRq2Xrx6
	 qUw7DKCEB/AzoBgG6M/YY08dYwEZl+S28yzseIKCiFYiI0Jc/6O5VSUSNH9YVBneL6
	 bF2yNORuo+3FQ==
Date: Tue, 4 Nov 2025 12:18:17 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
To: Chen Ni <nichen@iscas.ac.cn>
Cc: matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, 
	linux-pwm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] pwm: mediatek: Remove unneeded semicolon
Message-ID: <3sgj7ykavhum3svp657khyp3udqrov7nuzvuaaneu6fo7wlxys@uyhlvrl7lnqi>
References: <20251105214847.1279520-1-nichen@iscas.ac.cn>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="fc7lriu56xblnb2a"
Content-Disposition: inline
In-Reply-To: <20251105214847.1279520-1-nichen@iscas.ac.cn>
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


--fc7lriu56xblnb2a
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] pwm: mediatek: Remove unneeded semicolon
MIME-Version: 1.0

Hello,

On Thu, Nov 06, 2025 at 05:48:47AM +0800, Chen Ni wrote:
> Remove unnecessary semicolons reported by Coccinelle/coccicheck and the
> semantic patch at scripts/coccinelle/misc/semicolon.cocci.
>=20
> Signed-off-by: Chen Ni <nichen@iscas.ac.cn>

Applied to
https://git.kernel.org/pub/scm/linux/kernel/git/ukleinek/linux.git pwm/for-=
next
=2E I added a reference to the commit that introduced it and fixed the
author date assuming you're not living in the future :-)

Best regards
Uwe

--fc7lriu56xblnb2a
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmkJ4PYACgkQj4D7WH0S
/k4PGQf/cEvFbnM8Pdp7I6Y6+Z2EVEtr1DR5c1dnmi1a4/Nk1P8D8V364eyXb7WH
vmf+iI01U7XBfybzS49Z5EpJyXixcffYr83siyshJK2YADFKV5APYMlQ9w1uiC1k
pIA2gMyqGxk6BkgaEyotHKdgX/JTByR9nP2ks4i736D/+8Exu4LA8WHjHc8yd/ht
C5Zmqe1HnBB7MKlWw4SwvXvXdpU+cYY7pztBsaP8dMdN/dGBc5aafbWvL2YCdQjX
CeEIyGQ14pUWk+bm8gup5I975XOrYmaIdnGEPmNxC3/1M1xyxfop+LbZ16QsrN9U
qd6i5iUddF4Fva29kBrfvHMuVDgsFg==
=XArI
-----END PGP SIGNATURE-----

--fc7lriu56xblnb2a--

