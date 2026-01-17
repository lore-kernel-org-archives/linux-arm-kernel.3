Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D78FFC98315
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 17 Jan 2026 17:53:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7m3d4HwiGLorBw73R0tlMSpZewo7vqD/rm9Y2Z/oJTg=; b=4/4puR7sC65tmAojzlZ+AhEYXS
	a8C/XNM6dzJlDUiQpShKdzzIa4s8qH96xBV0y6iK8JQxP+ckYavoqNCQlRCT8hfDeworCOc5/eAI5
	fZUzo/+lZ4ac0yPnWNghqRXzlCIkMGwUqQEpJ86FvI1X7WxBB6c7IPF43dKdWYLE3p3/OoKCrbSDk
	i76VHWtNHCV2uMrB3mw9J70Pgu/0J4nDxjZT445+HQckcYmi49mtfc3asJpG7KU00RZO0MM9krENs
	lLh+fdxuf6sFF7Vq33Epsm1b7gihOPvRf6d+VGaMYzHh1KNmjdvr2+ixkkNPeRHGTAhmeb3CyCXMr
	0fJ6t2DQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhAU7-0000000FhUs-2YSm;
	Sat, 17 Jan 2026 17:53:15 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhAU5-0000000FhU7-1JWf;
	Sat, 17 Jan 2026 17:53:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 06EFF444F2;
	Sat, 17 Jan 2026 17:53:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B2E6C4CEF7;
	Sat, 17 Jan 2026 17:53:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768672391;
	bh=NBmfzkwnJbJcKDy2MJFtJf0468/FHJL7Wc0S+2mbhRY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sH2F+Ak657hN64Per/bgWJr6F0lRrRV7uqjXSYWE3ICtxvd2Iq2QzNOS//Jt3dkEo
	 VJbeeZfcodj+ciMWRAwPkYxuzNaBzuvoQAtR4OJVyTa7LeisAV/OdVRidQkBBaxoSm
	 nx3DEgOwfL1/1VVjim/yONPHUEdJr9xQE3cvsUcW+JKYwUBM1Amv/hCm2Q9/XC1a1y
	 L5YaN3L2xMbnlBOeT1wxWXirZzRfCs/SxVV4v2Fbi/n2S1wT/P19TNd2kE49IkPoe2
	 Bjfc9iNPDomsSudleE2E5DE3RX8N2QgHGHFpl7d0u6KymLn6zu5q9PwZmosPp/Ityw
	 +rJ1BAQVdeg4Q==
Date: Sat, 17 Jan 2026 18:53:09 +0100
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Christian Marangi <ansuelsmth@gmail.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH net-next v2 1/2] dt-bindings: net: airoha: npu: Add
 EN7581-7996 support
Message-ID: <aWvMhXIy5Qpniv39@lore-desk>
References: <e2d2c011-e041-4cf7-9ff5-7d042cd9005f@kernel.org>
 <69677256.5d0a0220.2dc5a5.fad0@mx.google.com>
 <76bbffa8-e830-4d02-a676-b494616568a2@lunn.ch>
 <6967c46a.5d0a0220.1ba90b.393c@mx.google.com>
 <9340a82a-bae8-4ef6-9484-3d2842cf34aa@lunn.ch>
 <aWfdY53PQPcqTpYv@lore-desk>
 <e8b48d9e-f5ba-400b-8e4a-66ea7608c9ae@lunn.ch>
 <aWgaHqXylN2eyS5R@lore-desk>
 <13947d52-b50d-425e-b06d-772242c75153@lunn.ch>
 <aWoAnwF4JhMshN1H@lore-desk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="pVcH4Yy79WeAyUUs"
Content-Disposition: inline
In-Reply-To: <aWoAnwF4JhMshN1H@lore-desk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260117_095313_401960_96D3BA90 
X-CRM114-Status: GOOD (  27.18  )
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


--pVcH4Yy79WeAyUUs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> > On Wed, Jan 14, 2026 at 11:35:10PM +0100, Lorenzo Bianconi wrote:
> > > > > In the current codebase the NPU driver does not need to access th=
e WiFi PCIe
> > > > > slot (or any other external device) since the offloading (wired a=
nd wireless)
> > > > > is fully managed by the NPU chip (hw + firmware binaries).
> > > >=20
> > > > Are you saying the NPU itself enumerates the PCI busses and finds t=
he
> > > > WiFi device?  If it can do that, why not ask it which PCI device it=
 is
> > > > using?
> > >=20
> > > nope, we do not need any PCI enumeration in the NPU driver at the mom=
ent
> > > (please see below).
> > >=20
> > > >=20
> > > > Or this the PCI slot to use somehow embedded within the firmware?
> > >=20
> > > in the current implementation the NPU driver does not need any refere=
nce to
> > > WiFi or Ethernet devices. The NPU exports offloading APIs to consumer=
 devices
> > > (e.g. WiFi or Ethernet devices). In particular,
> > > 1- during NPU module probe, the NPU driver configures NPU hw register=
s and
> > >    loads the NPU firmware binaries.
> > > 2- NPU consumers (ethernet and/or wifi devices) get a reference to th=
e NPU
> > >    device via device-tree in order to consume NPU APIs for offloading.
> > > 3- netfilter flowtable offloads traffic to the selected ethernet and/=
or WiFi
> > >    device that runs the NPU APIs accessible via the NPU reference obt=
ained via
> > >    dts.
> > >=20
> > > The issue here is the NPU firmware binaries for EN7581, loaded by the=
 NPU
> > > driver during NPU probe and used for offloading, depend on the WiFi c=
hipset
> > > (e.g. MT7996 or MT7992) available on the EN7581 board (we have two di=
fferent
> > > NPU binaries for MT7996 offloading and for MT7992 offloading).
> >=20
> > Maybe i'm getting the NPU wrong, but i assumed it was directly talking
> > to the Ethernet and WiFi device on the PCIe bus, bypassing the host?
>=20
> correct
>=20
> > If so, it most somehow know what PCIe slots these devices use?
>=20
> I have low visibility on the NPU hw internals but I do not think there are
> any registers in NPU mmio memory where we can read this info, but I will
> confirm it (please remember the fw binaries are not load yet).

Airoha folks reported the NPU hw can't provide the PCIe Vendor/Device ID in=
fo
of the connected WiFi chip.
I guess we have the following options here:
- Rely on the firmware-name property as proposed in v1
- Access the PCIe bus from the NPU driver during probe in order to enumerate
  the PCIe devices and verify WiFi chip PCIe Vendor/Device ID
- During mt76 probe trigger the NPU fw reload if required. This approach wo=
uld
  require adding a new callback in airoha_npu ops struct (please note I have
  not tested this approach and I not sure this is really doable).

What do you think? Which one do you prefer?

Regards,
Lorenzo

>=20
> Regards,
> Lorenzo
>=20
> >=20
> >    Andrew



--pVcH4Yy79WeAyUUs
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCaWvMhQAKCRA6cBh0uS2t
rMOvAQCMNwh2CVKjGEO70AcVfsgCQZ1QqH8Z7/Auje9H0kZ1jQD/cgKiYuRc7ovi
AFt2H8xHjHH80vZpTckGROq6f2hfwAY=
=7wvK
-----END PGP SIGNATURE-----

--pVcH4Yy79WeAyUUs--

