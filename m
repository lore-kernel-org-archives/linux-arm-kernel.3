Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A43FCA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Aug 2025 15:18:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m9h2QLkI6YkYRhYdghU2MiWTpV4YprWIN5TJOvTtl/4=; b=W0eJw2IU0nlxWeX0yDSd/X68B/
	nssxIs/BAjwye/mnNfhlg/DaXdk108qbMCb4B15nXosxoDz1+OFv0XQMme6iPBLXhOsdtbmjZjLZX
	4HYvkt13d/JwCbukRzn1NkFbpLESRxeUw6CdaC8OZ052UatpQcCs9m/f4GhxAR4RLi5NtnVRQUMld
	FLCVYfj3dDB3SGikSnzbar1poEPsRfqTccOSAvrSGlzHr9MX9kqOZc8LqTNH3NXDUe9LbrIK+U0kD
	FphIsrsz60bp7uTy9ymerbPzwqi9Jg+WziRTlAn8BqsHE4voxCNSIyu5fh5++uLO0g9ecs1OFTKiL
	yuzyaeiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoka1-0000000EE8Y-0hjW;
	Wed, 20 Aug 2025 15:18:25 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uojN4-0000000DvJr-1Mfu;
	Wed, 20 Aug 2025 14:00:59 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-afcb7347e09so1076360266b.0;
        Wed, 20 Aug 2025 07:00:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755698457; x=1756303257; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m9h2QLkI6YkYRhYdghU2MiWTpV4YprWIN5TJOvTtl/4=;
        b=ZbK8vIC9MaJXL/O+/giIlJcdShLkeTj3NcPbviWboPDo3dizIE8PL0MYqOTv3/DrjG
         58lr8YOfK3P1mcvc0QftsWR0T6p5PGrs5K5S6hw/K8rCnNTncZV/+YmdN+FX3PsGkgAE
         eyGTV2cG7x46WrzMmEtiNyJHTLIpaAo+jrCpUJhqaopXQaVsMTauuSVilkiW62ACYOqv
         wVp+LKSwEFjwFOT9GiMQkqefiwlRPnsmuBlpiw+ckGa2wGe+WgGb+o0ztyUBR4iz2uuL
         1rOR6vQ5ODj3yIye+BXl0tgSCvQ2ALXaJJoPkRFBYi/3ikNmaQISxc9tf8uZVmPhOsM7
         aXjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755698457; x=1756303257;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m9h2QLkI6YkYRhYdghU2MiWTpV4YprWIN5TJOvTtl/4=;
        b=n1coniOPyMPi7/pHpKbSihZgiBPs/PV6vfd6ADvgPSAvTrbRz3GVB+D5zcdrhxtW1A
         LZmV/c8XartBnsifLt1mTucsZtjb9N7S/eTRmh31kXfTj9qfhXz6oEpA0VeTBLSur3tT
         b0/9lfcibGB2zswlKG27v39a1OXo1QJh5nSvxbV0BDaliS54fljV2EDO4+E7uL9gZyX8
         6Rv0PZTTGAYAy1E3zsJEdRkqYJvoe4ICODnSJuvDvSsMyMK1pd+GiOJCQ52IvKvzD+MD
         B+5uhfoM1bafK+s7Upo04sPczQOirLA2lMhxi/NasMqtg3IAOUyV5p5hA2heJdKsP6N1
         tneQ==
X-Forwarded-Encrypted: i=1; AJvYcCUOo7Z7jb/f0agWou6t6oPv0cIKej7p4WdANbxjj/5nLQ0CDA3Cyqlrhlcxv/52Lo/PK7PVl/swV5/HMbfM@lists.infradead.org, AJvYcCVMh4jRJhACvbWP4BQ9eOWblUU5slDMTZyUEghv6TOMB+3EHmdJNpT3pHVX93Jua08shI9bOTZApqqEf6utVJ6IXg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwIhU5V1buK99lQNExuaeV+vdWwSHDGbdHevFAlQcOh2uHiTk/w
	99LVHkZwBoquVE53V0JJxenCSut7ZzYTcGcAv+X5JqZNjhySLx3CIPOzZI8gFDjq8JbKf0cd4ec
	6x70ZCX1OGnnx0f+1KrBWdXQgB39L8kM=
X-Gm-Gg: ASbGncv2ZS7ZJAyQwzPBnCNQ9f7ic54MEkn5N+jCmQPrqw4/oQ42IUGcMIyg7FfZ65A
	K+NTuX9XGkZNmFJZygWWE2WUQ7KbsNiZOfDf24cHz7ucZCSx9S5K1WXqVtDle/yT20VWOu1AqjS
	WCUEl1glW1+w93nfH4IYSlb1tN6IESdie07py3UNaKo9qn9KQNuRqnKKhSHzDkNYRP7muB1B3rs
	Wf/yZYfQRzc6doA
X-Google-Smtp-Source: AGHT+IFV+ro30RViXmPmh+UAaPLX9QXo+YSh1EhMZ8DdlEeQ+YTmgGE1awr/lw8YhiJs9zwakmOnOmQJdBgREnZFde0=
X-Received: by 2002:a17:907:3c8b:b0:afc:b13d:ea7a with SMTP id
 a640c23a62f3a-afdf020c2f4mr277148966b.57.1755698456244; Wed, 20 Aug 2025
 07:00:56 -0700 (PDT)
MIME-Version: 1.0
References: <20240205171930.968-1-linux.amoon@gmail.com> <20240205171930.968-5-linux.amoon@gmail.com>
 <cf47b82c-6307-475b-af3a-eab7f09715f0@linaro.org> <CANAwSgTOpDmZGR33veBWrzr75=xEZ-28iu=GeCzqa0ZPXxDchw@mail.gmail.com>
 <f87069a4-042c-467a-94fb-0b65bfa4758d@linaro.org> <CANAwSgR1+Fb5Si6yBU6JXCfRiq-XU0xjr-ecVbnALMj7qmv0Sg@mail.gmail.com>
In-Reply-To: <CANAwSgR1+Fb5Si6yBU6JXCfRiq-XU0xjr-ecVbnALMj7qmv0Sg@mail.gmail.com>
From: Anand Moon <linux.amoon@gmail.com>
Date: Wed, 20 Aug 2025 19:30:38 +0530
X-Gm-Features: Ac12FXzAr4dY-DLEEvK_oha48667po-sPu4Fnf6VcphXOs4zMjuTfD8jZc6AdGA
Message-ID: <CANAwSgQvYyE3rZqBHR2_Q0FzggznOh=fhtBQVJZ1DRn73P24pQ@mail.gmail.com>
Subject: Re: [PATCHv1 4/5] arm64: dts: amlogic: Add cache information to the
 Amlogic S922X SoC
To: neil.armstrong@linaro.org
Cc: Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250820_070058_372153_BD424875 
X-CRM114-Status: GOOD (  30.62  )
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

Hi Neil,

On Tue, 27 Feb 2024 at 18:34, Anand Moon <linux.amoon@gmail.com> wrote:
>
> Hi Niel,
>
> On Tue, 6 Feb 2024 at 20:31, <neil.armstrong@linaro.org> wrote:
> >
> > On 06/02/2024 11:15, Anand Moon wrote:
> > > Hi Neil,
> > >
> > > On Tue, 6 Feb 2024 at 14:30, Neil Armstrong <neil.armstrong@linaro.or=
g> wrote:
> > >>
> > >> On 05/02/2024 18:19, Anand Moon wrote:
> > >>> As per S922X datasheet add missing cache information to the Amlogic
> > >>> S922X SoC.
> > >>>
> > >>> - Each Cortex-A53 core has 32 KB of instruction cache and
> > >>>        32 KB of L1 data cache available.
> > >>> - Each Cortex-A73 core has 64 KB of L1 instruction cache and
> > >>>        64 KB of L1 data cache available.
> > >>> - The little (A53) cluster has 512 KB of unified L2 cache available=
.
> > >>> - The big (A73) cluster has 1 MB of unified L2 cache available.
> > >>
> > >> Datasheet says:
> > >> The quad core Cortex=E2=84=A2-A73 processor is paired with A53 proce=
ssor in a big.Little configuration, with each
> > >> core has L1 instruction and data chaches, together with a single sha=
red L2 unified cache with A53
> > >>
> > > Ok,
> > >
> > > Since all the Cortex=E2=84=A2-A73 and Cortex=E2=84=A2-A53 share some =
improvements in
> > > the architecture with some improvements in cache features
> > > hence I update the changes accordingly.
> > > Also, I checked this in the ARM documentation earlier on this.
> >
> > I don't understand, Amlogic states it's a shared L2 cache, but you trus=
t
> > the ARM documentation instead ???
>
> Yes please find the Cortex=E2=84=A2-A73 TRM
> L1 Cache
> https://developer.arm.com/documentation/100048/0002/level-1-memory-system=
/about-the-l1-memory-system?lang=3Den
> L2 Cache
> https://developer.arm.com/documentation/100048/0002/level-2-memory-system=
/about-the-l2-memory-system?lang=3Den
> >
> > >
> > >> And there's no indication of the L1 or L2 cache sizes.
> > >
> > > What I feel is in general all the Cortex=E2=84=A2-A73 and Cortex=E2=
=84=A2-A53 supports
> > > L1 and L2 cache size since it is part of the core features.
> > > but I opted for these size values from a Wikipedia article.
> > >
> > > On my Odroid N2+, I observe the following.
> > >
> > > I have also done some testing on the stress-ng to verify this.
> >
> >
> > Ok I don't feel confident adding numbers that comes out of thin air,
> > and even more since they are only shared to userspace.
> >
> > I think we should only add the numbers which are 100% sure
>
> Best way to let the Amlogic SoC members comment on the CPU  L1/ / L2 cach=
e size.
> But with the lack of pref PMU events we cannot test this feature.
>
> >
> >
> > This looks pretty, but let's keep exporting verified data.
> >
I just wanted to revisit this patch series with some updates on

Here is where the Android TV provides the cache details.
[1] https://androidpctv.com/comparative-amlogic-s922x/

Amlogic S922X Hexa Core SoC has four ARM Cortex-A73 cores capable of
reaching 1.8Ghz
with 1MB L2 cache + 2 Cortex-A53 RAM processors with 256k L2 cache,

https://boardor.com/blog/understanding-the-architecture-of-arm-cortex-a53-c=
ache

Also  Amlogic A311D processor utilizes a "big.LITTLE" architecture, combini=
ng:

Quad-core ARM Cortex-A73:
Each Cortex-A73 core has:
     64 KB L1 instruction cache 64 KB L1 data cache
The Cortex-A73 cluster shares a 1 MB unified L2 cache.

Dual-core ARM Cortex-A53:
Each Cortex-A53 core has:
  32 KB L1 instruction cache, 32 KB L1 data cache

The Cortex-A53 cluster shares a 512 KB unified L2 cache.

From what I understand, CPU caches are a core feature of the CPU.
Do you think I should update these patches and resend ?

Thanks
-Anand

