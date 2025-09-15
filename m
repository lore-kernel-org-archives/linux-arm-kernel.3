Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D32CACAC597
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Sep 2025 13:26:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RSZSUZzz67f8nXzkxgI75wygo74ieW0HfCiXHJnTBJo=; b=uGnXhO7R08ijx2BFPj42jenfM1
	mTReHAmwXr2zQglxfWMTrDBhWz77KW4KD8/l5e6Ixt9a+W3f/lx4dMWKnvbAEirYjIZMmj2x00Xjm
	s+cZNX/EQmCxc61Ncgl6nD8XnEC7iTsm/Nv8NWpLS1Ms7ZZ7521VAkV6SinQ/iG+kAsObm//wbhoZ
	MJgg7uJ4TsHouedc5amy1U0VFDQQwqGv831s0EmPLaE7auP6Rtun4PGq/CAdnAYFuLU5AhyMTXlFz
	0amqPXPg3N9YxW6OshU1sYm0ynR7yykz0iy79JfnKk0rK/46518qLGpNpZVL1b27JmEQilAos98OV
	M2QJTieQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy9Di-00000004JCY-3QDK;
	Mon, 15 Sep 2025 13:26:14 +0000
Received: from mail-m16.yeah.net ([220.197.32.16])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy9Dd-00000004J7u-1flY
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Sep 2025 13:26:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=RS
	ZSUZzz67f8nXzkxgI75wygo74ieW0HfCiXHJnTBJo=; b=oO/hVWnIJORk4vrZBD
	HnL5vzktDx94LyiwgCW/GlzHXTaSRBu3cuFDE35ITkTHUoh/1xylfxURxxgQXPje
	aRaAgoMEkiT6zL1ic9Bm2vw2RXpxOLkrLGPR47L1837WLBuQbjpfztmSl6rCqwnm
	kwK26uNf7MePMcowcN6VQjmEQ=
Received: from localhost.localdomain (unknown [])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgDnjyTaE8ho5MiXBA--.47709S5;
	Mon, 15 Sep 2025 21:25:50 +0800 (CST)
From: Shawn Guo <shawnguo2@yeah.net>
To: soc@kernel.org,
	arm@kernel.org
Cc: Shawn Guo <shawnguo@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	kernel@pengutronix.de,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 4/4] i.MX defconfig change for 6.18
Date: Mon, 15 Sep 2025 21:25:31 +0800
Message-ID: <20250915132535.253859-4-shawnguo2@yeah.net>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250915132535.253859-1-shawnguo2@yeah.net>
References: <20250915132535.253859-1-shawnguo2@yeah.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: Ms8vCgDnjyTaE8ho5MiXBA--.47709S5
X-Coremail-Antispam: 1Uf129KBjvdXoWrZry7Gr1kKr4fuF47Zw4DXFb_yoWfKrc_GF
	y7J3WkJr1UAryUGw1UZanrAr4UKw1UJ348Jr1FqF4fWr13tw1UJ3W8XF4rWF1kX3WjgryD
	Cr4DAwn0yr1UGjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU0WUDPUUUUU==
X-Originating-IP: [114.216.210.127]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiNx5IrWjIE94DbAAA3O
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250915_062609_804131_2E8B8B65 
X-CRM114-Status: UNSURE (   5.39  )
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

From: Shawn Guo <shawnguo@kernel.org>

The following changes since commit 8f5ae30d69d7543eee0d70083daf4de8fe15d585:

  Linux 6.17-rc1 (2025-08-10 19:41:16 +0300)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-defconfig-6.18

for you to fetch changes up to 8b3ce9541129c93958271cc6f6963742f1db0fe7:

  arm64: defconfig: Enable Marvell WiFi-Ex USB driver (2025-09-11 09:12:54 +0800)

----------------------------------------------------------------
i.MX defconfig changes for 6.18:

- Enable i.MX91 pinctrl driver and Marvell WiFi-Ex USB driver in arm64
  defconfig

----------------------------------------------------------------
Alexander Stein (1):
      arm64: defconfig: Enable Marvell WiFi-Ex USB driver

Joy Zou (1):
      arm64: defconfig: enable i.MX91 pinctrl

 arch/arm64/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)


