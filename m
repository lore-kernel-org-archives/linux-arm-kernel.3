Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5CB4C71157
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Jun 2025 17:12:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=1BLs9uONM9njf4dhVdFahYz1ARkfSflWyDh9As60HyU=; b=4iEAT5VrOAFYtwDbHHwPAYY4mL
	7Vu4PdKGEiIuyin3UAoNQ8dtVG9Pw+u/zj+2Y8r31cuIMuuqW7ZCCS15bVUmwmEIlP6+IAyJGtrpY
	xMp2hIbk/60MfydakT+ssQPMFgJ4/fg5DOqaFrRIySC5t/0QFboU9K6XkPOQTqCvVIhVemNVbmM8n
	E5HVu/+r4C7r5EZWbMmAiKM8lFnqs1guR+m7YRl9/rHp+t0dBtAkVNKQQKPWbuTK1STTr0m2qskoe
	82fduJudtnMvGWa6Ci22lmIJhoJC+tockKMiC8zOQU9E8cuNiGhsoNCasALaA1mi76LiqIzmLNo1t
	fPN1dmPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uT1lp-000000003uX-0xaP;
	Sat, 21 Jun 2025 17:12:49 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uT1it-000000003ix-2wxZ
	for linux-arm-kernel@lists.infradead.org;
	Sat, 21 Jun 2025 17:09:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id CD0DA45028
	for <linux-arm-kernel@lists.infradead.org>; Sat, 21 Jun 2025 17:09:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D72BC4CEE7;
	Sat, 21 Jun 2025 17:09:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750525786;
	bh=eI3CbwLJiy7jodm4/+yWPC8Tk6NZvpzd0iABkJQ4tcU=;
	h=From:To:Cc:Subject:Date:From;
	b=BzJ3L+NWeccSnjJEykbDfkBTDcSH9b1LE1aFuHdrSTtwBr6Lwnq7tx/TzOxO1wAYI
	 mQ+7PI3muYXzArYxJkFCKfjVhJ934tLHCdAq4+1cjalp+kESGIWkIO7YnRExxXBo6h
	 0nclQdogtl52jBVgK3znza6JFtFs7Wf1nxbX1RBQ9fW3rhR5mMrfAltYBxALs73sJ0
	 CmqzhDTfL+gwYo4KKyAGz5YSBbxu8N9qvN5n56dz9YPst8vvRlZzDNIMvmLrlINIgN
	 YaIfl7ByPZaTlvnVxKTt2bQ8g0ujpbiYFl7OHUjRzmXsP1szl7hM34KIRtew4mXqje
	 uFjCqnHmfpSig==
From: Sven Peter <sven@kernel.org>
To: soc@lists.linux.dev
Cc: asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Sven Peter <sven@kernel.org>
Subject: [GIT PULL] Apple SoC fixes for v6.16
Date: Sat, 21 Jun 2025 19:09:34 +0200
Message-Id: <20250621170934.63194-1-sven@kernel.org>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250621_100947_769059_6AC0F700 
X-CRM114-Status: UNSURE (   9.84  )
X-CRM114-Notice: Please train this message.
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

Hi Arnd,

Here are three fixes for device tree warnings from our side.
As usual, they've already been in -next for a while.


Thanks,


Sven

-- >8 --

The following changes since commit 19272b37aa4f83ca52bdf9c16d5d81bdd1354494:

  Linux 6.16-rc1 (2025-06-08 13:44:43 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/sven/linux.git tags/apple-soc-fixes-6.16

for you to fetch changes up to 08a0d93c353bd55de8b5fb77b464d89425be0215:

  arm64: dts: apple: Move touchbar mipi {address,size}-cells from dtsi to dts (2025-06-13 14:32:25 +0000)

----------------------------------------------------------------
Apple SoC fixes for 6.16

One devicetree fix for a dtbs_warning that's been present for a while:
- Rename the PCIe BCM4377 node to conform to the devicetree binding
  schema

Two devicetree fixes for W=1 warnings that have been introduced recently:
- Drop {address,size}-cells from SPI NOR which doesn't have any child
  nodes such that these don't make sense
- Move touchbar mipi {address,size}-cells from the dtsi file where the
  node is disabled and has no children to the dts file where it's
  enabled and its children are declared

Signed-off-by: Sven Peter <sven@kernel.org>

----------------------------------------------------------------
Janne Grunau (1):
      arm64: dts: apple: t8103: Fix PCIe BCM4377 nodename

Sven Peter (2):
      arm64: dts: apple: Drop {address,size}-cells from SPI NOR
      arm64: dts: apple: Move touchbar mipi {address,size}-cells from dtsi to dts

 arch/arm64/boot/dts/apple/spi1-nvram.dtsi | 2 --
 arch/arm64/boot/dts/apple/t8103-j293.dts  | 2 ++
 arch/arm64/boot/dts/apple/t8103-jxxx.dtsi | 2 +-
 arch/arm64/boot/dts/apple/t8103.dtsi      | 2 --
 arch/arm64/boot/dts/apple/t8112-j493.dts  | 2 ++
 arch/arm64/boot/dts/apple/t8112.dtsi      | 2 --
 6 files changed, 5 insertions(+), 7 deletions(-)

