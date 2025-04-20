Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1846C369C2
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 20 Apr 2025 17:00:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8SPeMr2qOZn4YU1fh/fx5ZM9kAovJzAmEca1OBcRO4o=; b=R6Fvt2nrElY5fLgK9cCcYgqS9Q
	SoE2hnOmvAJVpJ/FFd40NgHk93mesnBPJo281lMgP9Kl7m+kelCfWfqAf5QsXAPENeckrwpBoBFsU
	eYhc0C54nercsmFY1aUs8sRqWD33C8eV/n0ERCCdprmDco4u2+nHpuAs0/TdweVWaaxLw36K6hi0s
	ypF8Ye04vcvqaV0SrsHKOY35fZfS5RLnFJBXoFNCQtL/9c1W2b7izv/1HwzdBXbR0uNgeJ5kiBOqE
	riCy2i6q+hofRQrB5mdKvDoiH/njfn0P6LxAjKUeA6DyHx4BzKfUN1CHrqLvzxD9LZozq4kD+3RR1
	/gldixEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6Y1N-00000002o1i-28Hp;
	Sun, 20 Apr 2025 16:59:57 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6Xuu-00000002nWv-2um0;
	Sun, 20 Apr 2025 16:53:18 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-22c336fcdaaso35782795ad.3;
        Sun, 20 Apr 2025 09:53:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1745167996; x=1745772796; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8SPeMr2qOZn4YU1fh/fx5ZM9kAovJzAmEca1OBcRO4o=;
        b=CtED3q5VDI5DQZlEJVN0EBpn1I+nVE9GiWMkBHJohdBg6xhzK5KS+++kpY5bQDphs0
         Jn4ZR4yOl+BJLQOHiKmr9xydosgZjndcKz/H1rJ+/UrAlZxlActoGuLLEXFeAwLu2IIY
         UG+SBiKGDlaNky/OjORemq7+5KTXC/I4SyA/h/VZwSVhOzXuvuMiXulI/wVGLCaBK3VL
         q1SwAaoNygfjzKhN1cQ3r7Sf33jgscguXrOaXJKEnsgoEygAWGjMuGuMcoHxT0gpUXj5
         YuJl4noHtA8PSBhdWzqQzXueQhI+UN+ZxBNt82uW8q4wTqQuXDOkzhB5TIpPVCYgNK++
         MQOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745167996; x=1745772796;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8SPeMr2qOZn4YU1fh/fx5ZM9kAovJzAmEca1OBcRO4o=;
        b=JWqqiRnyTnnOyXYHBT3eTtso8rxpPFXFvyIXlrZpYmTaVhxl44nZMi8xM0rkJm8u2R
         usoIW9Ve52MKhrIymKhMzfZtHFqCD3uGo8qkl/oGBUI4c8PUG825hLRfKCFtdrcRiAQO
         eimIu5JRB/YDwC+vzpB/K79wU1EkFczHDANK5Y2zONu0fuwvwT4zH9gcPylgsRGeHVob
         IryszIcchYcxKYDM2qDeCEky/6FwLf2xi2YAcwFve6YAhtHeZzgIiZ95vBkN2dmwXXOY
         9LuGsLpIzTi5qVAQsVlWaXfHxr2HOn9kRt3nyWcfH95E7O38KHztl4U7iOqm7mLXLK5X
         42tw==
X-Forwarded-Encrypted: i=1; AJvYcCX9zR7OSbpBpbMVYHrX1PebpA72mUrAeHmRhHSuTQNhdebp4ltVdAY6virzK0E8ui5TNPOf/s32TAgMsKg9Whqh@lists.infradead.org
X-Gm-Message-State: AOJu0YyTe98bSOsupoEIXu7yRMhSS+UrsiqTOPtNv345KOnqE7QPWnZM
	0q/h3/l4smxsui2VzANgMkWWpIQVl0ATzgj6MWFKpEyzPguyek3wVuuORRGiJor01WhmtwH1n+b
	l5xihnhK6SRIyXFO8Ogd4K1SZO84=
X-Gm-Gg: ASbGncsSSb5gl1W77m5mB4nGNiERxVURg+k7SvMg6IVpFr0NeMeuBJPW3VL9CY8NrRp
	x43GXJqTgbFPi+LRowTT3zrQdh7S212LM9LGBtPFpCdq2jyxFEZIBD1poyTC5gBdvGSLTEAfC/W
	Va0bkcIw2af/bX/wfPkegKfFhQBkM6RE6lJQXgCIIQT18+ebY=
X-Google-Smtp-Source: AGHT+IH8DzvTiy4h+KL4U19Sci4voDMK4mciBQ4BPN22Pz+pQoaq5S9v0/nWEx5fqmVPXETBHXM/RT+poBdLM+MB/+0=
X-Received: by 2002:a17:902:f684:b0:223:635d:3e2a with SMTP id
 d9443c01a7336-22c535c0760mr127312745ad.23.1745167995675; Sun, 20 Apr 2025
 09:53:15 -0700 (PDT)
MIME-Version: 1.0
References: <20241227212514.1376682-1-martin.blumenstingl@googlemail.com> <4A37D0CD-FD4F-445A-87F8-19D65CB7FDB9@hewittfamily.org.uk>
In-Reply-To: <4A37D0CD-FD4F-445A-87F8-19D65CB7FDB9@hewittfamily.org.uk>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 20 Apr 2025 18:53:04 +0200
X-Gm-Features: ATxdqUHEOYPXXRr0KRgABoAXqlDBucnLKVCiuCrN19sebvABvHD_xIDDHJKPPek
Message-ID: <CAFBinCC7HrT_fD0zYudtj10SNiajwq-OSC7ceeoNrz2neChptg@mail.gmail.com>
Subject: Re: [PATCH 0/5] dts: amlogic: switch to the new PWM controller binding
To: Christian Hewitt <christian@hewittfamily.org.uk>
Cc: linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	jbrunet@baylibre.com, neil.armstrong@linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250420_095316_737908_634C7DFE 
X-CRM114-Status: GOOD (  25.15  )
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

On Sun, Apr 20, 2025 at 9:45=E2=80=AFAM Christian Hewitt
<christian@hewittfamily.org.uk> wrote:
>
> > On 28 Dec 2024, at 1:25=E2=80=AFam, Martin Blumenstingl <martin.blumens=
tingl@googlemail.com> wrote:
> >
> > This series switches all Amlogic SoCs to use the new PWM controller
> > binding. The main benefits of the new binding are:
> > - the pwm controller driver now picks the best possible clock to
> >  achieve the most accurate pwm output
> > - board.dts don't have to know about the pwm clock inputs anymore (as
> >  the driver picks the best one automatically)
> > - new SoCs only need a new compatible string but no pwm-meson driver
> >  changes, assuming only the clock inputs differ from older IP
> >  revisions
> >
> > This silences the following warning(s) at boot (for each pwm
> > controller instance):
> >  using obsolete compatible, please consider updating dt
> >
> > I have tested this on two devices:
> > - meson8b: odroidc1 (boots fine and cycling through all CPU
> >  frequencies and thus voltages works fine)
> > - meson-sm1: x96-air-gbit (boots and the rtw8822cs SDIO card is
> >  detected, so the 32kHz clock for the SDIO card works)
> >
> > Since I cannot test all devices I'm asking for this series to be
> > applied so the Kernel CI board farm can help verify it works on all
> > boards available there.
>
> This series breaks Broadcom BT on the GXBB/GXM/G12B boards in my
> current test rotation. I=E2=80=99m running Linux 6.14.2 with this series
> backported for testing. This is generally what=E2=80=99s seen in dmesg:
>
> VIM2:~ # dmesg | grep -i blue
> [    8.659535] Bluetooth: Core ver 2.22
> [    8.659681] NET: Registered PF_BLUETOOTH protocol family
> [    8.659690] Bluetooth: HCI device and connection manager initialized
> [    8.659712] Bluetooth: HCI socket layer initialized
> [    8.659721] Bluetooth: L2CAP socket layer initialized
> [    8.659742] Bluetooth: SCO socket layer initialized
> [    8.724898] Bluetooth: HCI UART driver ver 2.3
> [    8.724953] Bluetooth: HCI UART protocol H4 registered
> [    8.725106] Bluetooth: HCI UART protocol Three-wire (H5) registered
> [    8.725434] Bluetooth: HCI UART protocol Broadcom registered
> [    8.725502] Bluetooth: HCI UART protocol QCA registered
> [    8.725559] Bluetooth: HCI UART protocol AML registered
> [    8.966727] Bluetooth: hci0: Frame reassembly failed (-84)
> [    8.966772] Bluetooth: hci0: Frame reassembly failed (-84)
> [   11.148157] Bluetooth: hci0: command 0xfc18 tx timeout
> [   11.148383] Bluetooth: hci0: BCM: failed to write update baudrate (-11=
0)
> [   11.148446] Bluetooth: hci0: Failed to set baudrate
> [   13.281510] Bluetooth: hci0: command 0xfc18 tx timeout
> [   13.281576] Bluetooth: hci0: BCM: Reset failed (-110)
>
> This is also visible on a VIM3 board in kernelci (Linux 6.15.-rc2):
>
> https://dashboard.kernelci.org/test/maestro%3A67fd3cda3328e043e96da230?l=
=3Dtrue
>
> [ 3.954267] Bluetooth: hci0: Frame reassembly failed (-84)
> [ 4.040555] Bluetooth: hci0: Frame reassembly failed (-84)
>
> (linux-firmware and thus kernelci is lacking Broadcom BT firmwares so
> later messages that result from trying to load fw aren=E2=80=99t seen)
>
> With the series reverted:
>
> VIM2:~ # dmesg | grep -i blue
> [    8.452570] Bluetooth: Core ver 2.22
> [    8.452695] NET: Registered PF_BLUETOOTH protocol family
> [    8.452703] Bluetooth: HCI device and connection manager initialized
> [    8.452724] Bluetooth: HCI socket layer initialized
> [    8.452735] Bluetooth: L2CAP socket layer initialized
> [    8.452752] Bluetooth: SCO socket layer initialized
> [    8.530077] Bluetooth: HCI UART driver ver 2.3
> [    8.530113] Bluetooth: HCI UART protocol H4 registered
> [    8.530387] Bluetooth: HCI UART protocol Three-wire (H5) registered
> [    8.530902] Bluetooth: HCI UART protocol Broadcom registered
> [    8.530983] Bluetooth: HCI UART protocol QCA registered
> [    8.531037] Bluetooth: HCI UART protocol AML registered
> [    8.917685] Bluetooth: hci0: BCM: chip id 101
> [    8.918000] Bluetooth: hci0: BCM: features 0x2f
> [    8.919526] Bluetooth: hci0: BCM4354A2
> [    8.919560] Bluetooth: hci0: BCM4356A2 (001.003.015) build 0000
> [    8.941837] Bluetooth: hci0: BCM4356A2 'brcm/BCM4356A2.hcd' Patch
> [    9.831321] Bluetooth: hci0: BCM: features 0x2f
> [    9.832884] Bluetooth: hci0: BCM4356 37.4MHz AMPAK AP6356-0055
> [    9.832902] Bluetooth: hci0: BCM4356A2 (001.003.015) build 0266
> [    9.856044] Bluetooth: MGMT ver 1.23
>
> An SML544TW board (S905D) with a QCA9377 chip is not affected by the
> changes so the scope appears to be limited to Broadcom BT.
>
> I=E2=80=99ve also noticed that VIM3 and the SML5442TW have device-tree it=
ems
> like max-speed, clocks, clock-names defined, but adding these to e.g.
> a WeTek Play2 board or removing from VIM3 doesn=E2=80=99t change anything=
.
Thanks for reporting this - a fix has been submitted here: [0]


[0] https://lore.kernel.org/linux-amlogic/20250420164801.330505-1-martin.bl=
umenstingl@googlemail.com/T/#t

