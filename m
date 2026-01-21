Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE2E1C44502
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Jan 2026 09:12:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jsLSAvwVouFS1ZUYZEVJ53QymYVt0g0M3Kh3wgwwh/o=; b=ju0hwKIuFE/15prUvOgKA0yd7o
	EJicBio6Ayai7Y/hbE5nk9dU+J9996FAT5xEmLZyalIC26fA4fBHlz7m3Nmc2PGyXvUBw1JJB//su
	3iABIs4PbYw/17ylvXRfPxa6jOvSNFnh6vOlGQstvqpPGMRpIh47IBb8kA2S4AE42xWwybWC0g+Xa
	lQ7+xcBDDCiqfWwvHVioZc1nSkjwRkfkWHUrEF88C5rBfQfOFvvcS1sMW+FLLcCE3ukLrIUm9hxTK
	zca9b+7mG+XH4oK/PUFoNkC4sifcgxDDJl5Suk7k0d7ohIEuhi7f4VDTCJk8X+Dc/s+JeeR1tLrSA
	w856Xtxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viUGj-00000005A4D-2JG4;
	Wed, 21 Jan 2026 09:12:53 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viUGh-00000005A3F-29AJ;
	Wed, 21 Jan 2026 09:12:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=jsLSAvwVouFS1ZUYZEVJ53QymYVt0g0M3Kh3wgwwh/o=; b=ap/OREcpBA1KVY7huIkDAB0Tee
	qZPV0wgBw8KTyVv8BDXVVbIemBV06NbSS4DtC9lGP4DiAthwWuK0wvM69krQo713QPHHBvsRlb6KA
	9ImBmJgyaN6YvFSMmFsYgO0qd7yPqewnl3SaEPdFKc9gEKvEaYaLaeiC5BIempnslEUVp/xpVCoUS
	SbL4tI3SJq5C7IPWcb9OyjMb8JsdX/cP8sozubhm/O+sGP8EpFnEXFp4Pboo5H933aGABbSc3HRrU
	EZKH1hcb1hbYKGlsP6cfsWpev+J9QoTmCUY2Fwt9FIYxXHZqKs/W9baLStxHgQoQgh1BjBgVkeGCD
	SqYvDrmw==;
Received: from i53875baa.versanet.de ([83.135.91.170] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1viUGY-003c0W-Mj; Wed, 21 Jan 2026 10:12:43 +0100
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Luis Garcia <git@luigi311.com>
Cc: devicetree@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 Olivier Benjamin <olivier.benjamin@bootlin.com>, megi@xff.cz
Subject: Re: [PATCH 0/1] Fix imx258 variant on pinephone pro
Date: Wed, 21 Jan 2026 10:12:42 +0100
Message-ID: <50650709.fMDQidcC6G@diego>
In-Reply-To: <46730110-5713-4e7a-a593-29ad69432e03@luigi311.com>
References: <20260118214620.3319040-1-git@luigi311.com>
 <176890189889.310054.17634541522861042266.b4-ty@sntech.de>
 <46730110-5713-4e7a-a593-29ad69432e03@luigi311.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260121_011251_573553_B70F48F0 
X-CRM114-Status: GOOD (  20.52  )
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

Hi,

Am Dienstag, 20. Januar 2026, 17:33:37 Mitteleurop=C3=A4ische Normalzeit sc=
hrieb Luis Garcia:
> Thank you very much for the speedy turn around. Ohh
> interesting, here i was thinking i did the right thing with
> the reply to with the V2. Ill keep that in mind for the
> future but considering how far and few my contributions
> upstream are i hope i dont forget by then lol.

no worries. For individual patches this is mostly easy to figure out
and also recent versions of b4 handled this thread fine.

I think it's more a problem, once the thread goes deeper or multiple
patches are involved.

Heiko


> On 1/20/26 02:39, Heiko Stuebner wrote:
> > On Sun, 18 Jan 2026 14:46:19 -0700, Luis Garcia wrote:
> >> imx258 had the driver updated a while back and it introduced
> >> two variants, the imx258 and imx258-pdaf. The pinephone pro
> >> is using the pdaf variant so this switches it to the correct
> >> variant and eliminates the pdaf pixels from the sensor output
> >> resulting in a much cleaner image.
> >>
> >> Luis Garcia (1):
> >>    arm64: dts: rockchip: Fix imx258 variant on pinephone pro
> >>
> >> [...]
> > Applied, thanks!
> >
> > [1/1] arm64: dts: rockchip: Fix imx258 variant on pinephone pro
> >        commit: 6742b998166485558ccb0e89b5d5fd93c1aae3ca
> >
> > In the future, please don't send v2 patches as replies to the
> > previous version and instead start a new thread.
> >
> > Next versions as replies, does sometimes confusing tooling.
> >
> >
> > Best regards,
>=20





