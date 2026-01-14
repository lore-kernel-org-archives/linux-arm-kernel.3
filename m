Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6191BD38FFF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Jan 2026 18:16:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CoalsaMtvU3x8fS2yrgSJLQXqHoz1WWj7ogNekfDZNA=; b=YOuqrkjOQNyE+rJFyKQWGHl7XO
	d7cERYnWHNPaD260//zFi5VbvD8nxbupyLb3CIODk4J42HxRXxJkC5DlMmBzr9dCgajFQmZVhftcb
	RTupzPj9FLYWRoKYbh6ClMSymOIKos9KvIYXCsVxcQ0iZwjCED1H/epqKbRTZccIssN2EmVfNT4Ck
	aZK9qNyDB4egTag42xBADIYRW/3xBqGmPZrBNGsHsDV0hSY92GVMVcJsEeS5XRCvQCCQ2d2FmLa5F
	pMP/sFEpELWrLA7Fh2Hf0P8lrISmJRufZhQwzNsHF/rw9q7A0kxzfwzdNYd+Es2MaO2xRVXX/hhFY
	dEDjGIig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg5Pc-0000000AHss-3RvU;
	Wed, 14 Jan 2026 18:16:08 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg5Pa-0000000AHsU-2zQ1;
	Wed, 14 Jan 2026 18:16:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E2C9643F35;
	Wed, 14 Jan 2026 18:16:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45E6DC4CEF7;
	Wed, 14 Jan 2026 18:16:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768414565;
	bh=NluLEF7NMmp3/AgudKp+8aM6MBbaE0n02a0tsv2rEXM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=U/olIjIZfEKxE4MnNNIenrvMBsWIKmaBEvhi76I8+nYBWKJ4wMVEXYMsmt7KxT5iz
	 D4oUZoEiWm/h1H9fwxGRQDPKUWoR0gQQrHjh3rC2z2djAGcXB9XL8YcAJ9TylkWzeI
	 s2XegiU5svgbx3ZjQOHdwh0NKcXcBVx2/g7w6v0/snGx0WfhopuTALN9jgjmlWTQ8l
	 nuZzxfzduIcnP7SPo0yVoHjo79AZF3s2uk6ReJF3Nh1BtXEHhdX7lsKrBTMHbJdNsT
	 m1O0sGCSlIqP0AUGkzZ9EruKtbyEyflFsCkk59RsMm7PzjXYdgAF8d2E4CRKbKfqY9
	 uVv/DRs2bcLhw==
Date: Wed, 14 Jan 2026 19:16:03 +0100
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
Message-ID: <aWfdY53PQPcqTpYv@lore-desk>
References: <20260113-airoha-npu-firmware-name-v2-1-28cb3d230206@kernel.org>
 <20260114-heretic-optimal-seahorse-bb094d@quoll>
 <aWdbWN6HS0fRqeDk@lore-desk>
 <75f9d8c9-20a9-4b7e-a41c-8a17c8288550@kernel.org>
 <69676b6c.050a0220.5afb9.88e4@mx.google.com>
 <e2d2c011-e041-4cf7-9ff5-7d042cd9005f@kernel.org>
 <69677256.5d0a0220.2dc5a5.fad0@mx.google.com>
 <76bbffa8-e830-4d02-a676-b494616568a2@lunn.ch>
 <6967c46a.5d0a0220.1ba90b.393c@mx.google.com>
 <9340a82a-bae8-4ef6-9484-3d2842cf34aa@lunn.ch>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="BXxQL3Vd8nyun2Je"
Content-Disposition: inline
In-Reply-To: <9340a82a-bae8-4ef6-9484-3d2842cf34aa@lunn.ch>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_101606_802028_5F4A757F 
X-CRM114-Status: GOOD (  25.94  )
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


--BXxQL3Vd8nyun2Je
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Jan 14, Andrew Lunn wrote:
> On Wed, Jan 14, 2026 at 05:29:28PM +0100, Christian Marangi wrote:
> > On Wed, Jan 14, 2026 at 04:56:02PM +0100, Andrew Lunn wrote:
> > > > > Yes. What you plug into PCI is not a part of this hardware, so ca=
nnot be
> > > > > part of the compatible.
> > > > >=20
> > > >=20
> > > > Thanks for the quick response. Just to make sure Lorenzo doesn't get
> > > > confused, I guess a v3 would be sending v1 again (firmware-names
> > > > implementation series) with the review tag and we should be done wi=
th
> > > > this.
> > >=20
> > > Since this is a PCI device, you can ask it what it is, and then load
> > > the correct firmware based on the PCI vendor:product. You don't need
> > > to describe the hardware in DT because it is enumerable.
> > >=20
> >=20
> > Hi Andrew,
> >=20
> > I think it's problematic to create a bind between the NPU and
> > PCIe.
>=20
> But the NPU must already be bound to PCIe. How else does it know which
> PCIe slot the WiFi card is on, so it can make use of it?

In the current codebase the NPU driver does not need to access the WiFi PCIe
slot (or any other external device) since the offloading (wired and wireles=
s)
is fully managed by the NPU chip (hw + firmware binaries). The NPU driver is
only responsible for loading the proper firmware binaries, configure NPU hw
registers and export APIs for other external chips (e.g. MT76).
IIUC your proposal, we should add a PCIe slot access in the NPU kernel driv=
er in
order to enumerate PCIe Vendor/Device IDs during device probe and load the
proper firmware binaries, right? If so, this approach seems quite more comp=
lex
to me with respect of relying on firmware-name dts property (assuming
firmware-name is a suitable property for this scope). What do you think?

Regards,
Lorenzo

>=20
>      Andrew

--BXxQL3Vd8nyun2Je
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCaWfdYwAKCRA6cBh0uS2t
rE57AP9zuvgwh7EtMJ2YP09lnx23PG43DiyywAvJ1zCn4QPlywEA/LYdZ976dnCp
U9sh/SlAO7baGe7pcsLNjgLptRArTQY=
=OEKc
-----END PGP SIGNATURE-----

--BXxQL3Vd8nyun2Je--

