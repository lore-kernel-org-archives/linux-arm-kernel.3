Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C88CD2E9FF
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Nov 2024 14:21:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:From:MIME-Version:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=aEVarbYNpG1XTdpgob6gXdcurOp9nVWTJs4CKoAmY1I=; b=Zlvd+cCSFuAltRELwQNtI7JzC/
	6j/4dZZmJM8fwpWih3xeyHv7OnHSZsVCp5qzTh4+EUJkAx6VG1h+jyYsnL1VNJhzNt821jGvmTDKz
	2bhkMkGz22OqQ1R1v10y3L5nKlgVaSE5ax6/v7Ym23YQICYu2CFG+O9E+iTdCYwbNQV3DI9MzRkT5
	ejadRs0rv5ojtL4EL1N50/9G8OlCOllAfi/bHHZcC2ud1pXrsraYcapbhGflBS9GT9TuiX46FIOOF
	HjFA8THJye8TgFpvEwksTu0cE3T0PseHy4J03vmBfSVeuhq9ruLKULvZVd1WayPRxoKOwCKirowaq
	fvFplvtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAVHh-00000000Ikt-1CGL;
	Mon, 11 Nov 2024 14:20:53 +0000
Received: from marcansoft.com ([212.63.210.85] helo=mail.marcansoft.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAVFs-00000000IZL-0eQj
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 Nov 2024 14:19:03 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: marcan@marcan.st)
	by mail.marcansoft.com (Postfix) with ESMTPSA id 52B6042118;
	Mon, 11 Nov 2024 14:18:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=marcan.st; s=default;
	t=1731334733; bh=lMzik5o2zBHszPj4x+VSYPUbKw9fMBzUfko7NQ0We7U=;
	h=Date:From:Subject:To:Cc;
	b=D4YnzTza0fBoik+WOmYIyrsxf8zA8ajYxQ0QtEMPHp2RzeP68lKmAszEPSlkblLM6
	 xP6lk1DLEKImX4ZrMMr6yNyjqagpss04e9sP1gISIG4tfyA8Om+DCoQ9aim3mIxpSp
	 YeX42KTwIWZRKhcLcd/TooOtsTKBkLXVI4SUuOOlzX4RhkSyHyqLY/kAj3VwlWrrIK
	 j6RgjIuBge/Vgde9HV+CoB26x/NGZRFp5pb+XnU2j2e7zaFpEZk/AUJlWEEMEanExS
	 tXZtzLO5KK57JA86E1LtuB2OjLv2mEMkr0QxQHu85qC/kJQMnuRUQbgsNJyjdEGmMM
	 bhGmXnY9NbSTg==
Message-ID: <a8a19596-5d46-4562-9555-3b3ae7a5a3e5@marcan.st>
Date: Mon, 11 Nov 2024 23:18:52 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hector Martin <marcan@marcan.st>
Subject: [GIT PULL] Apple SoC DT updates for v6.13
To: SoC Team <soc@kernel.org>
Content-Language: en-US
Cc: Asahi Linux <asahi@lists.linux.dev>, LKML <linux-kernel@vger.kernel.org>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_061900_902079_C8D61BDB 
X-CRM114-Status: UNSURE (   8.68  )
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

Hi SoC folks,

Please merge these DT changes for v6.13.

This batch adds a bunch of pre-M1 Apple iDevice SoC and board device
trees. These are bare-bones right now, just basic bring-up.

-Hector

The following changes since commit 9852d85ec9d492ebef56dc5f229416c925758edc:

  Linux 6.12-rc1 (2024-09-29 15:06:19 -0700)

are available in the Git repository at:

  https://github.com/AsahiLinux/linux.git tags/asahi-soc-dt-6.13

for you to fetch changes up to 5c9de6f45db36b8a74c12e448cf9db87c97bf1e5:

  arm64: Kconfig: Update help text for CONFIG_ARCH_APPLE (2024-10-26 00:14:46 +0900)

----------------------------------------------------------------
Apple SoC DT updates for 6.13:

- Added base DTs for a bunch of non-Mac Apple iDevices (pre-M1)

----------------------------------------------------------------
Konrad Dybcio (8):
      arm64: dts: apple: Add A7 devices
      arm64: dts: apple: Add A8 devices
      arm64: dts: apple: Add A8X devices
      arm64: dts: apple: Add A9 devices
      arm64: dts: apple: Add A9X devices
      arm64: dts: apple: Add A10 devices
      arm64: dts: apple: Add A10X devices
      arm64: dts: apple: Add A11 devices

Nick Chan (12):
      dt-bindings: arm: cpus: Add Apple A7-A11 CPU cores
      dt-bindings: watchdog: apple,wdt: Add A7-A11 compatibles
      dt-bindings: pinctrl: apple,pinctrl: Add A7-A11 compatibles
      dt-bindings: arm: apple: Add A7 devices
      dt-bindings: arm: apple: Add A8 devices
      dt-bindings: arm: apple: Add A8X devices
      dt-bindings: arm: apple: Add A9 devices
      dt-bindings: arm: apple: Add A9X devices
      dt-bindings: arm: apple: Add A10 devices
      dt-bindings: arm: apple: Add A10X devices
      dt-bindings: arm: apple: Add A11 devices
      arm64: Kconfig: Update help text for CONFIG_ARCH_APPLE

 Documentation/devicetree/bindings/arm/apple.yaml   | 160 +++++++++++++-
 Documentation/devicetree/bindings/arm/cpus.yaml    |   8 +-
 .../devicetree/bindings/pinctrl/apple,pinctrl.yaml |   5 +
 .../devicetree/bindings/watchdog/apple,wdt.yaml    |   5 +
 arch/arm64/Kconfig.platforms                       |   4 +-
 arch/arm64/boot/dts/apple/Makefile                 |  53 +++++
 arch/arm64/boot/dts/apple/s5l8960x-5s.dtsi         |  51 +++++
 arch/arm64/boot/dts/apple/s5l8960x-air1.dtsi       |  51 +++++
 arch/arm64/boot/dts/apple/s5l8960x-common.dtsi     |  48 +++++
 arch/arm64/boot/dts/apple/s5l8960x-j71.dts         |  14 ++
 arch/arm64/boot/dts/apple/s5l8960x-j72.dts         |  14 ++
 arch/arm64/boot/dts/apple/s5l8960x-j73.dts         |  14 ++
 arch/arm64/boot/dts/apple/s5l8960x-j85.dts         |  14 ++
 arch/arm64/boot/dts/apple/s5l8960x-j85m.dts        |  14 ++
 arch/arm64/boot/dts/apple/s5l8960x-j86.dts         |  14 ++
 arch/arm64/boot/dts/apple/s5l8960x-j86m.dts        |  14 ++
 arch/arm64/boot/dts/apple/s5l8960x-j87.dts         |  14 ++
 arch/arm64/boot/dts/apple/s5l8960x-j87m.dts        |  14 ++
 arch/arm64/boot/dts/apple/s5l8960x-mini2.dtsi      |  51 +++++
 arch/arm64/boot/dts/apple/s5l8960x-mini3.dtsi      |  14 ++
 arch/arm64/boot/dts/apple/s5l8960x-n51.dts         |  14 ++
 arch/arm64/boot/dts/apple/s5l8960x-n53.dts         |  14 ++
 arch/arm64/boot/dts/apple/s5l8960x.dtsi            | 113 ++++++++++
 arch/arm64/boot/dts/apple/s800-0-3-common.dtsi     |  48 +++++
 arch/arm64/boot/dts/apple/s8000-j71s.dts           |  15 ++
 arch/arm64/boot/dts/apple/s8000-j72s.dts           |  15 ++
 arch/arm64/boot/dts/apple/s8000-n66.dts            |  15 ++
 arch/arm64/boot/dts/apple/s8000-n69u.dts           |  15 ++
 arch/arm64/boot/dts/apple/s8000-n71.dts            |  15 ++
 arch/arm64/boot/dts/apple/s8000.dtsi               | 144 +++++++++++++
 arch/arm64/boot/dts/apple/s8001-common.dtsi        |  48 +++++
 arch/arm64/boot/dts/apple/s8001-j127.dts           |  14 ++
 arch/arm64/boot/dts/apple/s8001-j128.dts           |  14 ++
 arch/arm64/boot/dts/apple/s8001-j98a.dts           |  14 ++
 arch/arm64/boot/dts/apple/s8001-j99a.dts           |  14 ++
 arch/arm64/boot/dts/apple/s8001-pro.dtsi           |  44 ++++
 arch/arm64/boot/dts/apple/s8001.dtsi               | 133 ++++++++++++
 arch/arm64/boot/dts/apple/s8003-j71t.dts           |  15 ++
 arch/arm64/boot/dts/apple/s8003-j72t.dts           |  15 ++
 arch/arm64/boot/dts/apple/s8003-n66m.dts           |  15 ++
 arch/arm64/boot/dts/apple/s8003-n69.dts            |  15 ++
 arch/arm64/boot/dts/apple/s8003-n71m.dts           |  15 ++
 arch/arm64/boot/dts/apple/s8003.dtsi               |  21 ++
 arch/arm64/boot/dts/apple/s800x-6s.dtsi            |  49 +++++
 arch/arm64/boot/dts/apple/s800x-ipad5.dtsi         |  43 ++++
 arch/arm64/boot/dts/apple/s800x-se.dtsi            |  49 +++++
 arch/arm64/boot/dts/apple/t7000-6.dtsi             |  50 +++++
 arch/arm64/boot/dts/apple/t7000-common.dtsi        |  36 ++++
 arch/arm64/boot/dts/apple/t7000-handheld.dtsi      |  27 +++
 arch/arm64/boot/dts/apple/t7000-j42d.dts           |  31 +++
 arch/arm64/boot/dts/apple/t7000-j96.dts            |  14 ++
 arch/arm64/boot/dts/apple/t7000-j97.dts            |  14 ++
 arch/arm64/boot/dts/apple/t7000-mini4.dtsi         |  51 +++++
 arch/arm64/boot/dts/apple/t7000-n102.dts           |  48 +++++
 arch/arm64/boot/dts/apple/t7000-n56.dts            |  14 ++
 arch/arm64/boot/dts/apple/t7000-n61.dts            |  14 ++
 arch/arm64/boot/dts/apple/t7000.dtsi               | 125 +++++++++++
 arch/arm64/boot/dts/apple/t7001-air2.dtsi          |  74 +++++++
 arch/arm64/boot/dts/apple/t7001-j81.dts            |  14 ++
 arch/arm64/boot/dts/apple/t7001-j82.dts            |  14 ++
 arch/arm64/boot/dts/apple/t7001.dtsi               | 123 +++++++++++
 arch/arm64/boot/dts/apple/t8010-7.dtsi             |  43 ++++
 arch/arm64/boot/dts/apple/t8010-common.dtsi        |  48 +++++
 arch/arm64/boot/dts/apple/t8010-d10.dts            |  14 ++
 arch/arm64/boot/dts/apple/t8010-d101.dts           |  14 ++
 arch/arm64/boot/dts/apple/t8010-d11.dts            |  14 ++
 arch/arm64/boot/dts/apple/t8010-d111.dts           |  14 ++
 arch/arm64/boot/dts/apple/t8010-ipad6.dtsi         |  44 ++++
 arch/arm64/boot/dts/apple/t8010-ipad7.dtsi         |  14 ++
 arch/arm64/boot/dts/apple/t8010-j171.dts           |  14 ++
 arch/arm64/boot/dts/apple/t8010-j172.dts           |  14 ++
 arch/arm64/boot/dts/apple/t8010-j71b.dts           |  14 ++
 arch/arm64/boot/dts/apple/t8010-j72b.dts           |  14 ++
 arch/arm64/boot/dts/apple/t8010-n112.dts           |  47 +++++
 arch/arm64/boot/dts/apple/t8010.dtsi               | 133 ++++++++++++
 arch/arm64/boot/dts/apple/t8011-common.dtsi        |  46 ++++
 arch/arm64/boot/dts/apple/t8011-j105a.dts          |  16 ++
 arch/arm64/boot/dts/apple/t8011-j120.dts           |  16 ++
 arch/arm64/boot/dts/apple/t8011-j121.dts           |  16 ++
 arch/arm64/boot/dts/apple/t8011-j207.dts           |  16 ++
 arch/arm64/boot/dts/apple/t8011-j208.dts           |  16 ++
 arch/arm64/boot/dts/apple/t8011-pro2.dtsi          |  42 ++++
 arch/arm64/boot/dts/apple/t8011.dtsi               | 141 +++++++++++++
 arch/arm64/boot/dts/apple/t8015-8.dtsi             |  13 ++
 arch/arm64/boot/dts/apple/t8015-8plus.dtsi         |   9 +
 arch/arm64/boot/dts/apple/t8015-common.dtsi        |  48 +++++
 arch/arm64/boot/dts/apple/t8015-d20.dts            |  14 ++
 arch/arm64/boot/dts/apple/t8015-d201.dts           |  14 ++
 arch/arm64/boot/dts/apple/t8015-d21.dts            |  14 ++
 arch/arm64/boot/dts/apple/t8015-d211.dts           |  14 ++
 arch/arm64/boot/dts/apple/t8015-d22.dts            |  14 ++
 arch/arm64/boot/dts/apple/t8015-d221.dts           |  14 ++
 arch/arm64/boot/dts/apple/t8015-x.dtsi             |  13 ++
 arch/arm64/boot/dts/apple/t8015.dtsi               | 234 +++++++++++++++++++++
 94 files changed, 3298 insertions(+), 4 deletions(-)
 create mode 100644 arch/arm64/boot/dts/apple/s5l8960x-5s.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/s5l8960x-air1.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/s5l8960x-common.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/s5l8960x-j71.dts
 create mode 100644 arch/arm64/boot/dts/apple/s5l8960x-j72.dts
 create mode 100644 arch/arm64/boot/dts/apple/s5l8960x-j73.dts
 create mode 100644 arch/arm64/boot/dts/apple/s5l8960x-j85.dts
 create mode 100644 arch/arm64/boot/dts/apple/s5l8960x-j85m.dts
 create mode 100644 arch/arm64/boot/dts/apple/s5l8960x-j86.dts
 create mode 100644 arch/arm64/boot/dts/apple/s5l8960x-j86m.dts
 create mode 100644 arch/arm64/boot/dts/apple/s5l8960x-j87.dts
 create mode 100644 arch/arm64/boot/dts/apple/s5l8960x-j87m.dts
 create mode 100644 arch/arm64/boot/dts/apple/s5l8960x-mini2.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/s5l8960x-mini3.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/s5l8960x-n51.dts
 create mode 100644 arch/arm64/boot/dts/apple/s5l8960x-n53.dts
 create mode 100644 arch/arm64/boot/dts/apple/s5l8960x.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/s800-0-3-common.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/s8000-j71s.dts
 create mode 100644 arch/arm64/boot/dts/apple/s8000-j72s.dts
 create mode 100644 arch/arm64/boot/dts/apple/s8000-n66.dts
 create mode 100644 arch/arm64/boot/dts/apple/s8000-n69u.dts
 create mode 100644 arch/arm64/boot/dts/apple/s8000-n71.dts
 create mode 100644 arch/arm64/boot/dts/apple/s8000.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/s8001-common.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/s8001-j127.dts
 create mode 100644 arch/arm64/boot/dts/apple/s8001-j128.dts
 create mode 100644 arch/arm64/boot/dts/apple/s8001-j98a.dts
 create mode 100644 arch/arm64/boot/dts/apple/s8001-j99a.dts
 create mode 100644 arch/arm64/boot/dts/apple/s8001-pro.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/s8001.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/s8003-j71t.dts
 create mode 100644 arch/arm64/boot/dts/apple/s8003-j72t.dts
 create mode 100644 arch/arm64/boot/dts/apple/s8003-n66m.dts
 create mode 100644 arch/arm64/boot/dts/apple/s8003-n69.dts
 create mode 100644 arch/arm64/boot/dts/apple/s8003-n71m.dts
 create mode 100644 arch/arm64/boot/dts/apple/s8003.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/s800x-6s.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/s800x-ipad5.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/s800x-se.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/t7000-6.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/t7000-common.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/t7000-handheld.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/t7000-j42d.dts
 create mode 100644 arch/arm64/boot/dts/apple/t7000-j96.dts
 create mode 100644 arch/arm64/boot/dts/apple/t7000-j97.dts
 create mode 100644 arch/arm64/boot/dts/apple/t7000-mini4.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/t7000-n102.dts
 create mode 100644 arch/arm64/boot/dts/apple/t7000-n56.dts
 create mode 100644 arch/arm64/boot/dts/apple/t7000-n61.dts
 create mode 100644 arch/arm64/boot/dts/apple/t7000.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/t7001-air2.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/t7001-j81.dts
 create mode 100644 arch/arm64/boot/dts/apple/t7001-j82.dts
 create mode 100644 arch/arm64/boot/dts/apple/t7001.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/t8010-7.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/t8010-common.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/t8010-d10.dts
 create mode 100644 arch/arm64/boot/dts/apple/t8010-d101.dts
 create mode 100644 arch/arm64/boot/dts/apple/t8010-d11.dts
 create mode 100644 arch/arm64/boot/dts/apple/t8010-d111.dts
 create mode 100644 arch/arm64/boot/dts/apple/t8010-ipad6.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/t8010-ipad7.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/t8010-j171.dts
 create mode 100644 arch/arm64/boot/dts/apple/t8010-j172.dts
 create mode 100644 arch/arm64/boot/dts/apple/t8010-j71b.dts
 create mode 100644 arch/arm64/boot/dts/apple/t8010-j72b.dts
 create mode 100644 arch/arm64/boot/dts/apple/t8010-n112.dts
 create mode 100644 arch/arm64/boot/dts/apple/t8010.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/t8011-common.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/t8011-j105a.dts
 create mode 100644 arch/arm64/boot/dts/apple/t8011-j120.dts
 create mode 100644 arch/arm64/boot/dts/apple/t8011-j121.dts
 create mode 100644 arch/arm64/boot/dts/apple/t8011-j207.dts
 create mode 100644 arch/arm64/boot/dts/apple/t8011-j208.dts
 create mode 100644 arch/arm64/boot/dts/apple/t8011-pro2.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/t8011.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/t8015-8.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/t8015-8plus.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/t8015-common.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/t8015-d20.dts
 create mode 100644 arch/arm64/boot/dts/apple/t8015-d201.dts
 create mode 100644 arch/arm64/boot/dts/apple/t8015-d21.dts
 create mode 100644 arch/arm64/boot/dts/apple/t8015-d211.dts
 create mode 100644 arch/arm64/boot/dts/apple/t8015-d22.dts
 create mode 100644 arch/arm64/boot/dts/apple/t8015-d221.dts
 create mode 100644 arch/arm64/boot/dts/apple/t8015-x.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/t8015.dtsi


