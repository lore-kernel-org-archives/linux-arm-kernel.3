Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCBCDCE8E9B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Oct 2024 17:27:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FTKrnBluD4JxPICdqME0ajZ+Fx27J0/+WYJKBnAywrU=; b=gLY9H2pQB/O+m+o/3qz9/Jo/rd
	eAAbUuEgcDu6LFwiaLcwX80s+PK38ctTmG/Y+pQtdCAtUMAtKt6NI37B0CgWzZOMiYFce6iFQS7AM
	upCuF4K97CI8+5cPHhclu+Pc/sEMlzSdQ/xN6dcD+VqMF7jo6x77PzrhKwUAEQBK/UrT61k1RbOnr
	0g2v7XJVS6l+Ml817NmCVWlTyfq5g0CUgIsmbXDfC0axm2pUb/y3I7S2VJGzO3Y2cPRVtjuN2bQZN
	sQVZCtOSgVkYKAnq/qZEBTTfEmed9bHBnTc6+iJ+fs+xIDqJlv2OIRmSvKNT17mmUb0SCyXO+HkyV
	mZ7d8WnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t41bx-00000001Haa-1qHR;
	Thu, 24 Oct 2024 17:27:01 +0000
Received: from mail-lj1-x235.google.com ([2a00:1450:4864:20::235])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t41Lw-00000001E0P-1nzu;
	Thu, 24 Oct 2024 17:10:29 +0000
Received: by mail-lj1-x235.google.com with SMTP id 38308e7fff4ca-2fb51e00c05so17975991fa.0;
        Thu, 24 Oct 2024 10:10:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729789826; x=1730394626; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FTKrnBluD4JxPICdqME0ajZ+Fx27J0/+WYJKBnAywrU=;
        b=lC6ROgjl5Tlb3e7Uaks14jFSYg0MNlgrm8aXNKp3lQ49QwzUbd8ZpM25HqmCmSINUv
         HzccDnbPDiqjsKkL/SAnLpv/DvLsV5uf3O+tl2gzKo05Pe6JKiUX/8YRv2dfOp2A72Hm
         ESlCOrJy2jCk/SQ7T+vd8SwwHjgyxxrt0OFUgCEkgHJvwzI9nR40zWC3FcNPpKkOQNMk
         ARNfOxh7gRLqovUGwcqQ33YO3Ni2lMOtSk8s1rbgSYWQy139xazXRpEFybds8sY23GAR
         l3+AHBoEtYZu58TZvco4ESu6QMZaNKZj8hMgC6pRgXday+8qdWjFaTa91JAWwrew0t01
         MBeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729789826; x=1730394626;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FTKrnBluD4JxPICdqME0ajZ+Fx27J0/+WYJKBnAywrU=;
        b=MqRPFXzU2RjE7Mzmu5AaPnCq0qxuaKueKk6/qJDBLQC+SG2+G04p/PouSJAw17beaB
         WtKa1Lbrw1B2EQIFmV4XfXSWtSCKLwJUs0SrXCI50agd+DprtxwGyB6tYbOXrvS/6P6H
         zP3Oi1+JDAZDrurBpmIcVBvY0Jun9nfDToGun48Ev8IY0eCZBa26tOY4JId/cIggspPU
         mN6m1yWOfqhOHJzsZw86iYfNsriND9YpZqR8EVzHf/mtGLCKNTYQgml1WFwJPS+/cBTS
         xOH9hh0sIlsvJycMY6emCKh+G7fc9R4atCgUePlJ5k0d8NKu5K7UXodu7xW3d4RRAyuX
         hhaA==
X-Forwarded-Encrypted: i=1; AJvYcCX7JJnkKhKs1HR3xlr6LqsopJVnCvwwhREgKEIicyIm43XoUF9f+Zk4m5ZGjD0+SmBv/WOWPMU0FPycZCMh4x+R@lists.infradead.org, AJvYcCXkxGfrxiuep6gbx08l2yvz2J/l+QVHB9G8t2axf1rSRzGphBqDjeg9GCazia7I9T2EfqpjqyT/gylCJsxwpqEk0A==@lists.infradead.org, AJvYcCXtR0QBrFM2HhjB1iEta0kA4Ai7JtmuYSUAtGasjLnZIvUpb2RPrmKHw9GrpEJILRMrk5ZHLjTmjW+RLzM=@lists.infradead.org
X-Gm-Message-State: AOJu0YyxyEbAzss+WWyqJ4/FqesR7sTay64QjFLZrlp9jaeyxeqhid1o
	pTTJIVlTLB2D7Vt5v9dKKuRmBsHPNgrYIOmxai3qMCglX9JSHVoT
X-Google-Smtp-Source: AGHT+IE6fiv+vs26SxlA2LCU8dr7H03wlCXlCxw07cHtczrt07/pTtUnxZ56Zdpp4aB7P5gDnnkT3Q==
X-Received: by 2002:a05:651c:1545:b0:2fb:3960:9667 with SMTP id 38308e7fff4ca-2fc9d31b55bmr61721431fa.14.1729789825771;
        Thu, 24 Oct 2024 10:10:25 -0700 (PDT)
Received: from orome (p200300e41f26ec00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f26:ec00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9a91370e75sm641392466b.130.2024.10.24.10.10.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2024 10:10:25 -0700 (PDT)
Date: Thu, 24 Oct 2024 19:10:23 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Celeste Liu <coelacanthushex@gmail.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>, 
	Anup Patel <anup@brainfault.org>, Heinrich Schuchardt <heinrich.schuchardt@canonical.com>, 
	Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
	Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Russell King <linux@armlinux.org.uk>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, Tony Lindgren <tony@atomide.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Palmer Dabbelt <palmer@rivosinc.com>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-sh@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rpi-kernel@lists.infradead.org, linux-omap@vger.kernel.org, linux-tegra@vger.kernel.org, 
	Stefan Wahren <wahrenst@gmx.net>, Kevin Hilman <khilman@baylibre.com>
Subject: Re: [PATCH v3 4/4] arm: defconfig: drop RT_GROUP_SCHED=y from
 bcm2835/tegra/omap2plus
Message-ID: <6m77wg6b76abyk2ebfniayxvrabvzur7onwar4isajb6tvfxbv@7a24p2xkmevj>
References: <20240910-fix-riscv-rt_group_sched-v3-0-486e75e5ae6d@gmail.com>
 <20240910-fix-riscv-rt_group_sched-v3-4-486e75e5ae6d@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="mgvujidfj33lw4eo"
Content-Disposition: inline
In-Reply-To: <20240910-fix-riscv-rt_group_sched-v3-4-486e75e5ae6d@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_101028_494179_853327E6 
X-CRM114-Status: GOOD (  17.22  )
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


--mgvujidfj33lw4eo
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3 4/4] arm: defconfig: drop RT_GROUP_SCHED=y from
 bcm2835/tegra/omap2plus
MIME-Version: 1.0

On Tue, Sep 10, 2024 at 08:51:10PM +0800, Celeste Liu wrote:
> Commit 673ce00c5d6c ("ARM: omap2plus_defconfig: Add support for distros
> with systemd") said it's because of recommendation from systemd. But
> systemd changed their recommendation later.[1]
>=20
> For cgroup v1, if turned on, and there's any cgroup in the "cpu" hierarch=
y it
> needs an RT budget assigned, otherwise the processes in it will not be ab=
le to
> get RT at all. The problem with RT group scheduling is that it requires t=
he
> budget assigned but there's no way we could assign a default budget, sinc=
e the
> values to assign are both upper and lower time limits, are absolute, and =
need to
> be sum up to < 1 for each individal cgroup. That means we cannot really c=
ome up
> with values that would work by default in the general case.[2]
>=20
> For cgroup v2, it's almost unusable as well. If it turned on, the cpu con=
troller
> can only be enabled when all RT processes are in the root cgroup. But it =
will
> lose the benefits of cgroup v2 if all RT process were placed in the same =
cgroup.
>=20
> Red Hat, Gentoo, Arch Linux and Debian all disable it. systemd also doesn=
't
> support it.
>=20
> [1]: https://github.com/systemd/systemd/commit/f4e74be1856b3ac058acbf1be3=
21c31d5299f69f
> [2]: https://bugzilla.redhat.com/show_bug.cgi?id=3D1229700
>=20
> Tested-by: Stefan Wahren <wahrenst@gmx.net>
> Acked-by: Kevin Hilman <khilman@baylibre.com>
> Signed-off-by: Celeste Liu <CoelacanthusHex@gmail.com>
> ---
>  arch/arm/configs/bcm2835_defconfig   | 1 -
>  arch/arm/configs/omap2plus_defconfig | 1 -
>  arch/arm/configs/tegra_defconfig     | 1 -
>  3 files changed, 3 deletions(-)

Any idea who will want to pick this up? Probably something the ARM SoC
maintainers can do directly, in which case:

Acked-by: Thierry Reding <treding@nvidia.com>

--mgvujidfj33lw4eo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmcaf38ACgkQ3SOs138+
s6Eb2RAAph/IveI76N2c7lk/cbmWs1cQoFHZmyzXgY26ZBU9nc81ILsjchLmkF85
h1M3kPkxMquC56MplXj0gSQGCIQIuLlbJf/cR4bL+PPOw7ecV5Dwg3cvg17do6+w
7+zAVkx+pXA8HbBAqVpHuQcP+YyPN4GEFDy8L8bdOa3GrAdpFKehSTCvr0cmvZCD
LtNd8P4xocqpMrxdGbH3YcOT/eJtbwlmRCYbeWavOtFfdiiIuNH73drj1L67sOjv
A0rgJOdsEtMCQG/sCtMkGd7KY62fZCE4nTu9RUM4/ett8nlROC674VgvJrpCW6Ym
hSZmJaRPXSInSFk9olAC3wWChah4WncpBj7qEfZ8g8dwMchFeGwgYTxxmCUIV7o8
A1Q1pbb1BMAS64SRaLv2bRkuWJ0FdI0bll+pihc7MSYtiWAuP5muOxK6QWdbr/ig
tTpYEh0PSsBkBAJ4zswAfXggM0HOUzqUOVsGDW0ky95K9pVDuDF9LVIY1FuEMgDw
72WHhE1zsbgVlfzTIOC0s8cD9ghl6e49g/TIl+BHxLh3xEWz2DOY8yLyj5M2OCgk
2Y+9jS20AREVOhtvxmeW5MDJavSj+4LXvqQE/7G63JDamadu/N1GYPfCqmQxQSiW
WaSdrnjknZjngwZWPQ+1p4LgKnlEr78OUc/jCnsSMyYXnBb3EzA=
=YCp7
-----END PGP SIGNATURE-----

--mgvujidfj33lw4eo--

