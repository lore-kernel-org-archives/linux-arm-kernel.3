Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 357E4CA5FF0
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  4 Oct 2026 20:52:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ELsLdn+4Qh6lp87H1c3X8IMTeSqRAZu1aVbHKFxqmEo=; b=uWJ+b5yvwLFuYLr9qkcwVDJPtn
	zJKBBAVS+PAhPjHL7+uv2EU1H6IVk1qp7Rcja/ovX7jlF/apsPQN+WNr9w9cPzzk9fCm+id0E5gNT
	YwVTnx/yy9I59TUkoFHTNl598Pp2aMETQ748axW6X+/2uwYsFuqJxU3FKMzcG4IOMQnolyXyaQBl0
	XOSPY8rnXZNpyiDAUWwL450fAo0FpYYXEAV5IKfhFKrG+V2Y+X4ewpjItgNgm04xwW9ydTz3dujSu
	ShI51NqJ95SKxRH9ITiLB2AQc9GetGMzuT43/bXTrcDii5DIGb8D127gBVHmZan6ANWMTVZqf5ubH
	PaYtuxbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDTBs-0000000FJ5z-0NAP;
	Sun, 04 Oct 2026 20:52:12 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDTBm-0000000FJ3o-0PVG;
	Sun, 04 Oct 2026 20:52:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=ELsLdn+4Qh6lp87H1c3X8IMTeSqRAZu1aVbHKFxqmEo=; b=TEdwpFsVofoNdgj2nTC5BT3t6t
	jGiu2l1l5uwUbftHZV6UPFekbeT6lbRy2hBiW4tlZCpQgEAe59VN3UmVacUl61uQZ8qxvwUwzTXnd
	97sHgIf9mrzWbygPYNfNnQIrvWac2Vs3Qv5Z2OENNv+y91gugNyKhKCqB0qm0At0ZMrLL+6J2bHkH
	3iuEG06pmd6oPcW4/lyCqG8uubKiRSiTsIm97lidPpXrOGzwsPki5Qudlbcof8uvbxxRVyygwwIG/
	JYYwNcgmr7toSsi9kaxVaPjQgVL9+OA51HLiO7DObKKFg3OGEu8N6Hjnmf+2PpB7ANcQa8SLYtipM
	maFWfOmw==;
From: Heiko Stuebner <heiko@sntech.de>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Johan Jonker <jbx6244@gmail.com>,
	Alex Bee <knaerzche@gmail.com>,
	Christian Hewitt <christianshewitt@gmail.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	David Summers <beagleboard@davidjohnsummers.uk>,
	Detlev Casanova <detlev.casanova@collabora.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	kernel@collabora.com,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/8] arm(64): dts: rockchip: give HDMI sound cards SoC-specific names
Date: Sun,  4 Oct 2026 22:51:45 +0200
Message-ID: <179114705961.3265768.12585686056328294949.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260910-fix-rockchip-hdmi-audio-names-v2-0-1396a6168e20@collabora.com>
References: <20260910-fix-rockchip-hdmi-audio-names-v2-0-1396a6168e20@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261004_135206_136901_E75F555F 
X-CRM114-Status: GOOD (  10.31  )
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


On Thu, 10 Sep 2026 09:34:42 -0400, Detlev Casanova wrote:
> Some Rockchip SoC that exposes HDMI audio through simple-audio-card
> currently expose a generic and inconsistent 'simple-audio-card,name':
> - HDMI on rk3066a, rk3288, rk3328, rk356x and rk3576
> - hdmi-sound on rk3399
> - hdmi[01] on rk3588
> 
> There is also rockchip,tinker-codec on rk3288.
> 
> [...]

Applied, thanks!

[1/8] ARM: dts: rockchip: Rename rk3066a HDMI audio card
      commit: 92e0587100ef8b2d103c7932750ad4237ef90e97
[2/8] ARM: dts: rockchip: Rename rk3288-miqi HDMI audio card
      commit: fbd2ec5bdb267034516f16d392cd52098ab5b7c1
[3/8] ARM: dts: rockchip: Rename rk3288-tinker HDMI audio card
      commit: e048e4da69a8362a7eaff26a10052f7d0020974f
[4/8] arm64: dts: rockchip: Rename rk3328 HDMI audio card
      commit: daa0db717771d43c25d98c2798fa6a7b0252deb7
[5/8] arm64: dts: rockchip: Rename rk3399 HDMI audio card
      commit: 946482033221ce5055721997888739cd57e3e5b2
[6/8] arm64: dts: rockchip: Rename rk3566 and rk3568 HDMI audio cards
      commit: 8043ed0f40fe2b49df1c2c25409ab6bd3f88e806
[7/8] arm64: dts: rockchip: Rename rk3576 HDMI audio card
      commit: d3d3b67505fa5f10af587a6fc8e6d4640010d52e
[8/8] arm64: dts: rockchip: Rename rk3588 HDMI audio cards
      commit: d1b7c3228041f4b3ad888abe6a31f6494279e979

I felt generous and donated the two ";" that the rk3566/rk3568 patch
was missing ;-)


Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

