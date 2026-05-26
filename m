Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DAF3CD5BB1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 May 2026 14:53:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=NG1MsJD+6r7VdzmGyqNvXHjFFZ8NsZMlL149djZSr2g=; b=yU+cuepQnQfe2A+s4LKUyxjvOJ
	qVw9v0vcrsrRSbCFfLl1JMfcf3SlNMDPKQ0MDFSMCuFeJfrKZiqQ7/pisje47SThF9XRXWZAG7oEP
	HblLsPulEZt+hNWJDtA70WDewXhWBIZJyXYoSmN6WBgkfmihy/vhRaB4ab0MLtjFZvo+fng51MvH2
	DUuXpKZWWCJMb7YMI+Ff/x6HSAOUvut2bzFHVBNmqYR9H6EA6NrGQXv7YRRPix0YWQs8QWzCsPssF
	hi024iYcgkM9EPH5FQA3wFUHtmEr/K8GJEcsOkWXSH7iLoyKKBjJbi+v/gmHM3CIE4Cx16UF3quYZ
	lCq4olQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRt9u-00000002ENe-1lfp;
	Tue, 26 May 2026 14:53:30 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRt9t-00000002ENW-1YqZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 May 2026 14:53:29 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id A28DA60123;
	Tue, 26 May 2026 14:53:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5F881F00A3D;
	Tue, 26 May 2026 14:53:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779807208;
	bh=NG1MsJD+6r7VdzmGyqNvXHjFFZ8NsZMlL149djZSr2g=;
	h=From:To:Cc:Subject:Date;
	b=gAM1KIY5bwj49FuQYukZaEMwgitseVn3EbKtSxJdWs8YFyuOMTPA0vq0maMBegu9Q
	 Jq4HO3zPzN70CZoz17fpFothsZFMaHtqpmfWjQ+2twUZZu6RdaNPnFtLtMxBiIn3t2
	 LsFaTw4gh7P8mLDgfp+9ji5EmQyJcU9j4/SKI+llCHCa0y6DTw6dnVJO1YgOaK07Fq
	 +ciKoyeIPK1/69UVye8EIOTmTTy3kVWLmfx9l2Txo85tMN5+dX7w1rH0oPkpok2s3g
	 7N3AY/684akel4mlBcv0Zri8zVBBCC3u1A2xtpPUjPrpVm7NZIznSxi71qUifSrUhv
	 qtpBDtNMDcWUw==
From: Bjorn Andersson <andersson@kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Arnd Bergmann <arnd@arndb.de>,
	Harshal Dev <harshal.dev@oss.qualcomm.com>,
	Abel Vesa <abel.vesa@oss.qualcomm.com>,
	Val Packett <val@packett.cool>
Subject: [GIT PULL] Qualcomm Arm64 DeviceTree fixes for v7.1
Date: Tue, 26 May 2026 09:53:26 -0500
Message-ID: <20260526145326.3243-1-andersson@kernel.org>
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

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-fixes-for-7.1

for you to fetch changes up to 67802f981361ebb49cc25175c57179aecb14626c:

  Merge branch '20260416-qcom_ice_power_and_clk_vote-v5-13-5ccf5d7e2846@oss.qualcomm.com' into arm64-fixes-for-7.1 (2026-05-21 16:34:26 -0500)

----------------------------------------------------------------
Qualcomm Arm64 DeviceTree fixes for v7.1

Add missing power-domain and iface clocks for the ICE node of Eliza and
Milos to avoid the validation errors that resulted from late binding
changes. Also drop the reference clock for the USB QMP PHYs, for the
same reason.

Avoid touching the 20'th I2C bus on the Hamoa-based (X Elite) Dell
laptops, as this conflicts with the battery management firmware.

----------------------------------------------------------------
Abel Vesa (1):
      arm64: dts: qcom: glymur: Drop RPMh CXO clocks from QMP PHYs

Bjorn Andersson (1):
      Merge branch '20260416-qcom_ice_power_and_clk_vote-v5-13-5ccf5d7e2846@oss.qualcomm.com' into arm64-fixes-for-7.1

Harshal Dev (2):
      arm64: dts: qcom: milos: Add power-domain and iface clk for ice node
      arm64: dts: qcom: eliza: Add power-domain and iface clk for ice node

Val Packett (1):
      arm64: dts: qcom: x1-dell-thena: remove i2c20 (battery SMBus) and reserve its pins

 arch/arm64/boot/dts/qcom/eliza.dtsi         |  6 +++++-
 arch/arm64/boot/dts/qcom/glymur.dtsi        | 20 ++++++--------------
 arch/arm64/boot/dts/qcom/milos.dtsi         |  6 +++++-
 arch/arm64/boot/dts/qcom/x1-dell-thena.dtsi |  7 +------
 4 files changed, 17 insertions(+), 22 deletions(-)

