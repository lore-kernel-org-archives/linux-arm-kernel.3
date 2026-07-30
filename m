Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 112DAC55162
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jul 2026 02:06:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=PAt+eZwf8tQx/cEfnmLtW7Yb9P3v3HHpCqPrZ+zoQ4Q=; b=ihtxq0mM1gqC3j/IpE7XcWcliF
	eVotOL7RHCEAbUgsm8z3dn0sM/N4uEZJWOBzg4QvX98t8wuhMe4W4f3Sk7PChJzW1uyAzizpsYf7m
	V2uuEMrjgp4vwGh/y3ChLqLyOeIW2l2ux7eimkTVPNgTjRAc0K0XsLJrm/x54ry9RlEj2fNSkfVgv
	XaddpEkqwOzSJ4W2Ytz4aGZz7hIubHEIRPAjxOeN8F7G4bvMPpiLcbJtwhXr5gcpQCkXmlh6hWOsD
	zARcBHp5tJ17y0RQJJ5mZacvh8le2jBz2/lpqIvrgN7GhXDboRnf/eG6IaOfgM/JAKDnB0EEVBgcX
	nVAW0A4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpGAb-00000009Jpo-1ZDK;
	Thu, 30 Jul 2026 02:06:49 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpGAa-00000009Jpg-0DDp
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jul 2026 02:06:48 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 21126600AA;
	Thu, 30 Jul 2026 02:06:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3CB41F000E9;
	Thu, 30 Jul 2026 02:06:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785377205;
	bh=PAt+eZwf8tQx/cEfnmLtW7Yb9P3v3HHpCqPrZ+zoQ4Q=;
	h=From:To:Cc:Subject:Date;
	b=fZl/qbuU/+0Cy/P550elaPKyJIDbtw0qsVazlVfw/W4DQPKrwm4s+xrQHjaGavvY1
	 93aa5LuQQZ6erVoOCiY1TlvjMU6E2kqnkgj18O8jCGuHTM/BRn57MKzmpNB2CDIjc3
	 H79WTXnp41nnCOmI2KIP4e/yzRvWP0Lk9TAr/mTFtsnTU3xPXlGYqE5pJhrqG4w608
	 TaoOLdH76R52xBbVM+PT2lKL1CkLzjV5iP5jbSgzxwJ66d4tg/DcZ6vYtlI+DR9lwi
	 0nZDVweBmfkBeiYfpWUPEH20mQ9RHM4rybavp2bsH36TgoR1/ygqs/gjPCnYuiZAC2
	 IGj9S0+rorVlA==
From: Bjorn Andersson <andersson@kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Arnd Bergmann <arnd@arndb.de>,
	Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Pengyu Luo <mitltlatltl@gmail.com>,
	Akhil P Oommen <akhilpo@oss.qualcomm.com>,
	Alexander Koskovich <akoskovich@pm.me>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [GIT PULL] Qualcomm Arm64 DeviceTree fixes for 7.2
Date: Wed, 29 Jul 2026 21:06:42 -0500
Message-ID: <20260730020642.68595-1-andersson@kernel.org>
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


The following changes since commit dc59e4fea9d83f03bad6bddf3fa2e52491777482:

  Linux 7.2-rc1 (2026-06-28 12:01:31 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-fixes-for-7.2

for you to fetch changes up to a3ba349af8e1bb7e0efdcd2dd53d69282f18478a:

  arm64: dts: qcom: eliza: Fix DSI1 phy reference clock rate (2026-07-29 16:15:06 -0500)

----------------------------------------------------------------
Qualcomm Arm64 DeviceTree fixes for 7.2

Correct the ESPI interrupt specifiers for PCIe SMMU and QUP nodes in
Glymur.

Correct the GIC address cells on Monaco, to avoid DeviceTree validation
failures introduces in v7.2-rc1.

Drop the secondary interrupt from the GPU SMMU on Purwa.

Fix the invalid PDC IRQ mapping for SC8280XP to ensure associated GPIOs
have functional interrupt handling. Correct the EC interrupt on Huawei
Matebook E Go.

Reduce the depth of the requested sleep state for SDM850-based Lenovo
Yoga C630, to work around the regression of suspend crashing the
machine.

Adjust the IPA IMEM address on SM8650, to avoid clobbering the wrong
memory region in IMEM.

Correct the DSI1 PHY reference clock on Eliza, to ensure that the right
clock rate is used.

----------------------------------------------------------------
Akhil P Oommen (1):
      arm64: dts: qcom: purwa: Fix GPU IOMMU property

Alexander Koskovich (1):
      arm64: dts: qcom: sm8650: Fix IPA IMEM slice

Bjorn Andersson (2):
      arm64: dts: qcom: glymur: fix PCIe SMMU interrupts
      arm64: dts: qcom: glymur: fix QUP serial engine IRQs

Dmitry Baryshkov (1):
      arm64: dts: qcom: sdm850-lenovo-yoga-c630: lower PSCI cluster idle

Krzysztof Kozlowski (2):
      arm64: dts: qcom: monaco: Add default GIC address cells
      arm64: dts: qcom: eliza: Fix DSI1 phy reference clock rate

Pengyu Luo (2):
      arm64: dts: qcom: sc8280xp: add several missing pdc map entries
      arm64: dts: qcom: sc8280xp: gaokun3: correct EC interrupt pin

 arch/arm64/boot/dts/qcom/eliza.dtsi                |  2 +-
 arch/arm64/boot/dts/qcom/glymur.dtsi               | 32 +++++++++++-----------
 arch/arm64/boot/dts/qcom/monaco.dtsi               |  1 +
 arch/arm64/boot/dts/qcom/purwa.dtsi                |  2 ++
 .../boot/dts/qcom/sc8280xp-huawei-gaokun3.dts      |  2 +-
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi             |  4 +--
 .../boot/dts/qcom/sdm850-lenovo-yoga-c630.dts      |  4 +++
 arch/arm64/boot/dts/qcom/sm8650.dtsi               |  4 +--
 8 files changed, 29 insertions(+), 22 deletions(-)

