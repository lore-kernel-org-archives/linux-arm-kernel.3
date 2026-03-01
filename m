Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E1CAFD0048
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Mar 2026 01:21:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=WekV9hQ9xhh2IGweb9bRPGMV607zrL6rjPDCuS+9Wao=; b=msohD5UTlwLqLlPkQbCxbwyYTy
	ZiIPVihLTk6w/b4nEyyKPfcVa1SC0Vx64e2s8CE46zHrS9jZX/7AoMZUr+9wp2zHBR6PaHCsyNyPR
	rU3mtPeZsMrYthgXf2WLP8JqIviheUpkB4iwqQUO1lGzj6DNnv2ydbJJrFjlfLSdSY1P1NwrHkIsZ
	qhw58o4aXNrXRY8E0YfXg0yaOYCeHUZGS47uo/nYbmzJiSJQ4oRf50KXiGpyakVq62Rdyqwhlf8WA
	+lr7vImWZjwASfCNKFGqCSZ+VEIoCl5RFxDbwuXm0HLUQbxqUcdpglW1VnLD70jLDgrArwPrRF80L
	lW5RwcUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwVV3-0000000AUmW-2F7b;
	Sun, 01 Mar 2026 01:21:37 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwVUs-0000000AUfe-0Fpd
	for linux-arm-kernel@lists.infradead.org;
	Sun, 01 Mar 2026 01:21:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B811540B07;
	Sun,  1 Mar 2026 01:21:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D37B2C2BC87;
	Sun,  1 Mar 2026 01:21:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772328085;
	bh=cStXjZw7ZuEYg6hpY1Da/79s+sXlHNHkAc0ebc5k6So=;
	h=From:To:Cc:Subject:Date:From;
	b=qqewTdWiS+TWTom0KgacxrEk1idMHYNuBz3yUGUsMxsFM3HP4CrKyO19Ob0WOiCHP
	 KZvIAWf3MIK3xnsWX+yIkpLwOkDjj02YtkCO/n+YGYOAR6EmyLoZL1EA865GWPxrxz
	 YqkHvm8UAVeek6kUffIRy9iuUHMGcvRBbc/yTZEB+5VDIdxT0rDJrUhSQcJQvQfBOQ
	 MlGWo2B/NUB6lZoNuRni5l9zAVJ7leh0tRJco6Pn87zuQ2FHpk1FnLef8FgcUmG6oT
	 2iaqrgzvVFMmmffbDMV9wDGi7ATUusyBeSPTF2bqTN/OeE5lTEpEFod1g1dnuNYNGY
	 rNL9eXJHHI3sQ==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org,
	alain.volmat@foss.st.com
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	linux-media@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org
Subject: FAILED: Patch "media: stm32: dcmipp: bytecap: clear all interrupts upon stream stop" failed to apply to 6.12-stable tree
Date: Sat, 28 Feb 2026 20:21:23 -0500
Message-ID: <20260301012123.1677297-1-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Patchwork-Hint: ignore
X-stable: review
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260228_172126_120298_F355521C 
X-CRM114-Status: GOOD (  13.18  )
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

From 222f1279edd9008ee35b62de156ddac84e31443c Mon Sep 17 00:00:00 2001
From: Alain Volmat <alain.volmat@foss.st.com>
Date: Fri, 19 Dec 2025 15:30:35 +0100
Subject: [PATCH] media: stm32: dcmipp: bytecap: clear all interrupts upon
 stream stop

Ensure that there are no pending interrupts after we have stopped the
pipeline. Indeed, it could happen that new interrupt has been generated
during the stop_streaming processing hence clear them in order to avoid
getting a new interrupt right from the start of a next start_streaming.

Fixes: 28e0f3772296 ("media: stm32-dcmipp: STM32 DCMIPP camera interface driver")
Cc: stable@vger.kernel.org
Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
---
 drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-bytecap.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-bytecap.c b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-bytecap.c
index 1c1b6b48918ee..b18e273ef4a3e 100644
--- a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-bytecap.c
+++ b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-bytecap.c
@@ -512,6 +512,9 @@ static void dcmipp_bytecap_stop_streaming(struct vb2_queue *vq)
 	/* Disable pipe */
 	reg_clear(vcap, DCMIPP_P0FSCR, DCMIPP_P0FSCR_PIPEN);
 
+	/* Clear any pending interrupts */
+	reg_write(vcap, DCMIPP_CMFCR, DCMIPP_CMIER_P0ALL);
+
 	spin_lock_irq(&vcap->irqlock);
 
 	/* Return all queued buffers to vb2 in ERROR state */
-- 
2.51.0





