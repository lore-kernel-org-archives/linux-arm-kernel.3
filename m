Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C6C3C43327
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 27 Jun 2026 10:06:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OSZiqCMi+0GOi5/NyLhgrD2BbljRo1J+9NIzBrNt8S4=; b=D+hYT5BXx8BrSwksoapZPsC5RW
	G9fZEGOzH6pJ0JvbFuUSGmJc5OAO90VRk20dB381i2sbJqtJdYnG1mMKE+3gt34FFmHgp9RBAD/5j
	uGW0DQMdOfU5oE8CmDHsE8YOadv2qoKMkMAH5ZcR5P4iZjsuDiHVHFzAApkIIUAtsNgZ77UiHDbNQ
	zs+ot0BhH7dPqQoFgITY+8Eeh9deV5iXkwmfRl+TlQOWweCesy8B/co0aIyrxom6mijiGPEbTY3rn
	m3sNmf04XmfuTzfnb9DbBzdpqAJOZDYBAL8Ndu2qn2qTdEJbsVGn0ba7UQ9OzyYIfc1/t+c0LlerH
	Uct7ggwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdPv7-0000000CMP5-0ghv;
	Sat, 27 Jun 2026 10:05:53 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdPv3-0000000CMOL-1W9N;
	Sat, 27 Jun 2026 10:05:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=OSZiqCMi+0GOi5/NyLhgrD2BbljRo1J+9NIzBrNt8S4=; b=ozaG4J1l9KKqY3skznNd64asbi
	e7FQ6bgTfkBS0KujkIDeFNPsue0H4a2o7wC80hRh1jNAMbtDnzs74cM6JGY1r1GYS6Qee8S1jI4C+
	AjhHVddQXda1nuZgT7N4E8Iz58YsVWuaH5mYWh1iGZLUvpGIfRi45M6rHPgqQ7E0nIUV+G768cbYz
	E1lkr9FBKYRYeIwcFnN8TvWQrxyEZ8qKeJOaRSBnriZt1tx7bHmAeS4zVbxSlE8HoambdXUncQlP8
	iEbaeTQ0knPWf6BqwPpkbBboy9GFBegBvO5d7ssHepis5ugdqy/jsGe1zHx6ZfffLtH+Gv6UpAVJE
	esbW+ALQ==;
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Hrushiraj Gandhi <hrushirajg23@gmail.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 Hrushiraj Gandhi <hrushirajg23@gmail.com>
Subject: Re: [PATCH 0/2] arm64: dts: rockchip: Add Vicharak Vaaman2 board support
Date: Sat, 27 Jun 2026 12:05:35 +0200
Message-ID: <1999863.IobQ9Gjlxr@diego>
In-Reply-To: <20260627094854.81564-1-hrushirajg23@gmail.com>
References: <20260627094854.81564-1-hrushirajg23@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260627_030550_369753_45E807AA 
X-CRM114-Status: GOOD (  15.75  )
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

Hi,

Am Samstag, 27. Juni 2026, 11:48:52 Mitteleurop=C3=A4ische Sommerzeit schri=
eb Hrushiraj Gandhi:
> This patch series adds device tree support for the Vicharak Vaaman2,
> a single-board computer based on the Rockchip RK3588 SoC.

please use proper versioning when sending new patches

If I'm reading this correctly, this should be

[PATCH v3 0/2] ....

Please also provide a changelog on what changed between versions.
See all the other patchsets on the mailinglist for reference.

Heiko

> The Vaaman2 board features include:
> - RK3588 SoC
> - eMMC storage and microSD support
> - RK806 PMIC and multiple RK8602/RK8603 regulators
> - Real-time clock and status LED
> - UART serial console and SARADC
>=20
> Note: This series was generated on top of the pending Vicharak Axon
> board support patches (v7) and includes the Axon entry in the context
> of the YAML binding patch.
>=20
> Patch 1 adds the binding documentation for the Vaaman2 board.
> Patch 2 adds the actual device tree file and Makefile entry.
>=20
> Hrushiraj Gandhi (2):
>   dt-bindings: arm: rockchip: Add Vicharak Vaaman2
>   arm64: dts: rockchip: Add Vicharak Vaaman2 board
>=20
>  .../devicetree/bindings/arm/rockchip.yaml     |   5 +
>  arch/arm64/boot/dts/rockchip/Makefile         |   1 +
>  .../dts/rockchip/rk3588-vicharak-vaaman2.dts  | 547 ++++++++++++++++++
>  3 files changed, 553 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/rockchip/rk3588-vicharak-vaaman2.=
dts
>=20
>=20





