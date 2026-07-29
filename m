Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2960C53200
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jul 2026 17:35:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PpUrkAYPFOVA1pV5Hqor5M/8KfkA4Zbov6foGmLt584=; b=pDdDM2CaXmzPVenI5l9ab7FvGo
	9VYmQzSSZsTRZGSKaIWnKjAzb9CGyruIdknVqGhLm3TyXFmXBn+oyiFaTH8+WQA8E0ySD7wpf1OqV
	7bWvlkQGoFQSaOX1rjaywjeO2nCPmetv3LvKo0kIG94Z5Y6n7n8EFyQf7T/wcxbfYM80EQYotnHSi
	pOiCe0q1SaWA2X6ucoe5zXJ6FHBfyFJURlaxOKWQqOqqDc8t26wshbzE4nrwLe7zzZTcyfDwmxp/w
	UV/Rx9fpTfgGrUvZDEmRUbk7hGRoZZmnCOO0bJ2V6UzsKTOsRBo8Zi+fUIIyiyBlfz23205nvTSqF
	wGjfy9xQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp8Bm-00000008iQP-1QR6;
	Wed, 29 Jul 2026 17:35:30 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp8Bk-00000008iPm-0RfF;
	Wed, 29 Jul 2026 17:35:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=PpUrkAYPFOVA1pV5Hqor5M/8KfkA4Zbov6foGmLt584=; b=0VN8FIB2IsiVhWK2p21wuwWWqr
	1s2Yll/671IrZG4xK0SXvE8kKTBU/U/Fv3UrEqxR74QvYcjemQlGi/1E4a3TWcqmJB6/mM1qaXzcc
	zZv56SvcjWWgUwXh6KwjztEA3TQhdXMY1vpwbcbOCZ5PEoGjIlwcUvw75Ympun009ppy+aIa7jy5G
	EfbfxdsNwAyZk9gGi1qvURU0dDfByTiKUvzoZsTVnA2Y6yJ5KI+WF9rFV6gdh7Nl+BDJ2WbLSY4aE
	xGDRT3R1XlGB0an+5X0wZGPVG0tPftDJHEVSLGxjb+r8mus24Ii9963sc/AzkjILveFkNybI5kacS
	g+NuHZSg==;
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Alexey Charkov <alchark@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Subject: Re: [PATCH] arm64: dts: rockchip: Add DSI LCD display on rk3576-evb1
Date: Wed, 29 Jul 2026 19:35:22 +0200
Message-ID: <12148936.RiKt1P0BV1@diego>
In-Reply-To: <CABjd4Yy7kzPFxSakaGqY18hyJCfQf5neCoHBdm4DueFrfnda0A@mail.gmail.com>
References: <20250925-rk3576-evb1-dsi-v1-1-c76fc3740abc@gmail.com>
 <29759328.czjnFlTdjD@diego>
 <CABjd4Yy7kzPFxSakaGqY18hyJCfQf5neCoHBdm4DueFrfnda0A@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_103528_174510_2572F73D 
X-CRM114-Status: GOOD (  42.50  )
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

Am Mittwoch, 29. Juli 2026, 18:32:08 Mitteleurop=C3=A4ische Sommerzeit schr=
ieb Alexey Charkov:
> On Wed, Jul 29, 2026 at 6:46=E2=80=AFPM Heiko St=C3=BCbner <heiko@sntech.=
de> wrote:
> >
> > Am Montag, 20. Oktober 2025, 14:31:12 Mitteleurop=C3=A4ische Sommerzeit=
 schrieb Heiko Stuebner:
> > > Am Montag, 20. Oktober 2025, 10:50:58 Mitteleurop=C3=A4ische Sommerze=
it schrieb Alexey Charkov:
> > > >
> > > > On Mon, Oct 20, 2025 at 12:31=E2=80=AFPM Heiko Stuebner <heiko@snte=
ch.de> wrote:
> > > > >
> > > > > Am Montag, 20. Oktober 2025, 10:19:51 Mitteleurop=C3=A4ische Somm=
erzeit schrieb Alexey Charkov:
> > > > > > On Thu, Sep 25, 2025 at 12:38=E2=80=AFAM Alexey Charkov <alchar=
k@gmail.com> wrote:
> > > > > > >
> > > > > > > Add support for the Rockchip W552793DBA-V10 LCD+touchscreen a=
ssembly which
> > > > > > > comes physically attached to Rockchip RK3576 EVB1 boards.
> > > > > > >
> > > > > > > The display part is driven by the on-chip MIPI DSI controller=
, and the
> > > > > > > touchscreen is connected over I2C.
> > > > > > >
> > > > > > > Signed-off-by: Alexey Charkov <alchark@gmail.com>
> > > > > > > ---
> > > > > > > Note that backlight support is left out for now, as it depend=
s on PWM
> > > > > > > support [0] which has not yet been merged.
> > > > > > >
> > > > > > > A workaround is simply `gpioset -c 0 13=3D1` to set the respe=
ctive GPIO
> > > > > > > pin high and thus to light up the display unconditionally.
> > > > > > >
> > > > > > > [0] https://lore.kernel.org/lkml/20250602-rk3576-pwm-v2-0-a64=
34b0ce60c@collabora.com/
> > > > > > > ---
> > > > > > >  arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dts | 89 ++++++=
++++++++++++++++++
> > > > > > >  1 file changed, 89 insertions(+)
> > > > > >
> > > > > > Hi Heiko,
> > > > > >
> > > > > > Any thoughts about this one? Can we perhaps get it merged for -=
next?
> > > > >
> > > > > Does the gpio-backlight work on that device?
> > > > > That would make the gpioset hack unnecessary.
> > > >
> > > > I've got a local patch using pwm-gpio and pwm-backlight as a stop-g=
ap
> > > > solution, but I don't think it's worth merging upstream, because the
> > > > backlight is supposed to be driven by the hardware PWM on the same =
pin
> > > > (not bit-banging the GPIO line). After all, Nicolas has been workin=
g on
> > > > adding a proper hardware PWM driver for RK3576.
> > > >
> > > > The display itself works without PWM support, and so does the touch=
screen.
> > >
> > > Right now, I don't think we have an actual timeline if/when Nicolas w=
ill
> > > be able to work on the pwm again. So my idea was if we want to
> > > integrate the baclight as you described below, to have an actual usab=
le
> > > display and then when the new pwm has landed switch over to that one?
> >
> > With the ELCE around the corner we're nearing the year-mark here ;-)
> > (And I'm surprised, I remembered this pending patch)
>=20
> I've been hoping that Nicolas' PWM series gets further along in the meant=
ime :)
>=20
> > So how about integrating your gpio-pwm backlight for the time being?
>=20
> Could do that, but I'm worried if it would immediately become set in
> stone because DT is ABI, making it hard to switch to a "proper"
> hardware-driven PWM once Nicolas' series lands.

The backlight subsystem is using dev_name() to name the sysfs node.
So if you keep the node name to "backlight", the backlight device stays the
same.

I guess the question is if you also consider the brightness levels as
unchangeable, though I would assume any sane system should just read
max_brightness and adjust accordingly.

Also this is an eval-board ... so you won't have any actual real-world
users :-) .

So, personally I don't see the big hickup here, but we'll do what you
think best.


Heiko

> > Or alternatively just going with a gpio-backlight, like the Anbernic Vi=
ta did:
> >
> >         /*
> >          * LEDs and Backlights can be controlled as a PWM, but PWM
> >          * support is not yet available.
> >          */
> >         gpio_backlight: backlight {
> >                 compatible =3D "gpio-backlight";
> >                 gpios =3D <&gpio2 RK_PC4 GPIO_ACTIVE_HIGH>;
> >                 pinctrl-0 =3D <&led_backlight_h>;
> >                 pinctrl-names =3D "default";
> >         };
>=20
> In the case of RK3576 EVB1 enabling it at full power is eye-burning
> bright, so some sort of PWM is definitely warranted.
>=20
> Best regards,
> Alexey
>=20





