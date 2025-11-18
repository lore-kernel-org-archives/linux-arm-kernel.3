Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 636D9CED265
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Nov 2025 10:17:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bMz2ZE23L8pkKEvAtibV91PPmqodgqp/GEg4FP1KnLM=; b=2QopbovpyePf5+qHvDEkFU9rS6
	SIHD5e0Jqm9IAjLoERZ2s0aFnetCXUEsE4YbdjF8edjbg6uQpe/RhMBj/w5Oy9uKeAkPtNWgqh/rZ
	ebEQ9TteTmfM7F6wLlcXQmvlUSm1CHJ6Jl+8KZRw1OJ90Qrp55SHv6ahPun23gRDiaBUfRAmkNH2M
	pbgRDM0m9CzpRVzZEedgTQCGNB+K3UTNDCfPXkuC9IAG5zKdUYbuMfwg0vMUQj49/CZjvb3uNHe55
	xjBDXHVAF93Mm7K325Fqm9HqGL4ztv06wuY/iZCLcRK9GbrrhU7QdqBu47JHaRgQLFEJT3ehjibq2
	qeM44JuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLImM-00000000EJE-2IVs;
	Tue, 18 Nov 2025 10:17:42 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLImJ-00000000EIW-1OHv
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Nov 2025 10:17:41 +0000
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-5959b2f3fc9so228337e87.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Nov 2025 02:17:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1763461057; x=1764065857; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bMz2ZE23L8pkKEvAtibV91PPmqodgqp/GEg4FP1KnLM=;
        b=OJeEHNT5B6/+3joWd/8gbUDTP/VxfQgw2utqwhoHC5qzAnLSxzOjfsDaTP8rjoRAvE
         hVypbhW4FI1IWSP8qXSqxDgKEuFCrAgGNSLMzC3KHWk0tUvGf1fTcQf4OFIOQVCrO1/F
         On+Zy54eIAYpqLWl4NF7NFjFwU2wqCINjedE4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763461057; x=1764065857;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bMz2ZE23L8pkKEvAtibV91PPmqodgqp/GEg4FP1KnLM=;
        b=YIrkgAoFVwQokis3lyPsrXy+hl21vOAM5A4gVTHIigmIx/LxcGcOAXUFJvUxAhfqBl
         GhhHP3ZXVeOPfBN+J1lZtLWaeEUAtK3aHII3BMMubhxqnWukejGxL3GWv1RWzqhNOeEu
         Z8Qhlz8doFRFzaeso85Eacs8eQAkvJ5kzq+ZJZjDNdV3JrHpFKLWDq2/Fzlc9OQtTrKv
         UMQjXq/MTDuXrNUUAgM1OefK46KYuVQTTwwqOB6XwQHhIs3fU3jczNs4vHPMFG1E6iLa
         qNcPQPU+Fti8NxtcKDywyYvsYyA2muIRfA7Rx2i6YxeWN5z9stELvM3a5Ox7Zg7wKMod
         DL+w==
X-Forwarded-Encrypted: i=1; AJvYcCV6qJGZ0g2ixdUYD+W38/3dRxD5Bw8Y+2ZL0sb/vL+vJ2ajZIx5ZgRt2Ytz7JfX8i2tCO9+QLQhEjewSfYicrzo@lists.infradead.org
X-Gm-Message-State: AOJu0YzN9WRQyrz5xS8Fw4zaGZYYcMApDYty339COVK+AZHKXROOwQuE
	pNrcAbVH12SQve8rxLRAfLypQOCGfRWFX8QYGa23axNsipGO2RHU3t+B2ZYjR3PLR48OFHQxtN9
	8lPuWJ+kB4z7afNmmNuHZZyVH3R/w/D6Az/7VdKLO
X-Gm-Gg: ASbGncvAtIIH2WRK9Kx5Ymc4Gm8B65C6JvbMMqg8ZSgvUW1jzrIvI2nnV5I5yNGdW7u
	/2tArQ92szAxmwgNx+BDPZWnptGjlPVcIstm6A3AxwiTXozhGaLkeMho0cVjd5Xc+VQ9HYntT94
	AjSo+CeM2uM2TZNCBJhoA1AtL32/FMI9y5vzQxtNu1mm0Z6731SMBLdiTvWUYo42K8qHbP2o94h
	Q5n3QNR2YXuN3YTKiWS9WYMVXbDs84JYCFmNRPXL5o2Naubggmd/XVuuOWfHK1mIFyfUoXzFMY5
	Za+p9zHiIs7iLMo=
X-Google-Smtp-Source: AGHT+IEDIyDccAsQNaQoiJeQUTT4vBLg4RzkD7VakIIbkSB2sGZK1r6Tx5nUDzSggQyhw/8/mBQdIa7MJoa+YejWBHs=
X-Received: by 2002:a05:6512:3b0d:b0:594:2f72:2f7b with SMTP id
 2adb3069b0e04-595841a2ce6mr4735606e87.6.1763461056862; Tue, 18 Nov 2025
 02:17:36 -0800 (PST)
MIME-Version: 1.0
References: <20251117211306.725678-1-robh@kernel.org> <679c1f30-7c62-484e-b4e5-7351a23f15e5@collabora.com>
In-Reply-To: <679c1f30-7c62-484e-b4e5-7351a23f15e5@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 18 Nov 2025 18:17:25 +0800
X-Gm-Features: AWmQ_bm304gtjUmEwlNuwAwUF0aqnogWCU3ugaXK9WBY_7txsNFFaEsy0o7zYa0
Message-ID: <CAGXv+5H23oc_Zj3tR4uCwKpXi074ujmF7WB9g_NV-OmXnAWmmQ@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: mediatek: Apply all DT overlays at build time
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: "Rob Herring (Arm)" <robh@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251118_021740_597972_C96CED2A 
X-CRM114-Status: GOOD (  25.91  )
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

On Tue, Nov 18, 2025 at 5:36=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Il 17/11/25 22:13, Rob Herring (Arm) ha scritto:
> > It's a requirement that DT overlays be applied at build time in order t=
o
> > validate them as overlays are not validated on their own.
> >
> > Add targets for all the Mediatek overlays.
> >
> > Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> > ---
> > This will soon be a warning[1].
> >
> > Note that if it is desired that the combined .dtb is not installed, the=
n
> > the combined .dtb should be added to 'dtb-' variable instead.
> >
>
> Uhm, sorry, can't we do something such that we don't generate a DTB with =
a
> preapplied overlay?
>
> Even something like generating those and deleting before build finalizati=
on
> could work, I guess, though that'd be hacky maybe.
>
> I don't know if this is the case, but I'm worried that various people hav=
e
> scripts to copy DTBs somewhere (in some partition) or embed those in imag=
es,
> and if they get the preapplied overlay dtbs in the same place, havoc coul=
d
> happen as the bootloaders might be selecting wrong dtbs (as a plus, there=
 is
> no dtbo that varies machine compatible strings, rightfully).

The in-tree scripts/make_fit.py can take a list of DTBs to pack, so
it's conceivable that someone would just use a wildcard path.

We do something similar downstream in ChromeOS, but we probably won't
get this change anytime soon.

OOTH the "make fit" target uses arch/arm64/boot/dts/dtbs-list , which
it seems is also used for DTB install?


ChenYu

> Cheers,
> Angelo
>
> > [1] https://lore.kernel.org/all/20251114222759.4181152-1-robh@kernel.or=
g/
> > ---
> >   arch/arm64/boot/dts/mediatek/Makefile | 16 ++++++++++++++++
> >   1 file changed, 16 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/mediatek/Makefile b/arch/arm64/boot/dt=
s/mediatek/Makefile
> > index a4df4c21399e..4e92bd9f0e53 100644
> > --- a/arch/arm64/boot/dts/mediatek/Makefile
> > +++ b/arch/arm64/boot/dts/mediatek/Makefile
> > @@ -15,16 +15,30 @@ dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt7986a-acelink-ew=
-7886cax.dtb
> >   dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt7986a-bananapi-bpi-r3.dtb
> >   dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt7986a-bananapi-bpi-r3-mini.dtb
> >   dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt7986a-bananapi-bpi-r3-emmc.dtbo
> > +mt7986a-bananapi-bpi-r3-emmc-dtbs :=3D mt7986a-bananapi-bpi-r3.dtb mt7=
986a-bananapi-bpi-r3-emmc.dtbo
> > +dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt7986a-bananapi-bpi-r3-emmc.dtb
> >   dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt7986a-bananapi-bpi-r3-nand.dtbo
> > +mt7986a-bananapi-bpi-r3-nand-dtbs :=3D mt7986a-bananapi-bpi-r3.dtb mt7=
986a-bananapi-bpi-r3-nand.dtbo
> > +dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt7986a-bananapi-bpi-r3-nand.dtb
> >   dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt7986a-bananapi-bpi-r3-nor.dtbo
> > +mt7986a-bananapi-bpi-r3-nor-dtbs :=3D mt7986a-bananapi-bpi-r3.dtb mt79=
86a-bananapi-bpi-r3-nor.dtbo
> > +dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt7986a-bananapi-bpi-r3-nor.dtb
> >   dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt7986a-bananapi-bpi-r3-sata.dtbo
> > +mt7986a-bananapi-bpi-r3-sata-dtbs :=3D mt7986a-bananapi-bpi-r3.dtb mt7=
986a-bananapi-bpi-r3-sata.dtbo
> > +dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt7986a-bananapi-bpi-r3-sata.dtb
> >   dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt7986a-bananapi-bpi-r3-sd.dtbo
> > +mt7986a-bananapi-bpi-r3-sd-dtbs :=3D mt7986a-bananapi-bpi-r3.dtb mt798=
6a-bananapi-bpi-r3-sd.dtbo
> > +dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt7986a-bananapi-bpi-r3-sd.dtb
> >   dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt7986a-rfb.dtb
> >   dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt7986b-rfb.dtb
> >   dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt7988a-bananapi-bpi-r4.dtb
> >   dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt7988a-bananapi-bpi-r4-2g5.dtb
> >   dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt7988a-bananapi-bpi-r4-emmc.dtbo
> > +mt7988a-bananapi-bpi-r4-emmc-dtbs :=3D mt7988a-bananapi-bpi-r4.dtb mt7=
988a-bananapi-bpi-r4-emmc.dtbo
> > +dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt7988a-bananapi-bpi-r4-emmc.dtb
> >   dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt7988a-bananapi-bpi-r4-sd.dtbo
> > +mt7988a-bananapi-bpi-r4-sd-dtbs :=3D mt7988a-bananapi-bpi-r4.dtb mt798=
8a-bananapi-bpi-r4-sd.dtbo
> > +dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt7988a-bananapi-bpi-r4-sd.dtb
> >   dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt8167-pumpkin.dtb
> >   dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt8173-elm.dtb
> >   dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt8173-elm-hana.dtb
> > @@ -104,6 +118,8 @@ dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt8390-genio-700-e=
vk.dtb
> >   dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt8395-kontron-3-5-sbc-i1200.dtb
> >   dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt8395-radxa-nio-12l.dtb
> >   dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt8395-radxa-nio-12l-8-hd-panel.dtbo
> > +mt8395-radxa-nio-12l-8-hd-panel-dtbs :=3D mt8395-radxa-nio-12l.dtb mt8=
395-radxa-nio-12l-8-hd-panel.dtbo
> > +dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt8395-radxa-nio-12l-8-hd-panel.dtb
> >   dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt8516-pumpkin.dtb
> >
> >   # Device tree overlays support
>
>
>

