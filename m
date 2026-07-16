Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83C38C4450A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jul 2026 07:26:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rSMky4NBMz4mCwwkSBWrp24PhKUMutXTZKuowSHmBVg=; b=KOd+ak05RFfjsQRNYxSVsEShYR
	YzWCmoFMTCz+RErIj/NnImLAxLUzoLySDnitl1Vitl4Hi2cb7WzYenjP8dvadMC47dtSJfMnB4agz
	kw96gW7HgU9IbJ25y7lEdfHJ6DYVJvYjmToz6UJs9Lc4HBnvHzgXjQl97tdlaViNx47eS5szcuoNG
	GsuO+yUl64FwnX+66TDi7gfKGbTK9bkcXvO34l2KiMzlwYT6K0LEq7aHWx3LOd4wFGu1BhquTX5SK
	4MU9klRntyELG5lDjD0Qa8DrZ8QfqFdIAvcEUBby6IBr3JFRsyILOEs8i57UI0GFBkPEcxl966mc/
	XitIdnHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkGU5-0000000GeRv-1fAp;
	Thu, 16 Jul 2026 07:26:17 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkGU3-0000000GeRn-3yq3
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jul 2026 07:26:15 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with UTF8SMTP id 93DE442E8E;
	Thu, 16 Jul 2026 07:26:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id EC2B51F000E9;
	Thu, 16 Jul 2026 07:26:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784186775;
	bh=rSMky4NBMz4mCwwkSBWrp24PhKUMutXTZKuowSHmBVg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Z4K9jQ8dZgB/nOZ3nEahhDL5jTD0H1CZ2VxGlWej1lstUdkYAtrl309g5ixYgiGm8
	 +CrFbz2hwP+ZrZ3RnZThMzte/JhYmoGkTbB//d3A9fpHeytmb9XpMrEd8RGfK0mkEf
	 XIW7/uNn2waLekYgKSPiE5bMsPIOI39zkBZJn5KLvUutShFiOTBdNhT1udXcpJyXBP
	 /KqXHWhwvCqrf1LKrEA+EA/yOwS7VPAlwgFsAq519GVXVpbqXquWAyXMLAfWWj/lKM
	 nmlCtBwa1aNafoC2TLEVCLPVUQg38RwYPN7H1f+z7SH7HR59v6HrDTgIE5ZLy1WDM7
	 R3efJpG4DCznw==
Date: Thu, 16 Jul 2026 09:26:12 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
To: Janne Grunau <j@jannau.net>
Cc: Sven Peter <sven@kernel.org>, Neal Gompa <neal@gompa.dev>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
	Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, 
	Andi Shyti <andi.shyti@kernel.org>, Sasha Finkelstein <k@chaosmail.tech>, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, linux-i2c@vger.kernel.org, linux-pwm@vger.kernel.org, 
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v2 08/10] dt-bindings: pwm: apple,s5l-fpwm: Add t6030 and
 t6031 compatibles
Message-ID: <aliHVGRlJPHJCr0H@monoceros>
References: <20260715-apple-t603x-initial-devices-v2-0-df65b2485710@jannau.net>
 <20260715-apple-t603x-initial-devices-v2-8-df65b2485710@jannau.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="lnle4boaomlspvdf"
Content-Disposition: inline
In-Reply-To: <20260715-apple-t603x-initial-devices-v2-8-df65b2485710@jannau.net>
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


--lnle4boaomlspvdf
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 08/10] dt-bindings: pwm: apple,s5l-fpwm: Add t6030 and
 t6031 compatibles
MIME-Version: 1.0

Hello,

On Wed, Jul 15, 2026 at 11:11:55AM +0200, Janne Grunau wrote:
> The PWM controller on Apple silicon M3 Pro, Max and Ultra SoCs is
> compatible with the t8103 (M1) one. Add "apple,t6030-fpwm" for M3 Pro
> and "apple,t6031-fpwm" for M3 Max and Ultra as per-SoC compatibles.
>=20
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Janne Grunau <j@jannau.net>

The cover letter states that merging through arm-soc is preferred,
that's fine for me. So take my

Acked-by: Uwe Kleine-K=F6nig <ukleinek@kernel.org>

for this pwm patch.

Best regards
Uwe

--lnle4boaomlspvdf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmpYh5IACgkQj4D7WH0S
/k4tSwf+Kn4gjN7dijDNgaApRD1Ut9S5RvHfCZ1SrrfJb1+Oset4/sHjEFTtfzAE
+Ll6NBv7n3FBw268v/PeOo9+alPGYh5yXTLvJc4+Pz4w7xuBX+ijXwqQMWKPGMBn
ntKKIVPNadlNG5oxqVHP9Kt083VUiEo+Ckeo6vx8TI+Ryd/o0/AEAlAeuTa3D7Wi
seZhURBdkPzrS6MtqHSnJo9b79kqlB0BWt9Gtz13ZyLi3YqqhUsCsDpUwMdSO7SJ
MjOdZRzvgiDiszs2X7bTYqzlspZl6/WHv31lLW8flKyq1YeZRWm04eVVYSGMMiIS
GdPo3nkUTu+eZgfWTHzEl7df017HnQ==
=7vJI
-----END PGP SIGNATURE-----

--lnle4boaomlspvdf--

