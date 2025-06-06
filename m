Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF3F5C5B549
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Jun 2025 08:23:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s9a3aqKy83KVXHUN2ItZ55YpPJ8j6cwV9IyFJ9G/oSo=; b=ewkJYhVyKhDKorx1Xo2+KLFRCD
	LLSQIsikuGiI1QZ/mDNzQSxnHnIezjkH9N7Kgx7JbjKHvnYCV+9KmYNCD6iSgpOh6Oy/xXFpAY1Dw
	ISmchne1904WN2HwZWGsacvBOASEO0m/tCTgsW84TOo9ZKDxna1zbFInMQWfCh1rkH+NPMFuZFuSX
	4LC2qLWqVprkGQiI6RG46EQ/42hLWw8FV6iqZ5taKm3WauCp4DqRz9chHKasHX78KZBQFu+8WeC2N
	A2RrLb6oypwTOgBXdH2veMEMvpTQo5lUYRhmV6/46ARjGiPcPpF1RHBYxyNRT+93UMcVDXD0vpHC3
	V43OoGxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNSM6-0000000HOU5-1EtA;
	Fri, 06 Jun 2025 08:23:14 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNSJu-0000000HOIA-3MYA;
	Fri, 06 Jun 2025 08:20:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=s9a3aqKy83KVXHUN2ItZ55YpPJ8j6cwV9IyFJ9G/oSo=; b=ZuOGLuINMM2lb52TpTR62Dny3i
	KVCVpu5XS3qh14Fd4tVoADvzGKog97I3VKyauy9qA2idNKEPiXb0FSvxlx7Ut4+pi5g67v4rGWeOO
	4ypWUD3Q75UwJDmWaj9Rlb9OsdCPoyE027bZCgh7ylLSorNAUksugqazL7JTd9uyTzDDJx17cLZCZ
	F0dvewxpW3z9o+av+CU4gD/c/LjfuG/fivCMs+rvbPOk08/qjJMfLZKmeLVC9bwtS1vMpO9D5Pz2U
	W8iWe5y00u8K1Cj/bisReat6296kN0jqkAvGqajsIUUM6hDJIGULenU7SOhyb/qX9EW03LRrtEzsp
	+7bUgNfA==;
Received: from i53875ad6.versanet.de ([83.135.90.214] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uNSJp-0005BS-H0; Fri, 06 Jun 2025 10:20:53 +0200
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: wens@kernel.org
Cc: quentin.schulz@cherry.de, jonas@kwiboo.se, dsimic@manjaro.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v2] arm64: dts: rockchip: add regulator-enable-ramp-delay to
 RK860-0/-2/-3 regulators
Date: Fri, 06 Jun 2025 10:20:52 +0200
Message-ID: <3115271.687JKscXgg@diego>
In-Reply-To: <CAGb2v65C0jHsD2HD_AEt+AGqMfWUUwwWV0bXw4i9Hw2tCNHZpA@mail.gmail.com>
References: <20250605185001.377055-1-heiko@sntech.de>
 <CAGb2v65C0jHsD2HD_AEt+AGqMfWUUwwWV0bXw4i9Hw2tCNHZpA@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250606_012058_859481_34478881 
X-CRM114-Status: GOOD (  31.20  )
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

Am Freitag, 6. Juni 2025, 04:17:53 Mitteleurop=C3=A4ische Sommerzeit schrie=
b Chen-Yu Tsai:
> On Fri, Jun 6, 2025 at 2:57=E2=80=AFAM Heiko Stuebner <heiko@sntech.de> w=
rote:
> >
> > The RK860-0/-1/-2/-3 regulators are used on rk3588 boards in addition to
> > the main pmic, to supply components like the big cpu-clusters and npu.
> >
> > So far nobody had a use-case for turning these off. The supplies for the
> > big cpu-clusters are on by default and those clusters normally are not
> > completely turned off during runtime.
> >
> > This changed with the new Rocket driver for the NPU, which does use
> > runtime-pm and thus does turn off and on the NPU's supply regulator as
> > needed. This regulator is also needed to run to actually turn on the
> > power-domain for the NPU.
> >
> > If the rocket driver now runtime-suspends while running a load and then
> > runtime-resumes again, hangs can be observed with messages like
> >
> >   rockchip-pm-domain fd8d8000.power-management:power-controller: failed=
 to set domain 'nputop' on, val=3D0
> >
> > A way to "fix" that issue when it happens, is to set the regulator to
> > always-on. This suggests that the power-domain is trying to get power
> > from the regulator before it is ready to deliver power.
> >
> > And in fact the datasheet for the regulator defines an "Internal soft-s=
tart
> > time" characteristic. For a target output voltage of 1.0V the _typical_
> > time to reach at least 92% of the output, is given as 260uS.
> >
> > That means the time is dependent on the target voltage (up to 1.5V for
> > the type) and also the rest of the board design.
> >
> > So add a regulator-enable-ramp-delay to all rk860-2/-3 nodes we have in
> > mainline right now. I've chosen 500uS to be on the safe side, as
> > 260uS is the "typical" value for 1.0V and sadly no max value is given
> > in the datasheet.
>=20
> Since these are characteristics of the PMIC, I wonder if it makes more
> sense to put them in the driver? At least that's what we've done with a
> similar fix for the AXP PMICs.

yeah - definitly.

After sending this v2 yesterday, I re-read Quentin's comment on v1 and
finally understood the meaning - which was the same, that the driver
might be a nicer place for default values.

So yesterday evening I did parse the datasheets of all the regulator
variants to get the relevant (and different) startup times.

Hopefully I'll get this done and sent out before lunch today :-) .

Heiko



