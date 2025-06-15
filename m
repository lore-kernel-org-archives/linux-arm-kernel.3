Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C56B8C71135
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Jun 2025 16:02:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:
	Content-Transfer-Encoding:Cc:Date:In-Reply-To:From:Subject:Mime-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/42QMcL77lI71D+Z1SeldcA7X3YrhfS5BoiK/HqtWsg=; b=mQ+NBIB+FaXy4kOAcpjqKVL08N
	5bpKY/g0KbbjmwgEXE/FbNuutaZXg8ylHxp+3FpFf+bfSBm5aUhesGBOpeytQ9mfmztBKPAA6/NVw
	P4XWQ3Nyo2hQww87FosCM5KTGpPmh8khVMToPLsDrRPGxUT86IERZ4eirVXpol41HB3tGePEEy0iC
	PQ8NkWurrhDkzUQbZ2uE+licUugAgnzdgXowcA4q4bg7Qg6yykEZhE2pmHEhQvEzKIAF42neDlonK
	TOT+KwbOus4+mGfOr4RiMOkXMpO5AMgLULBr3Mv0oycFNNY2QDqgAzggq9vWjujJdjlcxJ5qOA+1a
	un7PHEVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQpoP-00000002deP-2IHg;
	Sun, 15 Jun 2025 16:02:25 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQpmC-00000002dVs-1XWm;
	Sun, 15 Jun 2025 16:00:10 +0000
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-ade33027bcfso587721266b.1;
        Sun, 15 Jun 2025 09:00:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750003206; x=1750608006; darn=lists.infradead.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/42QMcL77lI71D+Z1SeldcA7X3YrhfS5BoiK/HqtWsg=;
        b=WbuY9aFWRrAkr+uzSkClL7uUquBm9yr3P5Kmg3d779aAcxYFyvFoqcJPsCAVCd2P3P
         JB6NxhlUeVG11U4BqRQfQ9ZYA0Hdt4LcX0p99mURlc+fxDpoXAYcv4Z6FvvG5stpbUha
         iA9mDfCVyCHy+JIzQ+FFva/2ewlUifo3Lh4xNTV5UQt669zdicJUSzg073Brg2+xT2+u
         i2jRNFknnEL8PKMon+Uw11Bngga2zpwLjlIWpgHUq5Gx0e0/Nzm7AYdcX76Uieic1FSo
         qUwi3cKXvue537WhH7gnKXEFZbcs8tHKK8UaN+Fd9WIZ8wZdN+Oew5hKtZxK10t5xZeZ
         7/9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750003206; x=1750608006;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/42QMcL77lI71D+Z1SeldcA7X3YrhfS5BoiK/HqtWsg=;
        b=MUz84117Y+KjrvvaNJhMLzIkXJjm5+5itduQNKcdKHZGbs9AOyq2GtScV5euWbuYRA
         k50j2ZeHuSLCdxIJdKvPZEvWcQgxHLSgZJ0W98Nic8DjrfciVMBETcvRmHe3llQwSAt8
         foxTU4O2JTh8R/JUaNZjjEprNNtIn1p/3QARBogT/iMJ6X0lQfTXgr/y0rcNEc6AJ9sK
         gZK+LaMeD8TXCj5jryXA7oGCpzPB2XMx5vISYwMdXDoKtWpV1BrrDqmFONRVRKjm9GRm
         7KbGdUdSlVpsLr1tQvUdWFddmf3nEd0/6hfl05W+t8zbY5oIDpxboXFr00v4bMoWXwsQ
         twBQ==
X-Forwarded-Encrypted: i=1; AJvYcCVdG3Lu1/PpdSGDV4LYhM6gCxv238J5QIEdIld3RppEWEN3V8+ncPkHb5/F8VJ00rEP2NPOIwGZIYEU5bsclYMl@lists.infradead.org, AJvYcCWrqW1Dx1K5aEURuL7Pv5YGZqNhDTf2EWHHprIS/GZT7/pPGPTctj1ocobuctXMhhd4O5O+p3qih/XE6Lpcews=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx75+WaM4bfk4P1M84V5Cc50oXjalgZGx+Npmaj+jSjIBOqcPCA
	A0QwnJevE3jHxYFiHYV1a1B9Yuxdn/aDnz9ozGI+qy7Nfcmlo9NFYW8h27ghkA==
X-Gm-Gg: ASbGnctoDW9h8b1b688Q5NqZzXB/5UqbtmIA9CpZPGpLNiMi+WeCIcen+EsKOczyONO
	/WwR0JHT4rhM3IgpQeXen0e0gv1C2ZmAfvGHHwU1nS2rpvHhpkdOd6/smvK7RJjWSak71tGDMzc
	cShkvH7hXU21iwNf6x9rsN7X2Iy0JL4SgPVeooyp2evHgAcSI9AFobB1gkh+lkc7rsQtJbfAIEa
	iw/dlD9361R4T4RFYaQFPxn4r93O6GtfpCNr0Oot78N1imfq4q37Mmye9JswQ44+gP3DLMzQcAT
	zRyAAXkZN8K/0ZsiM7Kcw7mmSTmWmpmMM5euuUM3BeqyxViUdL9fKjNAvbbzLc6xvL59kUE01nx
	6GqeQ4NT8Eg==
X-Google-Smtp-Source: AGHT+IHpsM22I+XbsRa2AQVigP0aFeEOrTL+GwdNlPuSMf2S91xq+3A6gFHO3jgYBg2+RbyfLoc5HA==
X-Received: by 2002:a17:907:fd18:b0:add:fa4e:8a7e with SMTP id a640c23a62f3a-adfad4104cemr513285866b.32.1750003206157;
        Sun, 15 Jun 2025 09:00:06 -0700 (PDT)
Received: from smtpclient.apple ([89.66.237.154])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-adec81b8a3fsm501587166b.38.2025.06.15.09.00.05
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 15 Jun 2025 09:00:05 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.600.51.1.1\))
Subject: Re: [PATCH 1/4] arm64: dts: rockchip: list all CPU supplies on ArmSoM
 Sige5
From: Piotr Oniszczuk <piotr.oniszczuk@gmail.com>
In-Reply-To: <CABjd4Yw3FyVS0MBk2WdWKb24vkqrb09Tx3tj6B-xsmG1-Csk7w@mail.gmail.com>
Date: Sun, 15 Jun 2025 17:59:54 +0200
Cc: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Heiko Stuebner <heiko@sntech.de>,
 devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <80ACAAAE-F522-4199-9048-ADE69F6E1128@gmail.com>
References: <20250603-sige5-updates-v1-0-717e8ce4ab77@gmail.com>
 <20250603-sige5-updates-v1-1-717e8ce4ab77@gmail.com>
 <6656934.DvuYhMxLoT@workhorse>
 <CABjd4Yx05SCm+03jWbsEP-A5AuhL14wLj=+VdKyQgqMbnxi3xQ@mail.gmail.com>
 <512E950E-E8CB-443B-8E47-79F073D217E8@gmail.com>
 <CABjd4YxGQP=rH15EX12w36b7+82Dedf+rVH3v5V6gBwNv3V3iw@mail.gmail.com>
 <90218D7B-0CF5-4F5D-969A-909A44E6044F@gmail.com>
 <CABjd4Yw3FyVS0MBk2WdWKb24vkqrb09Tx3tj6B-xsmG1-Csk7w@mail.gmail.com>
To: Alexey Charkov <alchark@gmail.com>
X-Mailer: Apple Mail (2.3826.600.51.1.1)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250615_090008_407361_EA49CD82 
X-CRM114-Status: GOOD (  18.18  )
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



> Wiadomo=C5=9B=C4=87 napisana przez Alexey Charkov <alchark@gmail.com> =
w dniu 9 cze 2025, o godz. 16:05:
>=20
> On Sun, Jun 8, 2025 at 11:24=E2=80=AFAM Piotr Oniszczuk
> <piotr.oniszczuk@gmail.com> wrote:
>>> Wiadomo=C5=9B=C4=87 napisana przez Alexey Charkov =
<alchark@gmail.com> w dniu 5 cze 2025, o godz. 15:42:
>>>> Alexey,
>>>> I see you are using rk3576 board like me (nanopi-m5)
>>>> Have you on your board correctly working cpu dvfs?
>>>> I mean: [1][desired clocks reported by kernel sysfs are in pair =
with [2[]cur clocks?
>>>> In my case i see mine cpu lives totally on it=E2=80=99s own with =
dvfs:
>>>=20
>>> Hi Piotr,
>>>=20
>>> I haven't tried to validate actual running frequencies vs. requested
>>> frequencies, but subjective performance and power consumption seem =
to
>>> be in line with what I expect.
>>=20
>> well - my subjective l&f is that  - currently - my rk3576 seems =
=E2=80=9Eslower" than i.e. 4xA53 h618.
>=20
> In my experience, native compilation of GCC 14 using 8 threads on
> RK3576 (mainline with passive cooling and throttling enabled): 2 hours
> 6 minutes, on RK3588 (mainline with passive cooling via Radxa Rock 5B
> case and throttling enabled but never kicking in): 1 hour 10 minutes

by curiosity i looked randomly on 3576 vs 3588:
multithread passmark: 3675 =
(https://www.cpubenchmark.net/cpu.php?cpu=3DRockchip+RK3576&id=3D6213)
multithread passmark: 4530 =
(https://www.cpubenchmark.net/cpu.php?cpu=3DRockchip+RK3588&id=3D4906)

assuming 3588 as baseline, 3576 is approx 20% slower on multithread =
passmark (has ~0,8 comp power of 3588)
70 min compile on 3588 should take something like ~86min on 3576.
In your case 126min compile on 3576 shows 3576 offers 0,55 comp power of =
3588.
Roughly 3576 should do this task in 40min less than you currently see i =
think
=20

> Can't see how u-boot would affect CPU speed in Linux, as long as you
> use comparable ATF images. Do you use the same kernel and dtb in all
> these cases? Also, what's your thermal setup?

yes. in all cases only change was: uboot & atf
thermal is based on recent collabora series (+ recent pooling fix for =
clocks return from throttling)=20

>=20
>=20
> Not sure UX is a particularly good measure of CPU performance, as long
> as you've got a properly accelerated DRM graphics pipeline. More
> likely 2D/3D and memory.

indeed.
For quantified look i=E2=80=99m looking on v.simple approach to estimate =
real clock is http://uob-hpc.github.io/2017/11/22/arm-clock-freq.html
by curiosity i looked what it reports on a53/a55/a72/a76 and it is =
surprisingly accurate :-)
on mine 3576 with collabora uboot+mainline atf is hows 800MHz (and in =
perf. gov it seems to be constant)

>=20
> There might be some difference in how PVTPLL behaves on RK3576 vs.
> RK3588. But frankly first I would check if you are using comparable
> ATF implementations (e.g. upstream TF-A in both cases), kernels and
> thermal environment :)
=20
all tests: the same 6.15.2 mainline + some collabora patches

diffs were:=20
1.collabora uboot[1] + mainline atf 2.13
2.collabora uboot[1] + rockchip rkbin bl31 blob
3.vendor uboot (bin dump from friendlyelec ubuntu image)  =20

on 1/2 i see kind of issue with clock values (i.e. perf gov gives =
constant 800MHz on mainline atf).
3 seems to perform better - (i.e. perf gov gives constant 1500MHz so all =
is snappier/faster)=20

as pvtpll is trying to reach target freq and ends with stable oper. freq =
for given cpu_vdd/temp/fab.cut - possible theory is: if cpu_vdd is =
wrongly driven, pvtpll programmed freq will way diff from req. (i.e. way =
too low).
monitoring vdd_big/vdd_lit shows constant 950mv for perf.gov (read from =
sysfs; not verified with multimeter as i don=E2=80=99t have pcb pdf with =
components layout so can=E2=80=99t identify i.e. vdd_big filtering caps =
c1007/c1008 to measure)

(.dxf file provided by friendlyelec [1] seems to be lacking comp. =
numbering) =20

[1]: =
https://wiki.friendlyelec.com/wiki/images/e/e1/NanoPi_M5_2411_DXF.zip


