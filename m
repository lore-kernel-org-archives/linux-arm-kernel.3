Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6485CD6E55
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 31 May 2026 06:08:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EXedMa3F9/2rK2uuNFkuGL7VYJbj96K9c+KvBlzH5Lo=; b=FnArNuknCKP3cb8FtD6MQzaFXM
	VNCUIow2jlw+RwAD1h5QXQrzy5eTszn7NShl4Env709b+nTStPPzWvutJ12F/KTz0/gFshIwo27yk
	G/nVxJJFnY5dxAqJVdsUytkP8io5XzNhog54Y4QEmlCc0ajpwbVshEhmKAh/O2Xv2tiJJNVU1sy1O
	KTIZrjNXi4Ulg0M5pubMdhrbiSDdw9HqeIwziPhna6rlhUuY/7VpcQfAPoZfIWVD5UiBT9XmqDusx
	9xW8r7PEqrgYGE2MVEdm/ueEZ7VUgVeQ1OEhGiVNQ0xRE3stlsLR8cA5A20ho8abDHduGax+0OllU
	03n9spqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTZLv-00000009H9p-0Stz;
	Sun, 31 May 2026 06:08:51 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTZLn-00000009H7j-0Gih
	for linux-arm-kernel@lists.infradead.org;
	Sun, 31 May 2026 06:08:43 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 84AA96001A;
	Sun, 31 May 2026 06:08:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AAC671F00893;
	Sun, 31 May 2026 06:08:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780207722;
	bh=EXedMa3F9/2rK2uuNFkuGL7VYJbj96K9c+KvBlzH5Lo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=fL5zcCN9wlgl719jz+O8g0FbMKXNGhkumsMP9mJPA+9l7+Ua+0rOnTW8RMFt6Z/fT
	 jKwBWtJfI9KkKurUx4JXUQ5DDuERHLU3StRYakyOwE+WJhKOjDRzQpL1BoCjUaCJgt
	 MooLA7MYtIPps+M9/R3yp8HGqA+6HriesKehH7Gz/A5V4GktC/8T1xP7qGbZH1uLv2
	 mGPc7nEXyOC3VcBFvTqs6EQxGM0Zo1w1jN/xnI3i/Z+QpTZbaoC8RmV+sWTIa1v0MV
	 6+/9Ba1xGXOFL0OSXc7yDkqMnURqyT0XLbAs/Rh2EDCTgqiqUAXIofNTVwqe/d/0yS
	 hKPBmH6in1ykQ==
From: Thierry Reding <thierry.reding@kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@kernel.org>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 5/6] ARM: tegra: Device tree changes for v7.2-rc1
Date: Sun, 31 May 2026 08:08:22 +0200
Message-ID: <20260531060825.1855391-5-thierry.reding@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260531060825.1855391-1-thierry.reding@kernel.org>
References: <20260531060825.1855391-1-thierry.reding@kernel.org>
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

The following changes since commit 254f49634ee16a731174d2ae34bc50bd5f45e731:

  Linux 7.1-rc1 (2026-04-26 14:19:00 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-7.2-arm-dt

for you to fetch changes up to 774bc2764647cfd6b65727cfa978d809f11df392:

  ARM: tegra: tf600t: Invert accelerometer calibration matrix (2026-05-29 14:36:18 +0200)

Thanks,
Thierry

----------------------------------------------------------------
ARM: tegra: Device tree changes for v7.2-rc1

The bulk of this is various improvements for some of the older ASUS and
LG devices, but there's also support for interconnects on Tegra114 to
help improve memory frequency scaling.

----------------------------------------------------------------
Brian Norris (1):
      ARM: tegra: Add #{address,size}-cells to Chromium-based /firmware

Ion Agorria (1):
      ARM: tegra: p880: Lower CPU thermal limit

Svyatoslav Ryhel (13):
      dt-bindings: memory: Document Tegra114 Memory Controller
      dt-bindings: memory: Document Tegra114 External Memory Controller
      ARM: tegra: Add EMC OPP and ICC properties to Tegra114 EMC and ACTMON device-tree nodes
      ARM: tegra: Add DC interconnections for Tegra114
      ARM: tegra: Configure Tegra114 power domains
      ARM: tegra: lg-x3: Complete video device graph
      ARM: tegra: lg-x3: Set PMIC's RTC address
      ARM: tegra: grouper: Add support for front camera
      ARM: tegra: transformer: Add support for front camera
      ARM: tegra: transformers: Add connector node for common trees
      ARM: tegra: tf600t: Configure panel
      ARM: tegra: tf600t: Drop backlight regulator
      ARM: tegra: tf600t: Invert accelerometer calibration matrix

Thierry Reding (1):
      Merge tag 'memory-controller-drv-tegra-dt-bindings-7.2' of https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux-mem-ctrl into for-7.2/arm/dt

 .../memory-controllers/nvidia,tegra124-emc.yaml    |  174 +--
 .../memory-controllers/nvidia,tegra124-mc.yaml     |   31 +-
 .../boot/dts/nvidia/tegra114-peripherals-opp.dtsi  | 1439 ++++++++++++++++++++
 arch/arm/boot/dts/nvidia/tegra114.dtsi             |  157 +++
 arch/arm/boot/dts/nvidia/tegra124-nyan.dtsi        |    5 +
 arch/arm/boot/dts/nvidia/tegra124-venice2.dts      |    5 +
 .../nvidia/tegra20-asus-transformer-common.dtsi    |   22 +-
 .../nvidia/tegra30-asus-nexus7-grouper-common.dtsi |  128 ++
 .../tegra30-asus-nexus7-grouper-maxim-pmic.dtsi    |    4 +-
 .../tegra30-asus-nexus7-grouper-ti-pmic.dtsi       |    4 +-
 arch/arm/boot/dts/nvidia/tegra30-asus-tf600t.dts   |   71 +-
 .../nvidia/tegra30-asus-transformer-common.dtsi    |  159 ++-
 arch/arm/boot/dts/nvidia/tegra30-lg-p880.dts       |   41 +
 arch/arm/boot/dts/nvidia/tegra30-lg-p895.dts       |   46 +
 arch/arm/boot/dts/nvidia/tegra30-lg-x3.dtsi        |  157 ++-
 include/dt-bindings/memory/tegra114-mc.h           |   67 +
 16 files changed, 2302 insertions(+), 208 deletions(-)
 create mode 100644 arch/arm/boot/dts/nvidia/tegra114-peripherals-opp.dtsi

