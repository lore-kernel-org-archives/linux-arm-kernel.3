Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C632DC83F27
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 20 Jul 2025 03:15:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=T70bkRltPkXY3Ym5QMEEWBxRwttAA2PuW/B6B2fHeUc=; b=XNBD+FcZFiO1scjnjA15nKfYF4
	sLIioH9f+YQY7amGVLc4JG2WCO85cNNKHoSfF/gT2njWGu9S3608r3gEOfhRU8zszor+T5Wgny4t1
	qos0O+cp5BWuraB7Z/ymdhfjt52OVtIdUj6VSg4dE795OxEYQNo/OZRlg+6NR1Sg8zWdcV5osNS1k
	6ezr6Q+iUlZCqyRj2ifW4fDSap6PrkGYqMuQyTNkVlcjGTTJFpe2JI4tFfO4MKxCIIJZuHFQX/e8N
	kEYypxeblFtCVpy/YWaX4ipeNNGaeOAoM3x84icw/EE65owCsKY5t+Y7RMLNMmfz+PIgCj+pZdsJB
	AeyRCkig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udKWE-0000000Eqfz-3MF0;
	Sun, 20 Jul 2025 03:15:18 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udKSf-0000000EqVU-2C7e
	for linux-arm-kernel@lists.infradead.org;
	Sun, 20 Jul 2025 03:11:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id A9575A5051E;
	Sun, 20 Jul 2025 03:11:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1C38C4CEF4;
	Sun, 20 Jul 2025 03:11:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752981096;
	bh=hy6TO0tqYA/iD0UESxM5WRK3VTok12PaLVtblUPe6HI=;
	h=From:To:Cc:Subject:Date:From;
	b=kQzFEnELpngKG8C++Y7Zk0MLDE4QHNF9lw3+74sPSXsdz+6W7Cq2IFOv0js7bl5B/
	 q6XWklc30P5gcz+5PlRc5lEWYyGPBK3+fERq2VW5McAgIEjlcpqhJwcztKapKMiWy9
	 iIlqp6niZGHAmHWT65QmFw2rvdkX5AhKHC+c5YgRtIy2IrUDJAb/nNOFQgLsiATbuR
	 ydU3rfVoc+gbEX/Uhxv5o8Mv0sEduDwIP54u3rOkP/MmW1SzzoBjrVFNlIl1vn8D+K
	 7BzS7zf/3oRuG+iQmFRKNwAfB8H0DRMTstsOw0GbwUj/uvnye1p68IpYs+CdiXx9AI
	 TnLDYtuAFvhZA==
From: Bjorn Andersson <andersson@kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Arnd Bergmann <arnd@arndb.de>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [GIT PULL] Qualcomm Arm64 defconfig updates for v6.17
Date: Sat, 19 Jul 2025 22:11:34 -0500
Message-ID: <20250720031134.286063-1-andersson@kernel.org>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250719_201137_627410_C28D050E 
X-CRM114-Status: UNSURE (   5.36  )
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


The following changes since commit 19272b37aa4f83ca52bdf9c16d5d81bdd1354494:

  Linux 6.16-rc1 (2025-06-08 13:44:43 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-defconfig-for-6.17

for you to fetch changes up to c5d02bbaa217b2454ba1ce7528113aa2ecf14f3c:

  arm64: defconfig: Enable camcc and videocc on Qualcomm SM8450+ (2025-06-11 10:46:23 -0500)

----------------------------------------------------------------
Qualcomm Arm64 defconfig updates for v6.17

Enable camera and video clock controllers for SM8450, SM8550, and SM8650
platforms.

----------------------------------------------------------------
Krzysztof Kozlowski (1):
      arm64: defconfig: Enable camcc and videocc on Qualcomm SM8450+

 arch/arm64/configs/defconfig | 3 +++
 1 file changed, 3 insertions(+)

