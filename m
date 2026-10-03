Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A7F4CA5FE3
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  3 Oct 2026 09:59:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QQUDK7iQZnXh2lBf7ATl7J/UaIvcvGDIkPs2KRMQAk0=; b=cQ3rcbNPx6DUOYbOUZWn3VwjkD
	rBYYTSuA9xUi/RixYPi3qmhCOLok59ETaw2XyKPpktXfusVGO0y4q2Uh99sEFwfhKSj1F0JAcJqzo
	ACnrarkzpb+VZ5bz61nfjHbhMBkW/gIENj9MyQje0GPdPqVKMt2YcxDKmjZL0BdXFHHtg/RJJsvaB
	UnVoMekkjIPV0IMOTP+/EtrF9FzzrURQRHz9LvaudOYF6klpmQYFtDrfFJoTxUqkcq9s8q6FktZ9f
	Vhz5UrAlCpok4o6Zaaifng1B9qV5gfpCdos1FlXPDBO5XacQBT6qkeT6J8HqlAyNMho+p8CaAoW7G
	mAbC+7/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCwWt-0000000DJkp-1XZ5;
	Sat, 03 Oct 2026 09:59:43 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCwWr-0000000DJjC-3kof
	for linux-arm-kernel@lists.infradead.org;
	Sat, 03 Oct 2026 09:59:41 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 9671B447DF;
	Sat,  3 Oct 2026 09:59:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3EDD1F0089B;
	Sat,  3 Oct 2026 09:59:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791021581;
	bh=QQUDK7iQZnXh2lBf7ATl7J/UaIvcvGDIkPs2KRMQAk0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=n+mqO0TOr77vBtY5/lGabd+8JO8E+Ss6lh2TW12NXZ4q3mGghP5yjuLhQrDE8eE8D
	 7S145Iuf8/zRb8lZFjwdCmLw7qNloUdcTQvs41c6fQlyHO81fl/+FTFbwfjcogCOih
	 n+3wRfJ0ysOmo8AXoKUi/TfY5uo8rkuVIJP1ycn8vdQRcsyLN9YdPY7pnqzgtBq89H
	 2+SByFHcQY6q5NSONE5/3AHklYmMWv+zcZSPnLGU5V3XKqgUq9X/DSyUWk6tlVugbV
	 v5oFaSLoiae9/hDzMBwoTppieOKfj+kmSW5OLP29AqWyooadp1/WCuqDAaKpJ/+4Zh
	 YQujM83GeVAgA==
From: Thierry Reding <thierry.reding@kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@kernel.org>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 6/7] arm64: tegra: Changes for v7.4-rc1
Date: Sat,  3 Oct 2026 11:59:21 +0200
Message-ID: <20261003095924.1370238-6-thierry.reding@kernel.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261003095924.1370238-1-thierry.reding@kernel.org>
References: <20261003095924.1370238-1-thierry.reding@kernel.org>
Content-Type: text/plain; charset="utf-8"
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

From: Thierry Reding <thierry.reding@gmail.com>

Hi ARM SoC maintainers,

The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:

  Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-7.4-arm64-dt

for you to fetch changes up to ad4deb2e42ebb94425c003ca3ca39691ebe61e0f:

  arm64: tegra: Add Tegra264 SDMMC1 device tree node (2026-10-03 00:56:24 +0200)

Thanks,
Thierry

----------------------------------------------------------------
arm64: tegra: Changes for v7.4-rc1

This set of changes contain a lot of cleanups to existing device trees,
most of which fix issues with the device tree validation.

There are also various improvements to Jetson AGX Thor and the DevKit as
well as IGX Orin, making all these Tegra264-based devices more capable.

----------------------------------------------------------------
Aaron Kling (1):
      arm64: tegra: Enable DMA Support on Tegra194 QSPI

Diogo Ivo (1):
      arm64: tegra: Move Tegra210 AHUB audio ports/endpoints to SoC DTSI

Jon Hunter (1):
      arm64: tegra: Add the USB Type-C controller for IGX Orin

Krzysztof Kozlowski (1):
      arm64: tegra: Replace spaces indentation with tabs

Manikanta Maddireddy (2):
      arm64: tegra: Use iommus for PCIe endpoint controllers
      arm64: tegra: Add PCIe wake GPIO for Jetson Orin NX/Nano

Prathamesh Shete (1):
      arm64: tegra: Add Tegra264 SDMMC1 device tree node

Thierry Reding (26):
      arm64: tegra: Add PWM controllers on Tegra264
      arm64: tegra: Add PWM fan on Jetson AGX Thor DevKit
      arm64: tegra: Reorder reg and reg-names to match bindings
      arm64: tegra: Add PCIe root ports on Tegra264
      arm64: tegra: Clean up AHUB on Tegra132
      arm64: tegra: Adjust AHUB range on Tegra210
      arm64: tegra: Clean up AHUB on Tegra186
      arm64: tegra: Clean up AHUB on Tegra194
      arm64: tegra: Clean up AHUB on Tegra234
      arm64: tegra: Clean up AHUB on Tegra264
      arm64: tegra: Clean up some whitespace issues on Tegra264
      arm64: tegra: Fix up cooling map names on Tegra194
      arm64: tegra: Fix up cooling map names on Tegra186
      arm64: tegra: Fix up cooling map names on Tegra210
      arm64: tegra: Use consistent key code for force-recovery button
      arm64: tegra: Enable GPIO keys on Jetson AGX Thor
      arm64: tegra: Add thermal zones for Tegra264
      arm64: tegra: Add cooling device on Jetson AGX Thor DevKit
      arm64: tegra: Enable built-in RTC on Jetson AGX Thor
      arm64: tegra: Add FUSE block on Tegra264
      arm64: tegra: Add missing *-cells properties for I2C controllers
      arm64: tegra: Add I2C aliases for Tegra264
      arm64: tegra: Add NVIDIA Jetson AGX Thor module EEPROM
      arm64: tegra: Add NVIDIA Jetson AGX Thor system EEPROM
      arm64: tegra: Add thermal sensor for Jetson AGX Thor
      arm64: tegra: Add Tegra132 specific compatible for AHUB

 arch/arm64/boot/dts/nvidia/tegra132.dtsi           |   22 +-
 .../dts/nvidia/tegra186-p3509-0000+p3636-0001.dts  |    8 +-
 arch/arm64/boot/dts/nvidia/tegra186.dtsi           |   76 +-
 arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts |    8 +-
 .../arm64/boot/dts/nvidia/tegra194-p3509-0000.dtsi |    8 +-
 arch/arm64/boot/dts/nvidia/tegra194.dtsi           |  113 +-
 arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dts | 1120 -------------------
 arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts | 1011 +-----------------
 arch/arm64/boot/dts/nvidia/tegra210.dtsi           | 1126 +++++++++++++++++++-
 .../boot/dts/nvidia/tegra234-p3737-0000+p3701.dtsi |    9 +-
 .../dts/nvidia/tegra234-p3740-0002+p3701-0008.dts  |   45 +-
 .../boot/dts/nvidia/tegra234-p3768-0000+p3767.dtsi |   12 +-
 arch/arm64/boot/dts/nvidia/tegra234.dtsi           |   86 +-
 arch/arm64/boot/dts/nvidia/tegra264-p3834.dtsi     |   57 +
 .../boot/dts/nvidia/tegra264-p4071-0000+p3834.dtsi |  106 ++
 arch/arm64/boot/dts/nvidia/tegra264.dtsi           |  794 +++++++++-----
 .../boot/dts/nvidia/thermal/nvidia,tegra264-bpmp.h |   20 +
 17 files changed, 2030 insertions(+), 2591 deletions(-)
 create mode 100644 arch/arm64/boot/dts/nvidia/thermal/nvidia,tegra264-bpmp.h

