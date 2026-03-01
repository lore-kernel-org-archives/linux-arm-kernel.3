Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6585DFD0048
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Mar 2026 01:48:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=UPU1OAK9OtU/fsUc2zz5AH/DdhhVafP78ryhtso5OXY=; b=AvhCMVKpstbmQQ2L7ukmEDbwve
	bbvpuwc1vkGxeJ0hGGIDVTnVu02z3WCs8HOrvJ9Jw+5aFPay+TMNVtF/PCmjTVlB9XDy3vPRn9tQ0
	OzE+W6dwLqfJqMhcZ6LNJVAK0AU6UWInwRnFHG9G4680cadCs7KsivqaMCh6yWDqpvk33KiMr0mOA
	Aylgbk/VqYFoyZZclynSXZqJZnQo1JqQHQWehtDNxfLKjevsC+MAKz4TbUm9/S0pCOffQA+bOKMqm
	RWnPgzq3xaGkWufPYO1zlrctX5revu6eAKLTHehOlI1mc6Bn7PB2CpUU5MZo9YGa59Kp6qciUFc5l
	KJ8CLxvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwVuX-0000000AeOO-0L0J;
	Sun, 01 Mar 2026 01:47:57 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwVuU-0000000AeNf-11ir
	for linux-arm-kernel@lists.infradead.org;
	Sun, 01 Mar 2026 01:47:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 78D4F4082E;
	Sun,  1 Mar 2026 01:47:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE1EFC19421;
	Sun,  1 Mar 2026 01:47:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772329673;
	bh=M7AjvNGQ6ivPiRbc206heB/jGonoRNCbN3E/EnL2zjM=;
	h=From:To:Cc:Subject:Date:From;
	b=Z/babn51pwctts/dQwb1PAK2xWkNgMYhuCVIIRfJgFA3k68Xkf5QZSmad/y2cVMOt
	 X/kr3c3T/0oPdxemzobB+MvHgb8PuIATOdjkqU5aTve7KLraIoZ8ksyHkgsbXGmPQk
	 S+486F3Snzb/oFw9TkP1otOJrwm1aRIqadoxHxCOugO5PHp1NXJpKk2tW1op/sJpll
	 WnCTr8jM5gQK5lfIjk+U4qsCGsUZJCwrOlKl1jn+xj4YNNnfKPzqCzOLOesXkS+Xd5
	 PTK+649d+L6xF3shBUwYMboJpCU5AUSMvj7FjpJgXtJyXDh2JJ5CfZ1ZttunyVl2Wl
	 zyqsQVhPaXdMQ==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org,
	fourier.thomas@gmail.com
Cc: Helge Deller <deller@gmx.de>,
	linux-arm-kernel@lists.infradead.org,
	linux-fbdev@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: FAILED: Patch "fbdev: vt8500lcdfb: fix missing dma_free_coherent()" failed to apply to 6.1-stable tree
Date: Sat, 28 Feb 2026 20:47:51 -0500
Message-ID: <20260301014751.1711844-1-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Patchwork-Hint: ignore
X-stable: review
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260228_174754_320816_9222E9F7 
X-CRM114-Status: GOOD (  15.12  )
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

The patch below does not apply to the 6.1-stable tree.
If someone wants it applied there, or to any other stable or longterm
tree, then please email the backport, including the original git commit
id to <stable@vger.kernel.org>.

Thanks,
Sasha

------------------ original commit in Linus's tree ------------------

From 88b3b9924337336a31cefbe99a22ed09401be74a Mon Sep 17 00:00:00 2001
From: Thomas Fourier <fourier.thomas@gmail.com>
Date: Mon, 12 Jan 2026 15:00:27 +0100
Subject: [PATCH] fbdev: vt8500lcdfb: fix missing dma_free_coherent()

fbi->fb.screen_buffer is allocated with dma_alloc_coherent() but is not
freed if the error path is reached.

Fixes: e7b995371fe1 ("video: vt8500: Add devicetree support for vt8500-fb and wm8505-fb")
Cc: <stable@vger.kernel.org>
Signed-off-by: Thomas Fourier <fourier.thomas@gmail.com>
Signed-off-by: Helge Deller <deller@gmx.de>
---
 drivers/video/fbdev/vt8500lcdfb.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/video/fbdev/vt8500lcdfb.c b/drivers/video/fbdev/vt8500lcdfb.c
index b08a6fdc53fd2..85c7a99a7d648 100644
--- a/drivers/video/fbdev/vt8500lcdfb.c
+++ b/drivers/video/fbdev/vt8500lcdfb.c
@@ -369,7 +369,7 @@ static int vt8500lcd_probe(struct platform_device *pdev)
 	if (fbi->palette_cpu == NULL) {
 		dev_err(&pdev->dev, "Failed to allocate palette buffer\n");
 		ret = -ENOMEM;
-		goto failed_free_io;
+		goto failed_free_mem_virt;
 	}
 
 	irq = platform_get_irq(pdev, 0);
@@ -432,6 +432,9 @@ static int vt8500lcd_probe(struct platform_device *pdev)
 failed_free_palette:
 	dma_free_coherent(&pdev->dev, fbi->palette_size,
 			  fbi->palette_cpu, fbi->palette_phys);
+failed_free_mem_virt:
+	dma_free_coherent(&pdev->dev, fbi->fb.fix.smem_len,
+			  fbi->fb.screen_buffer, fbi->fb.fix.smem_start);
 failed_free_io:
 	iounmap(fbi->regbase);
 failed_free_res:
-- 
2.51.0





