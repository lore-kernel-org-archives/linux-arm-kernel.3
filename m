Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 734ADC982FE
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 14:24:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ly2pXhe/Sa/cBSQyrIeNJRWXh0gmta1ocy1JJ2ys6wQ=; b=cC2TAyh4QSQ3Zs/DX69+b4XmWg
	Pxmg/N7d9emMzhf86GN9JwkHE39DKdhbF4NCDR3MMJdYRja6Kf7lbmc2+b+ItAshFyGWtDak0htoI
	+HBK4V6ahWOLQ5uMRq3tQRXRHbSxvgN2NhGIVwwH9vR2Alq7Yc3CTypUMJVbw9JUC0dFR4/l54Rm7
	PI4f/X2CMsraxQk6gbyWLuRhILmnLK4XXYYnCgsc9gL/iquOBbPD8a5folh9yZlGHlcg6QrCZvPRb
	y4FWGsxKkwSU2Qn0rYjciiwUzv0ukhXd9p0i7NAVS5oBB87B9LoQ61tV8gGDfCdR+QdE1tRAyeIXC
	qPpg9OQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x91PZ-00000005fia-1QF7;
	Tue, 22 Sep 2026 14:23:57 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x91PV-00000005fhs-0Rk8
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 14:23:53 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 3799F60E05;
	Tue, 22 Sep 2026 14:23:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8CB251F000FF;
	Tue, 22 Sep 2026 14:23:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790087031;
	bh=Ly2pXhe/Sa/cBSQyrIeNJRWXh0gmta1ocy1JJ2ys6wQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Jz7rmf5av2MA4moOZ2rh+BkTmQFJ308+vC8s56Vemcm6jUo2xGQVtmAfjlFbAv7dE
	 Et2VMG1mgdfqvcMnGcNVdLfvnTYIiNRLmpK5U1CgdJSr3quVMCjxwqjC7ze8/jpdx6
	 nfk6ZOchs08d+l/lQtK2xgpx8hWd1HWs9xWPxQBJPmu8oaIZzC/7sZIHnPjIbLuoFn
	 pFtUiFZnLskFLtHrKuv9OyGKEVGce3LWg4KJ4Ram6wtrHSXNz++b65g3k/U7Ne3deF
	 9iIfBjiZFAjHW4gPMxRxC4N9TPqwlr3JtL8dCpAX4B/cOItQskfIdgrNv+NpQ9CoN0
	 bLiqcJVuWyPkQ==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 4EDF91AC56C6; Tue, 22 Sep 2026 15:23:48 +0100 (BST)
Date: Tue, 22 Sep 2026 16:23:48 +0200
From: Mark Brown <broonie@kernel.org>
To: joakim.zhang@cixtech.com
Cc: lgirdwood@gmail.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, perex@perex.cz, tiwai@suse.com,
	p.zabel@pengutronix.de, cix-kernel-upstream@cixtech.com,
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/4] ASoC: dt-bindings: Add Cadence I2S-SC controller
Message-ID: <arKPdM4bYsAeAKtr@sirena.co.uk>
References: <20260922112134.4167305-1-joakim.zhang@cixtech.com>
 <20260922112134.4167305-2-joakim.zhang@cixtech.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="UbH3tjqyzUf1AEj7"
Content-Disposition: inline
In-Reply-To: <20260922112134.4167305-2-joakim.zhang@cixtech.com>
X-Cookie: Too clever is dumb.
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


--UbH3tjqyzUf1AEj7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Sep 22, 2026 at 07:21:31PM +0800, joakim.zhang@cixtech.com wrote:

> Add the DT binding for the Cadence I2S-SC controller integrated in
> the CIX SKY1 audio subsystem. I2S-SC is a full-duplex stereo
> controller supporting standard I2S, left/right-justified and DSP
> formats, plus TDM operation with up to 16 slots.

> +properties:
> +  compatible:
> +    const: cix,sky1-i2s-sc

Should there be some general Cadence fallback for this if it's a Cadence
IP?

--UbH3tjqyzUf1AEj7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqyj2kACgkQJNaLcl1U
h9CZRwf9Gcsnlbj3mDtspOE3KBPkeWdgWIwa6rSz/vI8UVuV18xOBbS2PYroKi4u
GhYAQIEI3QnfB0hVZ01CBV4uJGwTdxIZHNxcq/sG90iYvGLmWM5WWcAKyyboX+Tu
bUdeCMu6Uk6XUO43DmbJ9JTjhH4rGAeJgY/MLjnxsib6NzN8g7PuzmxyERWJgeQf
G7D8UZgwM2Noe438uIihYU/hQQfZcn4pk1xkAyPHPvysKNw38RI97GfR9N1rHfdF
r9DT5DpOC+SKcVWWeoAGc/Wnom3jBMc158U+bLHX0ilbH+Y/3xW0KpIsz941/F1X
dN/c+oy3rIz9MtqSOJ6WrwEAvqWu2w==
=fhHX
-----END PGP SIGNATURE-----

--UbH3tjqyzUf1AEj7--

