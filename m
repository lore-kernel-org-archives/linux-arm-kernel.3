Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80017C5DF81
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Aug 2026 09:00:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wVYZJVLed/RrGWFRSVBujog+j23nJPZnuYw3+qXXz+4=; b=Lx1R5kedl7/eF8Gf8EBPnOpgKW
	oCInaMBzOayzjxNYme6af5+uB3nr8gyXrDotTqbp7oC/KVFEujd0jXoR9IDNGqR/SBgdOJ9BFdgFw
	BMz6UXbR5mPj3m3b7IdsLeUcb0aQJyGR/nblCSW3iGajupqw/2WJGUSLOzXBHtq48nsVdcIVmR4R1
	Oa0qPjCTDO06agC1Fr2WRNd5jjIYHHYlWeQa3FGIRqFmza+JzVy20Dc9Ixav2iXv1puuar9zQa8hX
	VD4WP61NPB4xhp8FP9/9J0+WDRLFBlQW9g7/k0cMK9Hyja88uWzjNfbZXC5ee45vd+NL/Qlg4Ivfi
	hBvUTCmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwyd9-0000000BDAk-0Bue;
	Thu, 20 Aug 2026 09:00:11 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwyd2-0000000BD6D-2IJL
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Aug 2026 09:00:06 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-490cf322ed0so18186945e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Aug 2026 02:00:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787216403; x=1787821203; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wVYZJVLed/RrGWFRSVBujog+j23nJPZnuYw3+qXXz+4=;
        b=Kq1u/LE4pEQ5qEPGDB9QwlShjsfEZ9FcAdB5YmMm3YqZXMu6fDHOr0/Hq7x2QuQcTV
         SQF8ROoS0U5BMzRINzspM8SEbcZnj/S3tFpPcwaZwmzLYcYhXGCwMZLhw1mzOwgbfGDQ
         ZRDISo5D9TeyNn92gtkYzO7PtvX/kdWavfeSZZsLSA0QjOFASddcsP02fSEh0KErC84v
         ku5qnZ73E3U60UeAJmnvEEmaoSdTcUQ93RUjh/iXU5Wm53MO1v6ij+If84yLhA1mg/UO
         SvqbNhUeJwtm0+sJ1HrD3LtaTk9UsyjbpyLXI/FFMubddTljAm6c+yrchhV4bONPhhwP
         PKxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787216403; x=1787821203;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wVYZJVLed/RrGWFRSVBujog+j23nJPZnuYw3+qXXz+4=;
        b=Zwr5CcbFukA4ESq5qv5AFbtKVZLAnVpsUNq/qtxV6a8tUgJ4UoIC+iAizuRqHmNwXD
         XI9Xdyx9fwbDp7IFwOwuzC6bkrpsM1ULhU651c28i7m1u9mWwMMuMHswz7An8NCznajd
         rIgmkMy/ewRJYER2HYfDxLbO7CMK0jE9y49EgqUAHuMUwr6XUoTABiEuoAeGHqstwVYi
         1JQxdnDvfNvWNUJF/DxczeAdFiuXhhXasCZz06b1M+zMeTw3gSx1nr2FbFgMye7enInP
         Obbd+Vetl9qY1dd3IRKE3iTb/mQrv5vx4gjf985krDHDgnYg1OkRGdEvTfP25CqFvXKS
         eg4Q==
X-Forwarded-Encrypted: i=1; AHgh+RoxCaZogC8BvSsvCUv3tHg6rekT7aDS6BlGdQ+ZNoYuJLpB0/GdJkAn6J7n8K8iD0RRBIPmVi7ISCLCKpk5NnVW@lists.infradead.org
X-Gm-Message-State: AOJu0YxOfNv1P0WPCsZLn5jfKOnLZuJ10q0VKxTXORnIFUoycgY6EPr0
	dLE/vryKyGaOAaJTVDugAFrUEZK1GGVvNYpEKKB9IS+4sw4YNb743J16
X-Gm-Gg: AR+sD10ufNbHgPryjqOSXvY32It8+OhQexACDLSPTUhVuT7TKdogKOSm3RnrZR9OIJF
	ezo5WW1yMXqLHp32XVbM0xzETlRXC6R1rkL82HwIZTs6ido2PAyl9jj2ED+Zla09ffPMCcbqHro
	p+vCx4n1f7XxXyyDumOCPkz0Kj/85/60Nxd74tWZ7C9GZ2YQJuWtPEqSc9GuEmxqN0LIqKffd8P
	GZCY66wJMTcAm6EKX5GZNy4E/rCLaIrcE3+Tjrku2z2hkqRQvPpx4lxi3CTMBdOSRLuHKCoL5D+
	GCS7qsG9gw8XCd4a+5ToV/kpV7bmKsq0w0JWTef9bB9QKY7pFOsmnaEu0PGqJW9jyX7OYdjfm6r
	UR70DhMPZkfKDOMhG57Hm34HOL2+apxOoXML9DRpBwsz+6825mDbcvjliXttNIeDaIQ+5gDx3t9
	3EPEz2iyKmoYJyM8+wmrAAcruMo18rgAKyzRuUBKvVLQR/rrfdHQx5gxwT6xL6iW+/4F3R1hVrE
	GR1CflZ106WGFs8RhiDcay57tQWNKpJip7Vb3qiK7yMyGajH1UIxEI=
X-Received: by 2002:a05:600c:3b8e:b0:495:7888:281c with SMTP id 5b1f17b1804b1-499aa0dcd47mr188111325e9.0.1787216402552;
        Thu, 20 Aug 2026 02:00:02 -0700 (PDT)
Received: from fedora ([46.205.218.68])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499aa1111b2sm176837215e9.5.2026.08.20.02.00.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 02:00:01 -0700 (PDT)
From: Daniel Pawlik <pawlik.dan@gmail.com>
To: netdev@vger.kernel.org
Cc: linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	kuba@kernel.org,
	lorenzo@kernel.org,
	nbd@nbd.name,
	sean.wang@mediatek.com,
	Mark-MC.Lee@mediatek.com,
	davem@davemloft.net,
	edumazet@google.com,
	pabeni@redhat.com,
	andrew+netdev@lunn.ch,
	yangshiji66@outlook.com,
	Daniel Pawlik <pawlik.dan@gmail.com>
Subject: [PATCH v10 2/2] net: airoha: npu: use cacheline-sized buffers for mailbox DMA
Date: Thu, 20 Aug 2026 10:59:41 +0200
Message-ID: <20260820085941.380401-2-pawlik.dan@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260820085941.380401-1-pawlik.dan@gmail.com>
References: <20260820085941.380401-1-pawlik.dan@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260820_020004_646341_3AEBBD47 
X-CRM114-Status: GOOD (  15.96  )
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

On non-coherent ARM64 (EN7581), the kernel's dma_direct_map_page()
forces swiotlb bounce buffering when:

  !IS_ALIGNED(phys | size, dma_get_cache_alignment())

The NPU mailbox buffers are 12-24 bytes, well below the 64-byte cache
line size, so this check always fails regardless of physical address
alignment. The swiotlb sync path itself works correctly, but the
EN7581 NPU cannot DMA-write to the swiotlb bounce buffer address
range — it reads commands fine (mbox_status=0x7 success) but never
writes responses back, leaving response fields as zeros.

This was confirmed through five boot traces on a Gemtek W1700K:

  - Boots 1-4: all streaming DMA through swiotlb (is_swiotlb=1),
    bounce buffer byte-identical to pre-map after NPU completion,
    even after explicit CPU cache invalidation (dcache_inval_poc).
    NPU version reads 0.0.

  - Boot 5: kmalloc'd cache-line-aligned buffer bypasses swiotlb
    (is_swiotlb=0 on all 169 mappings), NPU writes response data
    directly, version reads 0.1111, WiFi fully functional.

Fix by rounding mailbox buffer allocations up to
dma_get_cache_alignment() and mapping the rounded length. The original
payload size is still programmed into the mailbox length register.
kmalloc returns cache-line-aligned pointers on ARM64 for allocations
>= ARCH_KMALLOC_MINALIGN, so the IS_ALIGNED check passes and swiotlb
is not triggered.

Fixes: 6f884eb87a79 ("net: airoha: Fix DMA direction for NPU mailbox buffer")
Link: https://patchwork.kernel.org/project/linux-mediatek/patch/20260814110017.2795022-1-pawlik.dan@gmail.com/
Link: https://patchwork.kernel.org/project/linux-mediatek/patch/20260809152813.585797-1-pawlik.dan@gmail.com/
Link: https://patchwork.kernel.org/project/linux-mediatek/patch/20260805070851.2885888-1-pawlik.dan@gmail.com/
Assisted-by: Claude:claude-opus-4-6
Signed-off-by: Daniel Pawlik <pawlik.dan@gmail.com>
---
 drivers/net/ethernet/airoha/airoha_npu.c | 25 +++++++++++++++---------
 1 file changed, 16 insertions(+), 9 deletions(-)

diff --git a/drivers/net/ethernet/airoha/airoha_npu.c b/drivers/net/ethernet/airoha/airoha_npu.c
index 4045d1eb93ea..3416f921f961 100644
--- a/drivers/net/ethernet/airoha/airoha_npu.c
+++ b/drivers/net/ethernet/airoha/airoha_npu.c
@@ -5,6 +5,7 @@
  */
 
 #include <linux/devcoredump.h>
+#include <linux/dma-mapping.h>
 #include <linux/firmware.h>
 #include <linux/platform_device.h>
 #include <linux/of_net.h>
@@ -160,15 +161,21 @@ struct wlan_mbox_data {
 	DECLARE_FLEX_ARRAY(u8, d);
 };
 
+static size_t airoha_npu_mbox_size(size_t len)
+{
+	return ALIGN(len, dma_get_cache_alignment());
+}
+
 static int airoha_npu_send_msg(struct airoha_npu *npu, int func_id,
 			       void *p, int size)
 {
 	u16 core = 0; /* FIXME */
 	u32 val, offset = core << 4;
 	dma_addr_t dma_addr;
+	size_t map_len = airoha_npu_mbox_size(size);
 	int ret;
 
-	dma_addr = dma_map_single(npu->dev, p, size, DMA_BIDIRECTIONAL);
+	dma_addr = dma_map_single(npu->dev, p, map_len, DMA_BIDIRECTIONAL);
 	ret = dma_mapping_error(npu->dev, dma_addr);
 	if (ret)
 		return ret;
@@ -191,7 +198,7 @@ static int airoha_npu_send_msg(struct airoha_npu *npu, int func_id,
 
 	spin_unlock_bh(&npu->cores[core].lock);
 
-	dma_unmap_single(npu->dev, dma_addr, size, DMA_BIDIRECTIONAL);
+	dma_unmap_single(npu->dev, dma_addr, map_len, DMA_BIDIRECTIONAL);
 
 	return ret;
 }
@@ -333,7 +340,7 @@ static int airoha_npu_ppe_init(struct airoha_npu *npu)
 	struct ppe_mbox_data *ppe_data;
 	int err;
 
-	ppe_data = kzalloc_obj(*ppe_data);
+	ppe_data = kzalloc(airoha_npu_mbox_size(sizeof(*ppe_data)), GFP_KERNEL);
 	if (!ppe_data)
 		return -ENOMEM;
 
@@ -354,7 +361,7 @@ static int airoha_npu_ppe_deinit(struct airoha_npu *npu)
 	struct ppe_mbox_data *ppe_data;
 	int err;
 
-	ppe_data = kzalloc_obj(*ppe_data);
+	ppe_data = kzalloc(airoha_npu_mbox_size(sizeof(*ppe_data)), GFP_KERNEL);
 	if (!ppe_data)
 		return -ENOMEM;
 
@@ -375,7 +382,7 @@ static int airoha_npu_ppe_flush_sram_entries(struct airoha_npu *npu,
 	struct ppe_mbox_data *ppe_data;
 	int err;
 
-	ppe_data = kzalloc_obj(*ppe_data);
+	ppe_data = kzalloc(airoha_npu_mbox_size(sizeof(*ppe_data)), GFP_KERNEL);
 	if (!ppe_data)
 		return -ENOMEM;
 
@@ -399,7 +406,7 @@ static int airoha_npu_foe_commit_entry(struct airoha_npu *npu,
 	struct ppe_mbox_data *ppe_data;
 	int err;
 
-	ppe_data = kzalloc_obj(*ppe_data, GFP_ATOMIC);
+	ppe_data = kzalloc(airoha_npu_mbox_size(sizeof(*ppe_data)), GFP_ATOMIC);
 	if (!ppe_data)
 		return -ENOMEM;
 
@@ -434,7 +441,7 @@ static int airoha_npu_ppe_stats_setup(struct airoha_npu *npu,
 	int err, size = num_stats_entries * sizeof(*npu->stats);
 	struct ppe_mbox_data *ppe_data;
 
-	ppe_data = kzalloc_obj(*ppe_data, GFP_ATOMIC);
+	ppe_data = kzalloc(airoha_npu_mbox_size(sizeof(*ppe_data)), GFP_ATOMIC);
 	if (!ppe_data)
 		return -ENOMEM;
 
@@ -466,7 +473,7 @@ static int airoha_npu_wlan_msg_send(struct airoha_npu *npu, int ifindex,
 	int err, len;
 
 	len = sizeof(*wlan_data) + data_len;
-	wlan_data = kzalloc(len, gfp);
+	wlan_data = kzalloc(airoha_npu_mbox_size(len), gfp);
 	if (!wlan_data)
 		return -ENOMEM;
 
@@ -489,7 +496,7 @@ static int airoha_npu_wlan_msg_get(struct airoha_npu *npu, int ifindex,
 	int err, len;
 
 	len = sizeof(*wlan_data) + data_len;
-	wlan_data = kzalloc(len, gfp);
+	wlan_data = kzalloc(airoha_npu_mbox_size(len), gfp);
 	if (!wlan_data)
 		return -ENOMEM;
 
-- 
2.55.0


