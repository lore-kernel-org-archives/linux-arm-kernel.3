Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 870DBC021A6
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Feb 2025 15:02:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3M5idA8N7HpwZKk/3+pcrUsB6D7VU4LeXOhWq3Jgugs=; b=ECPxAtoS51GrJvyd4uEBeKqFxs
	i65+nVTl75ZbJapEFXelbffHOpixlzHiBdbWXTNADB/Tt68WJJo/hzTmgZc+0iZ4wO7s0mzJYTJ3m
	xdWvY/kmfnW6ywlf/apZrHnTnKQq00bzDy8coKobkeLrGdukoXBMBqe5ELkG7jjabo/YUVNoRtDuR
	+cSjYwCH1GWXyheWsb9X2/oie8KD/TOz8QGKIIXOrKCcaXv4gbNkftjPr1xB4ewAJ/qbkijE/Wdye
	4rMiHMVDaWs6tlcDHRdMpVz8fEV2IdpDD0A2Rl/VXT9KBK0P7+5Y2ouGsyT2MsT4XdHllveTZaisK
	cbKLn6Tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thVJ7-00000000EFY-0yz0;
	Mon, 10 Feb 2025 15:02:45 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thVHg-00000000Dou-1m08;
	Mon, 10 Feb 2025 15:01:17 +0000
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-ab744d5e567so871949966b.1;
        Mon, 10 Feb 2025 07:01:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739199675; x=1739804475; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=3M5idA8N7HpwZKk/3+pcrUsB6D7VU4LeXOhWq3Jgugs=;
        b=i9vJGl8waq2LZGphmC691ge2ELjGXUioiklVTGhzfU74ZYoG+pZY8wEzsazFlL8Pn1
         LbVJALkhAQqtcl8iFBYmccse5ToGhDcwZoPawCZUC5NwUo10U6qmVQ4sCLC6GOQUKFTd
         0J8teU12o7yy9F3hTreK4dLuQHY6mcojvtC6dlXoyQGEnuL3MLnC96+tg8+zC+mnUg0p
         YJOFcLCK9aFkzTxxS91zN4aG/tRQbV3l7uy2le3lxhRWMgWg5mxVSPf++lCOFIizALOq
         oAxPXdmaQhSUkkYF95vu+dBZB9tdwa1QiS0/9WPrD5KV1PEmVvx3G3qcOx6aniTV5xgE
         F86w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739199675; x=1739804475;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3M5idA8N7HpwZKk/3+pcrUsB6D7VU4LeXOhWq3Jgugs=;
        b=O08yOy17ylNUXRATzn9VcoeaPB3pAyWPqg+vrZK0ailmzaiPaGR5if21gqrS4+TxhG
         8ns1uskxJwheCYH0E/M6kHP2AeiP1HbKpfit/OMYNiltDBeM+nUESFdWMV9w8fysy9vV
         UODwKCEylp4kKU+/AQ/lWj7y1byh4ICj4sRIXlGd0m87sTdogw4HX5iGGMl39dBl2Svr
         rkfCoqn2TCoPkiFVkOLhnooX9rj9wl2zshYBluqyR5UfUebs490CHMEP9Oa9gH55H8c5
         68C8Q5Z6j1WUq201nXS0973nPKFEzVV1VAyeqSDYRR4tUWQ0gaaWAMyZ1YOQSApS3G5N
         G1Mw==
X-Forwarded-Encrypted: i=1; AJvYcCUggiEaMfNvaGzX+D4ck+RB9qmXzetIuNgZSLSWVTJ/71D2eKvHt1b8+QgyUs8dOfuHXgulmqqdFmns73M=@lists.infradead.org, AJvYcCVk+A6Htyz7WUzlwF+IqB+p0VKUf1Uz5vlC9jXKP3wfDow2URJXc4in9LHdsM07cQ85Tey+hgLJ6NT/7tJkmjqa@lists.infradead.org
X-Gm-Message-State: AOJu0YzqN8byFq3+IND4IwWgtF1xmv3XcibrsuqngHsxxwYCSm8EjG4R
	HhIcUcAltCzvinWngmR/Q07UHzjzSvIXSnX4t4LvZEm7GTyiUvva
X-Gm-Gg: ASbGncsDj9ZuvJ2+ErR6B47nBEPRym3PRHx5O8hs5w9IZSb9XuF+67l2KzCi0edxzXd
	iqAzN2YC9a+PBp190mD2gOSb9dXlEn5QVuE+4BrAZqFmMxxkbP22SiQJF4cOfxY+iPjXGY1yi03
	t70u0nlZXo8vCHSTPGaT+Q+NNJxJm7IDtPO9UFOE2Vm2CQ3yb+q7GT/vCX64L8E3MzXMaGBg0x0
	dpkeVSQliM/TgnqBEtRwax/VyLLu+IrkrNx5bA6kKFKQEuQSlMEkk2qSQT3/KRLRHMnboaBR/p4
	3D3BUHP73wmampwhx/jtHeHN16gVEs1b
X-Google-Smtp-Source: AGHT+IHDvJX3+ekZa4vY1LIl/WMEIul6AD+KtHvHZm/OrLAAq1fRlkjI0uEBHS/oueveFzGr668vsg==
X-Received: by 2002:a17:906:6a29:b0:ab6:d4ce:5674 with SMTP id a640c23a62f3a-ab76e9dc14amr1858509166b.26.1739199672976;
        Mon, 10 Feb 2025 07:01:12 -0800 (PST)
Received: from giga-mm.home ([2a02:1210:861b:6f00:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab7cd7ffaa8sm122042766b.132.2025.02.10.07.01.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 07:01:12 -0800 (PST)
Message-ID: <03ff407fe68e46df4844e5dd244e7c609331af71.camel@gmail.com>
Subject: Re: [PATCH 03/10] arm64: dts: sophgo: Add initial SG2000 SoC device
 tree
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, soc@lists.linux.dev
Cc: Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto
 <inochiama@outlook.com>, 	linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org, Haylen Chu	 <heylenay@outlook.com>,
 linux-arm-kernel@lists.infradead.org, Arnd Bergmann	 <arnd@arndb.de>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski	 <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>
Date: Mon, 10 Feb 2025 16:01:10 +0100
In-Reply-To: <0d5484d1-be83-4f38-befd-94d458b3aaa8@kernel.org>
References: <20250209220646.1090868-1-alexander.sverdlin@gmail.com>
	 <20250209220646.1090868-4-alexander.sverdlin@gmail.com>
	 <0d5484d1-be83-4f38-befd-94d458b3aaa8@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.2 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_070116_467439_557A91ED 
X-CRM114-Status: GOOD (  19.79  )
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

Hi Krzysztof!

On Mon, 2025-02-10 at 09:45 +0100, Krzysztof Kozlowski wrote:
> On 09/02/2025 23:06, Alexander Sverdlin wrote:
> > Add initial device tree for the SG2000 SoC by SOPHGO (from ARM64 PoV).
> >=20
> > Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
> > ---
> > =C2=A0 arch/arm64/boot/dts/sophgo/sg2000.dtsi | 79 ++++++++++++++++++++=
++++++
> > =C2=A0 1 file changed, 79 insertions(+)
> > =C2=A0 create mode 100644 arch/arm64/boot/dts/sophgo/sg2000.dtsi
> >=20
> > diff --git a/arch/arm64/boot/dts/sophgo/sg2000.dtsi b/arch/arm64/boot/d=
ts/sophgo/sg2000.dtsi
> > new file mode 100644
> > index 000000000000..4e520486cbe5
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/sophgo/sg2000.dtsi
> > @@ -0,0 +1,79 @@
> > +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> > +
> > +#define SOC_PERIPHERAL_IRQ(nr)		GIC_SPI (nr)
> > +
> > +#include <dt-bindings/interrupt-controller/arm-gic.h>
> > +#include <riscv/sophgo/cv18xx-periph.dtsi>
> > +#include <riscv/sophgo/cv181x.dtsi>
> > +
> > +/ {

[...]

> > +	gic: interrupt-controller@1f01000 {
>=20
> MMIO nodes are always in the soc.

I think I've looked a wrong example (or a counter-example)...
$ grep -R -P '^\t\tcompatible =3D "arm,cortex-a15-gic";' *
arm/boot/dts/intel/axm/axm55xx.dtsi:		compatible =3D "arm,cortex-a15-gic";
arm/boot/dts/ti/omap/dra7.dtsi:		compatible =3D "arm,cortex-a15-gic";
arm/boot/dts/ti/omap/omap5.dtsi:		compatible =3D "arm,cortex-a15-gic";
arm/boot/dts/nvidia/tegra124.dtsi:		compatible =3D "arm,cortex-a15-gic";
arm/boot/dts/nvidia/tegra114.dtsi:		compatible =3D "arm,cortex-a15-gic";
arm64/boot/dts/nvidia/tegra132.dtsi:		compatible =3D "arm,cortex-a15-gic";
arm64/boot/dts/freescale/s32v234.dtsi:		compatible =3D "arm,cortex-a15-gic"=
;
arm64/boot/dts/apm/apm-storm.dtsi:		compatible =3D "arm,cortex-a15-gic";
arm64/boot/dts/apm/apm-shadowcat.dtsi:		compatible =3D "arm,cortex-a15-gic"=
;

But thanks for clarification!

> > +		compatible =3D "arm,cortex-a15-gic";
> > +		interrupt-controller;
> > +		#interrupt-cells =3D <3>;
> > +		reg =3D <0x01f01000 0x1000>,
> > +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 <0x01f02000 0x2000>;
> > +	};
> > +
> > +	soc {
>=20
> Override by phandle/label instead of duplicating.
>=20
> > +		ranges;
> > +
> > +		pinctrl: pinctrl@3001000 {
> > +			compatible =3D "sophgo,sg2000-pinctrl";
> > +			reg =3D <0x03001000 0x1000>,
> > +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 <0x05027000 0x1000>;
> > +			reg-names =3D "sys", "rtc";
> > +		};
> > +	};
> > +};
> > +
> > +
> > +&clk {
> > +	compatible =3D "sophgo,sg2000-clk";
>=20
>=20
> That's discouraged practice. If you need to define compatible, it means
> the block is not shared between designs and must not be in common DTSI.

That doesn't come from my series, that's how original cv18xx.dtsi has been
designed. Same question as before: do I need to rework it if I will not be =
able to
test the changes (I don't even posess the relevant HW). But if not, I have
to adapt the same pattern into the new sg2000.dtsi.

--=20
Alexander Sverdlin.


