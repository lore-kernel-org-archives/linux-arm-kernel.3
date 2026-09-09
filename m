Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC780C79FB6
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 14:48:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:From:
	To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9e2xytwfhYr9357vCuzcaoFTrbV5rohrhm5PdDDzSoQ=; b=W11SOuCpqbmjhFKrDrtWsQwt0W
	iTgHNDNM7gSPXPrkm+oFfD5UH9pQAPI0J87+fdZKgQDuwM1JWWcKOnlg46rkKPWhtO2I4nuClirq7
	+5LmyUn8qg6qjsKCaNDthN+CBbg14vPDj5OJwJ513ceBhW9GTAXvTs/5+M114AtxdM+YoMqaflWnQ
	4AoDDrZ1rmkAYiyR9ThMJc6un93beML3QXWBJpFx/qvJxTBZkkKYLssF+3GONO6BBYXJkHGDW1iHy
	fiS8CdFh6JsSqQUtwDZKAY89VhbrMIpV4kajaPy76nsocctXjIBe0hImh/Dr60jIw9yFrEkJbAMFt
	0lRsDarw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4Jar-0000000C2eB-0yTP;
	Wed, 09 Sep 2026 14:48:09 +0000
Received: from mail-106101.protonmail.ch ([79.135.106.101])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4Jan-0000000C2bu-3WPL
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Sep 2026 14:48:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1788965281; x=1789224481;
	bh=9e2xytwfhYr9357vCuzcaoFTrbV5rohrhm5PdDDzSoQ=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=heutEvUrdiuFmplmXJMuc/MIXcK8rDdVN01E9hZKtvupAapM8EQBEfLXHhJHeVnRG
	 2KrI+D8MvNFYPe9ACX4wwZ2vYNfruxJNL30sDLMYqHwsJg/w7+3xKq+9kiAvvg5vU0
	 UKamY5cxG3lKfORVNJrJDzGXw6wU8qFicYcySDCPkQq9KJt16dgf94BiJZV7kDIf0P
	 9QyeHFXJrWjxGinp5lzCyTt1VdKSdGWCVyIDUJhV1qBvK0z/dSdF5D+Y3+HuB6QNKp
	 4IeuCSHp6HkMsfRGGMJZ8BDzqlH66pkVuPUhxWMRoblSBy/CVa0O+mktugN1dzsDY0
	 D5j6GOlabvFAw==
Date: Wed, 09 Sep 2026 14:47:54 +0000
To: Andrey Korshunov <razor1702@gmail.com>
From: =?utf-8?B?5a6J5a65?= <HystericalDragons@proton.me>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-rockchip@lists.infradead.org" <linux-rockchip@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Chukun Pan <amadeus@jmu.edu.cn>, jensen <jensenhuang@friendlyarm.com>
Subject: Re: [PATCH v2 2/3] arm64: dts: rockchip: Split out the common NanoPi RK3528 parts
Message-ID: <BxIHWWXJmSvUm8NVgiaDUYHBOUaTS9qf4cAXQKfx8UgN_F90zHJpu0fMHWAZr70as9EnmOyj4cUPeFCO2p9JljBigVijrvYWzRpTG0WMm9U=@proton.me>
In-Reply-To: <20260909134716.879-1-razor1702@gmail.com>
References: <20260907-r28s-upstream-v2-2-21ab570fc91c@proton.me> <20260909134716.879-1-razor1702@gmail.com>
Feedback-ID: 91982645:user:proton
X-Pm-Message-ID: 362103fa24347cf345c686bb025fda6f2830d27f
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_074806_514175_0D7079EA 
X-CRM114-Status: GOOD (  17.42  )
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

On Wed, Sep 09, 2026 at 04:47:16PM +0300, Andrey Korshunov wrote:

> of_mdio_bus_register() reads the PHY ID with get_phy_device() before
> phy_device_register() fetches the PHY node's reset-gpios, so a PHY that
> the bootloader left in reset is simply not found:
>
>   mdio_bus stmmac-0: MDIO device at address 1 is missing.

Thanks, the diagnosis is right and I have reproduced the ordering in
the code: `__of_mdiobus_register()` registers the bus before it walks the
children. And for a PHY node with only the generic c22 compatible,
`fwnode_mdiobus_register_phy()` reads the PHY ID via `get_phy_device()`
before `phy_device_register()` gets as far as requesting reset-gpios.

> Describing the reset on the MAC instead makes stmmac install it
> as mii_bus->reset, which runs before the bus is scanned:
>
>     &gmac1 {
>         snps,reset-active-low;
>         snps,reset-delays-us =3D <0 20000 100000>;
>         snps,reset-gpio =3D <&gpio4 RK_PC2 GPIO_ACTIVE_LOW>;
>     };

But I would rather not use those: snps,reset-gpio, snps,reset-active-low
and snps,reset-delays-us are all deprecated in snps,dwmac.yaml,
so a new DTS using them is unlikely to get through netdev.

The MDIO bus level reset in mdio.yaml solves the same ordering problem
without using deprecated property. `__mdiobus_register()` asserts and
releases it before any device on the bus is registered, so it also
covers the DT described case where the bus is not scanned at all:

=09&mdio1 {
=09=09reset-delay-us =3D <20000>;
=09=09reset-gpios =3D <&gpio4 RK_PC2 GPIO_ACTIVE_LOW>;
=09=09reset-post-delay-us =3D <100000>;

=09=09rgmii_phy: ethernet-phy@1 {
=09=09=09compatible =3D "ethernet-phy-ieee802.3-c22";
=09=09=09reg =3D <0x1>;
=09=09};
=09};

with gmac1_rstn_l moved to the MAC's pinctrl-0, since the MDIO bus has
no device of its own for pinctrl to bind to. There is only one PHY on
mdio1, so a bus wide reset is equivalent to the per-PHY one.

v3 carries this as patch 1, against the NanoPi Zero2 and ahead of the
move, so it can be backported:

<https://lore.kernel.org/r/20260909-r28s-upstream-v3-0-ee3e1a34a353@proton.=
me>

A `Tested-by` on that form would be very welcome, since it is not the
variant you tested.

> I had an R28S series of my own out before I saw yours; I am dropping it.

Sorry about the duplicated effort.

Thanks,
Rong An.

