Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9606C28B28
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 15 Mar 2025 16:11:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=1VeO5hr1KTtCeq/vjZzvAaFvuU/CjtDmvpB7mrE5/C4=; b=kAOpWdRd+DUa1dF18Nf6Dten5f
	QwxoEwKqAinFvxPqI96o0oe3ZyPF1JWE7L5Ba2AaOlOY8vtiWJ+YD56SzqAQN1ZtTPUjl6wQIi7Ix
	pHEk8xwCIYxBE1lzn7y/zrsA2MO/2+hQrAetoHsvs0/NOJDpRbvf1CGqS9FRW8Quy8b4r0kKRWjWW
	V2YJumuBbOGFXtYs7uFB7NFjN6H/V6GlyTcRlY2dLZa0/srJbvfNbjggHj7gyzxEcHtZHDOdzAagB
	NtJ8OL21P17QWNnoQ9Rpu1AFKT6zOBlR7k1xLWMSSTckK38BNfWKQi7vhjvKLDOawl1MHQNYoivMi
	iBL+2eGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ttU67-0000000Ga1J-2Rei;
	Sat, 15 Mar 2025 16:10:51 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ttTj3-0000000GXXh-0vBd;
	Sat, 15 Mar 2025 15:47:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References;
	bh=1VeO5hr1KTtCeq/vjZzvAaFvuU/CjtDmvpB7mrE5/C4=; b=bvFFYx/+tc7xY5119MNFQ24BzH
	p5GW/e2RPUGfl6YbHvUc3gEWbnzaqzRFeHVtnACjnxRKvnLyhWNeAwPM2SxHcLFRM9GhNUXdpW5+/
	zs37wl9m4gD9tAPdcqyfQSdxkVoK17w7J/7+CQ5WSqnbkIIdInBy7wB6rNsHJRG+LScgrirpKVKoI
	hsBhK+s+/3jdgmGd4fmMfAFPXEF55g+01xjFLjo4Qr+uY4JOlm0rtImyR09CJ8CAASE4dpH+bTud0
	kItcxsoQ0a/kgn5kMfvmFwcP8aWylJZDveXAOz9f9yxQuUO7bPRmM95uzGBjq/v9g+iTco8ccvlaE
	ekRAHjbQ==;
Received: from [194.95.143.137] (helo=phil.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1ttTiz-0008Tk-UU; Sat, 15 Mar 2025 16:46:57 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: arm@kernel.org
Cc: soc@kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] Rockchip dts64 changes for 6.15 #2
Date: Sat, 15 Mar 2025 16:46:57 +0100
Message-ID: <23866869.6Emhk5qWAg@phil>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250315_084701_289624_F92BAE53 
X-CRM114-Status: GOOD (  14.43  )
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

Hi soc maintainers,

please find below some additional Rockchip changes for for 6.15 .
And I think with that I'll call it done, and have everything else
wait for after the merge-window.


Please pull.
Thanks
Heiko


The following changes since commit ba82f56bbf20e4166c988621cd0507509872848e:

  arm64: dts: rockchip: Add SPI NOR device on the ROCK 4D (2025-03-08 18:19:59 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v6.15-rockchip-dts64-2

for you to fetch changes up to 73d246b4402c3356f6b3d13665de3a51eea7b555:

  arm64: dts: rockchip: remove ethm0_clk0_25m_out from Sige5 gmac0 (2025-03-15 15:49:00 +0100)

----------------------------------------------------------------
New peripheral the sdhci controller on rk3528. Enablement of hdmi and hdmi
audio on a number of additional boards. Better handling for scmi shared
memory on rk3568 and a fix for the used SCMI clock ids on rk3576.
As well as some fixes that were a bit late for trying to stuff them into
6.14 at this late stage of the cycle.

----------------------------------------------------------------
Chen-Yu Tsai (1):
      arm64: dts: rockchip: Remove bluetooth node from rock-3a

Chukun Pan (1):
      arm64: dts: rockchip: Move rk356x scmi SHMEM to reserved memory

Jianfeng Liu (3):
      arm64: dts: rockchip: Add AP6275P wireless support to ArmSoM Sige7
      arm64: dts: rockchip: Enable HDMI audio output for ArmSoM Sige7
      arm64: dts: rockchip: Fix pcie reset gpio on Orange Pi 5 Max

Jimmy Hon (4):
      arm64: dts: rockchip: Enable HDMI0 audio output for Orange Pi 5/5B
      arm64: dts: rockchip: Enable HDMI audio outputs for Orange Pi 5 Max
      arm64: dts: rockchip: Enable HDMI1 on Orange Pi 5 Plus
      arm64: dts: rockchip: Enable HDMI audio outputs for Orange Pi 5 Plus

Jonas Karlman (2):
      arm64: dts: rockchip: Add SDHCI controller for RK3528
      arm64: dts: rockchip: Enable onboard eMMC on Radxa E20C

Nicolas Frattaroli (3):
      dt-bindings: clock: rk3576: add SCMI clocks
      arm64: dts: rockchip: fix RK3576 SCMI clock IDs
      arm64: dts: rockchip: remove ethm0_clk0_25m_out from Sige5 gmac0

Yao Zi (1):
      arm64: dts: rockchip: Fix PWM pinctrl names

 arch/arm64/boot/dts/rockchip/rk3308-roc-cc.dts     |  2 +-
 arch/arm64/boot/dts/rockchip/rk3318-a95x-z2.dts    |  4 +-
 arch/arm64/boot/dts/rockchip/rk3399-nanopi4.dtsi   |  2 +-
 arch/arm64/boot/dts/rockchip/rk3528-radxa-e20c.dts | 15 ++++++
 arch/arm64/boot/dts/rockchip/rk3528.dtsi           | 24 ++++++++++
 arch/arm64/boot/dts/rockchip/rk3568-rock-3a.dts    | 14 ------
 arch/arm64/boot/dts/rockchip/rk356x-base.dtsi      | 25 +++++-----
 .../boot/dts/rockchip/rk3576-armsom-sige5.dts      |  3 +-
 arch/arm64/boot/dts/rockchip/rk3576.dtsi           | 18 ++++----
 .../boot/dts/rockchip/rk3588-armsom-sige7.dts      | 24 ++++++++++
 .../dts/rockchip/rk3588-orangepi-5-compact.dtsi    |  2 +-
 .../boot/dts/rockchip/rk3588-orangepi-5-max.dts    | 16 +++++++
 .../boot/dts/rockchip/rk3588-orangepi-5-plus.dts   | 54 ++++++++++++++++++++++
 arch/arm64/boot/dts/rockchip/rk3588s-coolpi-4b.dts |  2 +-
 .../boot/dts/rockchip/rk3588s-orangepi-5.dtsi      |  8 ++++
 include/dt-bindings/clock/rockchip,rk3576-cru.h    |  5 ++
 16 files changed, 174 insertions(+), 44 deletions(-)




