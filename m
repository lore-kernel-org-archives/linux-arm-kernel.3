Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D52BEEF312
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 07:54:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=INGbhC1k38Jrr8kD8M8GCyeZ7uJijtC0Me4SABhYQmg=; b=Rv7SSmR7gf3CFtDqYg9wwWthJD
	AnMTqx1sLxwRIQM3B8Pr/jEUEnfT5N97I2dpmbJ+zXWtZdIlF71H4tUDK/2oEZoUDzdYp+VrBMvAb
	RskEfJdqVw9N/lPH15+AWN8Myfwu9P0p9/H+5S0uy7se8EmCrU5o1SaAGOkeqjrPROmtcpmGrip8P
	xJVBFcCAcJ53ejV8ADO4pDNdFwn5fblrU3bcd8pqu2wW3bk0iwsu9HVAkCfg9Q1EQ99XqZxTu5Uoc
	aS8RLUAodlq6bdP4i/0aSrEO6fzwn83EW4qmA24k7c0CTP8OJEW1iAYZjFweCQHDhuPg9zFheV6bU
	Do8p2nxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy3Xi-000000018T8-3bt2;
	Thu, 05 Mar 2026 07:54:46 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy3Xf-000000018OP-1qSA
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Mar 2026 07:54:45 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id ADB11C40404;
	Thu,  5 Mar 2026 07:54:56 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 28BF15FDEB;
	Thu,  5 Mar 2026 07:54:38 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4AFD51036981A;
	Thu,  5 Mar 2026 08:54:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1772697277; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=INGbhC1k38Jrr8kD8M8GCyeZ7uJijtC0Me4SABhYQmg=;
	b=lhxI5l8/VONdMAIwqs/2IElcJc+GoI3Y+SJON2PZaZFs8Vq54FxfiqMoB6j58Jg4LyKxoN
	XKzzVE8KbVMV50C0QbPLInENombI2kH+esU68DR4+uaQtUHcDAPboa/g0SYlU05D8ksXPa
	92ZE8P+kEg4icw/xhHb9nMq9aSoZeWUd/G2Jg/8NnvpISdvG5eyTACg6K2NDkFUVShQoGL
	IL15RxAr7cENNulbAT+OwLAQow3ue423grgkoHNFKM2dvmBZEGx2iYBwedZcSNs3U9KayG
	wmHaw0WmPC5rK+yHhIqK7ZWxb49/mFveEM5pq5+esQE7Ppvv+9Io0/SGeTniow==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
To: Andrew Lunn <andrew@lunn.ch>, Gabor Juhos <j4g8y7@gmail.com>
Cc: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: marvell: armada-37xx: drop
 'marvell,usb-misc-reg' properties
In-Reply-To: <db997887-2431-4baa-8e96-04f53ea59060@lunn.ch>
References: <20260304-armada-37xx-drop-usb-misc-reg-v1-1-800c1b746b7a@gmail.com>
 <db997887-2431-4baa-8e96-04f53ea59060@lunn.ch>
Date: Thu, 05 Mar 2026 08:54:34 +0100
Message-ID: <874imug18l.fsf@BLaptop.bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_235443_629652_F805BF23 
X-CRM114-Status: GOOD (  15.17  )
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

Hello Andrew,

> On Wed, Mar 04, 2026 at 08:12:43PM +0100, Gabor Juhos wrote:
>> The 'marvell,usb-misc-reg' property is present both in the EHCI and
>> in the XHCI USB host device nodes, however it is not documented. Thus
>> 'make dtbs_check' produces warnings like these:
>>=20
>>   /arch/arm64/boot/dts/marvell/armada-3720-db.dtb: usb@58000 (marvell,ar=
mada3700-xhci): Unevaluated properties are not allowed ('marvell,usb-misc-r=
eg' was unexpected)
>>           from schema $id: http://devicetree.org/schemas/usb/generic-xhc=
i.yaml
>>   /arch/arm64/boot/dts/marvell/armada-3720-db.dtb: usb@5e000 (marvell,ar=
mada-3700-ehci): Unevaluated properties are not allowed ('marvell,usb-misc-=
reg' was unexpected)
>>           from schema $id: http://devicetree.org/schemas/usb/generic-ehc=
i.yaml
>>=20
>> Apart from the fact that the properties are not documented, those are
>> not even used by any USB host drivers. At least 'git grep' says this:
>>=20
>>   $ git grep -n 'marvell.usb-misc-reg' v7.0-rc2
>>   v7.0-rc2:Documentation/devicetree/bindings/phy/marvell,armada-3700-utm=
i-phy.yaml:30:  marvell,usb-misc-reg:
>>   v7.0-rc2:Documentation/devicetree/bindings/phy/marvell,armada-3700-utm=
i-phy.yaml:41:  - marvell,usb-misc-reg
>>   v7.0-rc2:Documentation/devicetree/bindings/phy/marvell,armada-3700-utm=
i-phy.yaml:50:      marvell,usb-misc-reg =3D <&usb2_syscon>;
>>   v7.0-rc2:arch/arm64/boot/dts/marvell/armada-37xx.dtsi:372:            =
                  marvell,usb-misc-reg =3D <&usb32_syscon>;
>>   v7.0-rc2:arch/arm64/boot/dts/marvell/armada-37xx.dtsi:383:            =
                  marvell,usb-misc-reg =3D <&usb32_syscon>;
>>   v7.0-rc2:arch/arm64/boot/dts/marvell/armada-37xx.dtsi:396:            =
                  marvell,usb-misc-reg =3D <&usb2_syscon>;
>>   v7.0-rc2:arch/arm64/boot/dts/marvell/armada-37xx.dtsi:406:            =
                  marvell,usb-misc-reg =3D <&usb2_syscon>;
>>   v7.0-rc2:drivers/phy/marvell/phy-mvebu-a3700-utmi.c:231:              =
                                           "marvell,usb-misc-reg");
>

I don't follow:

> The phy-mvebu-a3700-utmi.c does use it, and does document it:
>
>   marvell,usb-misc-reg:
>     description:
>       Phandle on the "USB miscellaneous registers" shared region
>       covering registers related to both the host controller and
>       the PHY.
>     $ref: /schemas/types.yaml#/definitions/phandle
>
> And the patch which added the property to the USB nodes also added the
> PHY nodes.
>
> commit 05d168a56fae8ff50432d5dfe6e7423b989455a8
> Author: Miquel Raynal <miquel.raynal@bootlin.com>
> Date:   Tue Jan 29 10:36:34 2019 +0100
>
>     arm64: dts: marvell: armada-37xx: declare USB2 UTMI PHYs
>

You stated that the property is used and was properly added.

> So this change does lookcorrect.

But here you agree with removing it.

I am lost :)

Gregory

>
> Reviewed-by: Andrew Lunn <andrew@lunn.ch>
>
>     Andrew

--=20
Gr=C3=A9gory CLEMENT, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

