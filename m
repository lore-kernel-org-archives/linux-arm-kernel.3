Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A34FE85367
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Apr 2026 13:39:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=K0i9/psgiYriNr+bQD8bwLT5N5vs6aXdpa5YckR6JD0=; b=p0DEqpbTXAcq6F7ZWYb0bUSX0w
	gYQHEjcT6c7FaxPCgjNRDqWCdXvH9C0tFqy8oTurSxbUBdJXDfURaesTbY8ss1f6ueOSuBQ5AkyDF
	6hwCOdFGGAleC3aOIoqUyJ6hbAGsrZlWmc3YaumKQKOmOdBOQvoqHtqVZv97EzWbL9dRCX7K6T2ei
	/GsRMj1RwjGoM8oKGUlgCqD9NpqBq3has+iaJls6mPHyH6CMWGZLMKQmq7KPisHMPbAtpmzl0H4R3
	gkVW3y2OuDkL24oU47IOZbSIE6et3D3Ky5wEed7IH4Y+oYcms2JivrL1PavvaQfWeewoYs5jt4AJg
	rbgfG46w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8ekK-000000024uR-3zft;
	Fri, 03 Apr 2026 13:39:36 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8ekH-000000024tp-3hRb;
	Fri, 03 Apr 2026 13:39:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:In-Reply-To:References;
	bh=K0i9/psgiYriNr+bQD8bwLT5N5vs6aXdpa5YckR6JD0=; b=zB38WtEwuPAveMLDaJrCfuOoeM
	wRqvnkKiQvikUmFiOjjuJGW18YqsmRUTJOjGCR8Bj/PBRLDdzythtvYtblO8CfLuI5u/X4DhcDpO5
	35GlxsA2qWLqF1nmLwY8916tQ9vsSU07HGQ6bQpELI1fioaDrJJoKGbg0lHBdQ4h7mFkeGx/GcC4O
	0LMqFsjqa5DLoyQFydL/UWvzBNIhysuqa7Xth36+zF+kqXWsqhysNt+Hnw3a7ymSG0iaiA5pBgSjt
	gzTao7wn4ODFp2yexFVbUXglMjyHJ1OGQCRCjVahE45wXKr9gTOmx7jABkdC8hv8Nt04ZuzODoyNU
	/bKlaebA==;
From: Heiko Stuebner <heiko@sntech.de>
To: arm@kernel.org
Cc: soc@kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Stephen Boyd <sboyd@kernel.org>,
 mturquette@baylibre.com
Subject: [GIT PULL] Rockchip dts32 changes for 7.1 #2
Date: Fri, 03 Apr 2026 15:39:31 +0200
Message-ID: <13980380.dW097sEU6C@phil>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260403_063933_948851_90ED8B6E 
X-CRM114-Status: GOOD (  16.06  )
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

please find below a new ARM32 Rockchip SoC for 7.1 . This goes on top
of the generic arm32 changes I just sent.


I've split this off from the other ARM32 changes, because this contains
a shared clock header, shared between the devicetree side and the clock-
driver side.

The clock pull-request is sent [0], but not merged yet - probably after
easter I guess.

And while in the past this has always come together in time for the
merge-window, I wasn't sure if in the soc multi-maintainer context the
handling changes. So depending on your preference this could also wait
until after the clock-subsystem-side got merged.


Please pull.
Thanks
Heiko


[0] https://lore.kernel.org/all/3746710.R56niFO833@phil/


The following changes since commit 94c8dc1fa8e1ad4037084204152bca1e799d7d1c:

  ARM: dts: rockchip: Pass linux,code to the power key on rk3288-veyron-pinky (2026-03-24 17:06:35 +0100)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v7.1-rockchip-dts32-2

for you to fetch changes up to 683192d7d5b47e89d920867f7c6997d2c0d1a0ad:

  ARM: dts: rockchip: Add Onion Omega4 Evaluation Board (2026-03-24 17:40:11 +0100)

----------------------------------------------------------------
Support for the RV1103B SoC and the Onion Omega4 board using it.
While the RV1103B only got a B-extension to its name, the SoC internals
were reworked heavily. So likely it's mainly pin compatible to the
non-B variant.

The dt-binding for the RV1103B clock driver is shared with the clock-
driver branch going into the clock-tree.

----------------------------------------------------------------
Fabio Estevam (5):
      dt-bindings: clock: rockchip: Add RV1103B CRU support
      dt-bindings: soc: rockchip: grf: Add RV1103B compatibles
      ARM: dts: rockchip: Add support for RV1103B
      dt-bindings: arm: rockchip: Add Omega4 Evaluation board
      ARM: dts: rockchip: Add Onion Omega4 Evaluation Board

Heiko Stuebner (1):
      Merge branch 'v7.1-shared/clkids' into v7.1-armsoc/dts32

 .../devicetree/bindings/arm/rockchip.yaml          |   6 +
 .../bindings/clock/rockchip,rv1126b-cru.yaml       |   1 +
 .../devicetree/bindings/soc/rockchip/grf.yaml      |   3 +
 arch/arm/boot/dts/rockchip/Makefile                |   1 +
 arch/arm/boot/dts/rockchip/rv1103b-omega4-evb.dts  |  63 ++
 arch/arm/boot/dts/rockchip/rv1103b-omega4.dtsi     | 147 ++++
 arch/arm/boot/dts/rockchip/rv1103b-pinctrl.dtsi    | 816 +++++++++++++++++++++
 arch/arm/boot/dts/rockchip/rv1103b.dtsi            | 239 ++++++
 include/dt-bindings/clock/rockchip,rv1103b-cru.h   | 220 ++++++
 9 files changed, 1496 insertions(+)
 create mode 100644 arch/arm/boot/dts/rockchip/rv1103b-omega4-evb.dts
 create mode 100644 arch/arm/boot/dts/rockchip/rv1103b-omega4.dtsi
 create mode 100644 arch/arm/boot/dts/rockchip/rv1103b-pinctrl.dtsi
 create mode 100644 arch/arm/boot/dts/rockchip/rv1103b.dtsi
 create mode 100644 include/dt-bindings/clock/rockchip,rv1103b-cru.h




