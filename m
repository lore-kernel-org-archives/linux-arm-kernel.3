Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A91C7CA9EDE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Oct 2026 19:23:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=gWD+mFFh2PYQ5iuNSwqJ5xxnNC7WprPuBEo7h6CV0Vk=; b=WtbXvuV1tMv/AKbhdBn+yRbADb
	9sVoKv+t/501rKHefw0ppe6jj7llZSl8lYjYMbVBBJhevt5u3Wiv90mnfBcHlPOa+XLNafleop3tQ
	cmdHtsDkRkOnxlbXVvppfGCA6HMshFjKrEfFSEzBpB+G3jwNNsrzAoVqFsRzGQ2PLt7KjSo3ya/n2
	Xfr+GhJbOTie3/Kvtlvwbc2wrc+xvQy5Njb8pjwMdB9QMd0CkKfAvLmwSGOPFHab+Gqdss7gcgRhM
	AENi3oKTt6yI0ogx+YsSiFoLb+d5p8uKyMxDOiOlbYV+EwSvTYA1Igu61cEdjS61JzpPXi3SoKlL2
	GqLDWfwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGLc1-0000000BNd7-1rwi;
	Mon, 12 Oct 2026 19:23:05 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGLc0-0000000BNcy-0JT2
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Oct 2026 19:23:04 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 97C8F4390F;
	Mon, 12 Oct 2026 19:23:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D1301F0089B;
	Mon, 12 Oct 2026 19:23:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791832983;
	bh=gWD+mFFh2PYQ5iuNSwqJ5xxnNC7WprPuBEo7h6CV0Vk=;
	h=From:To:Cc:Subject:Date;
	b=XAYxFsA16i/953N2ybyvOB2TD8zOn33xK9QVy6+L9qyiAAJVeUgdCAKX9rHJ01JpZ
	 Wjzo1SAEqttUYH4hMjlrzey09zY1wje9V6VZaykCVZlUSPzS94c5XbYmDvM47ROiTQ
	 NUUmDb9gpJYAb8mfysC9EOYQ3WfQi2VbrQFOuuo3pEJe1pgXK0ors2B203qIsM0wKj
	 UwYuBMJ71A12pzZyZTwapzPrgTbckxevf9Bbe3QEQ5B/B/FGrDUtk+plpiXIRmckd6
	 pD4Oaci7nD/mJz4DVQF5NFNpu18ubfSo+JtSLgjc9HSzhBQOYANeUYV00OClwx6EQI
	 J7JixN3iQ6Fjw==
From: Bjorn Andersson <andersson@kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: [GIT PULL] More Qualcomm Arm64 defconfig updates for v7.4
Date: Mon, 12 Oct 2026 14:23:00 -0500
Message-ID: <20261012192301.13361-1-andersson@kernel.org>
X-Mailer: git-send-email 2.55.0
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


The following changes since commit 897cf6d54f366885e190e75b3a221e7b3ae35065:

  arm64: defconfig: Enable PMIC5 Gen3 ADC thermal monitor (2026-09-12 14:18:26 -0500)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-defconfig-for-7.4-2

for you to fetch changes up to 8b8d8aa9d482b08d5315e4d26631b9891c90e02e:

  arm64: defconfig: Enable EMC2305 and PCA963x drivers (2026-09-25 12:39:04 -0500)

----------------------------------------------------------------
More Qualcomm Arm64 defconfig updates for v7.4

Enable the EMC2305 fan controller and PCA963x LED controller drivers for
the Arduino Ventuno Q.

Remove explicit Qualcomm clock driver selections now provided by Kconfig
defaults from the ARM and Arm64 defconfigs, including the obsolete MDM9615
LCC entry. Allow the SDM845, SM8150, and SM8250 display, GPU, and video clock
controllers to be built as modules.

----------------------------------------------------------------
Krzysztof Kozlowski (2):
      ARM/arm64: defconfig: Drop redundant Qualcomm clock entries
      arm64: defconfig: Switch Qualcomm SDM845, SM8150 and SM8250 drivers to modules

Loic Poulain (1):
      arm64: defconfig: Enable EMC2305 and PCA963x drivers

 arch/arm/configs/multi_v7_defconfig |   9 ---
 arch/arm/configs/qcom_defconfig     |  14 -----
 arch/arm64/configs/defconfig        | 121 +-----------------------------------
 3 files changed, 2 insertions(+), 142 deletions(-)

