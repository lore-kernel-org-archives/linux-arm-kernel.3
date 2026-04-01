Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EC8CD35171
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Apr 2026 11:23:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XV/XQrnPKsdZ45NNgsrK3n7v8TXq7shL8pgsC2bU8IM=; b=MBEbUV4wnTxz10f10NRQpttLgr
	F0ACSXCvHLynU2Ms3+TVOVyIwc76KMN+/LTPQMTDdj32z05de3sJ/7xNAcuJQW86YeaOnJsREsqNA
	qetx0OQTXmfLBeImXO7aJwqkc5yRmnw/fGeiM44zt5tAyrwuvfnKN23nsLkx7yL/AHzuyCNcPM8og
	olZ98KAbOotwO1i8CSC/gDdL/Gk2V5pEzsfXCSe0AEj4co19vyX0pT2yap9rg2NO+E+nYYimrHQvs
	UUXg4uTFob/RKOqmVnw2iVOhIaCwqJJWe05mxRW/UAgpvjCkuR/+i2YLRJgBrwapsGYWuFYwqzFtj
	CxocPy+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7tf7-0000000EdAf-39Cj;
	Wed, 01 Apr 2026 11:23:05 +0000
Received: from www537.your-server.de ([188.40.3.216])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7tf5-0000000Ed96-0Krq
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Apr 2026 11:23:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=XV/XQrnPKsdZ45NNgsrK3n7v8TXq7shL8pgsC2bU8IM=; b=SlLRU6Ar8ftyOpmtaUHioFJByQ
	BDc63ICNTUXEg7HHqGDFuJ/h1cvJBbOL1lMYW50+rZ8gZ/+G2PYqD0Swya9dCSsgL1ACgi95lop5y
	klI9fbByaQx8YN1yPQDlQwcQBm78FDT/o4ACnwqivC0S2xuJ2HRfGptV0H2WaIFJKguBdcdCydeWR
	7G6uqotFeExEF5xbozhAFIE+wl2E6wmgoTDm7p8eUOSFhWx1US+qQQt1XOTZRrOuNz/PMP5mGr21b
	BdFv0aanfDbzo0cuzg5LHk591ccd7XWaOvFIBeirnCRND6wKtNfogZmsgpQUSGwz2OtE0lR/8MZBz
	gBdIM4vQ==;
Received: from sslproxy06.your-server.de ([78.46.172.3])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <nora.schiffer@ew.tq-group.com>)
	id 1w7tew-0008Tt-0q;
	Wed, 01 Apr 2026 13:22:54 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy06.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <nora.schiffer@ew.tq-group.com>)
	id 1w7teO-000CHU-1m;
	Wed, 01 Apr 2026 13:22:53 +0200
Message-ID: <0bcf160f0ebcf0904d3fc60853fddf1103da8f0e.camel@ew.tq-group.com>
Subject: Re: [PATCH v6 0/2] TQ-Systems TQMa62xx SoM and MBa62xx board
From: Nora Schiffer <nora.schiffer@ew.tq-group.com>
To: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, Tero
 Kristo <kristo@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
  Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>, Tony Luck
 <tony.luck@intel.com>,  "Guilherme G. Piccoli" <gpiccoli@igalia.com>,
 linux-arm-kernel@lists.infradead.org,  devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux@ew.tq-group.com
Date: Wed, 01 Apr 2026 13:22:53 +0200
In-Reply-To: <6e34ecefae8e2f187c5ecfdfd343fb717711c21d.camel@ew.tq-group.com>
References: <cover.1772443991.git.nora.schiffer@ew.tq-group.com>
	 <6e34ecefae8e2f187c5ecfdfd343fb717711c21d.camel@ew.tq-group.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
X-Virus-Scanned: Clear (ClamAV 1.4.3/27958/Wed Apr  1 08:24:34 2026)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260401_042303_234008_88E9A44D 
X-CRM114-Status: GOOD (  24.21  )
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

On Tue, 2026-03-17 at 10:08 +0100, Nora Schiffer wrote:
> On Mon, 2026-03-02 at 11:14 +0100, Nora Schiffer wrote:
> > This adds Device Trees for our AM62x-based SoM TQMa62xx and its
> > reference carrier board MBa62xx.
> >=20
> > Not yet included are overlays to enable LVDS display output and MIPI-CS=
I
> > camera input.
>=20
> Hi Nishanth,
>=20
> do you have any further comments on these patches? Can we get the series =
into
> v7.1?
>=20
> Best,
> Nora

Hi Vignesh,

ti-k3-dt-for-v7.1 is tagged now, does that mean we missed the window to get=
 this
series applied again? If there are still any issues, I'll gladly fix them u=
p,
but we have not received any review comments on this last revision of the
patches.

Best,
Nora



>=20
>=20
>=20
>=20
> >=20
> > Changed in v6:
> > - Update author information following name change
> > - Rebase onto latest ti-k3-dts-next
> > - Disable incomplete panel node
> > - Add various comments to explain why nodes are disabled
> > - Extend comment explaining disabled 1400MHz OPP
> > - Use consistent comment style for pinmux
> >=20
> > Changes in v5:
> > - Rebase onto latest ti-k3-dts-next
> >=20
> > Changes in v4:
> > - Rebase onto latest ti-k3-dts-next
> > - Reorder boot phase tags after other standard DT properties
> > - Add missing supply regulators in SPI-NOR flash and USB hub
> > - Set status =3D "okay" in &cpsw3g, as it is disabled in k3-am62-main.d=
tsi
> >   now
> > - Add disabled 1400MHz OPP entry (will be enabled by bootloader if
> >   supported by PMIC configuration)
> > - Update copyright years in new files
> >=20
> > Changes in v3:
> > - Rebased onto ti-k3-dt-for-v6.18
> > - 3 of the 5 patches in v2 have been applied already and are dropped
> > - Include k3-am62-ti-ipc-firmware.dtsi, drop now redundant configuratio=
n
> > - Change node name for MCU reserved memory to 'memory'
> > - Use rgmii-id PHY mode
> > - Drop now redundant ti,rx-internal-delay
> > - Update simple-audio-card,name to match other TQ SOMs with compatible
> >   configuration
> > - Reference dss_pins in dss node (actual display support will be added
> >   in a follow-up patch series)
> > - Consistently use GPIO_ACTIVE_HIGH define
> > - Drop unneeded usb0 quirk flags
> > - Add boot phase tags
> >=20
> > Changes in v2:
> > - Collected acks and reviews
> > - Rebased onto v6.13-rc1
> >=20
> >=20
> > Nora Schiffer (2):
> >   dt-bindings: arm: ti: Add compatible for AM625-based TQMa62xx SOM
> >     family and carrier board
> >   arm64: dts: ti: Add TQ-Systems TQMa62xx SoM and MBa62xx carrier board
> >     Device Trees
> >=20
> >  .../devicetree/bindings/arm/ti/k3.yaml        |    7 +
> >  arch/arm64/boot/dts/ti/Makefile               |    1 +
> >  .../boot/dts/ti/k3-am625-tqma62xx-mba62xx.dts | 1034 +++++++++++++++++
> >  arch/arm64/boot/dts/ti/k3-am625-tqma62xx.dtsi |  360 ++++++
> >  4 files changed, 1402 insertions(+)
> >  create mode 100644 arch/arm64/boot/dts/ti/k3-am625-tqma62xx-mba62xx.dt=
s
> >  create mode 100644 arch/arm64/boot/dts/ti/k3-am625-tqma62xx.dtsi
> >=20
>=20

--=20
TQ-Systems GmbH | M=C3=BChlstra=C3=9Fe 2, Gut Delling | 82229 Seefeld, Germ=
any
Amtsgericht M=C3=BCnchen, HRB 105018
Gesch=C3=A4ftsf=C3=BChrer: Detlef Schneider, R=C3=BCdiger Stahl, Stefan Sch=
neider
https://www.tq-group.com/

