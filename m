Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10DB7C79FB9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 13:35:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=9mkwdnQVR1s008Ew+lynOpuL8qm56jSllUtcf0uVtmg=; b=lFGeqlS4QL1zwX
	u5kloIsNwzkK7L/El4z0ria4YY4ShRcIJm9cd45jt0Ja5SQQ30zBqFZFBoceK8pq/5co4cWDZZjdM
	CEKSbICju9SLE/njl8oY+eRiOowfHnOWsHLcluwjmu+eLb+ya69vXCNWowP/Gblohy29vHbDA/pIE
	Jk93jFUEQGzI09yOUYtoWmDDWlcrYJIokU4Qg6zpqTYjr0X5fiz/PHKZ8jXOM7sJZMJWm7XfI8TEK
	1ocEtDnKfha6OvMpT1CM2/X0ce0YQWaof+orGKVO08z4fsnLhT4yKbhTyjeFNn7KE2U4DObwQ4Hht
	f9AB7NzwlhEN0vDN158g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4ewB-0000000EUEp-3MSY;
	Thu, 10 Sep 2026 13:35:35 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4ew6-0000000EU9K-36pm;
	Thu, 10 Sep 2026 13:35:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1789047326;
	bh=9C3JUCOwAQ1zEUDQ4Llz8iTa13vqDmi1w2+KMGh3JMs=;
	h=From:Subject:Date:To:Cc:From;
	b=FiWwdYgrjexM6w7mybio42uRq+AB0nkNrHP2priZTT9Ej+ZktndbH3CD4MJxpRMjx
	 D3lqb09j9qHQrbl3CvD876KdiceSBUzZEGHvuSm53/7JJHW6mms+Ad6Hc2rVt74J6S
	 pvPVZCzWUeceGHmtg9uB7p9g5V1C5Z9NP8qq2fLUyQBhbWW0r0Diwm0Y+LNypolcy4
	 efvXfqdbnl9JrmC1KIs1NqBd4n5rRLyQVl0QJWA67NaxrLx//eA9lwO+vS8oQPg1et
	 XraCxVDecKRaUpLSKtw5jBzoBtObKhOZtYdAu+xzEBy0BnQVSjanNXSQB+uVPWT8/s
	 ti3pc+BZczEIA==
Received: from [192.168.0.15] (unknown [100.64.0.170])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: detlev)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 8565F17E03E1;
	Thu, 10 Sep 2026 15:35:24 +0200 (CEST)
From: Detlev Casanova <detlev.casanova@collabora.com>
Subject: [PATCH v2 0/8] arm(64): dts: rockchip: give HDMI sound cards
 SoC-specific names
Date: Thu, 10 Sep 2026 09:34:42 -0400
Message-Id: <20260910-fix-rockchip-hdmi-audio-names-v2-0-1396a6168e20@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/42OQQ6CMBBFr0K6dkxbLEFX3sOwGNpBRoWSFoiGc
 HcLXsDlS/5//y8iUmCK4pItItDMkX2fQB8yYVvs7wTsEgstdSHLXEHDbwjePm3LA7SuY8DJsYc
 eO4pQWiXRFafGlCiSYwiUCrv/Vv04TvWD7LhJt0TLcfThsx+Y1Zb7d2tWIMHUyhgkafQ5v1r/e
 mHtAx6t70S1rusXWIno/OAAAAA=
X-Change-ID: 20260831-fix-rockchip-hdmi-audio-names-8c10ad64f58a
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Johan Jonker <jbx6244@gmail.com>, Alex Bee <knaerzche@gmail.com>, 
 Christian Hewitt <christianshewitt@gmail.com>, 
 Robin Murphy <robin.murphy@arm.com>, 
 Nicolas Frattaroli <frattaroli.nicolas@gmail.com>, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, 
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
 David Summers <beagleboard@davidjohnsummers.uk>
Cc: kernel@collabora.com, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 Detlev Casanova <detlev.casanova@collabora.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_063530_973907_FA60D792 
X-CRM114-Status: GOOD (  15.02  )
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

Hello !

Some Rockchip SoC that exposes HDMI audio through simple-audio-card
currently expose a generic and inconsistent 'simple-audio-card,name':
- HDMI on rk3066a, rk3288, rk3328, rk356x and rk3576
- hdmi-sound on rk3399
- hdmi[01] on rk3588

There is also rockchip,tinker-codec on rk3288.

That string is user-visible and it shows up in aplay -l,
/proc/asound/cards and is what ALSA UCM, WirePlumber and PulseAudio
match on when picking a profile for a card.

As the names are not unique across boards (5 of them use HDMI), any
userspace rule matching on the current name is ambiguous.
alsa-ucm-conf.git has no upstream UCM profile matching "HDMI", 
"hdmi-sound", "hdmi0" or "hdmi1" for Rockchip, precisely
because such a name could match on the wrong hardware.
It also prevents alsa-ucm to hav specific profiles per SoC.

This series renames each card to "RK<SOC> HDMI[N]". The new names:
- are unique inside the Rockchip family and self-describing,
- fit the 16-char ALSA driver field after normalization
  ("RK3588 HDMI1" -> driver "RK3588_HDMI1"),
- give distributions a stable, unambiguous name to match UCM /
  WirePlumber / PulseAudio rules on, which the current names cannot
  provide.

Because no upstream userspace configuration can match on the current
names without misfiring on a different board, this rename does not
regress any known userspace setup and allows reliable matching on the
different SoCs.
The tinker configuration is also not present in userspace tools.
It also gives naming examples for future Rockchip SoC enablement work,
which should avoid naming issues from now on.

As similar rename was already previously accepted in commit 309598fca339
("arm64: dts: rockchip: Use a readable audio card name on NanoPi M5"),
which changed 'simple-audio-card,name' simply for aesthetic reasons.

Detlev.

Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
---
Changes in v2:
- Fixed the ARM commit messages (instead of arm64)
- Also rename rk3288-tinker
- Separate rk3566 and rk3568 instead of using rk356x
- Link to v1: https://patch.msgid.link/20260831-fix-rockchip-hdmi-audio-names-v1-0-5b155ae05293@collabora.com

To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Heiko Stuebner <heiko@sntech.de>
To: Johan Jonker <jbx6244@gmail.com>
To: Christian Hewitt <christianshewitt@gmail.com>
To: Alex Bee <knaerzche@gmail.com>
To: David Summers <beagleboard@davidjohnsummers.uk>
To: Robin Murphy <robin.murphy@arm.com>
To: Nicolas Frattaroli <frattaroli.nicolas@gmail.com>
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Detlev Casanova <detlev.casanova@collabora.com>
Cc: kernel@collabora.com
Cc: devicetree@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-rockchip@lists.infradead.org
Cc: linux-kernel@vger.kernel.org

---
Detlev Casanova (8):
      ARM: dts: rockchip: Rename rk3066a HDMI audio card
      ARM: dts: rockchip: Rename rk3288-miqi HDMI audio card
      ARM: dts: rockchip: Rename rk3288-tinker HDMI audio card
      arm64: dts: rockchip: Rename rk3328 HDMI audio card
      arm64: dts: rockchip: Rename rk3399 HDMI audio card
      arm64: dts: rockchip: Rename rk3566 and rk3568 HDMI audio cards
      arm64: dts: rockchip: Rename rk3576 HDMI audio card
      arm64: dts: rockchip: Rename rk3588 HDMI audio cards

 arch/arm/boot/dts/rockchip/rk3066a.dtsi        | 2 +-
 arch/arm/boot/dts/rockchip/rk3288-miqi.dts     | 2 +-
 arch/arm/boot/dts/rockchip/rk3288-tinker.dtsi  | 2 +-
 arch/arm64/boot/dts/rockchip/rk3328.dtsi       | 2 +-
 arch/arm64/boot/dts/rockchip/rk3399-base.dtsi  | 2 +-
 arch/arm64/boot/dts/rockchip/rk3566-base.dtsi  | 4 ++++
 arch/arm64/boot/dts/rockchip/rk3568.dtsi       | 4 ++++
 arch/arm64/boot/dts/rockchip/rk356x-base.dtsi  | 1 -
 arch/arm64/boot/dts/rockchip/rk3576.dtsi       | 2 +-
 arch/arm64/boot/dts/rockchip/rk3588-base.dtsi  | 2 +-
 arch/arm64/boot/dts/rockchip/rk3588-extra.dtsi | 2 +-
 11 files changed, 16 insertions(+), 9 deletions(-)
---
base-commit: 893e11787f78e43b534e252249ac3fff4d1333f8
change-id: 20260831-fix-rockchip-hdmi-audio-names-8c10ad64f58a

Best regards,
--  
Detlev Casanova <detlev.casanova@collabora.com>


