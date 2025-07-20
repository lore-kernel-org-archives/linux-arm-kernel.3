Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A161C83F27
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 20 Jul 2025 03:10:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=R/7pankjeYjayVQ3GYY10kZLJpAcjh4ftqZNu2qM2lM=; b=K+KLYgOnt5h6v0sH2Y4UpeL4Xa
	dHfPuMEvTV/Ara3jC7r6B95rsnSaJb+4YV5+ighU64fhfGkG4C8oFnT/R0U8FNBWJTRKVAOjMxLs6
	kUvswsvOEeDdzLh946nmBtv4GjsogpS2pQyyBaLy2CIAaZFd6VcjHj068ahvBM+tkyMovEHo+AsNh
	jKtOKIa4w+/o2hbv823ez9xjbV+G/l4VwBkDGw7Y6QF58BY1qpmWBIM0M8cBx3u2tTHPenyGESIHR
	LhmyPbeKYFTSmDVZzJ0D8Zv8feO1o1/ikwAiKeCRiGj+kfQvqLUmQJmXLfe5rLLI1ZRQUJE63ZmuU
	dKahDQBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udKRP-0000000EqQU-0A1V;
	Sun, 20 Jul 2025 03:10:19 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udKOx-0000000EqLe-0JSD
	for linux-arm-kernel@lists.infradead.org;
	Sun, 20 Jul 2025 03:07:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 36A6245AE9;
	Sun, 20 Jul 2025 03:07:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 394C1C4CEF4;
	Sun, 20 Jul 2025 03:07:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752980865;
	bh=noUq5QeP6M5pVXcgC2Y/bXEJ5fNxp/pT0yKbZKkLxek=;
	h=From:To:Cc:Subject:Date:From;
	b=lmd+oZN39JkMHWmfn0BijZDP9B6AOQn7+Bm9XP72IxkiaZbsVtMVJjUuTUcd8z6oC
	 Opg0wy8jjDOyBfVN+yVWgKiDfyBTiTN7SkhhgU/m6W3YzTnlJOfgX12oz6EuDU+jMO
	 GAyv8pxWZla5unXYwXo16thsHQ8HWzTWfeeBJkvpE4Rs2nhzTGpMseeuQefGb8bceb
	 Gcz6dp1efBCu0TjI7nSf3HKi1a1EAmUTSPz6FPf0fwasfK7rlKxHKMm6+9JW6Fy1IL
	 zhcuBg9NkIXB+JF8CJKb0z6xqGXHvcVrON4xJxH0Cy0BbnZrjCY0DWfI4B6S7YrZsS
	 6tJ+hky7iK4ZQ==
From: Bjorn Andersson <andersson@kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Arnd Bergmann <arnd@arndb.de>,
	Luca Weiss <luca.weiss@fairphone.com>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Johan Hovold <johan@kernel.org>,
	Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
	Maulik Shah <maulik.shah@oss.qualcomm.com>,
	Rakesh Kota <rakesh.kota@oss.qualcomm.com>
Subject: [GIT PULL] More Qualcomm driver updates for v6.17
Date: Sat, 19 Jul 2025 22:07:41 -0500
Message-ID: <20250720030743.285440-1-andersson@kernel.org>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250719_200747_157737_6FD0C533 
X-CRM114-Status: UNSURE (   9.68  )
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


The following changes since commit 9f35ab0e53ccbea57bb9cbad8065e0406d516195:

  soc: qcom: mdt_loader: Fix error return values in mdt_header_valid() (2025-06-25 14:31:31 -0500)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-drivers-for-6.17-2

for you to fetch changes up to 4587d3910f805ac74348e6c320071a9b65be035e:

  dt-bindings: soc: qcom: qcom,pmic-glink: document Milos compatible (2025-07-16 22:59:58 -0500)

----------------------------------------------------------------
More Qualcomm driver updates for v6.17

Fix race condition during SCM driver initialization, in relation to
tzmem and waitqueue irq handling,

Make the rpmh RSC driver support version 4 of the IP block.

Add SM7635 family and related PMICs to the socinfo driver. Also add
support for retrieving the bootloader build details.

----------------------------------------------------------------
Bartosz Golaszewski (4):
      firmware: qcom: scm: remove unused arguments from SHM bridge routines
      firmware: qcom: scm: take struct device as argument in SHM bridge enable
      firmware: qcom: scm: initialize tzmem before marking SCM as available
      firmware: qcom: scm: request the waitqueue irq *after* initializing SCM

Johan Hovold (1):
      soc: qcom: pmic_glink: fix OF node leak

Kathiravan Thirumoorthy (1):
      soc: qcom: socinfo: Add support to retrieve APPSBL build details

Luca Weiss (6):
      dt-bindings: arm: qcom,ids: Add SoC IDs for SM7635 family
      soc: qcom: socinfo: Add SoC IDs for SM7635 family
      soc: qcom: socinfo: Add PM7550 & PMIV0108 PMICs
      dt-bindings: firmware: qcom,scm: document Milos SCM Firmware Interface
      dt-bindings: soc: qcom,aoss-qmp: document the Milos Always-On Subsystem side channel
      dt-bindings: soc: qcom: qcom,pmic-glink: document Milos compatible

Maulik Shah (1):
      soc: qcom: rpmh-rsc: Add RSC version 4 support

Rakesh Kota (1):
      soc: qcom: spmi-pmic: add more PMIC SUBTYPE IDs

 .../devicetree/bindings/firmware/qcom,scm.yaml     |  2 +
 .../bindings/soc/qcom/qcom,aoss-qmp.yaml           |  1 +
 .../bindings/soc/qcom/qcom,pmic-glink.yaml         |  1 +
 drivers/firmware/qcom/qcom_scm.c                   | 95 +++++++++++-----------
 drivers/firmware/qcom/qcom_scm.h                   |  1 +
 drivers/firmware/qcom/qcom_tzmem.c                 | 11 +--
 drivers/soc/qcom/pmic_glink.c                      |  9 +-
 drivers/soc/qcom/rpmh-rsc.c                        |  2 +-
 drivers/soc/qcom/socinfo.c                         | 11 +++
 include/dt-bindings/arm/qcom,ids.h                 |  5 ++
 include/linux/firmware/qcom/qcom_scm.h             |  5 +-
 include/soc/qcom/qcom-spmi-pmic.h                  |  2 +
 12 files changed, 85 insertions(+), 60 deletions(-)

