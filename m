Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2F65CD4F3C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 May 2026 18:57:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=yxLY9EqpF77hSPOoFBzsiCl9/0u0FyX67Jy/NSMRVXo=; b=VFK1DZ20AlmlkA2yADzwJ2NMsV
	VetWAOegUcIgFwTWPpdT1ODBFcEmF5mccD3i4akHYT5TyIjli3N91rh4EpNLF8qLSZ82RY8Y2QXUY
	5rSdlIc3kKwxghZqkOmJSDNqgiRmPngS1vCSe7Gvdb6KW0rug8+IkdePRB9MeVDIPwDyKhItDy02A
	6PHn1vpoW9K2KYJkSYU5ASLFzXn+X7CsNbvNdSdizq/ZY4LzDWtB50KPLSuau3dpp0KAiMBa6X0LU
	M+MOkTnxGyWSS23uZ2hi/c5v2c5iuXFI/A0n6nT5Bjlfe+JpNEwaPJ/+Sn49Bd5CR78/VyLAGtBAv
	WLzVczwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNxig-00000009ADS-1lt0;
	Fri, 15 May 2026 18:57:10 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNxie-00000009AD3-0N4m
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 15 May 2026 18:57:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=yxLY9EqpF77hSPOoFBzsiCl9/0u0FyX67Jy/NSMRVXo=; b=frXfdh1ERuj/ZF7VL69XoqRGlu
	NrxNFYKCfZ62AC1oiQanhY08jwEzIUxg8DygKrb7wTrq4AJmsVrW0phENOFPxN7izK5HnkveBzuBL
	q6eU1cxPZs9OJgKNm+yjXET8hNbGXy5LRBRNqPYoNHZBZ+uqQeFm0ld9Si72QmwwDZgEQEu8jE2QH
	B/PrQPsqKfvegUaAGiJMTROXvFpQdnTsMw3tCFDsvcJM5PzZHWjci9T2fsITXG4KsmmrFUZxU2UuP
	/bi9gyirToi9y5RdQsjZgYJxAaVjhBMq7bre8ugasftWK5U3OX6tcuLOJtZ2YN88qejd89LYHMbjR
	Cg5KMmgw==;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNxia-0000000620F-2tTR
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 May 2026 18:57:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1778871415;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=yxLY9EqpF77hSPOoFBzsiCl9/0u0FyX67Jy/NSMRVXo=;
	b=J2jJei2nqopR2OqqW07ohanchkqG58vZnn50ViYXM6/fnkejuWk3MIh1eTVS0UJuH8rcCv
	Hbp1IkIjnqR+FCBe5Tob9EKF+RHi1SyKZSmyQmrachFonodZb0YonAPOIRCflFxirble3e
	3VvEeSm6VE0I01UnDWHdZqsahT5xyyM=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1778871423;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=yxLY9EqpF77hSPOoFBzsiCl9/0u0FyX67Jy/NSMRVXo=;
	b=aO28jCqzl+PEmPtnVRyn3/e+ROcwQLqEQxHxgIBiXXZIEUMuVZxO9vM0+5v12VKgxvXKh5
	8YcAaBj5emSTJ5EfPxRqeE1i1737461DFZUQOvY/xg3Uw5Cm2TDL64T78dLARzAdhv0Iu5
	rrJBXoxTGtyqeewWsI4DYMzzsOebLFc=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-231-sVFDpB2MP2ec2VGg9EbMEQ-1; Fri, 15 May 2026 14:56:53 -0400
X-MC-Unique: sVFDpB2MP2ec2VGg9EbMEQ-1
X-Mimecast-MFC-AGG-ID: sVFDpB2MP2ec2VGg9EbMEQ_1778871413
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-48fd33b4921so653415e9.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 15 May 2026 11:56:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778871413; x=1779476213;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yxLY9EqpF77hSPOoFBzsiCl9/0u0FyX67Jy/NSMRVXo=;
        b=GIcvBwolH8UKZ8dlGeC8K1WDR1+PQJ2n2kBAuzbk2UQrXwVkXYFNk8TDIjQeyYnBMe
         2/zZooAomBDx5BsLrW6WQ/K8pVG+YE0LMYvwsI7rDmrX/HSAjW++Ycm3TjeCtYFazdSQ
         iTmL6MnpUKn53aTHFbdSGU/yIaoKgzYcFv5XFsWVEpzA9d0QqWeHccXnUwg7tV8eiMa0
         Yf6jsn7CMevqF5/vluAoQg7vePFFphZhmM6nbQCLIV6qjUiprk8tUaKfXf4ExhJuzRqR
         LwBp/ZManNm/eA3/sT6BRMvRfu+0ve9igK1EVW6TYpIFR6caOAzEyfnNUTEj5dH/5OoL
         /Lyg==
X-Gm-Message-State: AOJu0YyUGcDD0Wtp56nLqiBShX2MbolQZvIBxHx/UkB+6u4zVvIy8w/3
	W8AsmI1pcL4WWbbkdGMuiKJ8ArXG6yqdN+NHq7yPbej2EiPDZxqJhGQYtkJKSCpEyH/+RzhMhB8
	Q42iJB8PYy06uA3QTPU2tUngpm6CnEeKOKoL8PlkBSnVyWCh/YLLk0YHXv2ktRyM9A1udN2sU22
	OX
X-Gm-Gg: Acq92OGWkagZEr01/ELFnYHQmuKmD41auN5g5dWZQKZx6ZlZgSetF7jcbcqiWuFVwUm
	I9iKOnEyy+5V1bhZw+CukxPDy+2XA31hRXByVSXOIEkKR0/UgLJu1rgZd283Z5bV8/ZNnBb06+h
	a+TDyWOI+27HZT2H0W3CA/B4j2EJ0AsozFduIWkiDxHljBB/0n6PHyjR0ZtKgm711IFbaKygpkJ
	8xi4onxHuqjV73ESn+7GbQlw794yXJjVuId74ry3w2WMHRHPISzquyx0SrmlV+DRn75AUL05M3F
	xwNh31IfQ1jcf6xRMyLBxpgeWw93OHHemOs4TohSJIweZhSiMa64jTrBgHgkJ9nfUeOKzQI6kQw
	+GzF0bciqLb1KtRAxW2xgoiWLT8TtJdK8AzI=
X-Received: by 2002:a05:600c:8b56:b0:48e:7f1c:8776 with SMTP id 5b1f17b1804b1-48fe6514c83mr81580105e9.25.1778871412661;
        Fri, 15 May 2026 11:56:52 -0700 (PDT)
X-Received: by 2002:a05:600c:8b56:b0:48e:7f1c:8776 with SMTP id 5b1f17b1804b1-48fe6514c83mr81579835e9.25.1778871412212;
        Fri, 15 May 2026 11:56:52 -0700 (PDT)
Received: from costa-tp.bos2.lab ([2a00:a041:e223:1b00:fe51:8bb:7986:c897])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fea52a0bfsm32066625e9.0.2026.05.15.11.56.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 11:56:51 -0700 (PDT)
From: Costa Shulyupin <costa.shul@redhat.com>
To: Arnd Bergmann <arnd@arndb.de>,
	linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	Costa Shulyupin <costa.shul@redhat.com>
Subject: [PATCH v1] include: Remove unused dma-iop32x.h
Date: Fri, 15 May 2026 21:54:41 +0300
Message-ID: <20260515185447.1530941-1-costa.shul@redhat.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: zOYO6mVQ3LLmR75Zot_CPVc7ZNXjSJ7Y0jW__8donr0_1778871413
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=true
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260515_195705_175665_DE030A5A 
X-CRM114-Status: GOOD (  13.73  )
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

The IOP32X platform was removed in commit b91a69d162aa
("ARM: iop32x: remove the platform") and its DMA driver in
commit cd0ab43ec91a ("dmaengine: remove iop-adma driver").
No file includes this header.

Assisted-by: Claude:claude-opus-4-6
Signed-off-by: Costa Shulyupin <costa.shul@redhat.com>
---
 include/linux/platform_data/dma-iop32x.h | 110 -----------------------
 1 file changed, 110 deletions(-)
 delete mode 100644 include/linux/platform_data/dma-iop32x.h

diff --git a/include/linux/platform_data/dma-iop32x.h b/include/linux/platform_data/dma-iop32x.h
deleted file mode 100644
index ac83cff89549..000000000000
--- a/include/linux/platform_data/dma-iop32x.h
+++ /dev/null
@@ -1,110 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-/*
- * Copyright © 2006, Intel Corporation.
- */
-#ifndef IOP_ADMA_H
-#define IOP_ADMA_H
-#include <linux/types.h>
-#include <linux/dmaengine.h>
-#include <linux/interrupt.h>
-
-#define IOP_ADMA_SLOT_SIZE 32
-#define IOP_ADMA_THRESHOLD 4
-#ifdef DEBUG
-#define IOP_PARANOIA 1
-#else
-#define IOP_PARANOIA 0
-#endif
-#define iop_paranoia(x) BUG_ON(IOP_PARANOIA && (x))
-
-#define DMA0_ID 0
-#define DMA1_ID 1
-#define AAU_ID 2
-
-/**
- * struct iop_adma_device - internal representation of an ADMA device
- * @pdev: Platform device
- * @id: HW ADMA Device selector
- * @dma_desc_pool: base of DMA descriptor region (DMA address)
- * @dma_desc_pool_virt: base of DMA descriptor region (CPU address)
- * @common: embedded struct dma_device
- */
-struct iop_adma_device {
-	struct platform_device *pdev;
-	int id;
-	dma_addr_t dma_desc_pool;
-	void *dma_desc_pool_virt;
-	struct dma_device common;
-};
-
-/**
- * struct iop_adma_chan - internal representation of an ADMA device
- * @pending: allows batching of hardware operations
- * @lock: serializes enqueue/dequeue operations to the slot pool
- * @mmr_base: memory mapped register base
- * @chain: device chain view of the descriptors
- * @device: parent device
- * @common: common dmaengine channel object members
- * @last_used: place holder for allocation to continue from where it left off
- * @all_slots: complete domain of slots usable by the channel
- * @slots_allocated: records the actual size of the descriptor slot pool
- * @irq_tasklet: bottom half where iop_adma_slot_cleanup runs
- */
-struct iop_adma_chan {
-	int pending;
-	spinlock_t lock; /* protects the descriptor slot pool */
-	void __iomem *mmr_base;
-	struct list_head chain;
-	struct iop_adma_device *device;
-	struct dma_chan common;
-	struct iop_adma_desc_slot *last_used;
-	struct list_head all_slots;
-	int slots_allocated;
-	struct tasklet_struct irq_tasklet;
-};
-
-/**
- * struct iop_adma_desc_slot - IOP-ADMA software descriptor
- * @slot_node: node on the iop_adma_chan.all_slots list
- * @chain_node: node on the op_adma_chan.chain list
- * @hw_desc: virtual address of the hardware descriptor chain
- * @phys: hardware address of the hardware descriptor chain
- * @group_head: first operation in a transaction
- * @slot_cnt: total slots used in an transaction (group of operations)
- * @slots_per_op: number of slots per operation
- * @idx: pool index
- * @tx_list: list of descriptors that are associated with one operation
- * @async_tx: support for the async_tx api
- * @group_list: list of slots that make up a multi-descriptor transaction
- *	for example transfer lengths larger than the supported hw max
- * @xor_check_result: result of zero sum
- * @crc32_result: result crc calculation
- */
-struct iop_adma_desc_slot {
-	struct list_head slot_node;
-	struct list_head chain_node;
-	void *hw_desc;
-	struct iop_adma_desc_slot *group_head;
-	u16 slot_cnt;
-	u16 slots_per_op;
-	u16 idx;
-	struct list_head tx_list;
-	struct dma_async_tx_descriptor async_tx;
-	union {
-		u32 *xor_check_result;
-		u32 *crc32_result;
-		u32 *pq_check_result;
-	};
-};
-
-struct iop_adma_platform_data {
-	int hw_id;
-	dma_cap_mask_t cap_mask;
-	size_t pool_size;
-};
-
-#define to_iop_sw_desc(addr_hw_desc) \
-	container_of(addr_hw_desc, struct iop_adma_desc_slot, hw_desc)
-#define iop_hw_desc_slot_idx(hw_desc, idx) \
-	( (void *) (((unsigned long) hw_desc) + ((idx) << 5)) )
-#endif
-- 
2.53.0


