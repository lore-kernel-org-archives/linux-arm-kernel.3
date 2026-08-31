Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 040EBC624A4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Aug 2026 14:21:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=FXGkrqd/zSdOFrkh9ANTyIDVi3w/KmCCJt/zQOqaH+A=; b=UPq4yL2jiTbrNK
	hubYVQnRnS3n3wXWtcCK8rFZKXm7r5SZS4Ffo7cCRn5a+8b+pnfIi1kLgZVs0HPEAKlL28NwhQdxD
	Qwxt5jraz73dUVANuRL1jJoX3Se7qgRj81Cc1SS0lUPXXmxy9yZQiEmnuuHS+aAPngtNeuh6tkY8A
	XYt2GaS4yPATe5r4xvzAoltxxxrqXsssaaPc2x6y8aqXl7x2I610dQBCWdLnNOg8iZNyHDjD8ySRL
	iJW51I178moG6hTqet7Ig1jioOFNmWBX31kbWRRDfzoO0/QVyb91nVRLp9vv5TnswIACeqPRSx8BI
	P1yhP3c4hsCgO4npEl1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x12sk-00000009bvU-2Hvp;
	Mon, 31 Aug 2026 14:21:06 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x12si-00000009buq-2y2E;
	Mon, 31 Aug 2026 14:21:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1788186060;
	bh=ot792P61hDoD7zuKxG0gMHaJ3eU44352gH7eU0h4ohE=;
	h=From:Subject:Date:To:Cc:From;
	b=flN6rklCWLgo+IEPbSBXz/hlvPPkUalq3ts9StL/ubsmQtaoEKGH70LhMteRZYg2o
	 SwOfrMcEz7UtEz4unOuxE9lTTh15Uv+tn4Ldlchrnnm4EO8zZ+s2NlPJ3QbltM3Bg/
	 lopVGnPuUH0PFD5317oruoSXsvdGE4ap0v6Lr++57X+eHAV2/XvWHz0aLzfNx98TYv
	 oWWhOcCfkZGk6+y9b0bdG/92QqAiOIqVO4tbtbzRwakmime+1ubaIC8IpaBTq4eM8F
	 6E8FqM2nuMyXPS5rs4t07xcX45HphbbnCXAOS+UNIr4EU2Z2qjZMa2Na+yyVictwQZ
	 4gaW4B2pHFrMA==
Received: from [192.168.0.15] (unknown [100.64.0.170])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: detlev)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 8C56317E0069;
	Mon, 31 Aug 2026 16:20:58 +0200 (CEST)
From: Detlev Casanova <detlev.casanova@collabora.com>
Subject: [PATCH 0/7] arm64: dts: rockchip: give HDMI sound cards
 SoC-specific names
Date: Mon, 31 Aug 2026 10:20:47 -0400
Message-Id: <20260831-fix-rockchip-hdmi-audio-names-v1-0-5b155ae05293@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMwQrCMAyA4VcZORtop47iq4iHmGY2ytrROBHG3
 t2qx+/w/yuYVBWDU7dClZealtzgdx1wonwT1NgMvesHF/YeR31jLfzgpDOmOCnSErVgpkkMA3t
 HcTiMx0DQHnOVFvz+58vftlzvws/vFLbtA3I9jbWBAAAA
X-Change-ID: 20260831-fix-rockchip-hdmi-audio-names-8c10ad64f58a
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Johan Jonker <jbx6244@gmail.com>, Alex Bee <knaerzche@gmail.com>, 
 Christian Hewitt <christianshewitt@gmail.com>, 
 Robin Murphy <robin.murphy@arm.com>, 
 Nicolas Frattaroli <frattaroli.nicolas@gmail.com>, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, 
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: kernel@collabora.com, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 Detlev Casanova <detlev.casanova@collabora.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260831_072104_904061_605BAB31 
X-CRM114-Status: GOOD (  11.38  )
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
It also gives naming examples for future Rockchip SoC enablement work,
which should avoid naming issues from now on.

As similar rename was already previously accepted in commit 309598fca339
("arm64: dts: rockchip: Use a readable audio card name on NanoPi M5"),
which changed 'simple-audio-card,name' simply for aesthetic reasons.

Detlev.

Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
---
Detlev Casanova (7):
      arm64: dts: rockchip: Rename rk3066a HDMI audio card
      arm64: dts: rockchip: Rename rk3288 HDMI audio card
      arm64: dts: rockchip: Rename rk3328 HDMI audio card
      arm64: dts: rockchip: Rename rk3399 HDMI audio card
      arm64: dts: rockchip: Rename rk356x HDMI audio card
      arm64: dts: rockchip: Rename rk3576 HDMI audio card
      arm64: dts: rockchip: Rename rk3588 HDMI audio cards

 arch/arm/boot/dts/rockchip/rk3066a.dtsi        | 2 +-
 arch/arm/boot/dts/rockchip/rk3288-miqi.dts     | 2 +-
 arch/arm64/boot/dts/rockchip/rk3328.dtsi       | 2 +-
 arch/arm64/boot/dts/rockchip/rk3399-base.dtsi  | 2 +-
 arch/arm64/boot/dts/rockchip/rk356x-base.dtsi  | 2 +-
 arch/arm64/boot/dts/rockchip/rk3576.dtsi       | 2 +-
 arch/arm64/boot/dts/rockchip/rk3588-base.dtsi  | 2 +-
 arch/arm64/boot/dts/rockchip/rk3588-extra.dtsi | 2 +-
 8 files changed, 8 insertions(+), 8 deletions(-)
---
base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
change-id: 20260831-fix-rockchip-hdmi-audio-names-8c10ad64f58a

Best regards,
--  
Detlev Casanova <detlev.casanova@collabora.com>


