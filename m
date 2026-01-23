Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5F36D72375
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Jan 2026 11:17:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QGJzPwyJEfLJEypzKpvJpyuWiVBaXAmXTX79/4QKwfA=; b=RSqBMbfr5qZxFMFKsMWhO63WGT
	TYEKFH03aEyvMOhsqiB7EwcKFzvnpnGyxw/u0NpSJWX5jKCiHFCUiuv5oDtdCOsqm+YJkOo9Dv4Uf
	d0hJFTMD7NlyST1zfTjTYp6G4NKNj+nHrc2IILAoLaPuk5veRiJvGXCYCJa00ooi4MMXMFPXW7ZWa
	5M/qAQ0u42JQ59tTI94/9mV0Eb59jyor9E/KAFsV7dSAYb4iALBkMyYV0L6pp5Xhxx7Q4lvOQIV76
	y7Z2+ebJsF9tE4gdNnTaFDdQHs1ZKkYzF/FuPniy3q0/2E0vN4sc/4oFp29U4gEKxhQ8srmqEw9yR
	5Bbb3trQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjFAU-00000008oyk-1g0v;
	Fri, 23 Jan 2026 11:17:34 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjFAR-00000008owK-29xZ;
	Fri, 23 Jan 2026 11:17:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1769167048;
	bh=7DXAoiafUS6LRz5IInivBEJPaHy0O8Ijya9uB4UCJ0Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DXbkB8W2xXsmPVgC/cZdkiYMVK9KqhjqCkXeAvfFmg0pz7qpYwhyXiC3eqDrhkkM9
	 Gf00ttE4AIyFzyNSzSMGB7Eh7AyEHuO386up1qi/bNGi3UchgoGIz+9gXU/ZtEpBVJ
	 Z0xdjIstROC7YVt78hihkeB38inc+3n9UrwKa7XDauPBlsx6ks4Dm1ALOvQS73r+kR
	 6C0ISScIY6UBg2qsNHkdkdvOY/qlf5nZ8sV7wphwa0GZcyrin1BNHYNGI1DN5vGFgP
	 Lr6g8NCeqo0qGyNWpY8UGUlBw0n+QPglNbBBGwyRyftBxcoz0dLuhmwHR9QISscO48
	 2aQmtAGm/O12w==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 100CB17E0E3D;
	Fri, 23 Jan 2026 12:17:28 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: arm-soc <arm@kernel.org>,
	soc <soc@kernel.org>
Cc: matthias.bgg@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [GIT,PULL,3/3] MediaTek defconfig updates for v6.20
Date: Fri, 23 Jan 2026 12:17:22 +0100
Message-ID: <20260123111724.28631-3-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260123111724.28631-1-angelogioacchino.delregno@collabora.com>
References: <20260123111724.28631-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260123_031731_710062_AB306DCE 
X-CRM114-Status: UNSURE (   6.08  )
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

The following changes since commit 8f0b4cce4481fb22653697cced8d0d04027cb1e8:

  Linux 6.19-rc1 (2025-12-14 16:05:07 +1200)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/mediatek/linux.git/ tags/mtk-defconfig-for-v6.20

for you to fetch changes up to 81841b41a8bcd024f77a15d0634bc229d4d44db1:

  arm64: defconfig: Enable Mediatek HDMIv2 driver (2026-01-07 12:13:46 +0100)

----------------------------------------------------------------
MediaTek defconfig updates

This adds a single change, enabling to compile the
MediaTek HDMIv2 driver as module.

----------------------------------------------------------------
Louis-Alexis Eyraud (1):
      arm64: defconfig: Enable Mediatek HDMIv2 driver

 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)


