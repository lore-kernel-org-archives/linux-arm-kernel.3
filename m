Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17A08CAC5B8
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  5 Oct 2025 10:55:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SzLT2VU9AZrprVMKaIriIjeuBSSmoOGolyPhiSrywBQ=; b=PWDp0U0WqcTlIGHjIJLN5AImDL
	vsPGDRVYt4ayPqFj5LicetEaXBqyyLL4ajcmP172UjQFmj7zre/8ajXga3KZySAjyszeuyY64DciH
	dr1CAqDUNhrDM+ExMvQ1KIpU7lzsQVt2cVL9gONJX3XIhLS3ixaFzO0evi3Mva2BBCSN0Jyr9FeAj
	wsrER/MnDE3HMG7/1X8JN474dDn01kl4skbZtm6nQrWUSa5PQnUWMpNxfQeIWTA207e3PwLafBgUh
	0JPj/4BxovPQ1ZYJ/eFqsE8nouh8uyoqPFscF918xwhMSiEv94poDrijyc2RyxXiwnSDnOEirdhUg
	l8keuzEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5MOh-0000000EloI-0fME;
	Sun, 05 Oct 2025 10:55:23 +0000
Received: from mail-qk1-x732.google.com ([2607:f8b0:4864:20::732])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5MOe-0000000Elmg-0ZXg
	for linux-arm-kernel@lists.infradead.org;
	Sun, 05 Oct 2025 10:55:21 +0000
Received: by mail-qk1-x732.google.com with SMTP id af79cd13be357-8599c274188so330645685a.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 05 Oct 2025 03:55:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759661719; x=1760266519; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SzLT2VU9AZrprVMKaIriIjeuBSSmoOGolyPhiSrywBQ=;
        b=C7PsiO5gBb9H8Tf6B27CSdHO2IH2qRZgjIDzCy2D+UtmCkfDnYMkum0LsvitxDWIN/
         FuFy+BVppCF8PiBbnKkP6A7PbwGbltnRVA4d+fhRE8CIf2zjYXxAfOQDVydNFnJKyocX
         9jf6X5wNRHJKJpX07jV9+Jh1PFQxUO3Lz5WbUvtcDLFlW0dSuZvBdoeafnoYzyAxX/yP
         uLXtgu1uArf6/YnII7ZRqktsvEhSAccJqPMwQLC69kY82efa13P5DsJ6oWgYuicolmyE
         Le4J713WOVBLo12LckTzeb68NM3wBCshT9Maz84zZ10jJo0uyCdGVrPpaAI6flo6WEsV
         MeNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759661719; x=1760266519;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SzLT2VU9AZrprVMKaIriIjeuBSSmoOGolyPhiSrywBQ=;
        b=QPaD/sn99+JqbUQB9aQEkx9zsyZK20FieeTDMblS7hxO4eZWZwoOHpF5U8Oe8fWPUA
         2Rbp26pjoe/SgXxX2OKdBCaMJvujbvp45sT5jbGJUrsEK34h/Vu1mULFxExvR2l8tmG2
         IXgGK6Py11HZaUR+L+oYWGK9AXYPY75wBEnseQ+jj5H0FWYgpLJbjk4pLNnhh9aOH6Jo
         l09K9KjSQyUamSPnoAlZwkbNu28h5qquc7nrV+TP9PE9mA8Go6L4np5fRel2INuYDAla
         dFwGZKXYsmJPvlFAjO/zmV2XR8jXID7oalnUH4uLNnoEQh0yOTep+kj+WorotBkIWQNe
         h1ow==
X-Forwarded-Encrypted: i=1; AJvYcCXk+3j5ayGqi41cC+uiQbgMtZVMm0nG+RfzSWUsqwQ2xE04ty4Xxml+G1/euUtIC2RQ/nQahuT2peghBrIUvJGX@lists.infradead.org
X-Gm-Message-State: AOJu0Yyr6STOK84tU4uqdtDqMYApp4M6uswm+ddgPJChK/bBpRwPDTqH
	3PmlVMb2s3kxmVB/6nbrQs+2/cVeLpqHvaCeDS3NeYLxZPTvzdQalyyzhNV2YLLeDnz+w2ZybvR
	tkFWDZZbkjW7rspW7HzwyhDJdclWAmhA=
X-Gm-Gg: ASbGnctSo+aFe1Cff5iNS/pNgBFWv1fq7cTQSXk8S/b5U4Uw5M5IGsGa2K0LEzXBNo9
	v91QxFjxZg2gjOQ9GS/4vfhO35KykEVrMREhQ5Pe3XO3uV1XEBYmf5M7UqZHJ7aw+1KKjfBdKGk
	y+W/ucq3LlUA7XoynkqdUDs2oDeZ6vykdW9khi50MBlgrUutHziYlYVFiIBui0/1TvsSeY27juy
	t6U4rajhrZ8wdloU+1Zkv/4sRghEfww9o7azYRJIY6xtJZVchJKnro=
X-Google-Smtp-Source: AGHT+IFCrj2Udm0U0cWFhFJiQLU1ddUKbzdouHN8/JOmQqz2+KfbPT/k9liTJOs+57MzVtTZ8JhEfUehhe7xAfv7PN8=
X-Received: by 2002:a05:620a:29c8:b0:85e:5fef:8710 with SMTP id
 af79cd13be357-87a377dd5e1mr1187717885a.47.1759661718455; Sun, 05 Oct 2025
 03:55:18 -0700 (PDT)
MIME-Version: 1.0
References: <a76f315f023a3f8f5435e0681119b4eb@manjaro.org> <CABjd4Ywh_AkbXHonx-8vL-hNY5LMLJge5e4oqxvUG+qe6OF-Og@mail.gmail.com>
 <61b494b209d7360d0f36adbf6d5443a4@manjaro.org> <CABjd4Yx0p0B=e00MjCpDDq8Z=0FtM0s9EN86WdvRimt-_+kh2w@mail.gmail.com>
 <CABjd4Yy14bpjzvFyc8et-=pmds5uwzfxNqcs7L=+XRXBogZEsQ@mail.gmail.com>
 <20251003133304.GA21023@pendragon.ideasonboard.com> <CABjd4YxbyUWghd1ya8UayFkAE-VWQSd5-J2QD0sV7WmS8AXkCg@mail.gmail.com>
 <CABjd4YwtwUYFX4bX5vy=AFi=Dn1r6nxWtMvmeKBSjkvriNJtsQ@mail.gmail.com>
 <20251003232856.GC1492@pendragon.ideasonboard.com> <CABjd4Yx9rt2W=MhCSyO5vaxndD1jvGHNWsz7J=HnvnJcgOvQHw@mail.gmail.com>
 <20251004220326.GC20317@pendragon.ideasonboard.com>
In-Reply-To: <20251004220326.GC20317@pendragon.ideasonboard.com>
From: Alexey Charkov <alchark@gmail.com>
Date: Sun, 5 Oct 2025 14:55:07 +0400
X-Gm-Features: AS18NWCuY7b2iQ0RZGkQTZdghFPEhu9IsvjzDeHFMK_prX2xIp0MyG4PQ_3f7Y0
Message-ID: <CABjd4YwLQ_kr3tA=XnzR4_zmQ0CQs4TuQr-2OWbiOWQfDhP4xw@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: rockchip: Fix broken tsadc pinctrl binding
 for rk3588
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Dragan Simic <dsimic@manjaro.org>, Alexander Shiyan <eagle.alexander923@gmail.com>, 
	Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
	devicetree@vger.kernel.org, 
	Sebastian Reichel <sebastian.reichel@collabora.com>, stable@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251005_035520_203083_42E50E11 
X-CRM114-Status: GOOD (  69.76  )
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

On Sun, Oct 5, 2025 at 2:03=E2=80=AFAM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> On Sat, Oct 04, 2025 at 03:41:41PM +0400, Alexey Charkov wrote:
> > On Sat, Oct 4, 2025 at 3:29=E2=80=AFAM Laurent Pinchart wrote:
> > > On Fri, Oct 03, 2025 at 06:55:26PM +0400, Alexey Charkov wrote:
> > > > On Fri, Oct 3, 2025 at 6:13=E2=80=AFPM Alexey Charkov wrote:
> > > > > On Fri, Oct 3, 2025 at 5:33=E2=80=AFPM Laurent Pinchart wrote:
> > > > > > On Fri, Jan 24, 2025 at 11:44:34PM +0400, Alexey Charkov wrote:
> > > > > > > On Fri, Jan 24, 2025 at 9:23=E2=80=AFPM Alexey Charkov wrote:
> > > > > > > > On Fri, Jan 24, 2025 at 2:37=E2=80=AFPM Dragan Simic wrote:
> > > > > > > > > On 2025-01-24 11:25, Alexey Charkov wrote:
> > > > > > > > > > On Fri, Jan 24, 2025 at 2:06=E2=80=AFPM Dragan Simic wr=
ote:
> > > > > > > > > >> On 2025-01-24 09:33, Alexey Charkov wrote:
> > > > > > > > > >> > On Fri, Jan 24, 2025 at 9:26=E2=80=AFAM Alexander Sh=
iyan wrote:
> > > > > > > > > >> >>
> > > > > > > > > >> >> There is no pinctrl "gpio" and "otpout" (probably d=
esigned as
> > > > > > > > > >> >> "output")
> > > > > > > > > >> >> handling in the tsadc driver.
> > > > > > > > > >> >> Let's use proper binding "default" and "sleep".
> > > > > > > > > >> >
> > > > > > > > > >> > This looks reasonable, however I've tried it on my R=
adxa Rock 5C and
> > > > > > > > > >> > the driver still doesn't claim GPIO0 RK_PA1 even wit=
h this change. As
> > > > > > > > > >> > a result, a simulated thermal runaway condition (I'v=
e changed the
> > > > > > > > > >> > tshut temperature to 65000 and tshut mode to 1) does=
n't trigger a PMIC
> > > > > > > > > >> > reset, even though a direct `gpioset 0 1=3D0` does.
> > > > > > > > > >> >
> > > > > > > > > >> > Are any additional changes needed to the driver itse=
lf?
> > > > > > > > > >>
> > > > > > > > > >> I've been digging through this patch the whole TSADC/O=
TP thing in the
> > > > > > > > > >> last couple of hours, and AFAIK some parts of the upst=
ream driver are
> > > > > > > > > >> still missing, in comparison with the downstream drive=
r.
> > > > > > > > > >>
> > > > > > > > > >> I've got some small suggestions for the patch itself, =
but the issue
> > > > > > > > > >> you observed is obviously of higher priority, and I've=
 singled it out
> > > > > > > > > >> as well while digging through the code.
> > > > > > > > > >>
> > > > > > > > > >> Could you, please, try the patch below quickly, to see=
 is it going to
> > > > > > > > > >> fix the issue you observed?  I've got some "IRL stuff"=
 to take care of
> > > > > > > > > >> today, so I can't test it myself, and it would be grea=
t to know is it
> > > > > > > > > >> the right path to the proper fix.
> > > > > > > > > >>
> > > > > > > > > >> diff --git i/drivers/thermal/rockchip_thermal.c
> > > > > > > > > >> w/drivers/thermal/rockchip_thermal.c
> > > > > > > > > >> index f551df48eef9..62f0e14a8d98 100644
> > > > > > > > > >> --- i/drivers/thermal/rockchip_thermal.c
> > > > > > > > > >> +++ w/drivers/thermal/rockchip_thermal.c
> > > > > > > > > >> @@ -1568,6 +1568,11 @@ static int rockchip_thermal_pro=
be(struct
> > > > > > > > > >> platform_device *pdev)
> > > > > > > > > >>          thermal->chip->initialize(thermal->grf, therm=
al->regs,
> > > > > > > > > >>                                    thermal->tshut_pola=
rity);
> > > > > > > > > >>
> > > > > > > > > >> +       if (thermal->tshut_mode =3D=3D TSHUT_MODE_GPIO=
)
> > > > > > > > > >> +               pinctrl_select_default_state(dev);
> > > > > > > > > >> +       else
> > > > > > > > > >> +               pinctrl_select_sleep_state(dev);
> > > > > > > > > >
> > > > > > > > > > I believe no 'else' block is needed here, because if ts=
hut_mode is not
> > > > > > > > > > TSHUT_MODE_GPIO then the TSADC doesn't use this pin at =
all, so there's
> > > > > > > > > > no reason for the driver to mess with its pinctrl state=
. I'd rather
> > > > > > > > > > put a mirroring block to put the pin back to its 'sleep=
' state in the
> > > > > > > > > > removal function for the TSHUT_MODE_GPIO case.
> > > > > > > > >
> > > > > > > > > You're right, but the "else block" is what the downstream=
 driver does,
> > > > > > > >
> > > > > > > > Does it though? It only handles the TSHUT_MODE_GPIO case as=
 far as I
> > > > > > > > can tell (or TSHUT_MODE_OTP in downstream driver lingo) [1]
> > > > > > > >
> > > > > > > > [1] https://github.com/radxa/kernel/blob/edb3eeeaa4643ecac6=
f4185d6d391c574735fca1/drivers/thermal/rockchip_thermal.c#L2564
> > > > > > > >
> > > > > > > > > so I think it's better to simply stay on the safe side an=
d follow that
> > > > > > > > > logic in the upstream driver.  Is it really needed?  Perh=
aps not, but
> > > > > > > > > it also shouldn't hurt.
> > > > > > > > >
> > > > > > > > > > Will try and revert.
> > > > > > > > >
> > > > > > > > > Awesome, thanks!
> > > > > > > > >
> > > > > > > > > > P.S. Just looked at the downstream driver, and it actua=
lly calls
> > > > > > > > > > TSHUT_MODE_GPIO TSHUT_MODE_OTP instead, so it seems tha=
t "otpout" was
> > > > > > > > > > not a typo in the first place. So maybe the right appro=
ach here is not
> > > > > > > > > > to change the device tree but rather fix the "gpio" / "=
otpout" pinctrl
> > > > > > > > > > state handling in the driver.
> > > > > > > > >
> > > > > > > > > Indeed, "otpout" wasn't a typo, and I've already addresse=
d that in my
> > > > > > > > > comments to Alexander's patch.  Will send that response a=
 bit later.
> > > > > > > > >
> > > > > > > > > I think it's actually better to accept the approach in Al=
exander's
> > > > > > > > > patch, because the whole thing applies to other Rockchip =
SoCs as well,
> > > > > > > > > not just to the RK3588(S).
> > > > > > > >
> > > > > > > > Anyway, I've just tried it after including the changes belo=
w, and
> > > > > > > > while /sys/kernel/debug/pinctrl/pinctrl-handles shows the e=
xpected
> > > > > > > > pinctrls under tsadc, the driver still doesn't seem to be t=
riggering a
> > > > > > > > PMIC reset. Weird. Any thoughts welcome.
> > > > > > >
> > > > > > > I found the culprit. "otpout" (or "default" if we follow Alex=
ander's
> > > > > > > suggested approach) pinctrl state should refer to the &tsadc_=
shut_org
> > > > > > > config instead of &tsadc_shut - then the PMIC reset works.
> > > > > >
> > > > > > I've recently brought up an RK3588S-based Orange Pi CM5 Base bo=
ard, made
> > > > > > of a compute module (CM5, see [1]) and a carrier board (Base, s=
ee [2]).
> > > > > > The carrier board has a reset button which pulls the PMIC_RESET=
_L signal
> > > > > > of the CM5 to GND (see page 3 of the schematics in [3]).
> > > > > >
> > > > > > With &tsadc_shut_org the reset button has absolutely no effect.=
 With
> > > > > > &tsadc_shut it resets the board as expected.
> > > > >
> > > > > Interesting. The TSADC shouldn't affect the physical button opera=
tion
> > > > > at all, if it's really wired to the PMIC as the signal name impli=
es.
> > > > > There isn't even any default pull value associated with the TSHUT=
 pin
> > > > > config.
> > > >
> > > > On a second thought, I've got another hypothesis. Your baseboard on=
ly
> > > > pulls the reset line through  a 100 Ohm resistor when the button is
> > > > pressed. So if the TSHUT pin is in its default push-pull mode and
> > > > stays high when no thermal runaway reset is requested, the reset
> > > > button won't pull the line fully to zero, as the TSHUT line pulls i=
t
> > > > high at the same time.
> > >
> > > That's the most likely cause, I agree.
> > >
> > > > If you switch it from &tsadc_shut_org to &tsadc_shut, then it stops
> > > > working properly as the thermal protection reset, and GPIO0_A1 rema=
ins
> > > > high-impendance, thus allowing the reset button to function even
> > > > though its pull is too weak.
> > >
> > > By the way, what is the difference between tsadc_shut_org and tsadc_s=
hut
> > > ? I haven't seen it being clearly documented in the TRM.
> >
> > No idea frankly. Looks like a half-finished design change to me, which
> > left the non-"org" version unconnected internally.
>
> :-/
>
> > > > So maybe change the pin configuration of &tsadc_shut_org in
> > > > rk3588-base-pinctrl.dtsi to open drain and retry?
> > >
> > > That's a good idea, but... how ? The pinctrl-rockchip driver doesn't
> > > seem to support generic open-drain configuration.
> >
> > I thought I saw open-drain configurations here, but after reviewing
> > the TRM, bindings and the driver it turns out I must have been
> > daydreaming :( Sorry.
> >
> > Looks like the best we can try is a lower drive strength while keeping
> > the push-pull mode, but I'm afraid this 100 Ohm pulldown is too weak,
> > because the lowest TSHUT drive strength Rockchip offers is 100 Ohm,
> > while the PMIC would only count anything below 30% reference voltage
> > as logical low. Maybe adding a pulldown to the pin config can help,
> > but most likely this board will require switching the pin to GPIO
> > input for high-z, and switching the TSHUT mode to CRU.
>
> I agree with you, going through the CRU seems the best solution for this
> board. This is actually the default mode in
> arch/arm64/boot/dts/rockchip/rk3588-base.dtsi:
>
>         rockchip,hw-tshut-mode =3D <0>; /* tshut mode 0:CRU 1:GPIO */
>         rockchip,hw-tshut-polarity =3D <0>; /* tshut polarity 0:LOW 1:HIG=
H */
>         pinctrl-0 =3D <&tsadc_shut_org>;
>         pinctrl-1 =3D <&tsadc_gpio_func>;
>
> If hw-tshut-mode defaults to 0, why do we need to setup the GPIO0_A1 pin
> to output the TSADC_SHUT signal ?

I believe the thinking was along the lines of "it can't hurt, so let's
provide a default that's likely to work both for the boards where
TSHUT is routed to the PMIC and those where it's not, with an added
benefit of hogging the pin to prevent anyone from accidentally
triggering it to a low level from user space thus suddenly resetting
the board".

But this case of "TSHUT is routed, but with a deviation from the
reference schematic which makes it impossible to use as designed" was
likely never envisaged.

Technically, there is no reason to switch the pin to tsadc_shut_org
when CRU mode is used, and the boottime default for this pin is
high-impedance.

Heiko, shall we remove the pinctrl properties from the common .dtsi
and move them to board specific .dts for those boards that use
PMIC-assisted thermal resets? Happy to produce a patch to that effect.

Best regards,
Alexey

