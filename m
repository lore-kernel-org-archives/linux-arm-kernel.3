Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B1ADD12677
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Dec 2025 22:05:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0ZsKacXlk1x/USH5v76Y2P+5QZvrnKBumSM1Y249Jhk=; b=Yb7+iNxBWe4+0FaISZJ1gU2f71
	7jUvhJDyuNaOcsetplgbGPPHeGMKIWtW7lBMThDSJ4u8lOGie/u0lx6mzzBm/4u1FvjeMhHATw7w3
	xhbxEpQZ2gW1hy7DYlFRqjvR3wwZnoMJ8rtdRKSNqeL48sTlFXSwlLdc1cgX/ExUoJbBZFL1cPuRg
	6hqpAA6EO6mFcQrJ66u6CaztPUSofqdILHbrfR+DihHShj9QvdLtfuzPqguU95BfuyVzEnQ1BgVJu
	lb41yD4JcTNrZWFPbBRU09zS6l2l0CgQ6YaY8VXTLWezlCXMiM6f0L3SAHtPeAOWJ+13Qd9eF6ECu
	EWfafc0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQYUi-00000005sRL-0dCT;
	Tue, 02 Dec 2025 22:05:12 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQYUf-00000005sQw-0d0d
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Dec 2025 22:05:11 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-b73b24f1784so57633066b.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 02 Dec 2025 14:05:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1764713105; x=1765317905; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0ZsKacXlk1x/USH5v76Y2P+5QZvrnKBumSM1Y249Jhk=;
        b=OQ5R+c7yYb6LFNFic0oL+dwVV39QPb6s+JNK6McDWVk+V8b5ECLrOP/2DRUk/8i4Ud
         gj0x6h/d/EX/EDWQIessfDMhkQ0TzJx6LcZgtQ02cQkcIEXCYbhVHYbUftTc3OWJ138R
         1UIG/LEbpD8amCyd0hB0Vl15RvQP1Ht6FQZqA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764713105; x=1765317905;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0ZsKacXlk1x/USH5v76Y2P+5QZvrnKBumSM1Y249Jhk=;
        b=oOpNCvD99qZw/Je+hgIf4ol3PK6HIqVR26GiLIrG87CNPvuddDWnGdA5p4Z1rNtIzf
         kLCiGR2y0IbV4ZwjZN+SXaUon1TrblNMu8+UaGpLJhb7XhSqqcfMKWeK4Aj5BFLLbuWU
         1j0B329lR78/F18jUNh+++uKhcpcaPW/Tj7N0v3D7REPGZCYlPwjOJI6QGVqfqxGAKrn
         TME2OYYrtqKP/1dBfagGYT+GgSNmyFdnizLqf60QuiDzZbdLgJom5ajNDk+Gh2Wbwpzi
         +uIxoMxQ0wczyWN6mKLTG7D7oksrSsZrys62xCpXqFemH7PIUzOMSsn9e139FZ9/qk0I
         Mtgg==
X-Forwarded-Encrypted: i=1; AJvYcCW3y/YsEF6mIg4IlQHv6TY3OF9Z6/coFdMyLTqGNzR0R2SeabEQxtQ16+tV5CnvWC1GgQPcIUowEHaZlNGaXC98@lists.infradead.org
X-Gm-Message-State: AOJu0YzFpA4xY/NUd9w6ndp9TqgJ7ml1JieyASh1G//tcMWPLi9DtoU8
	VaVKGPLd7r1rAVHoATd3IgazRwh3U7w4R8ofg2R3ZaeRZggjz/qz9icGNtVTbpNzxwkB29D/vi5
	fHsoQPy2N
X-Gm-Gg: ASbGnctyoB9KWT65Qx9cf22tFhjx0jeN/p5MKIUjeANSJGUbDjZ/2U7U8UoyPtKB7SN
	Vpozfk4ZkaLihoNSwTurdjcMHw3AxQ+tcM9t1EEYmeRYEFOP8yCuWvXuaPYwEOMZglyTDwN8NGs
	sr8ICMQgFEgzWqBAwAmIxSEJti6HApFJshDtmvZ6dk4B0jUhK4JxubGMdPGvbQ33HFMQ0f9yT/c
	B9a7Di2gGIC9/MNsxJfE6p9AM5o7WaJvIdLg1C5Oz3fsA/w+J7LrBn6aCBDOes0DmqowVEBDXJK
	5SDUOcJ4GC6sgFd4XXwheKl6nndhRmdhalhOtGO1Tboxe3Dv7sSRPtLI3Uj6/WRf9AmpP+w0Qb2
	E6vVlfk74yXpjMvyHBgPODNum+DH8ni3eDkG1Zs9zNjx4Y8X/nP5eJgBe6onW1zuxwvYJyL5o0k
	XPvWiLcnNow9itzaRk3X2Q8lyRfu8vxYR6NZHZ4HXCpLTaWSbfFw==
X-Google-Smtp-Source: AGHT+IGNnJ/6ro3DzhnrMw/E3ICQJbIIVu9+En7sGruzcNAG7gHAOJQMrT6khBVy+hq0+1fLAF7tEg==
X-Received: by 2002:a17:907:9414:b0:b6d:6650:c3cd with SMTP id a640c23a62f3a-b79c233e071mr431395366b.21.1764713104801;
        Tue, 02 Dec 2025 14:05:04 -0800 (PST)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com. [209.85.221.44])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b76f5a3a4ebsm1614511566b.62.2025.12.02.14.05.03
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Dec 2025 14:05:03 -0800 (PST)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-42b47f662a0so148374f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 02 Dec 2025 14:05:03 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXwd7mUo5iatmwLq9ykdktGpWJdjfU+VfagJP/fymKKMLRKMUfzuXOcMham16bErDaQth48bhHO11SZhWUWQgnk@lists.infradead.org
X-Received: by 2002:a05:6000:1ac5:b0:429:8bb2:d0ce with SMTP id
 ffacd0b85a97d-42f6d5a0bb0mr5508346f8f.18.1764713102630; Tue, 02 Dec 2025
 14:05:02 -0800 (PST)
MIME-Version: 1.0
References: <CAD=FV=Ux7nGFnYEyX0cUL-9__BKnTYc+kAJjkF458ZnFS7zoJA@mail.gmail.com>
 <aS66WcLPm6e5rdyk@shell.armlinux.org.uk>
In-Reply-To: <aS66WcLPm6e5rdyk@shell.armlinux.org.uk>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 2 Dec 2025 14:04:51 -0800
X-Gmail-Original-Message-ID: <CAD=FV=VxArGov6jB8jTTnPmM9XKAya_nc4wCDQS+uZf72hgmzA@mail.gmail.com>
X-Gm-Features: AWmQ_bnodrqkOULQQki0m69B7q1cCVAE8F8yOrV4gjyka70td8p-eK-StEz6mVE
Message-ID: <CAD=FV=VxArGov6jB8jTTnPmM9XKAya_nc4wCDQS+uZf72hgmzA@mail.gmail.com>
Subject: Re: Proposal: Officially allow "incomplete" trees as a base
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: devicetree-spec@vger.kernel.org, boot-architecture@lists.linaro.org, 
	Chen-Yu Tsai <wenst@chromium.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk@kernel.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	William McVicker <willmcvicker@google.com>, Julius Werner <jwerner@chromium.org>, 
	Conor Dooley <conor+dt@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251202_140509_291265_16EBA1A1 
X-CRM114-Status: GOOD (  47.50  )
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

On Tue, Dec 2, 2025 at 2:07=E2=80=AFAM Russell King (Oracle)
<linux@armlinux.org.uk> wrote:
>
> Having worked on the SolidRun i.MX6 platforms, I agree with this.
> Within these platforms there are:
>
> SoC     SOM             Platform
> imx6dl  pre-v1.5        cubox
> imx6q   v1.5            hummingboard
>         v1.5 + emmc     hummingboard2
>
> On top of these, I have specific "user" extensions for hardware that
> I've connected - e.g.
> - the NoIR RPi camera needs DT modification.
> - for monitoring a mechanical church clock, a "gps" variant that
>   allowed PPS to be used with a GPIO pin, and a "capture" variant
>   that configured the hardware to allow precise event stamping.
> - 1-wire, for ds18b20 temperature sensors.
>
> Without the user extensions, this adds up to 18 DTB files:
> arch/arm/boot/dts/nxp/imx/imx6dl-cubox-i-emmc-som-v15.dts
> arch/arm/boot/dts/nxp/imx/imx6dl-cubox-i-som-v15.dts
> arch/arm/boot/dts/nxp/imx/imx6dl-cubox-i.dts
> arch/arm/boot/dts/nxp/imx/imx6dl-hummingboard-emmc-som-v15.dts
> arch/arm/boot/dts/nxp/imx/imx6dl-hummingboard-som-v15.dts
> arch/arm/boot/dts/nxp/imx/imx6dl-hummingboard.dts
> arch/arm/boot/dts/nxp/imx/imx6dl-hummingboard2-emmc-som-v15.dts
> arch/arm/boot/dts/nxp/imx/imx6dl-hummingboard2-som-v15.dts
> arch/arm/boot/dts/nxp/imx/imx6dl-hummingboard2.dts
> arch/arm/boot/dts/nxp/imx/imx6q-cubox-i-emmc-som-v15.dts
> arch/arm/boot/dts/nxp/imx/imx6q-cubox-i-som-v15.dts
> arch/arm/boot/dts/nxp/imx/imx6q-cubox-i.dts
> arch/arm/boot/dts/nxp/imx/imx6q-hummingboard-emmc-som-v15.dts
> arch/arm/boot/dts/nxp/imx/imx6q-hummingboard-som-v15.dts
> arch/arm/boot/dts/nxp/imx/imx6q-hummingboard.dts
> arch/arm/boot/dts/nxp/imx/imx6q-hummingboard2-emmc-som-v15.dts
> arch/arm/boot/dts/nxp/imx/imx6q-hummingboard2-som-v15.dts
> arch/arm/boot/dts/nxp/imx/imx6q-hummingboard2.dts
>
> basically, every combination needs to be enumerated. So, having two SoC
> dt files, three for the SOM, and three for the platform that the boot
> loader combines would significantly cut this down - to 8.
>
> However, it isn't that simple. For example, when the Hummingboard2 is
> used with the iMX6Q SoC, there's a SATA device present in the SoC level
> that needs Hummingboard2 specific properties to tune the signal
> waveform. However, iMX6DL doesn't have this SATA device in silicon, so
> the node doesn't exist in the base SoC DT file. The situation is the
> same for Hummingboard, but the tuning parameters, being board specific,
> are different.
>
> This means is that there are DT properties that are dependent on the
> SoC DT component and the platform DT component which do not fit with
> splitting the DT files into their individual "component" levels.

Wow, it sounds complicated! Yeah, in your specific case where you need
specific tuning parameters for each combination of SoC and SoM the
easiest might be to just keep things separate as you have it. If
you're looking to optimize the total size of the distributed device
trees instead of the total number of files, overlays still could
possibly help you out, though. I could imagine a case where you first
apply the "coarse" overlays (SoC, SoM, board) and then you look for
finer-grained overlays that are applied atop that. You'd still need a
bunch of these "finer grained" overlays (one for each unique
combination) but each one would be tiny.

To make it concrete, I'd imagine:
- imx6q - base dtb
- som1.5 - overlay
- hummingboard2 - overlay
- hummingboard2-with-imx6q - overlay

...and the "hummingboard2-with-imx6q" could _just_ have the SATA
tunings in it. I think that would be possible, right?


> The other issue would be the /model property - for example:
>
>         model =3D "SolidRun HummingBoard2 Solo/DualLite";
>         model =3D "SolidRun HummingBoard2 Solo/DualLite (1.5som+emmc)";
>         model =3D "SolidRun HummingBoard2 Solo/DualLite (1.5som)";
>         model =3D "SolidRun HummingBoard Solo/DualLite";
>         model =3D "SolidRun HummingBoard2 Dual/Quad";
>         model =3D "SolidRun Cubox-i Solo/DualLite";
>
> as a set of examples. I don't see a clear way to generate these from
> a fragmented scheme. There's a similar problem with the board-level
> compatible:
>
>         compatible =3D "solidrun,cubox-i/dl", "fsl,imx6dl";
>         compatible =3D "solidrun,hummingboard2/dl", "fsl,imx6dl";
>         compatible =3D "solidrun,hummingboard/dl", "fsl,imx6dl";
>         compatible =3D "solidrun,hummingboard2/q", "fsl,imx6q";
>
> These don't include the SoM information.

Right. This is the question many of the messages in this thread have
been struggling with.

Things become a bit easier if you simply don't expect the top-level
"compatible" to describe everything. ...but in your case it sounds
like things are _very_ dynamic (everything can be combined with
everything), so if we want to solve your problem it seems like we
truly do need a way to "combine" compatible strings.

As per one of my earlier replies, it's possible we'll postpone this
and start with simpler cases where we don't need to do any top-level
compatible/model munging, but it's good to know that there's a use
case that really needs it.


> Maybe what would work would be a high-level DT file that contains
> paths to the lower levels that need to be combined, along with
> properties that need to be merged. E.g.
>
> / {
>         model =3D "SolidRun HummingBoard2 Dual/Quad";
>         compatible =3D "solidrun,hummingboard2/q", "fsl,imx6q";
>
>         dts-components {
>                 compatible =3D "boot/dt";
>
>                 component@1 {
>                         compatible =3D "dt";
>                         path =3D "imx6q.dtbo";
>                 };
>
>                 component@2 {
>                         compatible =3D "dt";
>                         path =3D "imx6qdl-sr-som-v1.5.dtbo";
>                 };
>
>                 component@3 {
>                         compatible =3D "dt";
>                         path =3D "imx6qdl-hummingboard2.dtbo";
>                 };
>
>                 component@4 {
>                         compatible =3D "dt";
>                         path =3D "imx6ql-hummingboard2-emmc.dtbo";
>                 };
>         };
>
>         soc {
>                 sata@2200000 {
>                         .. sata tuning properties ..
>                 };
>         };
> };
>
> Or something similar.

Yeah, the question of how to know which files to combine is an
important and related point, but I've been trying to keep it separate
so we don't have to solve every complex problem at once. This is, I
believe, also the subject of one of Chen-Yu's talks at Plumbers.


> However, this would mean we would still need the
> 18 or so top level DT files, but also each component as well, which
> will increase the number of files we're having to manage on a target
> platform - so I'm wondering whether it's worth it.
>
> I don't think we'll be able to get away from this problem: it's likely
> that there will continue to be properties that are specific across
> several "levels" of a split DT setup, and apart from something like the
> above, I don't really see a way to handle them.
>
> I also don't see a sensible way without something like the above for a
> boot loader to know the filenames of each of the components for a
> platform - and it would need to be told the order to glue those
> components together.

Right, this kind of thing would be a judgement call. How you'd want to
organize things / use overlays would be up to you.


> I would have liked to use overlays for these platforms, but ISTR they
> either weren't supported at the time, or frowned upon, and even so I
> can only see them working for the simplest of cases due to the issue
> I mention above.

The fact that you have similar needs at least makes me continue to be
confident that this is an important problem to try to solve.


-Doug

