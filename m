Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DA31C79FA1
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 16:20:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Cw8A5DQf1axmrcHfnWBzzoDZK3C6lKXke5eM/STvWnE=; b=RxiwOqRDmj8LJB7VllUCYCwPFG
	vsVs0rDfztf4dRcrAdABBXn5tSz7/SyNP7XTFIztjXJrF0Koej67IjLFbfACBmu1GhZ2+CO9w4yzR
	iL0BYZx071syVdeULE7/+xcwRya/De1zl7cQyy6Yjnpptg/4Cgokgt90E5mTwc1QRvmXzZEqrq1vh
	zo7CVet0vLyuYUofY5m5muQD9Wyn8wx5wkVWgVQxTEr8D6NKCU8jh9PwfF8gTQliHlywghwgEG/w/
	D6sk1i0F9yEcSjZQKQ1Cx+unHjOYU4XRo1IaE0pyKFSnnaOA7qxoN6uPjnj7lyyNszLxk9HWCEiS+
	xJz9JIiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3c4x-00000007HNn-0XS3;
	Mon, 07 Sep 2026 16:20:19 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3c4v-00000007HNQ-3O4q
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Sep 2026 16:20:17 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 5966F41B27
	for <linux-arm-kernel@lists.infradead.org>; Mon,  7 Sep 2026 16:20:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DFF2E1F00A3D;
	Mon,  7 Sep 2026 16:20:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788798017;
	bh=Cw8A5DQf1axmrcHfnWBzzoDZK3C6lKXke5eM/STvWnE=;
	h=From:To:Cc:Subject:Date;
	b=W4I4zQzpu0fTBdaqUoh2PeOEf7nwbfRMVCbYj6qdPxWJPFB9xPtYKy3+u8ptXzFEQ
	 TG9dObe5jMbljHeYQ+KkYmGRUZe+tDYGSCL2OaKNVyTkLaK9xOicnvqklbIVGUVyXH
	 k8JP9UCkYjzHowX8FEpbLXfZ1HfOo7Vf2GYe48Lg4ky3JwSJj6fXTwBJM8wnOA6lYt
	 GvYzEelowiO1fdygocZhSCQoov/cw6/Rgj3pDrLVW0+F9YCn4sutcWgP3Q+QF165xK
	 Hfhx5CLFu3w5djhjK4gbdcA2CGZRx+Li+GuxznGe2kvU3w2EXuiHmTL7Es1OxLOC8k
	 8jr29JfMuhAIQ==
From: Dinh Nguyen <dinguyen@kernel.org>
To: linux-arm-kernel@lists.infradead.org,
	soc@lists.linux.dev
Cc: dinguyen@kernel.org
Subject: [GIT PULL] arm64: dts: socfpga: fix file access permission
Date: Mon,  7 Sep 2026 11:20:16 -0500
Message-ID: <20260907162016.1148705-1-dinguyen@kernel.org>
X-Mailer: git-send-email 2.42.0.411.g813d9a9188
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

The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:

  Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/dinguyen/linux.git tags/socfpga_dts_fix_for_v7.3

for you to fetch changes up to 5f8cb07d7a8573753c5d31dc76b51cab8e5e9460:

  arm64: dts: socfpga: change access permission from 755 to 644 (2026-08-31 18:08:36 -0500)

----------------------------------------------------------------
SoCFPGA DTS fix for v7.3
- Fix DTS file access permissions

----------------------------------------------------------------
Dinh Nguyen (1):
      arm64: dts: socfpga: change access permission from 755 to 644

 arch/arm64/boot/dts/altera/socfpga_stratix10_socdk.dtsi     | 0
 arch/arm64/boot/dts/altera/socfpga_stratix10_socdk_emmc.dts | 0
 2 files changed, 0 insertions(+), 0 deletions(-)
 mode change 100755 => 100644 arch/arm64/boot/dts/altera/socfpga_stratix10_socdk.dtsi
 mode change 100755 => 100644 arch/arm64/boot/dts/altera/socfpga_stratix10_socdk_emmc.dts

