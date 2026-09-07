Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F25BDC79F99
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 18:04:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uCwW6+gT3njRjgvc+5t1hsycs1+h5TBUJkyDrYO4u7I=; b=bJpHyqBNICnwsuphaaLOhoqrCk
	6BH4Ry5BhEouXq5GO2zH6+/NqYShL8ocmGzwPwce+upvqfmts7BS6NH6TyTeyFZ46hlXAvNtKyI8L
	GyIHrXiJCpcLyl4XKwGlK+wThePphr+ULmboxkRKNGvqY6VxC8o+XF2Xy12Jjt3qIwrt0iTKwb/Re
	bp9ZfZ5vi6gxgNmpUU05wB+lxYzVOjnD6s0echZIAszZT2iFB9X9L6dENwTlX+xVcH3Z5r+W0Q/Ph
	9w08p+hkEURzCjglUxGkipzewze2zJ0SaE5Qi+PwJBefGSJwxMf6RtbyUTmjNg5GYjAILqpNNzwxY
	tMzgkkMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3dhl-00000007XaB-3PCd;
	Mon, 07 Sep 2026 18:04:29 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3dhj-00000007XZh-2T9E;
	Mon, 07 Sep 2026 18:04:27 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 830C7601DB;
	Mon,  7 Sep 2026 18:04:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25C751F00A3A;
	Mon,  7 Sep 2026 18:04:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788804266;
	bh=uCwW6+gT3njRjgvc+5t1hsycs1+h5TBUJkyDrYO4u7I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=c5ZH6r7B9rcNWDmwK9ka7TzCln2oQankfFX/ykdQqIr9OL4RsaS1rGTS10rbX5FUV
	 7eBtFIsfa6mn6hgb6QDwA7cxiRV0jDjSftOAswhbMhTzz7T+M3XFCm8lRQQClHJQsV
	 /kLuTFZ/dOk7R6RGjnmBporPHmA+vqcs1RkKQ7OQrMjGIZO+3/p3fvAljfcstiuqVG
	 7jJMoq0nQafjd/0JCqJBtc0RDMACVvz4BBYsC0jib9Fec7EGhevjgcfIHbWh6DAUXQ
	 0exSOg4sVmKLum9eI7Jf1MAd3CP7iI2V8Deu+PJ4klKuNCsDaX4Eld8cd+brsXJ3My
	 6Yt7pRwj6bkTQ==
Date: Mon, 7 Sep 2026 19:04:21 +0100
From: Conor Dooley <conor@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Shashank Maurya <shashank.maurya@oss.qualcomm.com>,
	Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Marek Vasut <marek.vasut+renesas@mailbox.org>,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	venkata.valluru@oss.qualcomm.com,
	Jessica Zhang <jesszhan0024@gmail.com>
Subject: Re: [PATCH v2 2/2] regulator: rpi-panel-v2: Add required vcc-supply
 support
Message-ID: <20260907-showroom-elevation-ba1a0792b7f7@spud>
References: <20260907-rpi_reg-v2-0-0c59aa60d31f@oss.qualcomm.com>
 <20260907-rpi_reg-v2-2-0c59aa60d31f@oss.qualcomm.com>
 <20260907-ensnare-wanted-e86eeaf770b0@spud>
 <27fb1c11-c1eb-4494-ac38-d794baf80814@sirena.org.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="FBwSaQHk5R1QIosT"
Content-Disposition: inline
In-Reply-To: <27fb1c11-c1eb-4494-ac38-d794baf80814@sirena.org.uk>
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

--FBwSaQHk5R1QIosT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 07, 2026 at 06:09:57PM +0100, Mark Brown wrote:
> On Mon, Sep 07, 2026 at 06:06:24PM +0100, Conor Dooley wrote:
> > On Mon, Sep 07, 2026 at 11:16:08AM +0530, Shashank Maurya wrote:
>=20
> > > +	vcc =3D devm_regulator_get(&i2c->dev, "vcc");
> > > +	if (IS_ERR(vcc))
> > > +		return dev_err_probe(&i2c->dev, PTR_ERR(vcc),
> > > +				     "Failed to get vcc supply\n");
>=20
> > This needs to be optional, because without it you'll break existing
> > devicetrees. Unless you can explain how all existing users are
> > nonfunctional (e.g. nothing ever enabled the supply, which seems
> > doubtful given this surely worked when it was added) this must remain
> > optional.
>=20
> The core will stub in a dummy regulator for mandatory supplies that
> don't have anything mapped by firmware, otherwise essentially all
> regualtors would be optional and our error handling would be a disaster
> zone.

I always forget how this works. Thanks for the reminder.



--FBwSaQHk5R1QIosT
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCap78pQAKCRB4tDGHoIJi
0uTBAP9evMaKmff7rJAlkiT1L5Zx4532B5L6cpV0O5jW49THDQEAx/4ZV4Z/icen
QJ8YGia+cNCbCHFaHC2DFjOWUQ9irgA=
=QAjk
-----END PGP SIGNATURE-----

--FBwSaQHk5R1QIosT--

