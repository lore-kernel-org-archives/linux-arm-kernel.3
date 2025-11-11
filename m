Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A6DDCCFA1A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Nov 2025 09:56:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xVAsI6zc2vM8GVUHqhnn0KYddoaktg9d3e8tWE/wfUM=; b=mhoNVfrNYhxgtevncnz9OqwI3L
	muSGTYjNkbti3GgzEPHf0ezuHSm6HIkjo7iS602OZ0nIAhFI8KGsiJGMlu34AXrUV28GWAahWi+UL
	v2z5B7gP7u3qjKfEHtOZ1mobxAF0Z4SGHZW7bKBMybJrOIGPjxEtOwmAEQ5WqEHGoNhzPXDH1kEsG
	MCgaelqpMgLPoOzwmVRZOq4O2uU2gH7zlyvQJ+1yaFu4LeVCjn9ZWSXLjfIPWNta+saYPBrRtbprf
	5WBUfjlhDhGqo+FSejUFoYaGCTUhqJ+2hlqAEzxjmbheUmLGpGZlcbR8isbmyA4tE6Ppv9tbtOAoi
	Z80F2f6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIl6T-00000006t43-2ggJ;
	Tue, 11 Nov 2025 09:55:57 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIl6P-00000006szy-3D7r;
	Tue, 11 Nov 2025 09:55:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1762854951;
	bh=SsJCBdcz+P9WpOBbZA/R1/r8Ky8u/TUwqI5zNkruFjY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QZvo3rNU3daUtzbV3PzpidrINXXvbxEDvI/xq13hXdv7/4etzdz26liBLJ/tqNqnh
	 TpYvbWUEeuZOPC0qHSn37jm044oAj6gf+0p5m5VnoQf5QpE0xlf8kRIN+mzr1YGVds
	 9BBjTBcxcR0coSsXP1VJ2z1lLxZezeBWFL5k8qv0tEz2kkqIwLM4o+nhCQqbQy3ddP
	 WpEZ5ekYrARjX61fdWKLPNnJAZ3G6I6HXbQr1nn9fKr5TQQcbdSZ6uZZmKQpWJITnD
	 qWTsEPHDlQR3/FZM0KNapylvSDSqD2akx6WAJGajWnIq3GARdR3CpI957rnW77iF8F
	 Rj9ZFibMHVsfQ==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C252C17E13C1;
	Tue, 11 Nov 2025 10:55:50 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: arm-soc <arm@kernel.org>,
	soc <soc@kernel.org>
Cc: matthias.bgg@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [GIT,PULL,5/5] MediaTek defconfig updates for v6.19
Date: Tue, 11 Nov 2025 10:55:40 +0100
Message-ID: <20251111095542.13958-5-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251111095542.13958-1-angelogioacchino.delregno@collabora.com>
References: <20251111095542.13958-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251111_015553_962888_C48C5AC1 
X-CRM114-Status: UNSURE (   6.42  )
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

The following changes since commit 3a8660878839faadb4f1a6dd72c3179c1df56787:

  Linux 6.18-rc1 (2025-10-12 13:42:36 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/mediatek/linux.git tags/mtk-defconfig-for-v6.19

for you to fetch changes up to b59a508c1f5fdb3fdc690edebe815d59b04491d0:

  arm64: defconfig: Enable UFS support for MediaTek Genio 1200 EVK UFS board (2025-10-13 11:35:35 +0200)

----------------------------------------------------------------
MediaTek defconfig updates

As MediaTek boards with UFS appeared some time ago, this adds a
single commit enabling the MediaTek UFS driver, allowing those
boards to boot over UFS as primary storage.

----------------------------------------------------------------
Macpaul Lin (1):
      arm64: defconfig: Enable UFS support for MediaTek Genio 1200 EVK UFS board

 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)


