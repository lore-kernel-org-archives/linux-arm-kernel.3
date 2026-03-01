Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8705FD0049
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Mar 2026 01:22:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=L7utVMnnCNN9ssrpDSVPGEd88ROaDGQ+PSNIDPs+59I=; b=INZTAKN2CSjh3rgSIk7kYSnb8q
	p6HVVduRGEVOJ3ysx3WJ+KBiN3iyU9wtGODIEY1hg7OjCl3j7cgfxCGNBzhfiM9GclAz5n/Kp1+4m
	VYoish3N4hsrqNC50LaxxH9Oq8dE7Qv43L/Oz4UIXYwkT/TDXPcrlw1Pj0o2Lud0OodvXuhTWoPGd
	SlgDPXBZLF9vPaFMAjf3D7aPxAd3LrrGvDdVcaWQw+8MQ1Sy47LBfRK51lZVSMGmtc5CVDQkGvq9F
	oevrT/oYpug45Kx8ftT43JSUUd3uQbsJRM3ocPPZc9Pcr6eJ+GC2VQyRPoKWZUDJtkfFIfj5dqkJN
	uMyx16mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwVW6-0000000AVIE-2bal;
	Sun, 01 Mar 2026 01:22:42 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwVW3-0000000AVGG-1HHv;
	Sun, 01 Mar 2026 01:22:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id EF0D043288;
	Sun,  1 Mar 2026 01:22:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BC3CC2BC86;
	Sun,  1 Mar 2026 01:22:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772328158;
	bh=kLWXaNgVZ2kxxuEVRjfTLq1xSWeKJAWj9SQubazwqSk=;
	h=From:To:Cc:Subject:Date:From;
	b=PrgY9zbexjlkgc6Q7ik/43Qr5B38km8/ZQNXfhEu8EsuYkVAY4NjJRz2P72zGE6zN
	 O8RsEu1yT8GmcXvNbYpYl3/SvGCUd87hWknzqmzkdhr7U4XBffY5iYbYQuICnJ/d5V
	 IZE319eVoiVPgNj3MrMPFwwYk3B/ibMi9h9Nbqobx66QwvjIRj59JhNUei6Q3wrpyc
	 pglDwhvXOfHgtPTmwX8bxh7/49LliCBkPhLfRWkXZRE/vya/R9ZWwmrY6NfiOogtI7
	 zb05uxgfQLnz1rlgM7uc70tWYMsCgJ+fQTGkUCz/IEvjxhoSPeDuyCZRy4jH4uyTKL
	 Gg8HOLlhoCDCA==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org,
	benjamin.gaignard@collabora.com
Cc: Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: FAILED: Patch "media: verisilicon: AV1: Fix tile info buffer size" failed to apply to 6.12-stable tree
Date: Sat, 28 Feb 2026 20:22:36 -0500
Message-ID: <20260301012237.1679051-1-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Patchwork-Hint: ignore
X-stable: review
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260228_172239_990121_438756AE 
X-CRM114-Status: GOOD (  12.43  )
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

The patch below does not apply to the 6.12-stable tree.
If someone wants it applied there, or to any other stable or longterm
tree, then please email the backport, including the original git commit
id to <stable@vger.kernel.org>.

Thanks,
Sasha

------------------ original commit in Linus's tree ------------------

From a505ca2db89ad92a8d8d27fa68ebafb12e04a679 Mon Sep 17 00:00:00 2001
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
Date: Wed, 14 Jan 2026 10:07:10 +0100
Subject: [PATCH] media: verisilicon: AV1: Fix tile info buffer size

Each tile info is composed of: row_sb, col_sb, start_pos
and end_pos (4 bytes each). So the total required memory
is AV1_MAX_TILES * 16 bytes.
Use the correct #define to allocate the buffer and avoid
writing tile info in non-allocated memory.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
Fixes: 727a400686a2c ("media: verisilicon: Add Rockchip AV1 decoder")
Cc: stable@vger.kernel.org
Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Signed-off-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
---
 .../media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c b/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c
index 500e94bcb0293..e4e21ad373233 100644
--- a/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c
+++ b/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c
@@ -381,12 +381,12 @@ int rockchip_vpu981_av1_dec_init(struct hantro_ctx *ctx)
 		return -ENOMEM;
 	av1_dec->global_model.size = GLOBAL_MODEL_SIZE;
 
-	av1_dec->tile_info.cpu = dma_alloc_coherent(vpu->dev, AV1_MAX_TILES,
+	av1_dec->tile_info.cpu = dma_alloc_coherent(vpu->dev, AV1_TILE_INFO_SIZE,
 						    &av1_dec->tile_info.dma,
 						    GFP_KERNEL);
 	if (!av1_dec->tile_info.cpu)
 		return -ENOMEM;
-	av1_dec->tile_info.size = AV1_MAX_TILES;
+	av1_dec->tile_info.size = AV1_TILE_INFO_SIZE;
 
 	av1_dec->film_grain.cpu = dma_alloc_coherent(vpu->dev,
 						     ALIGN(sizeof(struct rockchip_av1_film_grain), 2048),
-- 
2.51.0





