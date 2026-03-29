Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECF2DF3D60E
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 29 Mar 2026 15:11:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=X6Q/IMYdEltHw+qjvM3FiAs8ZC3+A6Oq5wOLrOuixiE=; b=h+Wh01dOPseg74rdsWDlEx+I+A
	99xXnD9OpLjFlqh9QtO7tuuRUxCnE+636oaEtyvpRyGhYarrYX0rRipQ4zbjqsyBeJl7MrLm0uzKm
	fUJ41bruEqhWr6Em7CqsJQxdLy53ENjWF1kGeRozreOEDJdfVamMGERBLprG+ayDO4Px/LSqWtGRJ
	22knM7f0nXNPyrxOBhowPmjiHE7acEa5WyGSolF2YAKM2miUeHynk3rBieNLgKdcvA7LIhzb8RKF4
	uBzSoFy/rw3Z51G9bW2GVJ7rQydNBoT/uzILhJrbkNj4NZCLZei+4H1bgjpgpTFB0eU0ktXz/sMvS
	t9TVQIKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6rn4-0000000A30z-01RK;
	Sun, 29 Mar 2026 15:11:02 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6rn1-0000000A2zX-1xfQ
	for linux-arm-kernel@lists.infradead.org;
	Sun, 29 Mar 2026 15:11:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id AA7804086E;
	Sun, 29 Mar 2026 15:10:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A824C116C6;
	Sun, 29 Mar 2026 15:10:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774797052;
	bh=P2wTGkHTJGDVrYxmEmU2/P6KaIGmZDeFXomL2edPRdg=;
	h=From:To:Cc:Subject:Date:From;
	b=iwqnF1oubbdzl/60R4ybE+vt5J4BI7zfIck5GNPX8r9Fu+FW2CjuAbEMfT8edc4dC
	 SUl225X87kEARiv1UBRoK+uGlDBMrppwwZ0W5rMoWw1bskFj7uN2tMA6wQQOVcRhMC
	 +mf8pYui1pukoqFY7A/MpyYDxB3sKmFLZdBvVA3ED+S29YzkvMHLX1fA09mxqmjJ+N
	 ydZxZivknIPuQpa+0cRwSpKwE08lrHNrsV7DritYX/IfDjG0yA36XOtmPQ7F+RI9hL
	 wR35x4VI1xIprRbDgDdYB+kJXOUw7SgBdnr1WJHZM6rChtYcSS2ook5fOUldhpEvoh
	 eZe8Fi0K6RAKQ==
From: Thierry Reding <thierry.reding@kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 1/7] dt-bindings: Changes for v7.1-rc1
Date: Sun, 29 Mar 2026 17:10:38 +0200
Message-ID: <20260329151045.1443133-1-thierry.reding@kernel.org>
X-Mailer: git-send-email 2.52.0
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260329_081059_548620_6850FAEE 
X-CRM114-Status: UNSURE (   9.86  )
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

From: Thierry Reding <thierry.reding@gmail.com>

Hi ARM SoC maintainers,

The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f:

  Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-7.1-dt-bindings

for you to fetch changes up to bed2f5b4de6c6fd8f8928f6373ad92e8795c370f:

  dt-bindings: arm: tegra: Document Jetson AGX Thor DevKit (2026-03-28 01:05:24 +0100)

Thanks,
Thierry

----------------------------------------------------------------
dt-bindings: Changes for v7.1-rc1

This contains a few conversions to DT schema along with various
additions and fixes to reduce the amount of validation warnings.

Included are also a new binding for the PCIe controller found on
Tegra264 as well as compatible strings for the Jetson AGX Thor
Developer Kit.

----------------------------------------------------------------
Sumit Gupta (1):
      dt-bindings: arm: tegra: Add Tegra238 CBB compatible strings

Svyatoslav Ryhel (1):
      dt-bindings: display: tegra: Document Tegra20 HDMI port

Thierry Reding (9):
      dt-bindings: pci: Document the NVIDIA Tegra264 PCIe controller
      dt-bindings: phy: tegra-xusb: Document Type C support
      dt-bindings: clock: tegra124-dfll: Convert to json-schema
      dt-bindings: interrupt-controller: tegra: Fix reg entries
      dt-bindings: arm: tegra: Add missing compatible strings
      dt-bindings: phy: tegra: Document Tegra210 USB PHY
      dt-bindings: memory: Add Tegra210 memory controller bindings
      dt-bindings: memory: tegra210: Mark EMC as cooling device
      dt-bindings: arm: tegra: Document Jetson AGX Thor DevKit

 Documentation/devicetree/bindings/arm/tegra.yaml   |  56 +++-
 .../bindings/arm/tegra/nvidia,tegra234-cbb.yaml    |   4 +
 .../bindings/clock/nvidia,tegra124-dfll.txt        | 155 -----------
 .../bindings/clock/nvidia,tegra124-dfll.yaml       | 290 +++++++++++++++++++++
 .../display/tegra/nvidia,tegra20-hdmi.yaml         |  13 +-
 .../interrupt-controller/nvidia,tegra20-ictlr.yaml |  23 +-
 .../memory-controllers/nvidia,tegra210-emc.yaml    |   6 +-
 .../memory-controllers/nvidia,tegra210-mc.yaml     |  77 ++++++
 .../bindings/pci/nvidia,tegra264-pcie.yaml         | 149 +++++++++++
 .../bindings/phy/nvidia,tegra194-xusb-padctl.yaml  |  39 ++-
 .../bindings/phy/nvidia,tegra20-usb-phy.yaml       |   1 +
 11 files changed, 649 insertions(+), 164 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/clock/nvidia,tegra124-dfll.txt
 create mode 100644 Documentation/devicetree/bindings/clock/nvidia,tegra124-dfll.yaml
 create mode 100644 Documentation/devicetree/bindings/memory-controllers/nvidia,tegra210-mc.yaml
 create mode 100644 Documentation/devicetree/bindings/pci/nvidia,tegra264-pcie.yaml

