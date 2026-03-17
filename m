Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C657FF3381F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 09:05:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7BAE8LjeF83jHd4SQwSadRgJd4yWJH8g5djeZ7lRo2k=; b=Som2x4epkEnxvdcxea2gno+i29
	mUsbNlWJLQ4eXRDjxd+uMBT0eUHSMlPxuA80KLLhmoveZfMFNHvAx8ihUOelhHvU/xeb2rWTsSbw8
	kAJ6JAASwxcHsNRRE22/uUJi2K9umj9pJCcvqnZh0fewvZclJ/enHFaX3MOV9W4U6NTZb2Vf3TvGQ
	gFdbG7fzKDpJgamJ2GKkI7GMOGflHNM6XtwKJxqq6w6rwG+j8zVFe+r9I418MhHnn5FauUNyLTW+2
	ETqFmY20QxTKP1k0aetX+Jv+98K9UddOi51fIKQ8Zq7qf8zfbTs1/gIkTtRSdWEVi6zRMJ07j9tSS
	rjVINlMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2QN5-00000005mv0-3LQr;
	Tue, 17 Mar 2026 09:05:51 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2QN0-00000005muA-1FM6;
	Tue, 17 Mar 2026 09:05:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=7BAE8LjeF83jHd4SQwSadRgJd4yWJH8g5djeZ7lRo2k=; b=jdfOhEaoB2ew3o9mowKIzPE6yH
	amCO8fSi7sAl98aq+9/WYxoYuuyTuptV7QUEupijM3S6G5CnXIvTY0CZJHE0+h5weDoto2lZKK1YF
	3VIbKT4tgYShg+prxHVl1c/cdPU6xIa/WqkUQ/Fh+noU8C2AcFbBphPToLJQAKQYJMEMoPuc4XewN
	DtDIQsYbxRrkidOvBWMwz3fD5tg4ztGFAzanyucsboQZ/iAHAYJp81quKyyXaSwQ016oF0Qa8cSCw
	jfRVxDcik+T4xzaKGYru2KG63pAHCCAxPPNhX+TcMbgBcGlpeFk3G3825dCU8pFHO47Q8CjMYeHis
	JOopmjuA==;
From: Heiko Stuebner <heiko@sntech.de>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: arm@kernel.org, soc@kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [GIT PULL] Rockchip dts fixes for 7.0 #1
Date: Tue, 17 Mar 2026 10:05:39 +0100
Message-ID: <10817796.nUPlyArG6x@phil>
In-Reply-To: <20260317-clever-flat-wolverine-313a4c@quoll>
References: <5055064.GXAFRqVoOG@phil> <20260317-clever-flat-wolverine-313a4c@quoll>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_020546_399046_A60727F3 
X-CRM114-Status: GOOD (  23.57  )
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

Am Dienstag, 17. M=C3=A4rz 2026, 09:45:30 Mitteleurop=C3=A4ische Normalzeit=
 schrieb Krzysztof Kozlowski:
> On Sat, Mar 14, 2026 at 07:42:38PM +0100, Heiko Stuebner wrote:
> > Hi SoC maintainers,
> >=20
> > please find a below some Rockchip fixes for the current 7.0 release-cyc=
le.
> > And in the next PR, even one driver-fix this time.
> >=20
> > Please pull
> >=20
> > Thanks
> > Heiko
> >=20
> >=20
> > The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5=
f27f:
> >=20
> >   Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)
> >=20
> > are available in the Git repository at:
> >=20
> >   https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.=
git tags/v7.0-rockchip-dtsfixes1
> >=20
> > for you to fetch changes up to 2ed11ad1c2b4c191cb2ed6741be127eb99f8634f:
> >=20
> >   arm64: dts: rockchip: Correct Joystick Axes on Gameforce Ace (2026-03=
=2D12 20:52:53 +0100)
> >=20
> > ----------------------------------------------------------------
> > A big number of changes fixing dt-schema issues on the ARM32 side,
> > fixes for the Gameforce-Ace to make the hardware work properly
> > (including thermals) as well as fixing issues both on Beelink A1 (spdif)
> > and Pinebook Pro (Wifi) by reverting the commits that created the issues
> >=20
> > ----------------------------------------------------------------
> > Chris Morgan (2):
> >       arm64: dts: rockchip: Correct Fan Supply for Gameforce Ace
> >       arm64: dts: rockchip: Correct Joystick Axes on Gameforce Ace
> >=20
> > Fabio Estevam (11):
> >       ARM: dts: rockchip: Remove rockchip,grf from rk3288 tsadc
> >       ARM: dts: rockchip: Move PHY reset to ethernet-phy node on rk3036=
 boards
> >       ARM: dts: rockchip: Fix RTC compatible on rk3288-phycore-rdk
> >       ARM: dts: rockchip: Use mount-matrix on rk3188-bqedison2qc
> >       ARM: dts: rockchip: Remove invalid regulator-property from rk3288=
=2Dveyron
>=20
> Not a fix.
>=20
> >       ARM: dts: rockchip: Fix the Bluetooth node name on rk3288-veyron
>=20
> Not a fix. This is a pure style change. Fixes for current cycle means
> either important issues being fixed or errors introduced in current
> cycle.
>=20
> Changing style from one to another is not a fix.
>=20
> >       ARM: dts: rockchip: Fix the trackpad supply on rk3288-veyron-jerry
> >       ARM: dts: rockchip: Add missing the touchscreen interrupt on rk32=
88-phycore-rdk
> >       ARM: dts: rockchip: Fix RTC description on rk3288-firefly-reload
>=20
> Not a fix. Style of node name is not a bug, otherwise describe user
> visible (not "internal tools" visible) impact.
>=20
> >       ARM: dts: rockchip: Fix GMAC description n RK3288 boards
> >       ARM: dts: rockchip: Fix LED node names on rk3288-phycore-rdk
>=20
> Several other are questionable as well, since they were in DTS for long
> time. Please also read Linus' explanation here from some time ago - if
> the issue is for long time and no one cared, then changing it is a normal
> development.
>=20
> Several changed pieces here look like 3 or more years old, so does not
> fit criteria of current cycle fix at all.
>=20
> Please split the pull.

I do remember in the past, changes that reduced the number of
dt-checker errors were considered fixes, but it seems that has
changed, so I'll split that accordingly.


Heiko




