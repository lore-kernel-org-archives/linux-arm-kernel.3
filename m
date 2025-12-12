Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB89DD59D77
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Dec 2025 17:55:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3qFG9l9ylQMby5ImcI/MunHCe1yFd0VKfU7pX76B09Q=; b=llEcKCMKHmWtmabJylcPMplGx0
	dlYQm//rXNHrrcsh+V9gcJgNAOGw4JGQwZMi0esD0C7DzQ2pqs7DgXXTGUmV+LqqXZzg4ktwMQ1XB
	TyixeqBlGqJLYC3pNiSgpYMihepj5xodqah9PbpQHP7RDPOqXdl4/RRoOYRpDBAu3LU6YiUyqWbr3
	mIYlTwnSmGSlBBxDPEHcJvOYWnNWS2BHYdBtbBcVpO7dl8aCJCg0y2Tr49pcCUXLaYLqCcpq1G0Xe
	qcp2K6ZQ9R07OMmhtxO/R9ofJWxZrJ/BuleajKBt36SnJVrlmQ0B2V0WuKsw4ZpCybD+BKh+MT76O
	WrnDyfuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vU7Me-00000000utC-2kRl;
	Fri, 12 Dec 2025 17:55:37 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vU7Mc-00000000usZ-0WaV
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Dec 2025 17:55:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9953744295;
	Fri, 12 Dec 2025 17:55:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3004AC19421;
	Fri, 12 Dec 2025 17:55:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765562132;
	bh=TT3BjiDXo7vLPijIYy6fIZThrWVyzGnxiLcPa/Xmfuw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HAB0zwkLUGYg5Vcyi7Ms2WP5CJQHFP5S+cVj3UkFnmqiNW2xTlcmzLOVdkyEPCDpJ
	 l6baQspDib/b05s84imOxcfD5oi6iPxoY2rhHFyfnvLDG632Yb5C9cpBsjEjA80X9v
	 7GoDgZQZZ3itPz62rz4J5+qGpwULDouEUKh2jsEJLdhYmi7nv98gALs61leSuqv4OS
	 A86YdE9JPCe0qNhStkxyUT/tb8i7GqRNr4LcSDcJt4bPYF279MbUPr9BwU/ioXJlA5
	 GHSSusvNAXbNgmG8JvFMfp4jvBQjQIw5jTzuhADq2TlHkU12uxVFjUFL0KnlsYTgYu
	 1dRDsSX7Lj/iw==
Date: Fri, 12 Dec 2025 17:55:26 +0000
From: Conor Dooley <conor@kernel.org>
To: Robert Marko <robert.marko@sartura.hr>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	gregkh@linuxfoundation.org, nicolas.ferre@microchip.com,
	claudiu.beznea@tuxon.dev, mturquette@baylibre.com, sboyd@kernel.org,
	richardcochran@gmail.com, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
	daniel.machon@microchip.com, UNGLinuxDriver@microchip.com,
	luka.perkov@sartura.hr
Subject: Re: [PATCH 2/4] dt-bindings: arm: Document Microchip LAN969x
Message-ID: <20251212-dazzler-agility-d45940bd27d2@spud>
References: <20251203122313.1287950-1-robert.marko@sartura.hr>
 <20251203122313.1287950-2-robert.marko@sartura.hr>
 <20251203-duly-leotard-86b83bd840c6@spud>
 <CA+HBbNH6wO2VWOp1Dn52ArrYg6z89FgYnT3x-jsHsTVJ5xSBSA@mail.gmail.com>
 <20251208-absolute-diploma-6575729ab43f@spud>
 <CA+HBbNHuYCq9oV4ZjWGjwnJM=oz-O85p_tqB+UnTBmivzDoowg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="2+Dmjsrlr/kIiniW"
Content-Disposition: inline
In-Reply-To: <CA+HBbNHuYCq9oV4ZjWGjwnJM=oz-O85p_tqB+UnTBmivzDoowg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251212_095534_205564_79F00F6C 
X-CRM114-Status: GOOD (  24.82  )
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


--2+Dmjsrlr/kIiniW
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 12, 2025 at 11:09:01AM +0100, Robert Marko wrote:
> On Mon, Dec 8, 2025 at 6:10=E2=80=AFPM Conor Dooley <conor@kernel.org> wr=
ote:
> >
> > On Mon, Dec 08, 2025 at 11:30:28AM +0100, Robert Marko wrote:
> > > On Wed, Dec 3, 2025 at 8:19=E2=80=AFPM Conor Dooley <conor@kernel.org=
> wrote:
> > > >
> > > > On Wed, Dec 03, 2025 at 01:21:30PM +0100, Robert Marko wrote:
> > > > > Microchip LAN969x is a series of multi-port, multi-gigabit switch=
es based
> > > > > on ARMv8 Cortex-A53 CPU.
> > > > >
> > > > > Signed-off-by: Robert Marko <robert.marko@sartura.hr>
> > > > > ---
> > > > >  .../bindings/arm/microchip,lan969x.yaml       | 32 +++++++++++++=
++++++
> > > >
> > > > This should not be in a unique file, put it in with the other micro=
chip
> > > > arm devices please. Also, the wildcard in the compatible is not
> > > > permitted, only way it'd make sense is if these are different binni=
ngs
> > > > of the same silicon. If that's the case, you need to explain why,
> > > > because compatibles are meant to be soc-specific.
> > >
> > > Hi Conor,
> > > The issue is that there is no unique place for Microchip SoC-s,
> > > LAN966x series is in the AT91 bindings
> > > while SparX-5 has its own bindings file.
> > >
> > > What would you suggest in this case?
> >
> > Ideally, arm/atmel-at91.yaml and arm/microchip,sparx5.yaml would just
> > become arm/microchip.yaml. The axi@600000000 thing in the sparx5 file
> > looks pointless and can be deleted IMO.
>=20
> Ok, I merged them all in one generic microchip.yaml binding, but I notice=
d that
> arm/atmel-at91.yaml is licensed under GPL-2.0 while arm/microchip,sparx5.=
yaml
> is dual-licensed as its preferred for bindings.
>=20
> Is that going to be an issue?

I *think* everyone that contributed, other than maybe Wolfram has
already okayed any binding going to dual license. Just do it as a
standalone commit in the patchset and make sure you CC Michael Walle
and Wolfram Sang.

--2+Dmjsrlr/kIiniW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaTxXCwAKCRB4tDGHoIJi
0th0AQCeGvXNFnRESx7BYMbBp8z3ebY/JmtThhaK/pvT8fDEAgEA+31CSiBsVH57
cSVa85MdpgBrlggqpPrz+t3kfd+Vhg0=
=/YvB
-----END PGP SIGNATURE-----

--2+Dmjsrlr/kIiniW--

