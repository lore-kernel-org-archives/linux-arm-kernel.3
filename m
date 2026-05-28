Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E7D9CD5BD1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 May 2026 05:58:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Fd80mj/3IKoqWLM74yrIKUbYLZKNJTRnbWUqqZcHbKs=; b=H0u/6T1WrLffbBxAvtIDMK1cZh
	50l933qg9ZCtPumnZYRqeR1wPDuL8S0956j7Jv1GYF1vgivXjS9xN3pT03saSJalBsb6wEuzin9FK
	8CNGmqUjgToySxF2Wt0UBdM/g5l/7RfWaiIEmUQzwvda2PHsvJVrmNzwOWz2QsO64JSJqW4UxjKKh
	goFvrwBIVbo3WO0VaCX6PJErTa8tmjBInVnbG8TZVOEWWy1HjJ6Rq60SCQflWJ1NP6IcmcyX+CV6u
	ZvHrELe1lg8mb+lBKdg5Iz/2g7TTmxJOQmNC9aMDR2DXy7PL4JKOhOYLZ6rOLprAippxO88wFDaUU
	PLTvp/Vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSTkr-00000005Auo-1Ory;
	Thu, 28 May 2026 05:58:05 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSTkp-00000005Au8-1bLb;
	Thu, 28 May 2026 05:58:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=Fd80mj/3IKoqWLM74yrIKUbYLZKNJTRnbWUqqZcHbKs=; b=QlVv0Qrk0PyeAuUmNgfjl8R7/Z
	NeoTZdlSlxqRCcZHYA3bn1vb/T2z1+qwkDd5Tuk/9oOQn/Ssn+BK2wkx+yWy4wCPL6GKPzoNoXN1t
	idv4b5jx5aE37qz6gYEnEYQgrnXv0qLTZZtqdffUdf51mQ4D3D2n3P3Dpy7pTE90V3CEplSN+dWDG
	/NgcjdBvzy7d+ekKG67XLwOPF7FUhyGgmhPSyhd817TSXP3RklXa5YZT2d4IPLE4ueTld9QojvTkJ
	FMbVbPwc9PncJ4ocnWF03PXJK7njzwB2Mn0Qg+x306NgieTKIfOo0StcAtoTb6uGAVD6Xm9sTzAkG
	tX3oGzrg==;
From: Heiko Stuebner <heiko@sntech.de>
To: Chukun Pan <amadeus@jmu.edu.cn>
Cc: jonas@kwiboo.se, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 Chukun Pan <amadeus@jmu.edu.cn>
Subject: Re: [PATCH v2 2/5] arm64: dts: rockchip: Enable USB 2.0 ports on Radxa E20C
Date: Thu, 28 May 2026 07:57:45 +0200
Message-ID: <3879225.zToM8qfIzz@phil>
In-Reply-To: <20260525065005.1056845-1-amadeus@jmu.edu.cn>
References: <20260505171208.3267387-3-heiko@sntech.de>
 <20260525065005.1056845-1-amadeus@jmu.edu.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260527_225803_601033_1B01E650 
X-CRM114-Status: GOOD (  11.84  )
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

Am Montag, 25. Mai 2026, 08:50:05 Mitteleurop=C3=A4ische Sommerzeit schrieb=
 Chukun Pan:
> > +&usb_host0_xhci {
> > +	extcon =3D <&usb2phy>;
> > +	maximum-speed =3D "high-speed";
> > +	phys =3D <&usb2phy_otg>;
> > +	phy-names =3D "usb2-phy";
>=20
> I received this warning for this otg port:
> [    0.163307] dwc3 fe500000.usb: Configuration mismatch. dr_mode forced =
to host

Interesting, because if I read the schematics correctly, this is the
controller labeled "usb2.0 otg0" .
It even has a vbus-detect line.

If I understand the schematics and product page correctly, this
actually is an outward facing type-c-port, making the device a
peripheral?

usb_host0_xhci -> port1 of FE1.1s_QFN (device1 connected to the hub)
uart0 -> ch340 -> port2 of FE1.1s_QFN (device2 connected to the hub)

=46E1.1s_QFN host dm+dp going to the type-c port of the board.

So if anything, that controller should probably have dr_mode=3Dperipheral
I think?


>=20
> > +	snps,dis_u2_susphy_quirk;
>=20
> This property is missing in the sige1 patch. Since this property
> is related to phy vbus detection, can we move it to rk3528.dtsi?

yeah, that sounds sensible ... looking at the other socs using that
quirk, it really seems to be a property of the controller.


Heiko



