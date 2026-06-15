Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5664FCD98DE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Jun 2026 13:02:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tPjmqX9SMTeCykCfytbi1fpwWJ22FWgRgMVFy1mXudo=; b=4uHDkO1Ky47j1TNmt5glfOaStq
	vjHniVJp/yb2DmpSS5bEOL5dkZPY/VopBJb0D7Jn/dxa98oUacrG/+MrhmWAF+93beLxTDqn81ior
	D1Ii3Ax4A18AFiXQ1l6k+8M3HfGbwTME1jz1TuUsT4LccbFSV45E5ST+/Omw0y28HOtxZg8HKiyh0
	omAwiHdo1YHjvbcGP4d6xKseA60TJcWT4QKaJlURdKOKx8769+JqloDR+rejlFnRWvyAaHU3m+5r7
	yQMIIHd44mYisvd1pl7n9HzJZbVgTYvmDrrP62lzrCkOf82mT5iWoVabXXLzJemTJ5yFwN8043PEg
	/2JdVPoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ6wz-0000000EFpQ-2zqv;
	Mon, 15 Jun 2026 13:02:01 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ6ww-0000000EFoY-0u4c;
	Mon, 15 Jun 2026 13:01:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=tPjmqX9SMTeCykCfytbi1fpwWJ22FWgRgMVFy1mXudo=; b=WpbqWBWvTzXryDqoZIBXExPhvv
	kC4TAdAZPOGy3MWoEl9R/ridFn0Caqhgf6h44LSmRNpCoDSTrqd9CL6EsZC6lxZgUJlTXiJWw3xFl
	+95E2b7+/FYv6Ncrs9pgKL1jpnGUbQJX1FCdxKgV2sq9g+GMdGSdK1wK2KsDmd2zaN1MtTobwxuOi
	kiMyjzV7srbexEZXMXzTEvwGJbilvUhVCUWQGKRl8YCxFvNXODPowabXfP3XLL+St6/i332uPzH5A
	bnQ2u2XKMLvfGXUDYnI4O+ZconYoCd+homOJwc3DXlEcZN7dVqdjWJQoOmoWi2MVv6u/JvyvT7Yzz
	AVSBdotg==;
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 Damon Ding <damon.ding@rock-chips.com>
Cc: sebastian.reichel@collabora.com, nicolas.frattaroli@collabora.com,
 alchark@gmail.com, detlev.casanova@collabora.com,
 cristian.ciocaltea@collabora.com, michael.riesch@collabora.com,
 andy.yan@rock-chips.com, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v11 0/3] Add eDP support for RK3576
Date: Mon, 15 Jun 2026 15:01:38 +0200
Message-ID: <3213683.CbtlEUcBR6@diego>
In-Reply-To: <cd1f968a-2e1b-434f-a331-a60cd8740032@rock-chips.com>
References: <20260605022305.3058853-1-damon.ding@rock-chips.com>
 <cd1f968a-2e1b-434f-a331-a60cd8740032@rock-chips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260615_060158_307740_8AFF5FBE 
X-CRM114-Status: GOOD (  20.48  )
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

Hi Damon,

Am Montag, 15. Juni 2026, 14:33:03 Mitteleurop=C3=A4ische Sommerzeit schrie=
b Damon Ding:
> Gentle ping on this patch series.

Linux 7.1 was released yesterday, so we're in the merge-window now.
(And the 5th of june was shortly before -rc7, so too late for 7.2)

So I'll pick those up after the merge window end in 2 weeks.


Heiko

>=20
> Best regards,
> Damon
>=20
> On 6/5/2026 10:23 AM, Damon Ding wrote:
> > Picked from:
> > https://lore.kernel.org/all/20260601065100.1103873-1-damon.ding@rock-ch=
ips.com/
> >=20
> > Patch 1-2 are to add missing clock "hclk" for RK3588 eDP nodes.
> > Patch 3 is to add the RK3576 eDP node.
> >=20
> > Damon Ding (3):
> >    arm64: dts: rockchip: Add missing hclk for RK3588 eDP0
> >    arm64: dts: rockchip: Add missing hclk for RK3588 eDP1
> >    arm64: dts: rockchip: Add eDP node for RK3576
> >=20
> >   arch/arm64/boot/dts/rockchip/rk3576.dtsi      | 28 +++++++++++++++++++
> >   arch/arm64/boot/dts/rockchip/rk3588-base.dtsi |  4 +--
> >   .../arm64/boot/dts/rockchip/rk3588-extra.dtsi |  4 +--
> >   3 files changed, 32 insertions(+), 4 deletions(-)
> >=20
> > ---
> >=20
> > Changes in v2:
> > - Split out separate patches to add the "hclk" clock reference.
> > - Split out separate patches to enable the "hclk" clock.
> > - Add Reviewed-by tag.
> >=20
> > Changes in v3:
> > - Add a patch to expand descriptions for clocks of the eDP node.
> > - Add Reviewed-by tag.
> >=20
> > Changes in v4:
> > - Modify commit msg.
> >=20
> > Changes in v5:
> > - Enforce the correct third clock name on a per-compatible basis.
> > - Modify the commit msg simultaneously.
> > - Add Acked-by tag.
> >=20
> > Changes in v6:
> > - Expand more detail commit msg about using hclk instead of grf clock.
> >=20
> > Changes in v7:
> > - List all valid clock names at the top level, and constrain the clock
> >    count for each platform with minItems/maxItems in allOf.
> >=20
> > Changes in v8:
> > - Fix indentation to 10 for enum in clock-names property.
> >=20
> > Changes in v9:
> > - Restore the explicit clock-names for RK3399 and RK3588 eDP dt-binding=
s.
> >=20
> > Changes in v10:
> > - Use automatic cleanup to fix OF node reference leak reported by
> >    Sashiko.
> >=20
> > Changes in v11:
> > - Pick and rebase DT related patches.
> >=20
>=20
>=20





