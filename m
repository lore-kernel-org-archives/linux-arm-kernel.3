Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB339C5B543
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Jun 2025 14:24:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bj/8ZlhYi+PUXtlyuznaF1lt7ECGXw2FzjbqurTjZWA=; b=IGJGjTkRAUmuTP4pzbdVx3Pgil
	P2iURbYK5ajsCs3rtHc1nbhm8JqCwh3W+UVmcPwn2i6zWmmEV4wPzLlFBqsZqRBHqUR/ySWTnSb6h
	ToOFDRCZyzqWru/oqBj6BSMLzIrXC4gdnVKJ1esXxnS797xFTuYoTFc80XfLRAxt/gXnprlrFzA3X
	r1jQzabz4QhSlg3r2h7Rq3MlLOVrropprMNN4bhL+mRFCwHc1llW8mESIgjBh7UHasMlHG/s6HAnu
	RszdeiEEqfzWYEFrjitltIVL7sJkrmvdXBmmTTibNMvvHRIqJtFulc1rkwvUDsFjDhTU48uB/vPvF
	qnO0ioPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOztL-000000077X2-30X7;
	Tue, 10 Jun 2025 14:23:55 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOx3I-00000006dkY-1ePJ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Jun 2025 11:22:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=bj/8ZlhYi+PUXtlyuznaF1lt7ECGXw2FzjbqurTjZWA=; b=CvnoKiZ3nraCZlyqWpMIcSDXGd
	zDzkj6GV/yiCfjfwIwbYdSsjp/+ha7T6H28erflnAiTV5R9MO0/hVaUyW5x8JpEOJ8M+DkIa/fRIO
	uumexB2u0CCrv9Udo48bza3OuDrT5HU6WoxJrnwJALtqD+i75uXoyxxNVZSgpkdf19p2IaZF1RkKP
	OSUh7Lj6DJ/xLdPYeH3grvrF6QXtpdMwDaCC1CjGGlmAvhk/W/aS5+Lwg2Zc+6wTwXmub+s5NpwFm
	POlb06b3zFZ2iAyXG8JkiW7t/eHWiVZKVBsQsFpK98ixIZ8DvOwyvl5/NRcvT9aTbvw23UBbhpHLJ
	erTJoyIw==;
Received: from i53875b1c.versanet.de ([83.135.91.28] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uOx3F-0000kG-UP; Tue, 10 Jun 2025 13:21:57 +0200
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: open list <linux-kernel@vger.kernel.org>, lkft-triage@lists.linaro.org,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Linux Regressions <regressions@lists.linux.dev>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Naresh Kamboju <naresh.kamboju@linaro.org>
Cc: Peter Robinson <pbrobinson@gmail.com>, krzk+dt@kernel.org,
 Dan Carpenter <dan.carpenter@linaro.org>,
 Andrew Morton <akpm@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>,
 Rob Herring <robh@kernel.org>
Subject: Re: next-20250610: arm64 No rule to make target rockchip
 rk3399-rockpro64-screen.dtso
Date: Tue, 10 Jun 2025 13:21:57 +0200
Message-ID: <15979303.uLZWGnKmhe@diego>
In-Reply-To: <CA+G9fYuppX5LeRjOAZWsYRCs76PVbnv-TN_RrszhDsk=KregyA@mail.gmail.com>
References: <CA+G9fYuppX5LeRjOAZWsYRCs76PVbnv-TN_RrszhDsk=KregyA@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_042200_432641_2746E1F0 
X-CRM114-Status: GOOD (  13.64  )
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

Hi Naresh,

Am Dienstag, 10. Juni 2025, 12:25:31 Mitteleurop=C3=A4ische Sommerzeit schr=
ieb Naresh Kamboju:
> Regression while building arm64 with the Linux next-20250610
> the following dtb build errors noticed.
>=20
> Regressions found on arm64 builds
> - dtb build error
>=20
> Regression Analysis:
> - New regression? Yes
> - Reproducibility? Yes
>=20
> First seen on the next-20250610
> Good: next-20250606
> Bad:  next-20250610
>=20
> Anders bisected this to,
> # first bad commit:
>   [49760b9f60528393cca3ea35c4d0719f84215a48]
>   arm64: dts: rockchip: add overlay for RockPro64 screen
>=20
> Build regression: arm64 No rule to make target rockchip
> rk3399-rockpro64-screen.dtso
>=20
> Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
>=20
> ## Build error
> *** No rule to make target
> 'arch/arm64/boot/dts/rockchip/rk3399-rockpro64-screen.dtso', needed by
> '__dtbs_install'.
>=20
> ## Source
> * Kernel version: 6.16.0-rc1
> * Git tree: https://kernel.googlesource.com/pub/scm/linux/kernel/git/next=
/linux-next.git
> * Git sha:  b27cc623e01be9de1580eaa913508b237a7a9673
> * git describe: next-20250610
> * Toolchains: gcc-8, gcc-13, clang-20
> * Config: defconfig
> * Architecture: arm64
>=20
> ## Build details
> * Build warning:
> https://storage.tuxsuite.com/public/linaro/lkft/builds/2yJ4IOQa1XxMqDgmzj=
El7VszYE9/build.log
> * Build link:  https://storage.tuxsuite.com/public/linaro/lkft/builds/2yJ=
4IOQa1XxMqDgmzjEl7VszYE9/
> * Kernel config:
> https://storage.tuxsuite.com/public/linaro/lkft/builds/2yJ4IOQa1XxMqDgmzj=
El7VszYE9/config

thanks a lot for this notification.

I'm surprised that overlay build at all when I built it yesterday.
But yeah, the dtbs_install target really broke with that change.

I've amended the commit now [0], to change dtso to dtbo and ran the
dtbs_install target sucessfully with that change.

So on the next linux-next creation, this should hopefully be gone.


Heiko

[0] https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.gi=
t/commit/?h=3Dv6.17-armsoc/dts64&id=3De14491aaa6ff598bbe9d462e44c01ac65754f=
445



>=20
> ## Steps to reproduce
>  - tuxmake --runtime podman --target-arch arm64 --toolchain gcc-13
> --kconfig defconfig
>=20
> --
> Linaro LKFT
> https://lkft.linaro.org
>=20





