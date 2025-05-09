Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03083C3ABCB
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 May 2025 20:15:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b08n98Unj3RXD1x5xIwGhemBZssytc919TmwiiYZy+s=; b=2HyFwjSsmuGpJHiS2Px42MqlgH
	7it3JUAt7EB7z+oMwvYF2LmGt3/k2SkjB8icva1GFvPw1sORLbG70Lgm9CIFR2b5Sx3dvs/OQM56H
	CLLEhdyXN9uu4b8piJ+HzTR8Yec/VQ6KfMnx+MhLqbU+jIeJj8AR6c4LLAc0NC5m8y0dgicX75pp4
	yWehbHtR8GdqqnHOdg1VQ8N/ihxmeHj8ZOH6OocUlYrMlo54KAoHtbuiG4p34FpHBFV5Y86E0L1Qr
	thzn9Y6EcNtUXETVS3R1FW+sLRPCWB46VotaXCHQLuCBZoqrN94cBbjLH7Y0ahq9yZTELlBwrSC+k
	ttSN48OQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDU86-00000004jPA-1K3Q;
	Fri, 09 May 2025 20:15:34 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDPOu-000000042qM-13bw;
	Fri, 09 May 2025 15:12:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=b08n98Unj3RXD1x5xIwGhemBZssytc919TmwiiYZy+s=; b=Xrnt6M6Za2VeS267+y4ojCxHxr
	py/RBMo7NCKATjxxO1eXfWb94Kpe/E1n04rJA2Hs1riZZxCKRs/9SNSMMwwoX5yaxBu+TXZb2mSTH
	sXn13t/GOhZ7shQSdeodBbM6xf6wbNlOm5xzj8s6YtE6AXn34OMO87iavQoF/467zcoSFbJTib3oE
	LMbhHpUGNY/ezfXd7uD5KB/SsGM7QzRGkTwLAJeXVs2z/3vsoMXmDxP6iaSd+Vk0oqNV/faZo0lsP
	70RQllGYrQIyTVFqHm5bLHssTK7NSe+W+P4isdalSXoU40PPseF7S0DiFHu3hzU/ilXG9lIS53EcD
	FcEaycog==;
Received: from i53875a1d.versanet.de ([83.135.90.29] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uDPOh-0007hm-QA; Fri, 09 May 2025 17:12:23 +0200
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Sebastian Reichel <sebastian.reichel@collabora.com>,
 "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, kernel@collabora.com,
 FUKAUMI Naoki <naoki@radxa.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: Re: [PATCH v2 0/5] arm64: dts: rockchip: add ROCK 5B+ support
Date: Fri, 09 May 2025 17:12:22 +0200
Message-ID: <1893373.atdPhlSkOF@diego>
In-Reply-To: <174679985287.3369051.14227124355079340433.robh@kernel.org>
References: <20250508-rock5bp-for-upstream-v2-0-677033cc1ac2@kernel.org>
 <174679985287.3369051.14227124355079340433.robh@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_081236_310871_A7050777 
X-CRM114-Status: GOOD (  29.61  )
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

Am Freitag, 9. Mai 2025, 16:17:02 Mitteleurop=C3=A4ische Sommerzeit schrieb=
 Rob Herring (Arm):
>=20
> On Thu, 08 May 2025 19:48:49 +0200, Sebastian Reichel wrote:
> > This series adds support for the ROCK 5B+, which (as the name suggests)
> > is an improved version of the ROCK 5B. It also adds initial USB-C
> > support for both the ROCK 5B and the 5B+.
> >=20
> > Changes in PATCHv2:
> >  - Link to v1: https://lore.kernel.org/r/20250324-rock5bp-for-upstream-=
v1-0-6217edf15b19@kernel.org
> >  - Replaced DT binding patch with the version from NAOKI
> >  - Dropped unused pinctrl for vcc5v0_host_en from the shared DT
> >  - Moved USB-C SBU DC pins to board specific files, since they differ
> >    between Rock 5B and Rock 5B+
> >  - Added pinmux for SBU DC pins
> >  - Rebased to latest version of Heiko's for-next branch
> >  - Disable USB-C on Rock 5B for now
> >=20
> > Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> > ---
> > FUKAUMI Naoki (1):
> >       dt-bindings: arm: rockchip: Add Radxa ROCK 5B+
> >=20
> > Sebastian Reichel (4):
> >       arm64: dts: rockchip: move rock 5b to include file
> >       arm64: dts: rockchip: move rock 5b to include file
> >       arm64: dts: rockchip: add Rock 5B+
> >       arm64: dts: rockchip: add USB-C support for ROCK 5B+
> >=20
> >  .../devicetree/bindings/arm/rockchip.yaml          |    5 +
> >  arch/arm64/boot/dts/rockchip/Makefile              |    1 +
> >  .../boot/dts/rockchip/rk3588-rock-5b-plus.dts      |  129 +++
> >  arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dts    |  970 +-----------=
=2D-----
> >  arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dtsi   | 1082 ++++++++++++=
++++++++
> >  5 files changed, 1247 insertions(+), 940 deletions(-)
> > ---
> > base-commit: b7caeb9545db25649eda36ce593b70cc2aa804ab
> > change-id: 20250324-rock5bp-for-upstream-fd85b00b593b
> >=20
> > Best regards,
> > --
> > Sebastian Reichel <sre@kernel.org>
> >=20
> >=20
> >=20
>=20
>=20
> My bot found new DTB warnings on the .dts files added or changed in this
> series.
>=20
> Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
> are fixed by another series. Ultimately, it is up to the platform
> maintainer whether these warnings are acceptable or not. No need to reply
> unless the platform maintainer has comments.
>=20
> If you already ran DT checks and didn't see these error(s), then
> make sure dt-schema is up to date:
>=20
>   pip3 install dtschema --upgrade
>=20
>=20
> This patch series was applied (using b4) to base:
>  Base: base-commit b7caeb9545db25649eda36ce593b70cc2aa804ab not known, ig=
noring
>  Base: attempting to guess base-commit...
>  Base: tags/v6.15-rc1-40-g425af91c5802 (best guess, 2/3 blobs matched)
>=20
> If this is not the correct base, please add 'base-commit' tag
> (or use b4 which does this automatically)
>=20
> New warnings running 'make CHECK_DTBS=3Dy for arch/arm64/boot/dts/rockchi=
p/' for 20250508-rock5bp-for-upstream-v2-0-677033cc1ac2@kernel.org:
>=20
> arch/arm64/boot/dts/rockchip/rk3588-rock-5b-plus.dtb: /edp@fdec0000: fail=
ed to match any schema with compatible: ['rockchip,rk3588-edp']
> arch/arm64/boot/dts/rockchip/rk3588-rock-5b-plus.dtb: /edp@fded0000: fail=
ed to match any schema with compatible: ['rockchip,rk3588-edp']

This should be already fixed by the rk3588-edp addition in linux-next:
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/=
?id=3Df855146263b14abadd8d5bd0e280e54fbab3bd18



