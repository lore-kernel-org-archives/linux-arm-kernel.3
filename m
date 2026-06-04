Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAAD6CD6E57
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Jun 2026 10:26:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=tfu9KnLGfgoGr3OfG2c4EY0cS/9adxdzuVFmvrPD2NY=; b=CMGvUBKGwMAV2qLmYmOn2FtSul
	iLX8CIZbxReyeHiMqzEGewc6v5oJFLVR/Ytk3Kkq5jncYrgyjBhoozXD9WWGmJTo90CJ77OlLKMXc
	sV6yndKcehVBleBibpUlBHz0IEV8atqyC+U24vr9p2t9PDUk7KYu9IDZcg+mk+0x2sq/bd9C5Ul42
	XogcTfl5WZyrVzaxlEMDXYIorRbwsA8IaxhxG/1udtBxrgj3cXbC0EOVEQ3GAtypsWnTWOJVgKwIG
	kMDisaU4M9+wd7Sqi6nYMv3t+zhCKTf+3nbMJm+VqYhEHBMygjstIEwh9BitN4XcrkxiZkj3hKWDn
	ci0vsbGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV5HF-0000000GZmE-489Q;
	Thu, 04 Jun 2026 10:26:17 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV5HE-0000000GZm1-2RWZ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Jun 2026 10:26:16 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id ED1CE60219
	for <linux-arm-kernel@lists.infradead.org>; Thu,  4 Jun 2026 10:26:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65C4A1F00893;
	Thu,  4 Jun 2026 10:26:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780568775;
	bh=tfu9KnLGfgoGr3OfG2c4EY0cS/9adxdzuVFmvrPD2NY=;
	h=From:To:Cc:Subject:Date;
	b=OsjDmmXu3EGiqTrDmFydvjZVHEoMiUjY1LgfSfDNjor50LcXF+VgmxDc5rjTEjnWb
	 fRwJyKVo5hacT+VJYqCbsH2LoKi7GuQvqsYVLPDWHHXU2tBbp/x9ytgKHYqzfQ7yNc
	 13nCSpNr8P+UCvBy5tYsvEme/yGSXzhNYWduGuQtZPOKA5rJq7wpsjUSo8B4ifdVkU
	 Os59Gp2HoUqGBGLZlul97z8uaNfFutby329qEqVmwCEQQmbkbp5QpngcpNC0a52mTD
	 d1bMb1TwY63+cjXzqAVBRpRDHlBpTMGM5SB6x621hf2d2/YgHtvyW62ZHprlfaL5xc
	 SNbc13/9SIJ/A==
From: Sven Peter <sven@kernel.org>
To: soc@lists.linux.dev
Cc: asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Sven Peter <sven@kernel.org>
Subject: [GIT PULL] Apple SoC DT changes for v7.2
Date: Thu,  4 Jun 2026 12:25:58 +0200
Message-ID: <20260604102600.3790-1-sven@kernel.org>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

The following changes since commit 254f49634ee16a731174d2ae34bc50bd5f45e731:

  Linux 7.1-rc1 (2026-04-26 14:19:00 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/sven/linux.git tags/apple-soc-dt-7.2

for you to fetch changes up to c65ab4905e5874a1a489c72da4d6e78a6c9b5943:

  arm64: dts: apple: Initial t8122 (M3) device trees (2026-06-01 21:25:24 +0200)

----------------------------------------------------------------
Apple SoC DT update for 7.2

Add minimal device trees for all t8122 / base M3 based devices and some
required new compatibles to the dt-bindings. These are enough to boot
Linux on these devices to a simple serial console but future work is
required to make these machines useful for end users.

Signed-off-by: Sven Peter <sven@kernel.org>

----------------------------------------------------------------
Janne Grunau (5):
      dt-bindings: arm: apple: apple,pmgr: Add t8122 compatible
      dt-bindings: power: apple,pmgr-pwrstate: Add t8122 compatible
      dt-bindings: pwm: apple,s5l-fpwm: Add t8122 compatible
      dt-bindings: arm: apple: Add M3 based devices
      arm64: dts: apple: Initial t8122 (M3) device trees

 Documentation/devicetree/bindings/arm/apple.yaml   |   18 +
 .../devicetree/bindings/arm/apple/apple,pmgr.yaml  |    4 +-
 .../bindings/power/apple,pmgr-pwrstate.yaml        |    4 +-
 .../devicetree/bindings/pwm/apple,s5l-fpwm.yaml    |    1 +
 arch/arm64/boot/dts/apple/Makefile                 |    5 +
 arch/arm64/boot/dts/apple/t8122-j433.dts           |   19 +
 arch/arm64/boot/dts/apple/t8122-j434.dts           |   19 +
 arch/arm64/boot/dts/apple/t8122-j504.dts           |   37 +
 arch/arm64/boot/dts/apple/t8122-j613.dts           |   35 +
 arch/arm64/boot/dts/apple/t8122-j615.dts           |   35 +
 arch/arm64/boot/dts/apple/t8122-jxxx.dtsi          |   48 +
 arch/arm64/boot/dts/apple/t8122-pmgr.dtsi          | 1149 ++++++++++++++++++++
 arch/arm64/boot/dts/apple/t8122-usbpd-i2c.dtsi     |   32 +
 arch/arm64/boot/dts/apple/t8122.dtsi               |  444 ++++++++
 14 files changed, 1848 insertions(+), 2 deletions(-)
 create mode 100644 arch/arm64/boot/dts/apple/t8122-j433.dts
 create mode 100644 arch/arm64/boot/dts/apple/t8122-j434.dts
 create mode 100644 arch/arm64/boot/dts/apple/t8122-j504.dts
 create mode 100644 arch/arm64/boot/dts/apple/t8122-j613.dts
 create mode 100644 arch/arm64/boot/dts/apple/t8122-j615.dts
 create mode 100644 arch/arm64/boot/dts/apple/t8122-jxxx.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/t8122-pmgr.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/t8122-usbpd-i2c.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/t8122.dtsi

