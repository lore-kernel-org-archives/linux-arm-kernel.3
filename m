Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C63BFC83F05
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  6 Jul 2025 09:09:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f9YbyZd/VkquKLsCeJc+buXmeOWhQCLEKhQGAUaZYVE=; b=Ha9U1ah5ehSVhrS0BxwKNgwPRe
	n9tERQQTqrU7rDAWTdW60LBW9LE2PTD92HxheT/82VZckE1UaWFUoDvAJHK4KILcui/cW6le9VLYy
	bNQIsBlU69CjMkOtkeGpbol0W9BknyRW+OcJnfrIFcFMc+nHKmcGz8Hs6J9Yzh1kOhKBs65kdOLk9
	43P9ZniQgou0KEfG1BNuLP2Kq8gNH1O5fyFb9rsjE25VecV7i+MVTtANGkvEiyxp5p3qzbWM+83RE
	GNGYg2QADtt6xTpSue8mIPUa13OoIZMK5v7ZTQ3sK92Zpdo8hRfavUhWqDLMX7MpNVpVFVOjndSDy
	GJcJ8LfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYLMw-000000001rY-19qY;
	Sun, 06 Jul 2025 09:09:06 +0000
Received: from mail.netcube.li ([173.249.15.149])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYLKc-000000001Xv-1mZP;
	Sun, 06 Jul 2025 09:06:43 +0000
dkim-signature: v=1; a=rsa-sha256; d=netcube.li; s=s1;
	c=relaxed/relaxed; q=dns/txt; h=From:Subject:Date:Message-ID:To:CC:MIME-Version:Content-Type:In-Reply-To:References;
	bh=f9YbyZd/VkquKLsCeJc+buXmeOWhQCLEKhQGAUaZYVE=;
	b=Z+kPol288sL8JofDkheKNemupUD5VjzDMljyelMvIg7rb/xmGurWDWWn3QNgp0+NZoKBpussttaylwyqA8IT+4bxMji0HCCqI3KgTg51cmyRuVaz8EAGiZNkyOGOJBl0MFp9qGuAwLdeGarfV76vtqAovbkArMqHglR2XTjPpPo=
Received: from lukas-hpz440workstation.localnet (cm70-231.liwest.at [212.241.70.231])
	by mail.netcube.li with ESMTPSA
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256)
	; Sun, 6 Jul 2025 11:06:35 +0200
From: Lukas Schmid <lukas.schmid@netcube.li>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Maxime Ripard <mripard@kernel.org>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
Subject: Re: [PATCH v1 5/7] ARM: dts: sunxi: add support for NetCube Systems Nagami
 SoM
Date: Sun, 06 Jul 2025 11:06:34 +0200
Message-ID: <5023306.31r3eYUQgx@lukas-hpz440workstation>
In-Reply-To: <b2351675-cba2-4d8c-af6c-f341f5c77ee7@lunn.ch>
References: <20250705213900.3614963-1-lukas.schmid@netcube.li>
 <20250705213900.3614963-6-lukas.schmid@netcube.li>
 <b2351675-cba2-4d8c-af6c-f341f5c77ee7@lunn.ch>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart4662866.LvFx2qVVIh";
 micalg="pgp-sha512"; protocol="application/pgp-signature"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250706_020642_766997_A42EF851 
X-CRM114-Status: GOOD (  11.81  )
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

--nextPart4662866.LvFx2qVVIh
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"; protected-headers="v1"
From: Lukas Schmid <lukas.schmid@netcube.li>
To: Andrew Lunn <andrew@lunn.ch>
Date: Sun, 06 Jul 2025 11:06:34 +0200
Message-ID: <5023306.31r3eYUQgx@lukas-hpz440workstation>
In-Reply-To: <b2351675-cba2-4d8c-af6c-f341f5c77ee7@lunn.ch>
MIME-Version: 1.0

On Sonntag, 6. Juli 2025 09:38:00 CEST Andrew Lunn wrote:
> > +&mdio {
> > +	lan8720a: ethernet-phy@1 {
> > +			compatible = "ethernet-phy-ieee802.3-c22";
> > +			reg = <1>;
> > +	};
> > +};
> 
> Just for clarification: The PHY is on the SOM? I've seen systems where
> the PHY is on the SOM, and the magnetics and RJ45 on the carrier
> board. I've also seen systems where the PHY, magnetics and RJ45 are on
> the carrier.

Yes that' the case here. The PHY is located on the SoM and the MDI signals
before any magnetics are on the SoM's Card-Edge. The magnetics are required
on the Carrier board (e.g. a MagJack or dedicated Transformer)
> 
>     Andrew


--nextPart4662866.LvFx2qVVIh
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEPv6dcBmn59ssZMkSJnN+drMVRtgFAmhqPJoACgkQJnN+drMV
RtiE8Af9ESLIraKnrfQi55OimnR0w4/F/EGAOF6naWZtJ2WLGLsJtRxz4XtvmJg5
uTMGqjm/hF8f7xVSadaMBGnF1ZUEN13CxXoWiqE/uggNB4/9c4AxdgjlLjFeeAD0
A1pDHXHJJQykUpbNHtMqhNE3rLrAthy1PW/f2MG3ALh8VkFnOY5ZraFuTaxYZzA9
wiL5UBJw6XneItZUlr7BpFweH8H7kMusHg8eoOo2XKfj4REmQn1fj4FN1XEtGR+z
Q5N7/o6ccDVHruZve7BXIwpGXCnOOl7AmXZ1zT+FWNAI16QRm7/a8TkmP70Na67V
MvcLoylwZbp4U4SiH11wHuENj4rIdQ==
=pi6Q
-----END PGP SIGNATURE-----

--nextPart4662866.LvFx2qVVIh--





