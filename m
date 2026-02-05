Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D91FECD9A8
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Feb 2026 21:29:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/wAd/239BwDVBbEy2HHvjF0Km3ZlDxZOWPwFteBhOuE=; b=GohZIKYqx/PukVdfTSqBwy+50b
	RE0vfzyaECtsajnRlT2praG4trwjflFQf1+PQys0jeEt3wAUv5/k3oPdz1w5fEpfYUgz6tS7bhHUL
	ZW1ZL6Kya2dxGrPC5S+UyqFqiWFgXFGDaH5OlOn3FMUrJBTyXCe3xUHbPtLfbffda3sOZoQBY1HcN
	ZOo3c7huPVEf81nVGJmvNd1+GPqsanmzDPvIGmvRWGSKrtBG1rju7z2xbBtNJGX3ojxR6MIjJvv0J
	fQx2qpd6JcUSeKuadaRC894WzMA3+Oxpy61Wbce8VMCMUmsud8WSihzDOZMiMg4TVHPXQVdSEjedT
	pUTr4nmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vo6ui-0000000AWRs-2vT1;
	Thu, 05 Feb 2026 21:29:24 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vo6ug-0000000AWRL-0Wqp;
	Thu, 05 Feb 2026 21:29:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=/wAd/239BwDVBbEy2HHvjF0Km3ZlDxZOWPwFteBhOuE=; b=suuyb0UsFejPSRDPi5rxp2bKPI
	rpW0rci/ZvUv4j/jWRBHeZqaHtsC6oauLVU5ABig/dwhqV4Xk1bfUJVqmDyYD/fZt+k0FO6HKiLZr
	dB9IS1p0U6oIiZapDFIbz3YNq2pX7UEz7c08nnjmLZqq7lWxDXoTO6C4hK5xza0ASefeqOmwfqWKv
	a1oDjFVVrRcVt+kj/jRtyBwOUZwVB9bFD1IPNfSSPCG7T2WlIIGnRLfpx9KRQkM6GNHi28ZTSZlbF
	nQG+DDnNdmDNhG9sPCQj2nN+sPMowTvYqf/kD5one1iyWypE8FkXooe590j1lXwWbmwHQJhFVz0+n
	hVwVgPHw==;
Received: from i53875afe.versanet.de ([83.135.90.254] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1vo6ua-007GOA-5m; Thu, 05 Feb 2026 22:29:16 +0100
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Willy Tarreau <w@1wt.eu>
Cc: Kever Yang <kever.yang@rock-chips.com>,
 linux-rockchip@lists.infradead.org, Finley Xiao <finley.xiao@rock-chips.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Srinivas Kandagatla <srini@kernel.org>
Subject: Re: [PATCH v3 3/3] nvmem: rockchip-otp: Add support for rk3562
Date: Thu, 05 Feb 2026 22:29:15 +0100
Message-ID: <4412828.687JKscXgg@diego>
In-Reply-To: <aYS5ATObatoDnKFs@1wt.eu>
References: <20250415103203.82972-1-kever.yang@rock-chips.com> <3080333.vCJZsxu672@diego>
 <aYS5ATObatoDnKFs@1wt.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260205_132922_168638_3757EE9A 
X-CRM114-Status: GOOD (  22.68  )
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

Hi Willy,

Am Donnerstag, 5. Februar 2026, 16:36:33 Mitteleurop=C3=A4ische Normalzeit =
schrieb Willy Tarreau:
> On Thu, Feb 05, 2026 at 01:50:34PM +0100, Heiko St=C3=BCbner wrote:
> > Am Montag, 28. Juli 2025, 21:01:54 Mitteleurop=C3=A4ische Normalzeit sc=
hrieb Willy Tarreau:
> > > On Tue, Apr 15, 2025 at 06:32:03PM +0800, Kever Yang wrote:
> > > > From: Finley Xiao <finley.xiao@rock-chips.com>
> > > >=20
> > > > This adds the necessary data for handling otp on the rk3562.
> > > >=20
> > > > Signed-off-by: Finley Xiao <finley.xiao@rock-chips.com>
> > > > Signed-off-by: Kever Yang <kever.yang@rock-chips.com>
> > >=20
> > > Successfully tested with Jonas' patches on top of it on my
> > > Radxa E20C (RK3528):
> > >=20
> > > Tested-by: Willy Tarreau <w@1wt.eu>
> >=20
> > as you replied to the rk3562 variant, does that mean the rk3528
> > uses the same variant data?

[...]

> It's very possible that I visually mistook one for the other when
> responding to the series, and if so, I'm really sorry about that!

Really, no worries ... it just confused me a bit, while I was
resurrecting the whole thing :-)

[...]

> I have one extra E20C that's not yet in prod if you're interested in
> me running some specific tests. It will not happen quickly but just let
> me know if I can help, as it's a nice little machine.

With Jonas' blessing I added his patches for the RK3528 and send
the driver thing rebased onto a recent kernel just now [0] with you
in Cc.

I've also send in the corresponding DTS patches for all 3 [1], again
with you in Cc :-) .

So if you can give them a spin on your RK3528 board, that would be great.
Because I need to find my RK3528 board first :-) .


Thanks a lot
Heiko


[0] https://lore.kernel.org/linux-rockchip/20260205211901.490181-1-heiko@sn=
tech.de/T/#t
[1] https://lore.kernel.org/linux-rockchip/20260205212347.490636-1-heiko@sn=
tech.de/T/#t



