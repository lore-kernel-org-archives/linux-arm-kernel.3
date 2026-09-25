Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0DDAC98321
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Sep 2026 19:42:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aMNWTWyCqUsOG4orvXSkh6kcO43dY8xamvLY6SlMSqI=; b=Z20gdta9tk5FVuGN8BCcg7aZOr
	BrTnKAD/ykt9vJbkoVL6L2WBf32LcyTgWJUot7TGi2WNTg65i8QOiJkSwQ/YaAC8Ix1iGGd2hvJZV
	W872BhnO5f5VoYHKzqKEZ9eVjpKMJdEnzqPcHmsFXiwb13jxhhmvwhhNzfGqeRe+gnO70rHp3ZZSL
	oF3NhzRV7IY/bpMfEBu8hgw13bXaMWtZRVQckh5TupFkABklTYiyF/2fZYEOZnkwljbGQXrrAH/Il
	m55KNC4TNcKQy2ejr8GmRaoW0m9sbrw8g792QMbzT0Ua5bg8J3etkD5JP+Bm9uD6sPkpfjT0UPs0Q
	jDWbcxMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xABoe-0000000EI3D-48Am;
	Fri, 25 Sep 2026 19:42:41 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xABod-0000000EI2z-07UD;
	Fri, 25 Sep 2026 19:42:39 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id AD85142CE9;
	Fri, 25 Sep 2026 19:42:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6063A1F000FF;
	Fri, 25 Sep 2026 19:42:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790365358;
	bh=aMNWTWyCqUsOG4orvXSkh6kcO43dY8xamvLY6SlMSqI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=B/8huc7lVai+g37VoD897gWW6n7zUWJIrF/g478Lqoqss0UMsjQ+ljSqgoCTaNcaJ
	 d48fZqp/wcrzoQB04i7zGsRRJV63M9+P3IWL3ZzpsW0aWz9Hp3SE3yBlyBpgbnJh2a
	 aAkHmDIuShZGMWFCxNaxarm4h6zPPfXAqmLbd+0ILF3PrMJrUgV051omcUSeWREIGR
	 7vRDPIB2YYgttssXvWe13/8npFrqKx9HbSN4VfXc+2gvnvn4eeftxXZ0/EkYOvPU5a
	 E2FYZJVL1UQnBh1MX8RzQj+bFI3xQKn3tMYg7eM8Bgme0zsEadW8dZbKSRa7caiOX/
	 Bvwwd43ywlc+A==
Date: Fri, 25 Sep 2026 20:42:33 +0100
From: Mark Brown <broonie@kernel.org>
To: Lucas Costa <2000.costalucas@gmail.com>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Bartosz Golaszewski <brgl@kernel.org>, linux-spi@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v2] spi: bcm2835: fix device_node reference leak in
 bcm2835_spi_setup()
Message-ID: <ce711fbc-71a1-460f-bde7-9e2cefd96db4@sirena.org.uk>
References: <20260923184450.135601-1-2000.costalucas@gmail.com>
 <20260925193008.127314-1-2000.costalucas@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="/SVPUL7HbZZHdKNN"
Content-Disposition: inline
In-Reply-To: <20260925193008.127314-1-2000.costalucas@gmail.com>
X-Cookie: Love America -- or give it back.
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


--/SVPUL7HbZZHdKNN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Sep 25, 2026 at 04:30:08PM -0300, Lucas Costa wrote:
> of_find_compatible_node() returns a device_node with its reference count
> incremented, but bcm2835_spi_setup() only uses the return value to test
> for a matching node in the loop and never releases it.

Please don't send new patches in reply to old patches or serieses, this
makes it harder for both people and tools to understand what is going
on - it can bury things in mailboxes and make it difficult to keep track
of what current patches are, both for the new patches and the old ones.

--/SVPUL7HbZZHdKNN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmq2zqkACgkQJNaLcl1U
h9CRqwf+Ik/gAzOMcIALAuD9d3R0DPLClvHRDU3PpVBp13v3tTe9cBHSY1Xm9It2
weYQOM7tmlg9uWyXweim8tkdgUGWnfn5IoPHFk8uBCIxuJUmd3maBfkOAaVe17Bi
2QRsjVNvKL4c7S7YBmmPWLI0ojlxgQaL/Rh05I4T78VGlz1zTDsWiDDLtx6BimsE
hziLeR53ycJqjI+PsDSkcbEwx0uAipzmDhs+klidb6mGuV9KRsnFlnr3DkOSheqV
pSWU6uNS5C13gCzgsklJDctcRyLJZCg3osEQhNVLH+XbasmzsbyckYhqVsDTvr7k
+/FKmYJ+J+FaazSQSwJjlf3CFXUOrg==
=hogG
-----END PGP SIGNATURE-----

--/SVPUL7HbZZHdKNN--

