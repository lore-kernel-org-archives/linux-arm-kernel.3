Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF775C44515
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jul 2026 18:12:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T1Kjd75GrDknuJfskGJbtCjuUzudFkj+B+wHx6EHO08=; b=ank2puQ74Xp6edFsvA6UNGq1EW
	OFpnOBdjHDN2/9llwaGqjTeg6PY3Eb2giqMrSmQjE48ZJdwJvrticRkifsJz+UtPccT0so8dOUY/W
	ng4xRbBTl1Mk3Lg5V3W7luyzVfHjw63CxlcGfWTBG5KwQnNZH18rDZutqP/Pb0vVu/ygvPrJYsVnx
	xsQXVaw9Dcy5lgGhGzDB2fAiZoRxL1BN5SotGjpMo49bJpuwcEmTvNDl90sxb7MqbR22/MoREVkUz
	zuO5kM0iolR24EWznKcDT+nMxFK99+le4HwivYh7vSyqZWOFgn1I5mLBgcfrwUACcs86pFPecfqzI
	vX7comjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkQZB-00000000Lpl-3qjt;
	Thu, 16 Jul 2026 18:12:13 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkQZ9-00000000LoW-2qOu;
	Thu, 16 Jul 2026 18:12:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=T1Kjd75GrDknuJfskGJbtCjuUzudFkj+B+wHx6EHO08=; b=0Djob2ueamTLt489wqKmvosaF1
	Hj6Jaqc32ygFK5l+ehoF1u77JMiTTSAggjjpJC8ZNhl1DoQGC7D/nIk6IOBkN2QbUC3sngUo6D42f
	BcIDgGfDLop1wndv7451eyRNpPXC75ZWYKhAJfZceYcjPuPNUP6eJ8bMEcENsNJfX8F+T/31e6Pz4
	SDAVeLXD+u3cqeKVbx/tZ7gEEfy+0umjhVh0/U/MlTkUnzY7+Di1a7Jk/CUQ/WzOW3p8KskBjKfuy
	YB7F6a/FAchPtlub2JPic1Q8E64vqty7+wxm58iy0NnF9IdVraYV3LJ98RbBDJPruxaAdu2+nDrpW
	gZfbiDyw==;
From: Heiko Stuebner <heiko@sntech.de>
To: Hrushiraj Gandhi <hrushirajg23@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 0/2] arm64: dts: rockchip: add Vicharak Axon board support
Date: Thu, 16 Jul 2026 20:12:04 +0200
Message-ID: <14508147.RDIVbhacDa@phil>
In-Reply-To: <kzl6ykopmcj7nl6jnf4uav75cdn2znd3jb4vjlrde364homti6@2y2zfyvwni4x>
References: <20260608060940.52549-1-hrushirajg23@gmail.com> <14045151.uLZWGnKmhe@phil>
 <kzl6ykopmcj7nl6jnf4uav75cdn2znd3jb4vjlrde364homti6@2y2zfyvwni4x>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_111211_740859_590E5B37 
X-CRM114-Status: GOOD (  22.35  )
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

Am Mittwoch, 8. Juli 2026, 12:21:30 Mitteleurop=C3=A4ische Sommerzeit schri=
eb Hrushiraj Gandhi:
> On Tue, Jul 07, 2026 at 08:23:47PM +0200, Heiko Stuebner wrote:
> > Am Dienstag, 7. Juli 2026, 18:03:54 Mitteleurop=C3=A4ische Sommerzeit s=
chrieb Rob Herring:
> > > On Thu, Jul 02, 2026 at 09:04:55PM +0200, Heiko Stuebner wrote:
> > > >=20
> > > > On Mon, 08 Jun 2026 11:39:38 +0530, Hrushiraj Gandhi wrote:
> > > > > This series adds initial device tree support for the Vicharak Axon
> > > > > single-board computer, which is based on the Rockchip RK3588 SoC.
> > > > >=20
> > > > > The Vicharak Axon is a feature-rich SBC targeting developer and e=
mbedded
> > > > > use cases. It ships with:
> > > > >=20
> > > > >   - Rockchip RK3588 (4x Cortex-A76 + 4x Cortex-A55)
> > > > >   - RK806 PMIC providing all SoC power domains
> > > > >   - eMMC 5.1 (on-board) and microSD slot
> > > > >   - Gigabit Ethernet via RGMII (RTL8211F)
> > > > >   - Dual HDMI 2.1 output and one HDMI 2.0 input (receiver)
> > > > >   - PCIe 3.0 x4 and two PCIe 2.0 slots
> > > > >   - SATA 3.0
> > > > >   - USB 2.0 host ports (EHCI/OHCI)
> > > > >   - NXP PCA9554 I/O expander for status LEDs
> > > > >   - Haoyu HYM8563 RTC
> > > > >=20
> > > > > [...]
> > > >=20
> > > > Applied, thanks!
> > > >=20
> > > > [1/2] dt-bindings: arm: rockchip: add Vicharak Axon board
> > > >       commit: e0008b108aaf8c5aa22930b2ceadf8f894562acb
> > > > [2/2] arm64: dts: rockchip: add Vicharak Axon board
> > > >       commit: e08c3389c78dbefd31a57df8807cf57ef6f3c9b1
> > >=20
> > > Both have issues and should be dropped.
> >=20
> > I've dropped both the Axon as well as the Vaaman2 board from the
> > same vendor now.
> >=20
> > The whole thing is confusing.
> >=20
> > I should've caught the pinctrl issue, and do remember running a dtbsche=
ck
> > on at least one Vcharak board - but that must have been the Vaaman2 boa=
rd
> > because there the pmic fullfills the binding (and general setup of other
> > rk3588 boards).
> >=20
> > The vendor-prefix is missing indeed. I found earlier versions of the
> > version-avalanche had it, up until v6 [0] . Though I haven't figured out
> > yet why it was lost.
>=20
> Regarding the missing vendor prefix 'vicharak' that was noted: the prefix=
=20
> was already submitted separately upstream by my team in a different patch=
 [1].=20
> Because it was already submitted, Krzysztof asked us to drop it from our=
=20
> own series to avoid duplicates [2].=20

Looks like that series with the vendor-prefix was applied last
saturday [3], so I'll continue with your newly sent board versions :-)


Heiko


> [1] https://lkml.org/lkml/2026/6/24/929
> [2] https://lore.kernel.org/linux-rockchip/96c9b1eb-9f8e-430d-9c38-eb4d48=
9d7d24@kernel.org/
[3] https://lore.kernel.org/all/178378800443.138068.8763713563230008567.b4-=
ty@kernel.org/



