Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4D71C43327
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 27 Jun 2026 10:06:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eSxG+0Qg7/F1OJdh0uQRGtMrVTwzrmRupcfCq3GTC4Y=; b=cwBKPhZLbyzc8KLxDPUWpvOat4
	eyO0Ad1oYy+gQt9EIVZpYHuXYEnMIUQ+fjewXIOGQjtkVcU/gXwarpC6IUbZi7TnkIS0MyXIy0u35
	cI8kZDLeq5A+lOfiieEQEzIKiV6MLMmeUTyYAzYYhMQvfjel5XEVoOTcf3+madn1CrpImUzWuA1Y1
	UR/aegp2IgdSgVqnfcNMaXXvR6+m7OKVgrkwQfEUPTVFZf5OP1zELjKNPROu6cK0V9oyU6PdcGL4M
	DHFoAhW67QWzdt3f4/WzjFTNd5Z3FQsCTbM+jVvU8cBmOEpCDoM4AkHLOORjUi0BkFL2VjBty4GJC
	ulj0XKNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdPw1-0000000CMYA-1l2o;
	Sat, 27 Jun 2026 10:06:49 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdPvy-0000000CMXC-1OUG;
	Sat, 27 Jun 2026 10:06:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=eSxG+0Qg7/F1OJdh0uQRGtMrVTwzrmRupcfCq3GTC4Y=; b=vJsYREIEKhJTKXk6PO0NetGKm1
	VYXWRdXUfNdwL15Zr6rFb4XYQmKwssoRR+CR0O1tMVVKFJ3tCByYe4j5h+RgY4WF9E1aeBT5e87Gq
	lXQXW/MNJFiDtwu+N335ivsg71NJL00mmoPHmk1sjC9DtnqG3aFmYyMdCH6nvyCC2df7x+ZoVdwEI
	LxhmZaBbWZkkWBGDHaL/dMcC6W4FPlBSmVxG2KCaG2SLI0g96Mcao18+1gQJ2QM+n1jXsrxe+q9s5
	C6YWXYQaYSCaRLnyfgDik3jPuo50VmX1RJ3hvHJ+R5qtY3nYxysdrmi/0FiFywFDf+skE9aw1mKB9
	fnfsXeGg==;
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Hrushiraj Gandhi <hrushirajg23@gmail.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 Hrushiraj Gandhi <hrushirajg23@gmail.com>
Subject: Re: [PATCH 0/2] arm64: dts: rockchip: Add Vicharak Vaaman2 board support
Date: Sat, 27 Jun 2026 12:06:43 +0200
Message-ID: <8106243.lvqk35OSZv@diego>
In-Reply-To: <1999863.IobQ9Gjlxr@diego>
References: <20260627094854.81564-1-hrushirajg23@gmail.com> <1999863.IobQ9Gjlxr@diego>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260627_030646_372615_7C00C7C3 
X-CRM114-Status: GOOD (  19.22  )
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

Am Samstag, 27. Juni 2026, 12:05:35 Mitteleurop=C3=A4ische Sommerzeit schri=
eb Heiko St=C3=BCbner:
> Hi,
>=20
> Am Samstag, 27. Juni 2026, 11:48:52 Mitteleurop=C3=A4ische Sommerzeit sch=
rieb Hrushiraj Gandhi:
> > This patch series adds device tree support for the Vicharak Vaaman2,
> > a single-board computer based on the Rockchip RK3588 SoC.
>=20
> please use proper versioning when sending new patches
>=20
> If I'm reading this correctly, this should be
>=20
> [PATCH v3 0/2] ....

correction .. v2 ;-)

The other was the Axon board.

>=20
> Please also provide a changelog on what changed between versions.
> See all the other patchsets on the mailinglist for reference.
>=20
> Heiko
>=20
> > The Vaaman2 board features include:
> > - RK3588 SoC
> > - eMMC storage and microSD support
> > - RK806 PMIC and multiple RK8602/RK8603 regulators
> > - Real-time clock and status LED
> > - UART serial console and SARADC
> >=20
> > Note: This series was generated on top of the pending Vicharak Axon
> > board support patches (v7) and includes the Axon entry in the context
> > of the YAML binding patch.
> >=20
> > Patch 1 adds the binding documentation for the Vaaman2 board.
> > Patch 2 adds the actual device tree file and Makefile entry.
> >=20
> > Hrushiraj Gandhi (2):
> >   dt-bindings: arm: rockchip: Add Vicharak Vaaman2
> >   arm64: dts: rockchip: Add Vicharak Vaaman2 board
> >=20
> >  .../devicetree/bindings/arm/rockchip.yaml     |   5 +
> >  arch/arm64/boot/dts/rockchip/Makefile         |   1 +
> >  .../dts/rockchip/rk3588-vicharak-vaaman2.dts  | 547 ++++++++++++++++++
> >  3 files changed, 553 insertions(+)
> >  create mode 100644 arch/arm64/boot/dts/rockchip/rk3588-vicharak-vaaman=
2.dts
> >=20
> >=20
>=20
>=20





