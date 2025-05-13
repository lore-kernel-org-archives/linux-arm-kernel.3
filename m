Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C81A1C3ABD8
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 May 2025 15:20:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=39bn3xk0Q75/p6z3qnAmNSpcXd8S/ZEQ0QV03qD/MaU=; b=aQvb4f6lwngio6kzv/XcqBJQiR
	1b6c26T8QfvYQ5P9bNRE1ZdMr/LRsd1Dj0pRoUvstfhehY3wcJjYNBs+22Bbcj33pSiiMDktZscik
	aPKhRFGt+ylceQUYd0zUuMfsEI5gpwinFJz5JEJoKB0Kex3NYno4RkW5BUtPzLpLrECThHzRHbLwO
	81/W7irqtt11ewP/6Apt+iVOXdTJf03BbOheJYxEISKXC/2JUysqCG8oyAP8fJnmu2AunlM3mS94u
	TR7HETZLtlrIQnDhiJISWT3zK7081kZcXopu4K7JolzSoy3lYuael0DaJWaYRlnuwn2Go7Dn2urtB
	jw2aQYGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uErQz-0000000ClBC-0QNr;
	Tue, 13 May 2025 15:20:45 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uErCg-0000000CiRT-2pEE;
	Tue, 13 May 2025 15:05:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=39bn3xk0Q75/p6z3qnAmNSpcXd8S/ZEQ0QV03qD/MaU=; b=AIU85UpFy9HfLAFaxI9Up0boxk
	e9imu3J7aIVXC9K4DiHNYwFIz+GjY5u3SurXxDfKanIWfzTdyLRm8QQWwlXuuyQbtr6iG/9ajvUIP
	z1gvnRM661wz/7Qixvjc4eghmguVGtxJ72ZBX4RRPCyoZucC3jgKSEDkXzztd6QPZfJmNzJUpMP+J
	5FeJ6485TNPwWnSka/wcDRcBhkTcVdL52pcc9Ep44iLPDyVd1qlBEtYiVGhCxOxj967f+8ta+8MS5
	xrbXGNY/O2Lu5ek7mq2ycJMjxM8eupBTldURHNFR2Ip/+06GsvZq3fFRVMceRiMkpgf5ixk5tukcW
	5hRLoOxQ==;
Received: from i53875a50.versanet.de ([83.135.90.80] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uErCf-0008UM-9E; Tue, 13 May 2025 17:05:57 +0200
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 quentin.schulz@cherry.de, krzk+dt@kernel.org, devicetree@vger.kernel.org,
 conor+dt@kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/6] Add two board-families from Theobroma-Systems
Date: Tue, 13 May 2025 17:05:56 +0200
Message-ID: <3311886.aV6nBDHxoP@diego>
In-Reply-To: <174679984943.3368422.9645324507043955723.robh@kernel.org>
References: <20250508150955.1897702-1-heiko@sntech.de>
 <174679984943.3368422.9645324507043955723.robh@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250513_080558_718260_5EE4FCA9 
X-CRM114-Status: GOOD (  26.30  )
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

Am Freitag, 9. Mai 2025, 16:16:58 Mitteleurop=C3=A4ische Sommerzeit schrieb=
 Rob Herring (Arm):
>=20
> On Thu, 08 May 2025 17:09:49 +0200, Heiko Stuebner wrote:
> > Both the Cobra and PP1516 boards are based around the PX30 SoC and can =
be
> > found with a variety of display options.
> >=20
> > As new boards should not use the deprecated snps,reset-* properties
> > in the gmac node, I also added a core mdio-node for the gmac and
> > converted the Theobroma Ringneck board over.
> >=20
> > Testing with the new node both before and after converting Ringneck
> > showed the board finding its network both when booting locally and
> > from the tftp/nfs.
> >=20
> >=20
> > Heiko Stuebner (6):
> >   arm64: dts: rockchip: add basic mdio node to px30
> >   arm64: dts: rockchip: move reset to dedicated eth-phy node on ringneck
> >   dt-bindings: arm: rockchip: add PX30-Cobra boards from Theobroma
> >     Systems
> >   arm64: dts: rockchip: add px30-cobra base dtsi and board variants
> >   dt-bindings: arm: rockchip: add PX30-PP1516 boards from Theobroma
> >     Systems
> >   arm64: dts: rockchip: add px30-pp1516 base dtsi and board variants
> >=20
> >  .../devicetree/bindings/arm/rockchip.yaml     |  18 +
> >  arch/arm64/boot/dts/rockchip/Makefile         |   6 +
> >  .../rockchip/px30-cobra-ltk050h3146w-a2.dts   |  39 ++
> >  .../dts/rockchip/px30-cobra-ltk050h3146w.dts  |  39 ++
> >  .../dts/rockchip/px30-cobra-ltk050h3148w.dts  |  39 ++
> >  .../dts/rockchip/px30-cobra-ltk500hd1829.dts  |  58 ++
> >  arch/arm64/boot/dts/rockchip/px30-cobra.dtsi  | 570 +++++++++++++++++
> >  .../rockchip/px30-pp1516-ltk050h3146w-a2.dts  |  39 ++
> >  .../dts/rockchip/px30-pp1516-ltk050h3148w.dts |  39 ++
> >  arch/arm64/boot/dts/rockchip/px30-pp1516.dtsi | 601 ++++++++++++++++++
> >  .../boot/dts/rockchip/px30-ringneck.dtsi      |  22 +-
> >  arch/arm64/boot/dts/rockchip/px30.dtsi        |   6 +
> >  12 files changed, 1473 insertions(+), 3 deletions(-)
> >  create mode 100644 arch/arm64/boot/dts/rockchip/px30-cobra-ltk050h3146=
w-a2.dts
> >  create mode 100644 arch/arm64/boot/dts/rockchip/px30-cobra-ltk050h3146=
w.dts
> >  create mode 100644 arch/arm64/boot/dts/rockchip/px30-cobra-ltk050h3148=
w.dts
> >  create mode 100644 arch/arm64/boot/dts/rockchip/px30-cobra-ltk500hd182=
9.dts
> >  create mode 100644 arch/arm64/boot/dts/rockchip/px30-cobra.dtsi
> >  create mode 100644 arch/arm64/boot/dts/rockchip/px30-pp1516-ltk050h314=
6w-a2.dts
> >  create mode 100644 arch/arm64/boot/dts/rockchip/px30-pp1516-ltk050h314=
8w.dts
> >  create mode 100644 arch/arm64/boot/dts/rockchip/px30-pp1516.dtsi
> >=20
> > --
> > 2.47.2
> >=20
> >=20
> >=20
>=20
>=20
> My bot found new DTB warnings on the .dts files added or changed in this
> series.
>=20
> Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
> are fixed by another series. Ultimately, it is up to the platform
> maintainer whether these warnings are acceptable or not. No need to reply
> unless the platform maintainer has comments.
>=20
> If you already ran DT checks and didn't see these error(s), then
> make sure dt-schema is up to date:
>=20
>   pip3 install dtschema --upgrade
>=20
>=20
> This patch series was applied (using b4) to base:
>  Base: attempting to guess base-commit...
>  Base: tags/v6.15-rc1-1-g59529bbe642d (exact match)
>=20
> If this is not the correct base, please add 'base-commit' tag
> (or use b4 which does this automatically)
>=20
> New warnings running 'make CHECK_DTBS=3Dy for arch/arm64/boot/dts/rockchi=
p/' for 20250508150955.1897702-1-heiko@sntech.de:
>=20
> arch/arm64/boot/dts/rockchip/px30-cobra-ltk500hd1829.dtb: panel@0 (leadte=
k,ltk500hd1829): 'port' does not match any of the regexes: '^pinctrl-[0-9]+=
$'
> 	from schema $id: http://devicetree.org/schemas/display/panel/leadtek,ltk=
500hd1829.yaml#
> arch/arm64/boot/dts/rockchip/px30-cobra-ltk050h3148w.dtb: panel@0 (leadte=
k,ltk050h3148w): 'port' does not match any of the regexes: '^pinctrl-[0-9]+=
$'
> 	from schema $id: http://devicetree.org/schemas/display/panel/leadtek,ltk=
050h3146w.yaml#
> arch/arm64/boot/dts/rockchip/px30-pp1516-ltk050h3148w.dtb: panel@0 (leadt=
ek,ltk050h3148w): 'port' does not match any of the regexes: '^pinctrl-[0-9]=
+$'
> 	from schema $id: http://devicetree.org/schemas/display/panel/leadtek,ltk=
050h3146w.yaml#
> arch/arm64/boot/dts/rockchip/px30-cobra-ltk050h3146w.dtb: panel@0 (leadte=
k,ltk050h3146w): 'port' does not match any of the regexes: '^pinctrl-[0-9]+=
$'
> 	from schema $id: http://devicetree.org/schemas/display/panel/leadtek,ltk=
050h3146w.yaml#
> arch/arm64/boot/dts/rockchip/px30-pp1516-ltk050h3146w-a2.dtb: panel@0 (le=
adtek,ltk050h3146w-a2): 'port' does not match any of the regexes: '^pinctrl=
=2D[0-9]+$'
> 	from schema $id: http://devicetree.org/schemas/display/panel/leadtek,ltk=
050h3146w.yaml#
> arch/arm64/boot/dts/rockchip/px30-cobra-ltk050h3146w-a2.dtb: panel@0 (lea=
dtek,ltk050h3146w-a2): 'port' does not match any of the regexes: '^pinctrl-=
[0-9]+$'
> 	from schema $id: http://devicetree.org/schemas/display/panel/leadtek,ltk=
050h3146w.yaml#
>=20

this is handled by the already applied changes to the panel bindings:
dt-bindings: display: ltk500hd1829: add port property [0]
dt-bindings: display: ltk050h3146w: add port property [1]


[0] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/com=
mit/?id=3De782ac936941cff4c5580bb5cc2ec0e91468068c
[1] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/com=
mit/?id=3Dbf0636f4348e098e2338eebbe42d7780c58a1195




