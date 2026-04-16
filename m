Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE6E4F428F6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Apr 2026 06:20:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QVEWApQ8SGzvLOzKWrNmtTuBW8dEI9SRhim1vQtgHE4=; b=L8uXAq1xs1+49jU38HyEgg7YlT
	rxMQcrUKv7vyd3EK5DvkcorgD9gMnc0sagqCOe9ruBvCDLIXbjCqdmTCBnCrOE1AjXARhWiFEZ+b3
	u/M9RVIjx2Q8qQJxoPRxpS0XTe0pti6PcdbGU8leLYtWm4t/cnP/6SfmCCxQMr53cUQGSZZ+Zd8/c
	Wzyf6esiL+n51K6ZccNWfNRmW/xKD7A2GST72WJlbvOaeBjxFk1M/myPioLzoInVIZoQCfVNekqFn
	NlQs7GTlQJr0A+obHA7kHxjOMdYCBSwtwdVzpP0owmNfGSPTGTxjwC7eixAjRv/tJ04N6oJoZgK4x
	x7/11RIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDG5X-000000022WY-47re;
	Thu, 16 Apr 2026 06:20:32 +0000
Received: from www537.your-server.de ([188.40.3.216])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDG5V-000000022Vy-0CVg
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Apr 2026 06:20:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Type:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=QVEWApQ8SGzvLOzKWrNmtTuBW8dEI9SRhim1vQtgHE4=; b=R//Cr3VV3lQasZ26REI5zhDcVn
	v2b0sJZIvov1K3dg/i6Mbv2ra5hbvuM4Kn7jhhiynrNDyeyUWf2kQArF2zxZo0iMAQahMd3fDQShK
	XBtyVxMXMzJKXAuDMTeZAw4SRrqDPiGUOXAWCJiQLZVDZ7mwPt7/m0I/967IM177d+hrj9UglRasE
	hSk525hrA9eRobjS535sMqEu+eyU8VbObLJ5XvgCwbUM6yp/TI8p+rbBF4BAWTm7fAQhymLZFAOPK
	XABd8Vltp37V3mjgBRNu4UEUvILxywBP8r5AWchJ16yhhzRnZKFwNUx+L40V3E+rkfW1sLb7Ffpbd
	ZvF4K7Ug==;
Received: from sslproxy06.your-server.de ([78.46.172.3])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1wDG5G-000Fp1-21;
	Thu, 16 Apr 2026 08:20:14 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy06.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1wDG4i-000Oj6-2s;
	Thu, 16 Apr 2026 08:20:14 +0200
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 Paolo Abeni <pabeni@redhat.com>
Subject: Re: [PATCH net-next 5/6] net: stmmac: move PHY handling out of
 __stmmac_open()/release()
Date: Thu, 16 Apr 2026 08:20:13 +0200
Message-ID: <5987484.DvuYhMxLoT@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <ad-LtOBrKREM1tCk@shell.armlinux.org.uk>
References: <aNKDqqI7aLsuDD52@shell.armlinux.org.uk> <8409022.LvFx2qVVIh@steina-w>
 <ad-LtOBrKREM1tCk@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Virus-Scanned: Clear (ClamAV 1.4.3/27972/Wed Apr 15 08:24:27 2026)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260415_232029_201051_F7B7C506 
X-CRM114-Status: GOOD (  20.60  )
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

Am Mittwoch, 15. April 2026, 14:59:32 CEST schrieb Russell King (Oracle):
> On Wed, Apr 15, 2026 at 08:08:40AM +0200, Alexander Stein wrote:
> > Hi,
> >=20
> > Am Dienstag, 23. September 2025, 13:26:19 CEST schrieb Russell King (Or=
acle):
> > > Move the PHY attachment/detachment from the network driver out of
> > > __stmmac_open() and __stmmac_release() into stmmac_open() and
> > > stmmac_release() where these actions will only happen when the
> > > interface is administratively brought up or down. It does not make
> > > sense to detach and re-attach the PHY during a change of MTU.
> >=20
> > Sorry for coming up now. But I recently noticed this commit breaks chan=
ging
> > the MTU on i.MX8MP. Once I simply change the MTU I run into some DMA er=
ror:
> > $ ip link set dev end1 mtu 1400
> > imx-dwmac 30bf0000.ethernet end1: Register MEM_TYPE_PAGE_POOL RxQ-0
> > imx-dwmac 30bf0000.ethernet end1: Register MEM_TYPE_PAGE_POOL RxQ-1
> > imx-dwmac 30bf0000.ethernet end1: Register MEM_TYPE_PAGE_POOL RxQ-2
> > imx-dwmac 30bf0000.ethernet end1: Register MEM_TYPE_PAGE_POOL RxQ-3
> > imx-dwmac 30bf0000.ethernet end1: Register MEM_TYPE_PAGE_POOL RxQ-4
> > imx-dwmac 30bf0000.ethernet end1: Link is Down
> > imx-dwmac 30bf0000.ethernet end1: Failed to reset the dma
> > imx-dwmac 30bf0000.ethernet end1: stmmac_hw_setup: DMA engine initializ=
ation failed
>=20
> This basically means that a clock is missing. Please provide more
> information:
>=20
> - what kernel version are you using?

Currently I am using v6.18.22.
$ ethtool -i end1
driver: st_gmac
version: 6.18.22
firmware-version:=20
expansion-rom-version:=20
bus-info: 30bf0000.ethernet
supports-statistics: yes
supports-test: no
supports-eeprom-access: no
supports-register-dump: yes
supports-priv-flags: no

> - has EEE been negotiated?

No. It is marked as not supported

$ ethtool --show-eee end1
EEE settings for end1:
        EEE status: not supported

> - does the problem persist when EEE is disabled?

As EEE is not supported the problem occurs even with EEE disabled.

> - which PHY is attached to stmmac?

It is a TI DP83867.

imx-dwmac 30bf0000.ethernet eth1: PHY [stmmac-1:03] driver [TI DP83867] (ir=
q=3D136)

> - which PHY interface mode is being used to connect the PHY to stmmac?

=46or this interface
> phy-mode =3D "rgmii-id";
is set.

In case it is helpful. My platform is arch/arm64/boot/dts/freescale/imx8mp-=
tqma8mpql-mba8mpxl.dts
Thanks for assisting. If there a further questions, don't hesitate to ask.

Thanks and best regards
Alexander
=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/




