Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3336BC71157
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Jun 2025 15:38:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8krqiHD4H6SdO/c1xN2g7T+0SS16eUWDEAWw9hScjck=; b=RKDdh8+KsNElskBzp17e2uART2
	l4b4idoMelIvyvg9VOs5RxnlZoxKG4wzrUokHcfxuEGGNh7Au5hZimvvA36XquTBikBPwANLYtgXv
	LEQ39E4jYJ3V29NbBBHKQ9YdjccxwaQNhmUudaNfjol3YRlMl4TpecYlNwBJWo4fWxiSMUO1yXgLu
	eHyvTcT+CbBHvyi2FG2ohzz3guU6MA+qmZF3vXIaFj4vIqW5PgZ5ReMBFpe+cxMdLLiv2CqXpQqCP
	GfTHy6rmGK7kaGRAx7SK2mNIPwkx1CMDfI30sD2aFfe+MV9Su179VVI72fiLAIqzyQ0vbW9TT/xo2
	a93CHxvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRurw-0000000AcMO-3iZy;
	Wed, 18 Jun 2025 15:38:32 +0000
Received: from mail-qt1-x833.google.com ([2607:f8b0:4864:20::833])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRtCn-0000000AMSm-3j1c;
	Wed, 18 Jun 2025 13:51:59 +0000
Received: by mail-qt1-x833.google.com with SMTP id d75a77b69052e-4a5851764e1so133974421cf.2;
        Wed, 18 Jun 2025 06:51:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750254716; x=1750859516; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8krqiHD4H6SdO/c1xN2g7T+0SS16eUWDEAWw9hScjck=;
        b=INDaggVqryJkETYiACP/RU7OtvX3XJJYQg42bCj4/XCELzRF1/Uxdt4j4XtKzq+I+y
         xUyTy60HhhRy7cjouJPKeCIL+nZQysi3ddnQKHwdsxDkdUkW6czCIpI6dDZedjV74e3e
         O/GJ3o+24NH/2uMqBIY4VYd3CumwI6n8KFzy0vEgNwzmPSC1qydZkAaNW9vn0+9dpZZ3
         6cqNV4l23T7jrCuuLnOzw+dOkK/Om9r+5gJ0Y4T7tyES5IE5VDncWiFTRhbTnMZqRC+f
         NEDzfIwv4mm7649Jv5aFIl/Wol2NyB08ZKSF4xIRRQpbuZbedq/1rzaUWpIdEnfhV4IY
         Hovw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750254716; x=1750859516;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8krqiHD4H6SdO/c1xN2g7T+0SS16eUWDEAWw9hScjck=;
        b=OGewuWVnx0CDaNM2CagXgUV5OQK0BtLsSGQeONnY2tdkhp0ODjE2f3xod7MDknTsVx
         xbZ6TpjjYurVYUIA0sQhbUTmVuWcdmJBi35827hV8PjvKyIHrAzAMi24e6F7e86DMXSv
         kn5+pqwGYhIUx64a98/IJZXrW4jAK3CbZehE1MSHoHwwmFY3lvRr5wMCmP+4vJWzHzqk
         KO+SYkweBrxpROivJlVberSb7MAMJ5KI34pfOb1oU7AenwHZIO3iO7kq5Qfp5Z3h5cpT
         +0Do0x1q5Wna7VdTE+xZ1RYLLTPEV116eJbggJaHPIkDcuBMooBeFGbfWQ5DO/XSlRkI
         ph1A==
X-Forwarded-Encrypted: i=1; AJvYcCUHiscN1VHHVg/xoJjKN6LU8spp+dgmmySGvTFs9ou+cDH6zcV2Iv6qkKUhPKH4aD6Fmbky+udskK0BwfAjW30=@lists.infradead.org, AJvYcCVYdZCHWrG0CC3qMjxnCatjVDtF8tWelFoFhB0p0zNwycbAmo/RIaga4reRsc1c02MfKPyA3WqQI+ZEFiSfZwS/@lists.infradead.org
X-Gm-Message-State: AOJu0Yw3K9zdocPQtJGd/JzzTDZ5UHtoo3K8v03g/iEwGCTSEOrb/Nu8
	CSZ/ApHz4RB7um+J5ZDimL29ePydpVu4NOtZiC27WAGhl+ntZbVHUZ8Xa7cNazt+5GLAbrhE/Ya
	qqK8e0lZY2NoHWrSHNce/1ymtfvuUBtfdMZ4aQH03Ow==
X-Gm-Gg: ASbGnctx33iqoNyxsivE4mp1ZB1IDcMP2iAypmUfBjpPUvnJfz3uPHPI2fHztcTA7Je
	wV0eUnYxxZqfYXG03ZTs7aN4kmRK3FiJ9ZFmlUnejTEcpn9dn/S6TZGEliqkN7F8XvPqGlMKBxz
	hu1QggNh0/bYgZdxzqSGxpI34xNdPjc0+sWVKXpDM2gwnh
X-Google-Smtp-Source: AGHT+IFjLbj9BEdwTMYyliD/R38NY95P1fawYFekYrWxlx0+R36xCe+ioWLBLqW6E3ETOu7kqPcQGiL5wE4zGwh2p+0=
X-Received: by 2002:ac8:7d56:0:b0:4a7:189a:7580 with SMTP id
 d75a77b69052e-4a73c596fddmr239579821cf.26.1750254716255; Wed, 18 Jun 2025
 06:51:56 -0700 (PDT)
MIME-Version: 1.0
References: <20250603-sige5-updates-v1-0-717e8ce4ab77@gmail.com>
 <20250603-sige5-updates-v1-1-717e8ce4ab77@gmail.com> <6656934.DvuYhMxLoT@workhorse>
 <CABjd4Yx05SCm+03jWbsEP-A5AuhL14wLj=+VdKyQgqMbnxi3xQ@mail.gmail.com>
 <512E950E-E8CB-443B-8E47-79F073D217E8@gmail.com> <CABjd4YxGQP=rH15EX12w36b7+82Dedf+rVH3v5V6gBwNv3V3iw@mail.gmail.com>
 <90218D7B-0CF5-4F5D-969A-909A44E6044F@gmail.com> <CABjd4Yw3FyVS0MBk2WdWKb24vkqrb09Tx3tj6B-xsmG1-Csk7w@mail.gmail.com>
 <80ACAAAE-F522-4199-9048-ADE69F6E1128@gmail.com>
In-Reply-To: <80ACAAAE-F522-4199-9048-ADE69F6E1128@gmail.com>
From: Alexey Charkov <alchark@gmail.com>
Date: Wed, 18 Jun 2025 17:51:45 +0400
X-Gm-Features: AX0GCFvqMvYkd-RNYAsYCTEDXbFxfEzQX2sHnuaUv1aDcfcEAiv314iSEAb7Qg8
Message-ID: <CABjd4YyVJv0NmF9LsGWQ-O44MGjT5=FFeUjbg5rJ6XkNgjxb+g@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20250618_065157_928623_8E8E2C53 
X-CRM114-Status: GOOD (  29.33  )
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

On Sun, Jun 15, 2025 at 8:00=E2=80=AFPM Piotr Oniszczuk
<piotr.oniszczuk@gmail.com> wrote:
>
>
>
> > Wiadomo=C5=9B=C4=87 napisana przez Alexey Charkov <alchark@gmail.com> w=
 dniu 9 cze 2025, o godz. 16:05:
> >
> > On Sun, Jun 8, 2025 at 11:24=E2=80=AFAM Piotr Oniszczuk
> > <piotr.oniszczuk@gmail.com> wrote:
> >>> Wiadomo=C5=9B=C4=87 napisana przez Alexey Charkov <alchark@gmail.com>=
 w dniu 5 cze 2025, o godz. 15:42:
> >>>> Alexey,
> >>>> I see you are using rk3576 board like me (nanopi-m5)
> >>>> Have you on your board correctly working cpu dvfs?
> >>>> I mean: [1][desired clocks reported by kernel sysfs are in pair with=
 [2[]cur clocks?
> >>>> In my case i see mine cpu lives totally on it=E2=80=99s own with dvf=
s:
> >>>
> >>> Hi Piotr,
> >>>
> >>> I haven't tried to validate actual running frequencies vs. requested
> >>> frequencies, but subjective performance and power consumption seem to
> >>> be in line with what I expect.
> >>
> >> well - my subjective l&f is that  - currently - my rk3576 seems =E2=80=
=9Eslower" than i.e. 4xA53 h618.
> >
> > In my experience, native compilation of GCC 14 using 8 threads on
> > RK3576 (mainline with passive cooling and throttling enabled): 2 hours
> > 6 minutes, on RK3588 (mainline with passive cooling via Radxa Rock 5B
> > case and throttling enabled but never kicking in): 1 hour 10 minutes
>
> by curiosity i looked randomly on 3576 vs 3588:
> multithread passmark: 3675 (https://www.cpubenchmark.net/cpu.php?cpu=3DRo=
ckchip+RK3576&id=3D6213)
> multithread passmark: 4530 (https://www.cpubenchmark.net/cpu.php?cpu=3DRo=
ckchip+RK3588&id=3D4906)
>
> assuming 3588 as baseline, 3576 is approx 20% slower on multithread passm=
ark (has ~0,8 comp power of 3588)
> 70 min compile on 3588 should take something like ~86min on 3576.
> In your case 126min compile on 3576 shows 3576 offers 0,55 comp power of =
3588.
> Roughly 3576 should do this task in 40min less than you currently see i t=
hink
>
>
> > Can't see how u-boot would affect CPU speed in Linux, as long as you
> > use comparable ATF images. Do you use the same kernel and dtb in all
> > these cases? Also, what's your thermal setup?
>
> yes. in all cases only change was: uboot & atf
> thermal is based on recent collabora series (+ recent pooling fix for clo=
cks return from throttling)
>
> >
> >
> > Not sure UX is a particularly good measure of CPU performance, as long
> > as you've got a properly accelerated DRM graphics pipeline. More
> > likely 2D/3D and memory.
>
> indeed.
> For quantified look i=E2=80=99m looking on v.simple approach to estimate =
real clock is http://uob-hpc.github.io/2017/11/22/arm-clock-freq.html
> by curiosity i looked what it reports on a53/a55/a72/a76 and it is surpri=
singly accurate :-)
> on mine 3576 with collabora uboot+mainline atf is hows 800MHz (and in per=
f. gov it seems to be constant)
>
> >
> > There might be some difference in how PVTPLL behaves on RK3576 vs.
> > RK3588. But frankly first I would check if you are using comparable
> > ATF implementations (e.g. upstream TF-A in both cases), kernels and
> > thermal environment :)
>
> all tests: the same 6.15.2 mainline + some collabora patches
>
> diffs were:
> 1.collabora uboot[1] + mainline atf 2.13
> 2.collabora uboot[1] + rockchip rkbin bl31 blob
> 3.vendor uboot (bin dump from friendlyelec ubuntu image)
>
> on 1/2 i see kind of issue with clock values (i.e. perf gov gives constan=
t 800MHz on mainline atf).
> 3 seems to perform better - (i.e. perf gov gives constant 1500MHz so all =
is snappier/faster)

There is indeed something weird going on. I've tried running sbc-bench
[1], and even though I observe dynamically varying CPU frequencies
after boot with schedutil governor, once sbc-bench switches the
governor to "performance" and goes through the OPPs in descending
frequency order, the CPUs seem to get stuck at the last applied low
frequency. Even after max frequency gets reverted from 408 MHz to
something higher, even after I switch the governor to something else -
no matter what. Only a reboot gets the higher frequencies 'unstuck'
for me.

These are all observed at around 55C SoC temperature, so throttling is
not an issue. Regulators are stuck at 950000 uV - way above 700000 uV
that the 408 MHz OPP requires (and power readings seem to match: I'm
getting about 2.3W consumption at 408 MHz in idle vs. normal idle
reading of 1.4W at around 1 GHz).

Not sure what's going on here, and I don't remember seeing anything
similar on RK3588. Thoughts welcome.

Best regards,
Alexey

[1] https://github.com/ThomasKaiser/sbc-bench

