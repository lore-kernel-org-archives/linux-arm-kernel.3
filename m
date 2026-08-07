Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04A6AC2A09B
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Aug 2026 15:42:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=rA49zl9sY0e+xDBXbaY5286T7pTnj1IO0yTCmjFA2II=; b=RnNLtUYTFLkwlgNA4Ca5MdJWwb
	ShWFg6o9WMqROmRsjop9zgIeKckJlcF16U+XCorHnSjXQRZ8d0G40VTRmQbBzUeM/6AprvXwxdOYz
	cLW78EnXcJrL7JzdYek3WUq+vnhXaKR6LYoE5TiOky20+o2RoA4VrebIaddyQd28eIT80f1d3pymh
	KRs8QXThUJ4Q13LcVsvETh7/NkgWgD+n0SeN6Ucwefig5NR1ccAyDS38OARJBdP3n3DyFId/ni0my
	B1PnXe8uLUIkYFSLUfDjsNsb+M06pbFdhRIj+jqWpx14Ox2d2lhnYqJ++OqpPXBlAcSKVMRkSX0u0
	GVkHKR5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsMhl-00000008MkS-2hTI;
	Fri, 07 Aug 2026 15:41:53 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsMhj-00000008Mjv-49ag
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Aug 2026 15:41:52 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id AEA48404F5;
	Fri,  7 Aug 2026 15:41:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C09291F00A3A;
	Fri,  7 Aug 2026 15:41:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786117311;
	bh=rA49zl9sY0e+xDBXbaY5286T7pTnj1IO0yTCmjFA2II=;
	h=From:To:Cc:Subject:Date;
	b=GnJqXTDPnaUxDgRuW7bToK5Bo8Rw0cSkaTBSGdxSoPRpQ9974R9lu/zNyyIT3Uxnz
	 oYhlH1jJhD8M+KemVq21kevKIvy2u4TVLTUzRDEsS1e8cBIXNY35RVvXFTIB/+/o8q
	 ko6aN6q7IcwtLF0Mp8XBq8XBme7YTcvlNuGYrYJ6zsE1//COvHjXS293G7lS7oBF8U
	 qrIJnt3wadwntkMhx0Ea+RaUhL0PVq9I8qTG1907QXbIpTVUESCYH7L6U0M9fcqnan
	 8Xq3pV83u3bcqj09Tx7jziqgvohqeZCPL5oc7IOonx1hNJhYsuFEUA9Tn5DLt9t9oq
	 Rp2O+S10SvkzQ==
From: Bjorn Andersson <andersson@kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Arnd Bergmann <arnd@arndb.de>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
	Maulik Shah <maulik.shah@oss.qualcomm.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Shawn Guo <shengchao.guo@oss.qualcomm.com>,
	Sumit Garg <sumit.garg@oss.qualcomm.com>,
	Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
Subject: [GIT PULL] More Qualcomm driver updates for v7.3
Date: Fri,  7 Aug 2026 10:41:49 -0500
Message-ID: <20260807154149.603041-1-andersson@kernel.org>
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


The following changes since commit 43584144a46bccbe90482cd8eede9596d8fc47dc:

  soc: qcom: llcc: Skip ECC interrupt setup on Shikra, pre-configured by DSF (2026-07-17 17:22:44 -0500)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-drivers-for-7.3-2

for you to fetch changes up to 94d3305d990b055e1561e3b78275344b1f40c86e:

  media: qcom: Switch to generic PAS TZ APIs (2026-08-04 10:26:42 -0500)

----------------------------------------------------------------
More Qualcomm driver updates for v7.3

Add SMEM parsing for DDR configuration data and use its highest bank
address bit to select the appropriate UBWC configuration.

Enable generic PAS trusted-zone APIs for the Iris and Venus media drivers.

Fix SCM probe retry state, reserved-memory cleanup, and an early IRQ-handler
NULL dereference. Enable QSEECOM EFI variable access on the Asus Zenbook A16.

Correct GENI firmware-size validation using the hardware CFG RAM depth and
correct the PMIC GLINK Thunderbolt extradata layout.

Document the Nord AOSS side channel and the IMEM minidump SRAM property.
Clean up Qualcomm statistics macros and the WCNSS binding schema.

----------------------------------------------------------------
Konrad Dybcio (5):
      soc: qcom: pmic_glink_altmode: Define the TBT extradata properly
      firmware: qcom: scm: Allow QSEECOM on Asus Zenbook A16 (UX3607OA)
      soc: qcom: smem: Use 'unsigned int' instead of 'unsigned'
      soc: qcom: smem: Expose DDR data from SMEM
      soc: qcom: ubwc: Get HBB from SMEM

Krzysztof Kozlowski (1):
      dt-bindings: soc: qcom,wcnss: Drop redundant $ref of firmware-name property

Maulik Shah (2):
      soc: qcom: qcom_stats: Remove unused macro definitions
      soc: qcom: qcom_stats: Replace CLIENT_VOTES_OFFSET macro with sizeof()

Mukesh Ojha (4):
      firmware: qcom: scm: Fix NULL dereference in IRQ handler before __scm is published
      firmware: qcom: scm: Fix reserved memory cleanup on probe failure
      firmware: qcom: scm: Fix tzmem state on probe retry
      dt-bindings: sram: qcom,imem: Add minidump-sram pattern property

Shawn Guo (1):
      dt-bindings: soc: qcom,aoss-qmp: Document Nord AOSS side channel

Sumit Garg (1):
      media: qcom: Switch to generic PAS TZ APIs

Viken Dadhaniya (1):
      soc: qcom: geni-se: Use HW PROG_RAM_DEPTH to validate firmware size

 .../bindings/soc/qcom/qcom,aoss-qmp.yaml           |   1 +
 .../devicetree/bindings/soc/qcom/qcom,wcnss.yaml   |   4 +-
 .../devicetree/bindings/sram/qcom,imem.yaml        |  16 +
 drivers/firmware/qcom/qcom_scm-smc.c               |   2 +-
 drivers/firmware/qcom/qcom_scm.c                   |  43 ++-
 drivers/firmware/qcom/qcom_scm.h                   |   2 +-
 drivers/firmware/qcom/qcom_tzmem.c                 |  13 +-
 drivers/media/platform/qcom/iris/Kconfig           |  27 +-
 drivers/media/platform/qcom/iris/iris_firmware.c   |   9 +-
 drivers/media/platform/qcom/venus/Kconfig          |   1 +
 drivers/media/platform/qcom/venus/firmware.c       |  11 +-
 drivers/soc/qcom/Makefile                          |   3 +-
 drivers/soc/qcom/pmic_glink_altmode.c              |   3 +-
 drivers/soc/qcom/qcom-geni-se.c                    |  24 +-
 drivers/soc/qcom/qcom_stats.c                      |   9 +-
 drivers/soc/qcom/smem.c                            |  81 ++--
 drivers/soc/qcom/smem.h                            |  12 +
 drivers/soc/qcom/smem_dramc.c                      | 430 +++++++++++++++++++++
 drivers/soc/qcom/ubwc_config.c                     |  40 +-
 include/linux/soc/qcom/geni-se.h                   |   4 +
 include/linux/soc/qcom/smem.h                      |   2 +
 21 files changed, 635 insertions(+), 102 deletions(-)
 create mode 100644 drivers/soc/qcom/smem.h
 create mode 100644 drivers/soc/qcom/smem_dramc.c

