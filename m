Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4AE3CCD199
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Oct 2025 12:35:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MhYxWhLFynEPuXGXf6NvRZnWZ6WgJyN1EoBH8Cps2Ag=; b=VYLIY7DqKXj5Y3R8fflWXwdU2e
	ONfCes/6EY8wE2CQo37jPChUijSN/xPErgocJNNoqLj2+vDUoaF7WDBfLpKNwfXzuSQfCD0WMcsZ/
	ZluQhbhW4N1sd959s36AJxyUyG8XHu/5P1j8TybwyoGt7fTibMqJHyYoKqFhPCiPyx4c5PL4/1DUK
	sgo+IecrtYfRTKDLZNohaouB7gJEhkqdJu5XTtpnJfKg6uVPnYNAy4M3F2IRVVRomgaGb9uFqTigK
	cg0ycPZ/74wASlKpmyH557xwxSiw0rVbrswE4EycP/dCvrfhjITUbZ+mVVe0+LBtIuzb1SxJty7O7
	4cJP8GYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAp67-0000000DXOl-1ua9;
	Mon, 20 Oct 2025 12:34:47 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAp2x-0000000DSi4-0B9i;
	Mon, 20 Oct 2025 12:31:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=MhYxWhLFynEPuXGXf6NvRZnWZ6WgJyN1EoBH8Cps2Ag=; b=MabG5WugADLFB3VHMtrQzUpRxT
	Uu5zPfFuEVei3jXQflPWqYDa6IGq9AhbFshszFxtQ1DIYbau0T1+AsxcL/7DW0l1L2pB6zDvyTRqH
	494zfzYQgg30yraphBl8ZiXhUoL0awuihc5jLRjNZhUoPtRpTUm2/UYBJmic6y/VzE7YfDsJKCxvD
	MqvUhcQZMorqRGWCQqtPbOQ5hIZObA1uZmQxvvU6BEMyffc5XFJ+mIsmPRyXijZAodRwEpxRgsW9k
	inN2sogIdhHGsVM3s262AzpVc1S7oBKNHAes48Gbb4e9nTsTuCzDv25e+XfDVI6e9i6+Hgkeyaaur
	JrlXViug==;
Received: from gloria.sntech.de ([185.11.138.130])
	by casper.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAp2p-000000075TG-3MZj;
	Mon, 20 Oct 2025 12:31:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=MhYxWhLFynEPuXGXf6NvRZnWZ6WgJyN1EoBH8Cps2Ag=; b=zjTdNbwzRfJ02QMBrrUYQyahQC
	e9N3vAi5TdIP52ZJc9LOJrjBvU+FQY7C7UqYSd4R0ulVAW1xYAUKXit/t/Rr4/7MZxilfLTNNJgac
	TlFiOtt/tM3BpXEYQzfEO+lrPttm2Zk9zvunVObYN9FvqgCaOWoNYUx/SS2DDJ5g/lH8VblaMS2fZ
	7ZT+SpN4ORtxBml2817HjzBDIFLE6qL/CmK8DJm0yEeTns6Dk/df/NPZeiwBHJhNsNxzx4kD0nkHi
	5hMv45MUTUZN0U8f5/YH/rZ6GrqqID3rYMB42Sqypt8jJYpXqM01Qg8aZU+kjq2Zupd4ICtFzxcNp
	WqFKgMJw==;
Received: from [141.76.253.240] (helo=phil.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1vAp2f-0000zJ-3h; Mon, 20 Oct 2025 14:31:13 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Alexey Charkov <alchark@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Subject: Re: [PATCH] arm64: dts: rockchip: Add DSI LCD display on rk3576-evb1
Date: Mon, 20 Oct 2025 14:31:12 +0200
Message-ID: <12339028.CDJkKcVGEf@phil>
In-Reply-To: <748fd61a-31fb-436f-b028-b47807a4860c@gmail.com>
References: <20250925-rk3576-evb1-dsi-v1-1-c76fc3740abc@gmail.com>
 <5143458.iZASKD2KPV@phil> <748fd61a-31fb-436f-b028-b47807a4860c@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_133125_099280_3D0B7628 
X-CRM114-Status: GOOD (  28.37  )
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

Am Montag, 20. Oktober 2025, 10:50:58 Mitteleurop=C3=A4ische Sommerzeit sch=
rieb Alexey Charkov:
>=20
> On Mon, Oct 20, 2025 at 12:31=E2=80=AFPM Heiko Stuebner <heiko@sntech.de>=
 wrote:
> >
> > Am Montag, 20. Oktober 2025, 10:19:51 Mitteleurop=C3=A4ische Sommerzeit=
 schrieb Alexey Charkov:
> > > On Thu, Sep 25, 2025 at 12:38=E2=80=AFAM Alexey Charkov <alchark@gmai=
l.com> wrote:
> > > >
> > > > Add support for the Rockchip W552793DBA-V10 LCD+touchscreen assembl=
y which
> > > > comes physically attached to Rockchip RK3576 EVB1 boards.
> > > >
> > > > The display part is driven by the on-chip MIPI DSI controller, and =
the
> > > > touchscreen is connected over I2C.
> > > >
> > > > Signed-off-by: Alexey Charkov <alchark@gmail.com>
> > > > ---
> > > > Note that backlight support is left out for now, as it depends on P=
WM
> > > > support [0] which has not yet been merged.
> > > >
> > > > A workaround is simply `gpioset -c 0 13=3D1` to set the respective =
GPIO
> > > > pin high and thus to light up the display unconditionally.
> > > >
> > > > [0] https://lore.kernel.org/lkml/20250602-rk3576-pwm-v2-0-a6434b0ce=
60c@collabora.com/
> > > > ---
> > > >  arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dts | 89 ++++++++++++=
++++++++++++
> > > >  1 file changed, 89 insertions(+)
> > >
> > > Hi Heiko,
> > >
> > > Any thoughts about this one? Can we perhaps get it merged for -next?
> >
> > Does the gpio-backlight work on that device?
> > That would make the gpioset hack unnecessary.
>=20
> I've got a local patch using pwm-gpio and pwm-backlight as a stop-gap=20
> solution, but I don't think it's worth merging upstream, because the=20
> backlight is supposed to be driven by the hardware PWM on the same pin=20
> (not bit-banging the GPIO line). After all, Nicolas has been working on=20
> adding a proper hardware PWM driver for RK3576.
>=20
> The display itself works without PWM support, and so does the touchscreen.

Right now, I don't think we have an actual timeline if/when Nicolas will
be able to work on the pwm again. So my idea was if we want to
integrate the baclight as you described below, to have an actual usable
display and then when the new pwm has landed switch over to that one?


Heiko


> My temp patch goes like this:
>=20
> ---
>   arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dts | 15 +++++++++++++++
>   1 file changed, 15 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dts=20
> b/arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dts
> index f20cd6f2c079..5c27fff03569 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dts
> +++ b/arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dts
> @@ -58,6 +58,14 @@ button-vol-up {
>   		};
>   	};
>=20
> +	backlight: backlight {
> +		compatible =3D "pwm-backlight";
> +		brightness-levels =3D <20 220>;
> +		default-brightness-level =3D <100>;
> +		num-interpolated-steps =3D <200>;
> +		pwms =3D <&lcd_bl_pwm 0 25000 0>;
> +	};
> +
>   	hdmi-con {
>   		compatible =3D "hdmi-connector";
>   		type =3D "a";
> @@ -78,6 +86,12 @@ work_led: led-0 {
>   		};
>   	};
>=20
> +	lcd_bl_pwm: pwm {
> +		#pwm-cells =3D <3>;
> +		compatible =3D "pwm-gpio";
> +		gpios =3D <&gpio0 RK_PB5 GPIO_ACTIVE_HIGH>;
> +	};
> +
>   	vbus5v0_typec: regulator-vbus5v0-typec {
>   		compatible =3D "regulator-fixed";
>   		regulator-name =3D "vbus5v0_typec";
> @@ -277,6 +291,7 @@ panel@0 {
>   		compatible =3D "wanchanglong,w552793baa", "raydium,rm67200";
>   		reg =3D <0>;
>=20
> +		backlight =3D <&backlight>;
>   		iovcc-supply =3D <&vcc3v3_lcd_n>;
>   		reset-gpios =3D <&gpio3 RK_PB5 GPIO_ACTIVE_LOW>;
>   		vdd-supply =3D <&vcc3v3_lcd_n>;
>=20





