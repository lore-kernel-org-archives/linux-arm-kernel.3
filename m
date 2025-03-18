Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AB93C28B28
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Mar 2025 12:04:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Jb82ha75Ky9xw2N283lhpcRhhXBYeZoPwyZVdHllL3Q=; b=mV9xOF2tDWoWB/VZvKZdi0JePb
	ieOfNdZp5W6+byu5dyeLEA47ds7bEC7YAsE9LJ7WqaE68SwkGpjk19deCGcF8P1PiW6LSjo4xnvNp
	TTxQSNFl+tNuVOLDPaAdRvgxerIHTjqNycg9J5uX499dbyBiRTdZ1/1X+7boQxBsBNhhrJkVMgKse
	/zG4Zb6437fYc4qfOigvoafyj27EaRntHW7HkwAuTWZaeZKZTwLpLKr5xSnYAjWtmBHGXW6ndKe6F
	NQIM0gupY4AvtkNE4FPSOm9BbsDsdmaGGe618/olTNbIB25EcQ6waiFKyV8XrfUjig9I854+v0tV2
	JrifcJeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuVfv-00000005p5A-3x8n;
	Tue, 18 Mar 2025 12:04:03 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuVa2-00000005npu-0zBQ;
	Tue, 18 Mar 2025 11:57:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 8ADACA43555;
	Tue, 18 Mar 2025 11:52:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DA00C4CEFC;
	Tue, 18 Mar 2025 11:57:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742299076;
	bh=CIhTjH9kKlO1VYGiipc2V9drjBD3Ayt0OkD0U7KRb6w=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=VNZz+D/dtbyshE97W4HnLDn48vAHhWJ1qM3mL/ZcYLXzJCavmJHa91JYiiOlMNJbz
	 3UQHEcUGagflvTa1naQQ3WhxL7VDkHEqM2S7CkzCA9R2QNMrKsOF/87TV8TeAU7pag
	 JnyeHsFK4NM+n6Sd6iwRDBgTTtsst7XHqqi+SMHGvuW0tYLqcabFNOqlgCauzVkD73
	 FEV87vVnNi6+5cugxgHyXPjIWm09qmE4hdd7e5vWrscoz4DVCqYqP4MsFlrfEg/D+e
	 hisoP8e3IL/aZBRIfu7TRQITKlDjGtX7HEA5nLU4mGdskuoLTKP3Pn1CaVYbWjJBBQ
	 A9XO+vMkI9ejg==
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5e677f59438so8669595a12.2;
        Tue, 18 Mar 2025 04:57:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUExeOBmX/zLWPoouMBtGnTVddztDmbYXPLoFTsi7WZLz5+CATmFVCCgaNQnK2T6h397YmsbmAN2L0/YQwFkBFA4w==@lists.infradead.org, AJvYcCVJ4YiEq5+eSYPmP0EgeqmaGnSQjR/2uE3lVhucTc6hmPQdyL/svUXPKvfCyhEznqz+Skzwj0PhRks1MxC4L29P@lists.infradead.org, AJvYcCXslvRvQkMR98QPyAYPldX1YMfC4z23AKiRIGiWLqQhvMAvm71kcQnE/VGtksAupbh8HHEv87/IuSnyGbY=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx1Pf89FOYPXveyy6ftxVh7S8BxYXHCOolvbd2yMyg3PA20TgLm
	wdwE119l5ymHgl/lT08tYc0lpNektVHrXa11hLB1wdH5mZ/KG353wFL3c3kHz4BeUnKR4K+wRvA
	wkreDi+OoaBXZgX+Kfb5qbG8c1fg=
X-Google-Smtp-Source: AGHT+IHWKrMLWQmDlK3EXFGkIz3JuWrB7n/PbIZxnJSxvCf68cavwFPKlU+WgeLv6v2/CTfArLyeiik7sHtiA+Oo+58=
X-Received: by 2002:a17:907:1009:b0:ac3:3f10:e8e3 with SMTP id
 a640c23a62f3a-ac33f10ed5cmr1299294766b.1.1742299074804; Tue, 18 Mar 2025
 04:57:54 -0700 (PDT)
MIME-Version: 1.0
References: <20250115-fix-riscv-rt_group_sched-v4-0-607606fe73a5@coelacanthus.name>
 <20250115-fix-riscv-rt_group_sched-v4-4-607606fe73a5@coelacanthus.name> <t2dustbykx2qd24wazjeiw5hch5nwr6z2ewmaf4srg6r2grwrf@rdw47chzkef2>
In-Reply-To: <t2dustbykx2qd24wazjeiw5hch5nwr6z2ewmaf4srg6r2grwrf@rdw47chzkef2>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Tue, 18 Mar 2025 19:57:44 +0800
X-Gmail-Original-Message-ID: <CAAhV-H4fTGs-7EXE0EcR=P6GqHF2fokRE-kEte+cDmhjy=FYsA@mail.gmail.com>
X-Gm-Features: AQ5f1Jo4W5NNqo2SfcBdxKCe2OFxQs4im7DaCODl6wEw6MnCM3-sp2pnyba2ZAw
Message-ID: <CAAhV-H4fTGs-7EXE0EcR=P6GqHF2fokRE-kEte+cDmhjy=FYsA@mail.gmail.com>
Subject: Re: [PATCH v4 4/4] arm: defconfig: drop RT_GROUP_SCHED=y from bcm2835/tegra/omap2plus
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Celeste Liu <uwu@coelacanthus.name>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>, 
	Anup Patel <anup@brainfault.org>, 
	Heinrich Schuchardt <heinrich.schuchardt@canonical.com>, WANG Xuerui <kernel@xen0n.name>, 
	Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Russell King <linux@armlinux.org.uk>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, Tony Lindgren <tony@atomide.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Aaro Koskinen <aaro.koskinen@iki.fi>, 
	Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, 
	Roger Quadros <rogerq@kernel.org>, Palmer Dabbelt <palmer@rivosinc.com>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-sh@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rpi-kernel@lists.infradead.org, linux-omap@vger.kernel.org, 
	linux-tegra@vger.kernel.org, Stefan Wahren <wahrenst@gmx.net>, 
	Thierry Reding <treding@nvidia.com>, soc@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250318_045758_404349_EDC9A886 
X-CRM114-Status: GOOD (  21.88  )
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

On Fri, Mar 7, 2025 at 3:19=E2=80=AFAM Thierry Reding <thierry.reding@gmail=
.com> wrote:
>
> On Wed, Jan 15, 2025 at 04:41:23AM +0800, Celeste Liu wrote:
> > Commit 673ce00c5d6c ("ARM: omap2plus_defconfig: Add support for distros
> > with systemd") said it's because of recommendation from systemd. But
> > systemd changed their recommendation later.[1]
> >
> > For cgroup v1, if turned on, and there's any cgroup in the "cpu" hierar=
chy it
> > needs an RT budget assigned, otherwise the processes in it will not be =
able to
> > get RT at all. The problem with RT group scheduling is that it requires=
 the
> > budget assigned but there's no way we could assign a default budget, si=
nce the
> > values to assign are both upper and lower time limits, are absolute, an=
d need to
> > be sum up to < 1 for each individal cgroup. That means we cannot really=
 come up
> > with values that would work by default in the general case.[2]
> >
> > For cgroup v2, it's almost unusable as well. If it turned on, the cpu c=
ontroller
> > can only be enabled when all RT processes are in the root cgroup. But i=
t will
> > lose the benefits of cgroup v2 if all RT process were placed in the sam=
e cgroup.
> >
> > Red Hat, Gentoo, Arch Linux and Debian all disable it. systemd also doe=
sn't
> > support it.
> >
> > [1]: https://github.com/systemd/systemd/commit/f4e74be1856b3ac058acbf1b=
e321c31d5299f69f
> > [2]: https://bugzilla.redhat.com/show_bug.cgi?id=3D1229700
> >
> > Tested-by: Stefan Wahren <wahrenst@gmx.net>
> > Acked-by: Kevin Hilman <khilman@baylibre.com>
> > Acked-by: Thierry Reding <treding@nvidia.com>
> > Signed-off-by: Celeste Liu <uwu@coelacanthus.name>
> > ---
> >  arch/arm/configs/bcm2835_defconfig   | 1 -
> >  arch/arm/configs/omap2plus_defconfig | 1 -
> >  arch/arm/configs/tegra_defconfig     | 1 -
> >  3 files changed, 3 deletions(-)
>
> Hi Arnd,
>
> is this something that you could pick up? I think so far only the RISC-V
> patch was picked up, but nobody seems to feel responsible for the ARM
> patch here.
I will take the LoongArch patch, but may be squashed to another one
about config file update.

Huacai

>
> Thierry

