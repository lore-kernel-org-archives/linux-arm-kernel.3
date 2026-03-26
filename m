Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D11810A62CF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Mar 2026 13:38:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jMat4KAOWiaV65em2XhZHKKr2Pb2rmFe1OyCfr+EcTg=; b=46vX97gfTd3pF506Sa8WMgWDKP
	OK5pJcCIAN11yjzqJegx5cJnYpVb8uvN8tukjp7U8pUCj1Y7Af3cJSZwbgkF6sHX2KH/qbr1pj4LS
	l/5v2d1IieqMnESfjwVFPXDJ3BWFB9+DNSM7S7QHGDWxRpVX2nfqRkmaNby1okqdTpmMMq9K7vvz9
	0VmUag67Ffq85Uj7+x8/3J+4PjB8guxSMR5zHr06AZqCLiGbbyITnbA1wLBG+msiYu0Xpb20Q1ceY
	Bf4aQuONV7D9uBwLEsM3xn/F5KIdywlxJWjWjf+rFJupysxVmmvTrMmkX75BdWr4Q/cSwCtP9/Cyh
	lkWaNs1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5kvE-00000005Z9i-0SqM;
	Thu, 26 Mar 2026 13:38:52 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5kvB-00000005Z9F-1yX1
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Mar 2026 13:38:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C3DE54039A;
	Thu, 26 Mar 2026 13:38:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C78E4C116C6;
	Thu, 26 Mar 2026 13:38:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774532328;
	bh=sXJKLR6Xugtxmj7WhI7mlr1ILFb05U6FcPvNWJU2J3U=;
	h=From:To:Cc:Subject:Date:From;
	b=sZKwT8K7/taa0s4nQQZLmnw8eRbCl10F795xkaBGsdFfyvn5vbI3Y+vH0ZaalyENK
	 7BpAa6fFaoxz64X4hNik3FCnM2LwTI2327k+Mv+UL2/HaP8d7bayzADwAb4rSX2MPo
	 J01yNYjnmbtBDk7YmAalzMEolfpcboJk2xOTXBpUau1Hkc8at5PfJtr9czqUPaX+v5
	 CygfV9Vgv+uFqjOmjoqqPcUdNs2uFNRwzsTgtK4sYkP/Uy3a/IGnkSsVju6oYoEpPl
	 yRZIn+ioALx7ELzq+qFOfAmfk8tB8iX2ClXYq+lRtsutp+Lz6aEOu5lWkOdBwMmhZI
	 kDswIHn+DzZzg==
From: Bjorn Andersson <andersson@kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Arnd Bergmann <arnd@arndb.de>,
	Sumit Garg <sumit.garg@oss.qualcomm.com>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Daniel J Blueman <daniel@quora.org>,
	Ravi Hothi <ravi.hothi@oss.qualcomm.com>
Subject: [GIT PULL] Qualcomm Arm64 DeviceTree fixes for v7.0
Date: Thu, 26 Mar 2026 08:38:45 -0500
Message-ID: <20260326133845.66761-1-andersson@kernel.org>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_063849_530111_BED3A34A 
X-CRM114-Status: UNSURE (   8.54  )
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


The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f:

  Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-fixes-for-7.0

for you to fetch changes up to 2c409e03fc04b5cded81b7add9ce509706c922e3:

  arm64: dts: qcom: agatti: Fix IOMMU DT properties (2026-03-23 22:31:40 -0500)

----------------------------------------------------------------
Qualcomm Arm64 DeviceTree fixes for v7.0

Fix the idle exit latency numbers on Hamoa, to resolve the issue that
Linux points out that the numbers are incorrect.

Fix the WCD9370 reset polarity on QCM6490 IDP.

Correct the Monaco UART10 pinconf, to apply to the correct pins.

Add reserved-memory region for Gunyah in Monaco, as the entry in UEFI
memory map is incomplete.

Fix the iommu stream specifiers for display, GPU, and video codec as the
current values aren't accepted on systems with Gunyah.

----------------------------------------------------------------
Daniel J Blueman (1):
      arm64: dts: qcom: hamoa/x1: fix idle exit latency

Loic Poulain (2):
      arm64: dts: qcom: monaco: Fix UART10 pinconf
      arm64: dts: qcom: monaco: Reserve full Gunyah metadata region

Ravi Hothi (1):
      arm64: dts: qcom: qcm6490-idp: Fix WCD9370 reset GPIO polarity

Sumit Garg (3):
      dt-bindings: display: msm: qcm2290-mdss: Fix iommus property
      dt-bindings: media: venus: Fix iommus property
      arm64: dts: qcom: agatti: Fix IOMMU DT properties

 .../devicetree/bindings/display/msm/qcom,qcm2290-mdss.yaml    |  6 ++----
 .../devicetree/bindings/media/qcom,qcm2290-venus.yaml         |  7 ++-----
 arch/arm64/boot/dts/qcom/agatti.dtsi                          | 11 +++--------
 arch/arm64/boot/dts/qcom/hamoa.dtsi                           |  2 +-
 arch/arm64/boot/dts/qcom/monaco.dtsi                          |  9 +++++++--
 arch/arm64/boot/dts/qcom/qcm6490-idp.dts                      |  2 +-
 6 files changed, 16 insertions(+), 21 deletions(-)

