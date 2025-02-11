Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 850B0C0219B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Feb 2025 13:11:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uepduHjDPy55AkkCGXbAU8w+LO18qfkEQA77TDsyyXM=; b=sItttOlQantg4U5KrKw0pTeNqV
	x/hYSvkGzdpX4Rqi3PJRCWr4HbN8lmZI6gLSeFB9gs7Aewku5RPcPDWO6HAWiOCVHCMimwJZWFRzp
	aGKoAf32fSBMcs0dFDva9jtU86vKbxXJ7BnV2prR/MOCX0plosn1s1pBJaEmx8uuObrldVld2+SdM
	7u0aX4aiNIdTGEHORJ+gRwtuBqrzGZA2v/rAzlFaT9RGIO/9dxPQJF1RkE58+woBDZ0b/YnXzipEs
	0BYy1Nw7kl3wCV9NFJc76yKQJzkL09BMvEsYJSJHE4jp4hsHF6JTGRIhGoL5YsMt+aVYkGwWfSBiV
	OhiETmbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thq2l-00000003tbJ-1XHZ;
	Tue, 11 Feb 2025 13:11:15 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thpc1-00000003oew-1Xcw;
	Tue, 11 Feb 2025 12:43:38 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-43934d6b155so17930955e9.1;
        Tue, 11 Feb 2025 04:43:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739277815; x=1739882615; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=uepduHjDPy55AkkCGXbAU8w+LO18qfkEQA77TDsyyXM=;
        b=IwNjN9ucm0txM/B+4pHQJRyyZUkZp5B41tS9kYa85tKPT/05ZSFIJ4rQLJSxEvoBKP
         zDA9FraQGNyJiZpWTwjQ1g8gTpvaSybkIm8MikW3PJ58ve8fLTwbE2bkvNnpsk79biO7
         PDYUiQNuyHK47aKrS2NVSHpM5Y+F99seq/cbg6UpNASpjU/OsAY8s8UelmuR+ndt3ALk
         xbsV4F7FCqKdpoRC2PPk106LXEHJkHMZoB0rzwW3l+rsTW7ewZfXxA8W+RMV8zoR+m95
         GpgP4uxIfCmeL9APjJhqkL+b597qi4JjMEimwQ38CmdfWWPBSyiG7bmVoNwpTxWT/ZWC
         8EjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739277815; x=1739882615;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uepduHjDPy55AkkCGXbAU8w+LO18qfkEQA77TDsyyXM=;
        b=rGL5ij4tquDPj//tk7Hpr0nueIRHMgPO8KcYH3djmtxmofX4RXO34Dfoz7kZV+5AFc
         E5vniWRTSb2pLAYlPV+S2LJ3P4+TOJbuuhe+SVy4wOvIdbn9jtBcbqrN/vTBdoWzRpbA
         ryNtDOd3YD6vxeDwBDoJ7BxXo9D+XPitE/aq1UYB2ylisxdeGFr6SV5qmv0ov/FyxY6K
         UcFBjEZkmRcrMNwl4roWUN4A2wKljFkGfUJAQme8iUcKL6pQd+8LAf42dPFMFTu9LlW4
         n4UC6LycO0DKFRq/x/+jZEx9yk/v7cascLjpfuZzbvSoGHansw5CcpjKl9owX3Q2TNxn
         nSlQ==
X-Forwarded-Encrypted: i=1; AJvYcCUWAfWpRVVEeQasNgLyHLoETtGO1eioELANFAUnbydlehfF0DWgJ/kyY7POLYUSLvs06bkEswGdGQdytkHUExE3@lists.infradead.org, AJvYcCXnd8I/B0b8D7DDXZVJoA81GnXi9h9qHgKIKsJY/k22o+HfMka86i3i23mhNA93VpoRwt1qRM/jw2wF+qo=@lists.infradead.org
X-Gm-Message-State: AOJu0YwnchlFA/HEcvnhULZQMV1SQZIjCau1+OPrMEYbVQwN87uF6JPD
	E1fhhRz4T88B2wMuvuvoogdaS1GX8deqkKD1j8t5ucy1IGose4xp
X-Gm-Gg: ASbGncsuX1hLNDBuAAtmJ+Bok5TY204e8UGOjh7uyvJGUBvEc9KAoGGyzOqZfi5WNSf
	rWVkUlOqzUbLc5iCWppSafRsGQnW+ewJDoURBo7LZgieoZbQwbaX2iNxr9DXfgJwaGCCqXlc8wP
	1QtkG76IeFDSntDJu1GjfeWnVAfCOGufA2xGRx0eyRruf6X3DgKIceS96DtmTMpe8CDLqLe3c8o
	kEqHndBzNK+FTrEHhNGoayduxSN5uilIDHr+pG2aPdJki4ftgKKfLpQOHuvkssS0ls0pqhG8T6c
	lxAGIkkfPZ6omzJeGOaGW5z8XD2hn03q
X-Google-Smtp-Source: AGHT+IEBhVLUgJKyLV9yDCk2soLE+OEkOUesnwWNG1Lpa/Ktin9FkzYLpEqwqMjhtsNnoPajSZttXg==
X-Received: by 2002:a7b:ce8c:0:b0:439:31a6:276a with SMTP id 5b1f17b1804b1-4394ceaf874mr28491015e9.2.1739277815164;
        Tue, 11 Feb 2025 04:43:35 -0800 (PST)
Received: from giga-mm.home ([2a02:1210:861b:6f00:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dcd8213f2sm11711856f8f.67.2025.02.11.04.43.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 04:43:34 -0800 (PST)
Message-ID: <b1f05bff1d6c3f0cb1b381c15dcf222ec4c7f1b1.camel@gmail.com>
Subject: Re: [PATCH v2 0/7] arm64 support for Milk-V Duo Module 01 EVB
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: Conor Dooley <conor@kernel.org>
Cc: soc@lists.linux.dev, Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto
	 <inochiama@outlook.com>, Lee Jones <lee@kernel.org>, Rob Herring
 <robh@kernel.org>,  Krzysztof Kozlowski	 <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Philipp Zabel	 <p.zabel@pengutronix.de>, Catalin
 Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Arnd
 Bergmann <arnd@arndb.de>, Paul Walmsley <paul.walmsley@sifive.com>,  Palmer
 Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Sebastian
 Reichel <sre@kernel.org>, 	devicetree@vger.kernel.org, Haylen Chu
 <heylenay@outlook.com>, 	linux-arm-kernel@lists.infradead.org,
 linux-riscv@lists.infradead.org, 	linux-pm@vger.kernel.org, Jisheng Zhang
 <jszhang@kernel.org>, Chao Wei	 <chao.wei@sophgo.com>
Date: Tue, 11 Feb 2025 13:43:31 +0100
In-Reply-To: <20250211-backwash-jester-2fdd6740000e@spud>
References: <20250210220951.1248533-1-alexander.sverdlin@gmail.com>
	 <20250211-backwash-jester-2fdd6740000e@spud>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.2 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_044337_404520_F94C5D48 
X-CRM114-Status: GOOD (  13.83  )
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

Hi Conor!

On Tue, 2025-02-11 at 10:50 +0000, Conor Dooley wrote:
> On Mon, Feb 10, 2025 at 11:09:40PM +0100, Alexander Sverdlin wrote:
> > This series adds very basic support for Milk-V Duo Module 01 EVB [1] in
> > arm64 mode. The SoC (SG2000) is dual-arch, RiscV and ARM64, the latter =
has
> > been chosen because the upstream toolchain can be utilized.
>=20
> > =C2=A0 .../{riscv =3D> soc/sophgo}/sophgo.yaml=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 7 +-
> > =C2=A0 arch/arm64/Kconfig.platforms=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 =
6 ++
> > =C2=A0 arch/arm64/boot/dts/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 =
1 +
> > =C2=A0 arch/arm64/boot/dts/sophgo/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 2 +
>=20
> I'd expect this to be maintained alongside the riscv support, how come
> there's no maintainers entry change here?

MAINTAINERS file has "K: sophgo" entry already, I suppose new files will
fall into this category? That's why I've ignored this specific checkpatch w=
arning
in all patches. Am I wrong?

> > =C2=A0 .../sophgo/sg2000-milkv-duo-module-01-evb.dts | 31 +++++++
> > =C2=A0 .../sophgo/sg2000-milkv-duo-module-01.dtsi=C2=A0=C2=A0=C2=A0 | 8=
5 +++++++++++++++++
> > =C2=A0 arch/arm64/boot/dts/sophgo/sg2000.dtsi=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 | 75 +++++++++++++++
> > =C2=A0 arch/arm64/configs/defconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 =
5 +
> > =C2=A0 arch/riscv/boot/dts/sophgo/cv1800b.dtsi=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 | 64 ++++++++++---
> > =C2=A0 arch/riscv/boot/dts/sophgo/cv1812h.dtsi=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 | 64 ++++++++++---
> > =C2=A0 arch/riscv/boot/dts/sophgo/cv181x.dtsi=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |=C2=A0 2 +-
> > =C2=A0 arch/riscv/boot/dts/sophgo/cv18xx-cpu.dtsi=C2=A0=C2=A0=C2=A0 | 5=
7 ++++++++++++
> > =C2=A0 arch/riscv/boot/dts/sophgo/cv18xx.dtsi=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 | 91 +++++--------------
> > =C2=A0 arch/riscv/boot/dts/sophgo/sg2002.dtsi=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 | 64 ++++++++++---
> > =C2=A0 14 files changed, 451 insertions(+), 103 deletions(-)
> > =C2=A0 rename Documentation/devicetree/bindings/{riscv =3D> soc/sophgo}=
/sophgo.yaml (80%)
> > =C2=A0 create mode 100644 arch/arm64/boot/dts/sophgo/Makefile
> > =C2=A0 create mode 100644 arch/arm64/boot/dts/sophgo/sg2000-milkv-duo-m=
odule-01-evb.dts
> > =C2=A0 create mode 100644 arch/arm64/boot/dts/sophgo/sg2000-milkv-duo-m=
odule-01.dtsi
> > =C2=A0 create mode 100644 arch/arm64/boot/dts/sophgo/sg2000.dtsi
> > =C2=A0 create mode 100644 arch/riscv/boot/dts/sophgo/cv18xx-cpu.dtsi

--=20
Alexander Sverdlin.


