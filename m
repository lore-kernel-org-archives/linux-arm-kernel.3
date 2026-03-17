Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95AA1F33834
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 10:02:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kVSAKNPWFaVjAvCtb6poHFlHo32MFz9vQGa3WsfvRMM=; b=WEyDu+oMFq5YfIoR5WYS/AHx6C
	G9q3PXjAPKM0h5gLdYJpn+MdDTqsk6kBJPu/3rCpxIGx5f4mW009pDXsSq5moFeKU1Pog0rW+4LuK
	i00ohUpkMlTuje3GFM3w9lVVsN8R75sn5gsW+U2cdEtsgZyuEfz9Iw9MBTJuu+amSU/+JQqYeY5F6
	VSCutM/LKb//U1osrVsLeE2Ja16bqW52FOYaDIoXGObaoRAWakd0P5yTsGrWFzOdHrB2k62xAIzQZ
	lbNUzMvKfXNK5TtbQNMiLiU1DKtNsKmh9hJpYrnK8QVqzfY7xYEvPMIjxUG+n88K9+zi3KEsEN7kd
	G0yrhUXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2RGJ-00000005whr-0PL1;
	Tue, 17 Mar 2026 10:02:55 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2RGC-00000005wgj-3bAm;
	Tue, 17 Mar 2026 10:02:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=kVSAKNPWFaVjAvCtb6poHFlHo32MFz9vQGa3WsfvRMM=; b=LgP3QfHfOOYMNSRMLjnLoFRFAa
	ZCDb16yFn4AYA3tDWxE0CFUeDIiFC4NxMxix+jDDlDzm7goSZaEg7muiykq02mgzgm/4pctchpZ75
	MQ6AOfUMGYpw1H6U8uc1tfbMBWxRehX6wF88fh7EWDORMFBrzFlzQI/L6uGneN8v5nELhdGDPTm2I
	H5XtgeA+5+V5EukXV+sRWIOsH+Ey0+MiC0QYhtL3wrlq2PBNKsECLGszqHmyW/hSDtteNeYMI1QAW
	/M+Lp7uqYobYf6/Rq1/wWqxfcpZ7yU5BPA2djnbJh/+KMCY09AXRR3g+p4ENQIdyaBNT68CbUlWeu
	+/gjaZmw==;
From: Heiko Stuebner <heiko@sntech.de>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: arm@kernel.org, soc@kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [GIT PULL] Rockchip dts fixes for 7.0 #1
Date: Tue, 17 Mar 2026 11:02:46 +0100
Message-ID: <3682281.iIbC2pHGDl@phil>
In-Reply-To: <aa9d42ad-c480-4fc8-b8be-1a0c505b4293@kernel.org>
References: <5055064.GXAFRqVoOG@phil> <10817796.nUPlyArG6x@phil>
 <aa9d42ad-c480-4fc8-b8be-1a0c505b4293@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_030248_922229_11DD5EAA 
X-CRM114-Status: GOOD (  24.83  )
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

Am Dienstag, 17. M=C3=A4rz 2026, 10:19:29 Mitteleurop=C3=A4ische Normalzeit=
 schrieb Krzysztof Kozlowski:
> On 17/03/2026 10:05, Heiko Stuebner wrote:
> > Am Dienstag, 17. M=C3=A4rz 2026, 09:45:30 Mitteleurop=C3=A4ische Normal=
zeit schrieb Krzysztof Kozlowski:
> >> On Sat, Mar 14, 2026 at 07:42:38PM +0100, Heiko Stuebner wrote:
> >>> Hi SoC maintainers,
> >>>
> >>> please find a below some Rockchip fixes for the current 7.0 release-c=
ycle.
> >>> And in the next PR, even one driver-fix this time.
> >>>
> >>> Please pull
> >>>
> >>> Thanks
> >>> Heiko
> >>>
> >>>
> >>> The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5=
b5f27f:
> >>>
> >>>   Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)
> >>>
> >>> are available in the Git repository at:
> >>>
> >>>   https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchi=
p.git tags/v7.0-rockchip-dtsfixes1
> >>>
> >>> for you to fetch changes up to 2ed11ad1c2b4c191cb2ed6741be127eb99f863=
4f:
> >>>
> >>>   arm64: dts: rockchip: Correct Joystick Axes on Gameforce Ace (2026-=
03-12 20:52:53 +0100)
> >>>
> >>> ----------------------------------------------------------------
> >>> A big number of changes fixing dt-schema issues on the ARM32 side,
> >>> fixes for the Gameforce-Ace to make the hardware work properly
> >>> (including thermals) as well as fixing issues both on Beelink A1 (spd=
if)
> >>> and Pinebook Pro (Wifi) by reverting the commits that created the iss=
ues
> >>>
> >>> ----------------------------------------------------------------
> >>> Chris Morgan (2):
> >>>       arm64: dts: rockchip: Correct Fan Supply for Gameforce Ace
> >>>       arm64: dts: rockchip: Correct Joystick Axes on Gameforce Ace
> >>>
> >>> Fabio Estevam (11):
> >>>       ARM: dts: rockchip: Remove rockchip,grf from rk3288 tsadc
> >>>       ARM: dts: rockchip: Move PHY reset to ethernet-phy node on rk30=
36 boards
> >>>       ARM: dts: rockchip: Fix RTC compatible on rk3288-phycore-rdk
> >>>       ARM: dts: rockchip: Use mount-matrix on rk3188-bqedison2qc
> >>>       ARM: dts: rockchip: Remove invalid regulator-property from rk32=
88-veyron
> >>
> >> Not a fix.
> >>
> >>>       ARM: dts: rockchip: Fix the Bluetooth node name on rk3288-veyron
> >>
> >> Not a fix. This is a pure style change. Fixes for current cycle means
> >> either important issues being fixed or errors introduced in current
> >> cycle.
> >>
> >> Changing style from one to another is not a fix.
> >>
> >>>       ARM: dts: rockchip: Fix the trackpad supply on rk3288-veyron-je=
rry
> >>>       ARM: dts: rockchip: Add missing the touchscreen interrupt on rk=
3288-phycore-rdk
> >>>       ARM: dts: rockchip: Fix RTC description on rk3288-firefly-reload
> >>
> >> Not a fix. Style of node name is not a bug, otherwise describe user
> >> visible (not "internal tools" visible) impact.
> >>
> >>>       ARM: dts: rockchip: Fix GMAC description n RK3288 boards
> >>>       ARM: dts: rockchip: Fix LED node names on rk3288-phycore-rdk
> >>
> >> Several other are questionable as well, since they were in DTS for long
> >> time. Please also read Linus' explanation here from some time ago - if
> >> the issue is for long time and no one cared, then changing it is a nor=
mal
> >> development.
> >>
> >> Several changed pieces here look like 3 or more years old, so does not
> >> fit criteria of current cycle fix at all.
> >>
> >> Please split the pull.
> >=20
> > I do remember in the past, changes that reduced the number of
> > dt-checker errors were considered fixes, but it seems that has
> > changed, so I'll split that accordingly.
>=20
> It is subjective and of course dtbs_check fix for issue introduced in
> current cycle is a RC-fix. I am pretty sure that many maintainers would
> pull all above to RC, but I follow a bit stricter interpretation just
> like Linus explained it:
>=20
> https://lore.kernel.org/lkml/CA+55aFyvW38WU93CqegHiKt-ReO8yNfAOUGZRFGY3-A=
q0UsETw@mail.gmail.com/
>=20
> https://lore.kernel.org/all/CAHk-%3DwgFuoHpMk_Z_R3qMXVDgq0N1592%2BbABkyGj=
wwSL4zBtHA@mail.gmail.com/
>=20
> So the issues were there probably for many years and fixes do not have
> user-visible impact, thus they look like regular improvement of poor
> code. Just like I evaluated dtbs_check findings in 2024 - 50% of
> warnings are style.


Thanks for the explanation. As I said, I'll adapt the PR accordingly :-) .

Heiko



