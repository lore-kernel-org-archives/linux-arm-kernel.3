Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7570BF3D5E8
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Mar 2026 08:28:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IWDxnURTi+IF8/iD9M37ASLzznD8KgRMZxGLGGi0MIw=; b=L0j50QuPwxHJvQHr+wZg3I9w2Z
	Q0OJ+umm7/32OpvqbJ+jgOsOHZ72wZf1qkO8Qw7GdEHaz3TdQCVI7vK1EMX1ZZ7OebpLETomDh9+L
	EU6qg0uJ8eGtIYODM8K5tQ45SZPqfMOdUnhYfP0gEWprSckfxhW+wpokGlkhaYFOSBUh6PUc4b6YI
	vh+0LP1fFPuf75jUUFtqY0yfBmQeY0abUUtNEYGudMd0kkpMBo4HHWNg2vivRq02LxPip1jDBshsz
	+Q66UhugY3rL3DRNGza8S8WhdR85Xtvc37GKOSyJMsZtpneU8A0V42CewNqnSq05j2j+0WjJORT0T
	Q8tB1mXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w77yj-0000000ArDH-3vp4;
	Mon, 30 Mar 2026 08:28:09 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w77yg-0000000ArBz-3L3I;
	Mon, 30 Mar 2026 08:28:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=IWDxnURTi+IF8/iD9M37ASLzznD8KgRMZxGLGGi0MIw=; b=PwF6o3Bus4nqDZmEr/pMzIT22J
	cHfd1EIWui1UH5vO2QOorMssuZJ2Dd+kF8s0DHsXcOXkSM7RbdTalDnd735//E5P1Yti+6YjnhZv/
	5zPB7X25VbAw/OQzLPETrJDw9kkSjgmnL1k9CjnCgOT5oQEf7eSEN+WyhAofuwnplR7+h2Js/6Ahc
	BJREJ6pAUjAXqVJgMDKgw2c0gys1jAUwcrmMynoqJbsYzhrRn12lJzzagV+d7zqrs6QX60wfMl3v3
	GrnLKJnas26fbqcy6YestrjuvOi5Lxdsq8bK6gn8W1HWeHXLmReGzbnzqUZUJNgxn/FaK8jle9kav
	4wAoCBYA==;
From: Heiko Stuebner <heiko@sntech.de>
To: =?UTF-8?B?6LCi6Ie06YKmIChYSUUgWmhpYmFuZyk=?= <Yeking@red54.com>,
 linux-rockchip@lists.infradead.org, Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Kever Yang <kever.yang@rock-chips.com>,
 Finley Xiao <finley.xiao@rock-chips.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: rockchip: Add RK3562 serial aliases
Date: Mon, 30 Mar 2026 10:27:52 +0200
Message-ID: <1954782.CQOukoFCf9@phil>
In-Reply-To: <9b3ee9e9-d44d-49b1-81ac-9c3806dc0efb@kernel.org>
References: <tencent_4BED6C3FFB8102B4BB3D08D6F47F2CCFC908@qq.com>
 <9b3ee9e9-d44d-49b1-81ac-9c3806dc0efb@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260330_012806_904422_B87DDE67 
X-CRM114-Status: GOOD (  15.88  )
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

Am Samstag, 28. M=C3=A4rz 2026, 16:08:57 Mitteleurop=C3=A4ische Sommerzeit =
schrieb Krzysztof Kozlowski:
> On 28/03/2026 14:05, =E8=B0=A2=E8=87=B4=E9=82=A6 (XIE Zhibang) wrote:
> > This fixes the stdout-path in rk3562-evb2-v10.dts.
> >=20
> > Fixes: ceb6ef1ea900 ("arm64: dts: rockchip: Add RK3562 evb2 devicetree")
> > Signed-off-by: =E8=B0=A2=E8=87=B4=E9=82=A6 (XIE Zhibang) <Yeking@Red54.=
com>
> > ---
> >  arch/arm64/boot/dts/rockchip/rk3562.dtsi | 10 ++++++++++
> >  1 file changed, 10 insertions(+)
> >=20
> > diff --git a/arch/arm64/boot/dts/rockchip/rk3562.dtsi b/arch/arm64/boot=
/dts/rockchip/rk3562.dtsi
> > index e4816aa3dae0..14e74e8ac7df 100644
> > --- a/arch/arm64/boot/dts/rockchip/rk3562.dtsi
> > +++ b/arch/arm64/boot/dts/rockchip/rk3562.dtsi
> > @@ -26,6 +26,16 @@ aliases {
> >  		gpio2 =3D &gpio2;
> >  		gpio3 =3D &gpio3;
> >  		gpio4 =3D &gpio4;
> > +		serial0 =3D &uart0;
> > +		serial1 =3D &uart1;
> > +		serial2 =3D &uart2;
> > +		serial3 =3D &uart3;
> > +		serial4 =3D &uart4;
> > +		serial5 =3D &uart5;
> > +		serial6 =3D &uart6;
> > +		serial7 =3D &uart7;
> > +		serial8 =3D &uart8;
> > +		serial9 =3D &uart9;
>=20
> UART aliases are properties of the boards, not SoC.

We had this argument a lot of times for those numbered aliases
where everything on all soc documentation, schematics and also
user documentation for individual boards, generally references
exactly those numbers :-)

But fiiiiiine, if it comes up all the time ...

I really hope, you're okay with intermitend ordering though:

	serial0 =3D &uart0;
	serial2 =3D &uart2;
	serial5 =3D &uart5;

because otherwise, this would cause pure chaos everywhere.

Because as I said this serial number is used on board-schematics,
board-user-level documentation, SoC documentation, even silcscreen
on boards ... so everywhere.

Similar for all the numbered busses ofthe SoCs.


Heiko




