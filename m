Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 086C8C54F51
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jul 2026 14:47:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zJcsJ8fR+ulIwIiOMxrp3nSK2qIbFs2gb9tc6WLrzyQ=; b=ElocVk90eeEdUda6iyVYnES/Yw
	Ac0g27ZDKjUUAQT/7YVkSKn85HYYkcIMAIDRQlVYwzM6K0OycwOVwy6oYlQcOzm62w2pIcInwAzrB
	4CyFf5lTZgGvOf4G98V5O2gddpPazfU6Mo3KGRZyiZFxZrUP8Eo4tkKu4uBa7J2zhs8Eowkvw6YUX
	/LNbLLzvjCOsjyJu7EV2FRt8HwKJVoQCFkw7ZoUiVLZknDhNEwVeZtkMvuoEYPUI+2vSqOgYoDcUC
	DR2qC51mANGIdeJwQA+bamh05gTL/0JhWFnNusg90TNWWjiEJI4Zn8y7a/OqcCbcRgoG3gI+pDUw2
	bNvxhaog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp5Yc-00000008HnF-0ltT;
	Wed, 29 Jul 2026 14:46:54 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp5YY-00000008Hmm-20vP;
	Wed, 29 Jul 2026 14:46:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=zJcsJ8fR+ulIwIiOMxrp3nSK2qIbFs2gb9tc6WLrzyQ=; b=c2Iwj9ryzc7uaSSy6XQOv58vFx
	ysJ3eLDDGkq65DzSjVvj1Lxj02XFVF/lGve/vr7WU6/lgoXvyTVX6bTWnHP5RjZJzMWT18EeK8kyK
	whKrhnj8Z9zR3AbSk0ppWJvyS3roCfMvyeSaqqiJS9meUURiohi99+AWgqe5+NpPwm2S1qcvclOg7
	uEEDgHQiYrLDspUjMEc6rFFnnknWPy47yCLvkNzoyDxmzsgnNsnVKHjIqPixQGggrwm7RMm+L9CEF
	e6KoB5ZwPHLjyzQOuqZSp7KIdMYsYConi4zPod81125RGDJ7MHqXHggALLhACVLFmo9Dy46bxkxYw
	YbPO3r4w==;
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Alexey Charkov <alchark@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Subject: Re: [PATCH] arm64: dts: rockchip: Add DSI LCD display on rk3576-evb1
Date: Wed, 29 Jul 2026 16:46:45 +0200
Message-ID: <29759328.czjnFlTdjD@diego>
In-Reply-To: <12339028.CDJkKcVGEf@phil>
References: <20250925-rk3576-evb1-dsi-v1-1-c76fc3740abc@gmail.com>
 <748fd61a-31fb-436f-b028-b47807a4860c@gmail.com> <12339028.CDJkKcVGEf@phil>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_074650_701431_123C21DE 
X-CRM114-Status: GOOD (  36.50  )
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

Am Montag, 20. Oktober 2025, 14:31:12 Mitteleurop=C3=A4ische Sommerzeit sch=
rieb Heiko Stuebner:
> Am Montag, 20. Oktober 2025, 10:50:58 Mitteleurop=C3=A4ische Sommerzeit s=
chrieb Alexey Charkov:
> >=20
> > On Mon, Oct 20, 2025 at 12:31=E2=80=AFPM Heiko Stuebner <heiko@sntech.d=
e> wrote:
> > >
> > > Am Montag, 20. Oktober 2025, 10:19:51 Mitteleurop=C3=A4ische Sommerze=
it schrieb Alexey Charkov:
> > > > On Thu, Sep 25, 2025 at 12:38=E2=80=AFAM Alexey Charkov <alchark@gm=
ail.com> wrote:
> > > > >
> > > > > Add support for the Rockchip W552793DBA-V10 LCD+touchscreen assem=
bly which
> > > > > comes physically attached to Rockchip RK3576 EVB1 boards.
> > > > >
> > > > > The display part is driven by the on-chip MIPI DSI controller, an=
d the
> > > > > touchscreen is connected over I2C.
> > > > >
> > > > > Signed-off-by: Alexey Charkov <alchark@gmail.com>
> > > > > ---
> > > > > Note that backlight support is left out for now, as it depends on=
 PWM
> > > > > support [0] which has not yet been merged.
> > > > >
> > > > > A workaround is simply `gpioset -c 0 13=3D1` to set the respectiv=
e GPIO
> > > > > pin high and thus to light up the display unconditionally.
> > > > >
> > > > > [0] https://lore.kernel.org/lkml/20250602-rk3576-pwm-v2-0-a6434b0=
ce60c@collabora.com/
> > > > > ---
> > > > >  arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dts | 89 ++++++++++=
++++++++++++++
> > > > >  1 file changed, 89 insertions(+)
> > > >
> > > > Hi Heiko,
> > > >
> > > > Any thoughts about this one? Can we perhaps get it merged for -next?
> > >
> > > Does the gpio-backlight work on that device?
> > > That would make the gpioset hack unnecessary.
> >=20
> > I've got a local patch using pwm-gpio and pwm-backlight as a stop-gap=20
> > solution, but I don't think it's worth merging upstream, because the=20
> > backlight is supposed to be driven by the hardware PWM on the same pin=
=20
> > (not bit-banging the GPIO line). After all, Nicolas has been working on=
=20
> > adding a proper hardware PWM driver for RK3576.
> >=20
> > The display itself works without PWM support, and so does the touchscre=
en.
>=20
> Right now, I don't think we have an actual timeline if/when Nicolas will
> be able to work on the pwm again. So my idea was if we want to
> integrate the baclight as you described below, to have an actual usable
> display and then when the new pwm has landed switch over to that one?

With the ELCE around the corner we're nearing the year-mark here ;-)
(And I'm surprised, I remembered this pending patch)

So how about integrating your gpio-pwm backlight for the time being?

Or alternatively just going with a gpio-backlight, like the Anbernic Vita d=
id:

        /*
         * LEDs and Backlights can be controlled as a PWM, but PWM
         * support is not yet available.
         */
        gpio_backlight: backlight {
                compatible =3D "gpio-backlight";
                gpios =3D <&gpio2 RK_PC4 GPIO_ACTIVE_HIGH>;
                pinctrl-0 =3D <&led_backlight_h>;
                pinctrl-names =3D "default";
        };

DSI without backlight is a quite black screen, which I'd call non-working
still, so would require some form of backlight.


Heiko

> > My temp patch goes like this:
> >=20
> > ---
> >   arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dts | 15 +++++++++++++++
> >   1 file changed, 15 insertions(+)
> >=20
> > diff --git a/arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dts=20
> > b/arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dts
> > index f20cd6f2c079..5c27fff03569 100644
> > --- a/arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dts
> > +++ b/arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dts
> > @@ -58,6 +58,14 @@ button-vol-up {
> >   		};
> >   	};
> >=20
> > +	backlight: backlight {
> > +		compatible =3D "pwm-backlight";
> > +		brightness-levels =3D <20 220>;
> > +		default-brightness-level =3D <100>;
> > +		num-interpolated-steps =3D <200>;
> > +		pwms =3D <&lcd_bl_pwm 0 25000 0>;
> > +	};
> > +
> >   	hdmi-con {
> >   		compatible =3D "hdmi-connector";
> >   		type =3D "a";
> > @@ -78,6 +86,12 @@ work_led: led-0 {
> >   		};
> >   	};
> >=20
> > +	lcd_bl_pwm: pwm {
> > +		#pwm-cells =3D <3>;
> > +		compatible =3D "pwm-gpio";
> > +		gpios =3D <&gpio0 RK_PB5 GPIO_ACTIVE_HIGH>;
> > +	};
> > +
> >   	vbus5v0_typec: regulator-vbus5v0-typec {
> >   		compatible =3D "regulator-fixed";
> >   		regulator-name =3D "vbus5v0_typec";
> > @@ -277,6 +291,7 @@ panel@0 {
> >   		compatible =3D "wanchanglong,w552793baa", "raydium,rm67200";
> >   		reg =3D <0>;
> >=20
> > +		backlight =3D <&backlight>;
> >   		iovcc-supply =3D <&vcc3v3_lcd_n>;
> >   		reset-gpios =3D <&gpio3 RK_PB5 GPIO_ACTIVE_LOW>;
> >   		vdd-supply =3D <&vcc3v3_lcd_n>;
> >=20
>=20
>=20





