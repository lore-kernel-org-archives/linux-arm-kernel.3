Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDC91D3CC84
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Jan 2026 22:35:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7lCwYXd1xK+6wXDwomn0LoPtpxOfCXjS/mGYMG7XUZ0=; b=tyv/2LQcSRyiyMhXkZB44UOEv3
	BJFxDHqjCMJcNuMTq/kPqt2eYgO+hN/p6//AdiuouFg9dAItd3cEJ5VEatAOfqeOBcPSEBHe3a2Sf
	t54BqoyIM9sjCEWMGbjD3aHs/eHIDW9aohgP9mLTFkdnUPCUfmt2h6sVOBwFtsfTrl8UdD7PtKFvh
	l4Suti2U4Csv0Gp/6u/5TiWhO2JAUdFoLekB0oMH86JBw8/20uisqtSvQKpgZsYdy0DMk/CgzX9fI
	xdeIeo3a6TxuDNrZEpf1XvVoEnLPd1RpI2QhaPnAkoOnkWgnsADU55llfuWuf17rZ30UHXZ4d4/4n
	0bg3BodA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg9SW-0000000Awh3-2KJ3;
	Wed, 14 Jan 2026 22:35:24 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg9SL-0000000AwaD-2ZOk;
	Wed, 14 Jan 2026 22:35:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C0A984032A;
	Wed, 14 Jan 2026 22:35:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5199FC4CEF7;
	Wed, 14 Jan 2026 22:35:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768430112;
	bh=bGPeZJuOX9kFSWCNT1OsWd84cPtXULGfVrA4w55KR8s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RXg12OrsRxSkC6k3bL4TBr3lPksxPQ4tRk1ebifPMy7VqNRMKLB7GQ5zbQMTsTD1w
	 sb0gHNEEfR6Jlf+Hr1vcontVtcbWLU/byX/TdsQAqR1KRnN7zZnZz0pZ8vhLRv0TNV
	 qD0M2ep09UXDHkOB0mR2btEZB6At0jLE/XZ3o3jR+UYSXj1lsqkXotacyDOLreJJli
	 v4UkL0xjW6RUnTZQtOWuyh+6J4f5HACfRePfHihlV29q5qgJVNptIkf92INwJcuXgK
	 Zuxr+rRaPmrbkHwYMqQuSdeUzNTD7bnTHM029jGuToB03xJpsPK/1ZyPQqxtH2e2Gh
	 r5TSAfIk309mA==
Date: Wed, 14 Jan 2026 23:35:10 +0100
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
Message-ID: <aWgaHqXylN2eyS5R@lore-desk>
References: <aWdbWN6HS0fRqeDk@lore-desk>
 <75f9d8c9-20a9-4b7e-a41c-8a17c8288550@kernel.org>
 <69676b6c.050a0220.5afb9.88e4@mx.google.com>
 <e2d2c011-e041-4cf7-9ff5-7d042cd9005f@kernel.org>
 <69677256.5d0a0220.2dc5a5.fad0@mx.google.com>
 <76bbffa8-e830-4d02-a676-b494616568a2@lunn.ch>
 <6967c46a.5d0a0220.1ba90b.393c@mx.google.com>
 <9340a82a-bae8-4ef6-9484-3d2842cf34aa@lunn.ch>
 <aWfdY53PQPcqTpYv@lore-desk>
 <e8b48d9e-f5ba-400b-8e4a-66ea7608c9ae@lunn.ch>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="hY6eQNj4UDrrBkRP"
Content-Disposition: inline
In-Reply-To: <e8b48d9e-f5ba-400b-8e4a-66ea7608c9ae@lunn.ch>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_143513_718249_7507076A 
X-CRM114-Status: GOOD (  14.58  )
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


--hY6eQNj4UDrrBkRP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> > In the current codebase the NPU driver does not need to access the WiFi=
 PCIe
> > slot (or any other external device) since the offloading (wired and wir=
eless)
> > is fully managed by the NPU chip (hw + firmware binaries).
>=20
> Are you saying the NPU itself enumerates the PCI busses and finds the
> WiFi device?  If it can do that, why not ask it which PCI device it is
> using?

nope, we do not need any PCI enumeration in the NPU driver at the moment
(please see below).

>=20
> Or this the PCI slot to use somehow embedded within the firmware?

in the current implementation the NPU driver does not need any reference to
WiFi or Ethernet devices. The NPU exports offloading APIs to consumer devic=
es
(e.g. WiFi or Ethernet devices). In particular,
1- during NPU module probe, the NPU driver configures NPU hw registers and
   loads the NPU firmware binaries.
2- NPU consumers (ethernet and/or wifi devices) get a reference to the NPU
   device via device-tree in order to consume NPU APIs for offloading.
3- netfilter flowtable offloads traffic to the selected ethernet and/or WiFi
   device that runs the NPU APIs accessible via the NPU reference obtained =
via
   dts.

The issue here is the NPU firmware binaries for EN7581, loaded by the NPU
driver during NPU probe and used for offloading, depend on the WiFi chipset
(e.g. MT7996 or MT7992) available on the EN7581 board (we have two different
NPU binaries for MT7996 offloading and for MT7992 offloading).

Regards,
Lorenzo

>=20
> Or is it simply hard coded in the NPU silicon which slot to use?
>=20
>    Andrew

--hY6eQNj4UDrrBkRP
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCaWgaHgAKCRA6cBh0uS2t
rJN6AQDkgeHf1sv0dehgGn3QZ1vcixxjd3NNGP9dNVCMq+9ssQEAys3dZo7kFmYB
mF4zbcTbKw/Osa6twW99r8dYvPutLwE=
=k96L
-----END PGP SIGNATURE-----

--hY6eQNj4UDrrBkRP--

