Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B89CFC61CE8
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Jun 2025 14:08:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5em0HjCiCNml+pK7wkeftBLKShhy+xkQwHSxQRlfmBI=; b=m75dJ/63HTszaqENFCQ7Rsefm7
	rb1t7//SOps2x8AxD5gxMoaU3Twj620PRQ5P0dwTLNuKZrV+KX1VvcmLzcCgxALoaQk/AKw2AdZGg
	GYLZwsWQjp72WyMMj94ueQCgmmEnR8au1HjOtzFqzgeFPPP6IB/FBiO3JjtECvbyhMfPsxysSImHx
	x4gp0bZFRSTMjvoDELcUERjY+QwxOWHY4zTCzPGBCo9v9tEgn1B0OxajmHFKclpAFnmBgRWFPqcQ2
	k3ruEsBY3/e4hQsI3d53xEwlZUByTWSecFivpQhLAQYx5kS29Y6odEh9n4h0Qvi+vdQisQ+5FAx66
	TEB7ciog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOdAQ-00000004Lnd-1rQi;
	Mon, 09 Jun 2025 14:08:02 +0000
Received: from mail-qt1-x82b.google.com ([2607:f8b0:4864:20::82b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOd8D-00000004LSi-0KJb;
	Mon, 09 Jun 2025 14:05:46 +0000
Received: by mail-qt1-x82b.google.com with SMTP id d75a77b69052e-4a58c2430edso47644441cf.1;
        Mon, 09 Jun 2025 07:05:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749477944; x=1750082744; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5em0HjCiCNml+pK7wkeftBLKShhy+xkQwHSxQRlfmBI=;
        b=ccPUNQ/IIb90AhlXRpd1amrPl7ruZjmgELr8gnw3xpIqAUWYF4VVHa86WaU2Op7hRC
         g/jPN6buMCJS/lT9CDeVz1KF6Og+0mXDhN0tsuPPYw3ZL5V0CinOkY7o5dODu8DdQnzq
         mTQx1J3vNH6+PcRGYek9i+8Md6Fz+XjxiB3JC9H+Ug3beKodmmos0/nleJ/1HmgZ3w91
         AI4D71KqmN3gofOzzb11AC5cSITkZrYKUibcigxC6tM82lYkbCxqrLGNNo7nZ0WcZNEX
         JvgAfpawhTTMh+bVIjq/ExK19ccJQxHjlkm1LBItSKa/Hfe4/M9P3DP6buZuLfkEoETS
         lo0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749477944; x=1750082744;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5em0HjCiCNml+pK7wkeftBLKShhy+xkQwHSxQRlfmBI=;
        b=IlVyHvnRnHxC6oxI3oRsIMJnUR7PGT4af+Xd8Hp0I9moI+hhiu/INNt9rIZ/kKg/jq
         nXrxVMG/dvNyyLub3HaXRwd05++0fQJrEUqj5+shU9kkwuE2l5SdmgHCS9A/9WU8V8Fc
         mEslRf2IBZzlGGw9O6BqzlArabm1GvmiuFKJ3AuKprXLEdaT2USf8IaiymWg8vcYEYY0
         MHRau+YffeHlgnu4XWjRFdnBtfB4pQWAx+KYeZRJMjmKiGoGkIaRtkmbyaL7aN+d7InL
         dvr9Sksklu51NOL0WUQIWZUSXYyYbrdOFoY4HSLyqOiDEHC3Bd7oMWF7u0uZ0F5vI3Oq
         A34A==
X-Forwarded-Encrypted: i=1; AJvYcCVUNbPKDqf6oYgPJxpGZ9kJW2/mh/p1aHkpwzmlzh0HWFLXiI37vQuOo/zTd3aRw4TmCDjn858zhwOa1X/agM0O@lists.infradead.org, AJvYcCWTtfFlpFtvUN9s7Ecv4xZ1FXh3YwMQ3Y7+PRh9//XgizXUCCJCrWnWmViFjrL3RkdnwHXnMIWzoMAyRsB9poc=@lists.infradead.org
X-Gm-Message-State: AOJu0YxkWJGD1uq8bQ7rP6QZ2aRIpRkw0Pw3w60dKcVgTrcVTN6ugOZ/
	UMsqX2Ph7wAJlept130Gy+Sty1V5sbfaWJ7RtNRe9jzCzD7HICQkArk9AppvyW+3NGXeiMBfshj
	eUW/R1SlalPXNWrV9zzFmnujgZwzIMkA=
X-Gm-Gg: ASbGnct7OZStCqe8otkUMBuoZzPixVQ2ef4KamNElZixxAcAFyHfTkjxDogjC+M/79a
	Z9OwilkdFMTrNPJDE1OIlz/tNONH8I8KsyA+s4OSp47tMgEjMNOCPM5iGV6ggKHMClo+LZxv8SU
	w6M3ktZWj2m1qsWrKGX5AJnVh5an0rCYY=
X-Google-Smtp-Source: AGHT+IElRSJZYvwLgNDSXxeUFeCJ4WGpztDtPuM0pyb0/v8zrLeTq6YP4S0P3QPuP0k+uFuxoBLonx/Q+SmnlY/xFZw=
X-Received: by 2002:a05:622a:4d08:b0:4a5:99a8:eb21 with SMTP id
 d75a77b69052e-4a6f054f796mr16515991cf.22.1749477943641; Mon, 09 Jun 2025
 07:05:43 -0700 (PDT)
MIME-Version: 1.0
References: <20250603-sige5-updates-v1-0-717e8ce4ab77@gmail.com>
 <20250603-sige5-updates-v1-1-717e8ce4ab77@gmail.com> <6656934.DvuYhMxLoT@workhorse>
 <CABjd4Yx05SCm+03jWbsEP-A5AuhL14wLj=+VdKyQgqMbnxi3xQ@mail.gmail.com>
 <512E950E-E8CB-443B-8E47-79F073D217E8@gmail.com> <CABjd4YxGQP=rH15EX12w36b7+82Dedf+rVH3v5V6gBwNv3V3iw@mail.gmail.com>
 <90218D7B-0CF5-4F5D-969A-909A44E6044F@gmail.com>
In-Reply-To: <90218D7B-0CF5-4F5D-969A-909A44E6044F@gmail.com>
From: Alexey Charkov <alchark@gmail.com>
Date: Mon, 9 Jun 2025 18:05:32 +0400
X-Gm-Features: AX0GCFuWBU5QiUTtg-6bvXrLknfduxLhtbNHfqrkbx632DneSAm8rotxzSeH1rs
Message-ID: <CABjd4Yw3FyVS0MBk2WdWKb24vkqrb09Tx3tj6B-xsmG1-Csk7w@mail.gmail.com>
Subject: Re: [PATCH 1/4] arm64: dts: rockchip: list all CPU supplies on ArmSoM Sige5
To: Piotr Oniszczuk <piotr.oniszczuk@gmail.com>
Cc: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250609_070545_117903_D080CE1C 
X-CRM114-Status: GOOD (  23.72  )
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

On Sun, Jun 8, 2025 at 11:24=E2=80=AFAM Piotr Oniszczuk
<piotr.oniszczuk@gmail.com> wrote:
> > Wiadomo=C5=9B=C4=87 napisana przez Alexey Charkov <alchark@gmail.com> w=
 dniu 5 cze 2025, o godz. 15:42:
> >> Alexey,
> >> I see you are using rk3576 board like me (nanopi-m5)
> >> Have you on your board correctly working cpu dvfs?
> >> I mean: [1][desired clocks reported by kernel sysfs are in pair with [=
2[]cur clocks?
> >> In my case i see mine cpu lives totally on it=E2=80=99s own with dvfs:
> >
> > Hi Piotr,
> >
> > I haven't tried to validate actual running frequencies vs. requested
> > frequencies, but subjective performance and power consumption seem to
> > be in line with what I expect.
>
> well - my subjective l&f is that  - currently - my rk3576 seems =E2=80=9E=
slower" than i.e. 4xA53 h618.

In my experience, native compilation of GCC 14 using 8 threads on
RK3576 (mainline with passive cooling and throttling enabled): 2 hours
6 minutes, on RK3588 (mainline with passive cooling via Radxa Rock 5B
case and throttling enabled but never kicking in): 1 hour 10 minutes

> This directed me to investigate this issue.
> Test run was media player (mythtv) where ui has gl effects and ui gl tran=
sitions =E2=80=9Espeed=E2=80=9D are quite proportional to cpu speed (and gp=
u).
> My overall feeling is: ux is comparable to slow socs 4xA53@1.4GHz/G31. Th=
is is with mainline atf + collabora uboot [1] and on-demand gov.
> I done test with replacing uboot from mainline atf + collabora uboot to b=
in. dump of vendor uboot (2017.09) and with this ux become almost as expect=
ed (i mean comparable with i.e. rk3399).
>
> I done test with perf gov. and
>
> 1.collabora uboot[1] + mainline atf 2.13
> 2.collabora uboot[1] + rockchip rkbin bl31 blob [2]
> 3.vendor uboot (bin dump from friendlyelec ubuntu image)
>
> [a] on vendor uboot:
> Requested CPU4: 2304 MHz
> Requested CPU0: 2208 MHz
> Running CPU4: 1008 MHz
> Running CPU0: 1008 MHz
> Measured on HW: 1580.11 MHz
>
> [b] on collabora uboot + mainline atf:
> Requested CPU4: 2304 MHz
> Requested CPU0: 2208 MHz
> Running CPU4: 816 MHz
> Running CPU0: 816 MHz
> Measured on HW: 808.72 MHz
>
> [c] on collabora uboot + rockchip rkbin bl31 blob:
> Requested CPU4: 2304 MHz
> Requested CPU0: 2208 MHz
> Running CPU4: 816 MHz
> Running CPU0: 816 MHz
> Measured on HW: 812.49 MHz
>
> in all cases all clocks are constant as they should
> Interesting that on collabora uboot [b][c] measured clock is 808 vs 1580 =
on vendor uboot [a]...
> sw video decode conforms this diff: hd h264 gets cpu load: 172%[b][c] vs =
87%[a]

Can't see how u-boot would affect CPU speed in Linux, as long as you
use comparable ATF images. Do you use the same kernel and dtb in all
these cases? Also, what's your thermal setup?

> So summarising:
>
> 1. i see kind of issue with clock values (e.g. perf gov gives 800MHz on m=
ainline atf).
> imho rot cause seems to be in collabora uboot
>
> 2. on-demand gov. seems behave much more like powersave.
> this seems to be 3576 specific:
> -on 3588 change from perf to on_demand is hardly noticeable in ux

Not sure UX is a particularly good measure of CPU performance, as long
as you've got a properly accelerated DRM graphics pipeline. More
likely 2D/3D and memory.

By the way, I'd rather go for the "schedutil" governor, as it is more
forward-looking than "ondemand", thus should be more responsive to
load changes. It's also the default in modern distros AFAIR.

> -on 3576 such change makes ux feeling noticeable slow (like 4xA53 soc)
> i think this is more related to diff between scmi mcu gov algo in 3576 vs=
. 3588
> (imho 3576 algo has high latency in clock increases when demand happens +=
 too short delay for  clocks decreases to save power)

There might be some difference in how PVTPLL behaves on RK3576 vs.
RK3588. But frankly first I would check if you are using comparable
ATF implementations (e.g. upstream TF-A in both cases), kernels and
thermal environment :)

Best regards,
Alexey

