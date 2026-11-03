Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E993C6082BDF
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 08:33:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=t23mUWy1;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=u2u2VGSL
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=l4U/3KUqu/qVdhfefKvegkeTdRkvD6adQTd3BjiKpMs=; b=t23mUWy1lKx3qEjPoODitosHDA
	LxeLtGzEOl84ItQXaxCAJMhva/90xzwr2GEoZNo771i1J/5rIWIMqQk/mKcNnauW8tfDasAAipwDC
	AciFUQAN0y3R4CtUJKZGCF/gWdgBpxH8xr1BL2Ydivfv0YxsUb5RtCDFIL84X5tCojlCHXtOTv+AW
	0N34HwGorwBezUYxd8c4rxwQuMaKHwJsqvfVnj1zfTgQH0Gog/rUyhS8bnM5SO9W7dBRXYIFvXJhg
	Tf53frK7EBpNRaY47qD229rcPlS1bkxFS4pW8Ho41TbMXcjcEOAJTmmC6j/pMJZOSvtO6Hqbju6Sy
	78Ffx0Ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO9wt-00000001Yns-2uco;
	Tue, 03 Nov 2026 08:32:55 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO9wo-00000001YnC-10cJ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 08:32:54 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-2eb5251724bso9277135ad.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Nov 2026 00:32:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793694769; x=1794299569; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=l4U/3KUqu/qVdhfefKvegkeTdRkvD6adQTd3BjiKpMs=;
        b=u2u2VGSL34KqyWtHNXMMCaKlRoPNftwsOUyJGZYQSnLA+gllns+Tz1Pi4tcnVm5KLe
         h/ELKgYkdlH0QFTJQe4RJrvCSuBKXPke8E+je/7q83Cj9Odo2/8pG0d6OEinCWdJLSi3
         cbK9h80HTsstqopW2sUrc8raFIpt6Ngag/pU6zHaWQ5CETfSuAv2Gr81/5WnQRxSj093
         Fdz6rkJMoOQcDdVXRJ2SPacaFbdjxEIVs7bn32Pdy6Urxn6DyoFvHED9bCvWDESgIGtB
         Y4UTIdVR3ucIHEsIxNurhEYf7e2C4FPHrSF36bG18CJ66YrSxEl0QDnAqHufrDNXAx8z
         xedA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793694769; x=1794299569;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=l4U/3KUqu/qVdhfefKvegkeTdRkvD6adQTd3BjiKpMs=;
        b=PlJRfEmKoaicdIRa8X0G+jLdMAp26x/jqqEud2PBcHD5UlwgYwkWl6GA4WggzMbRjp
         I/sZgyE8vBatNNGrES/19qXVYGtxbTv8bgeGGxrDCMEqcLfcLnkfIlsGyqRupQWe9Te4
         YNI+Bkjhbf+qBHE1YFb1yKwg3Kh0fKjtGmZ5OoyaVeH7wJ8/6gyoYDdo2L7760Ec6iRy
         wDsITg1n/ccsFmQ+yOSqtRmzuX5vm7Z895JG6f8uh0YjzgjNQVmEN0f3hzfykRStU31X
         eA9XzUZSuR2WpKam9rMH2XlGb+C45ke+p9bWevZ6uym/s4JnzWkAyw8xm8YufqGtL6fr
         IHEA==
X-Forwarded-Encrypted: i=1; AKwUvBxwR4tES2gJxeYyfXraPMwoEWgFszFiDFEpMcyPz5JjL+/ZzFlE3rSWcu9Ts8xpK/QaD0aPwYsBxov3lEgaN24b@lists.infradead.org
X-Gm-Message-State: APuU4Z+Ej3ckvcBSBlNFyib2rS65rWsBFCIowAKckOBYnERoiLpmjWRO
	TftiW7P1jC1/VeIZfzLmlAY0fZBeBZ+RsSSs7F0RifuezCk/1W3lLo9O
X-Gm-Gg: AYBFou0uPLBfJH0qP00Hy5witsqecWAZhs4aAn717nzBTtdwgfGHXy6CigaBbScHtHx
	sNMsFQEU/2dxEMgbrNbAWYlqfz5D07oQFGWrxxkIsaB1IOVuz++P9evVfOA9WG4bLPHbfbIciMP
	YcdCsUaNu7ukUxKq3H/GiNjBodLbs879OZRSM6CInKwjBPYWx550qB2y8py3VqtUubnGQPevbrE
	VysO5ild6r0uDyP6fE5tNWVtakP5HsXgX4iVJLq0uPUZay51TzUwCsoQH64VQstDhraoEnSmZqk
	xWKwM/Om0gqd0PghfMttBQylKZ7PWu727PWTGWRUtE/8zsXrLqQoDru6BTz4yXVQWfzL3ZujBA+
	NIsLWJIpyW83XfpPhGNdSJJHp3fiHLNzQli2BkpepIAGcFUaNmrkjvlUopR1TIJ0W+TM3id8iKz
	KYutQv3Lswcf9fSuD0il0tVyCRmnpDFvmpTy4Tz+f6IksVvAeWl4E/jx1WJf4J6PBV6FG7fitma
	sjQqTGmtTqOxageuMrw+IyJCOxEg9T87ZKBRRtBXCJ8K34Mp8/yFeIWBzwZ8iX99oE0W8Nuoz3y
	bX+eNAQQ2PZt5loUjZJS5YrUKMV0RRJafdapp2kU3LqAUgg3
X-Received: by 2002:a17:903:46ce:b0:2e9:723a:cf37 with SMTP id d9443c01a7336-2eb364e0725mr114991555ad.50.1793694769016;
        Tue, 03 Nov 2026 00:32:49 -0800 (PST)
Received: from spiderman.taila3fd8c.ts.net ([202.112.47.77])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eb392a5f48sm37036785ad.64.2026.11.03.00.32.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 00:32:48 -0800 (PST)
From: Li Ximo <lixicaicai@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Michal Simek <michal.simek@amd.com>
Cc: Frank Li <Frank.Li@kernel.org>,
	dmaengine@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Wang Haoran <haoranwangsec@gmail.com>,
	Li Ximo <lixicaicai@gmail.com>
Subject: [PATCH v2] dmaengine: xilinx: Fix wild pointer dereference on empty segment list
Date: Tue,  3 Nov 2026 16:32:39 +0800
Message-Id: <20261103083239.2033556-1-lixicaicai@gmail.com>
X-Mailer: git-send-email 2.25.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_003250_302190_63EE8AF3 
X-CRM114-Status: GOOD (  15.37  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Wang Haoran <haoranwangsec@gmail.com>

list_first_entry() does not return NULL on an empty list; it returns the
result of container_of() on the list head, i.e. a wild pointer. In the
Xilinx DMA driver, the prep functions xilinx_dma_prep_peripheral_dma_vec(),
xilinx_dma_prep_slave_sg() and xilinx_mcdma_prep_slave_sg() can build zero
segments while still returning a descriptor, and both they and
xilinx_dma_get_metadata_ptr() then take list_first_entry() of the empty
segment list, yielding a wild pointer that is dereferenced for
desc->async_tx.phys or the metadata app words.

Guard the three prep functions against an empty segment list by going
through the existing error path (which frees the descriptor and returns
NULL), and make xilinx_dma_get_metadata_ptr() return ERR_PTR(-ENODATA)
in that case without touching the length outputs, matching the ERR_PTR()
convention that dmaengine_desc_get_metadata_ptr() and its callers (e.g.
axienet) check with IS_ERR().

This issue was found by static analysis.

Reported-by: Wang Haoran <haoranwangsec@gmail.com>
Reported-by: Li Ximo <lixicaicai@gmail.com>
Signed-off-by: Wang Haoran <haoranwangsec@gmail.com>
---
v1: https://lore.kernel.org/r/20261023065806.3175584-1-lixicaicai@gmail.com
v2: xilinx_dma_get_metadata_ptr() now returns ERR_PTR(-ENODATA) instead
of NULL and no longer modifies *max_len/*payload_len on failure, per
Frank Li's review; the prep function guards are unchanged.

 drivers/dma/xilinx/xilinx_dma.c | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/drivers/dma/xilinx/xilinx_dma.c b/drivers/dma/xilinx/xilinx_dma.c
index cffe7c6fa..8b9e3a13e 100644
--- a/drivers/dma/xilinx/xilinx_dma.c
+++ b/drivers/dma/xilinx/xilinx_dma.c
@@ -649,9 +649,12 @@ static void *xilinx_dma_get_metadata_ptr(struct dma_async_tx_descriptor *tx,
 	struct xilinx_dma_tx_descriptor *desc = to_dma_tx_descriptor(tx);
 	struct xilinx_axidma_tx_segment *seg;
 
+	seg = list_first_entry_or_null(&desc->segments,
+				       struct xilinx_axidma_tx_segment, node);
+	if (!seg)
+		return ERR_PTR(-ENODATA);
+
 	*max_len = *payload_len = sizeof(u32) * XILINX_DMA_NUM_APP_WORDS;
-	seg = list_first_entry(&desc->segments,
-			       struct xilinx_axidma_tx_segment, node);
 	return seg->hw.app;
 }
 
@@ -2305,6 +2308,9 @@ static struct dma_async_tx_descriptor *xilinx_dma_prep_peripheral_dma_vec(
 		}
 	}
 
+	if (list_empty(&desc->segments))
+		goto error;
+
 	head = list_first_entry(&desc->segments, struct xilinx_axidma_tx_segment, node);
 	desc->async_tx.phys = head->phys;
 
@@ -2406,6 +2412,9 @@ static struct dma_async_tx_descriptor *xilinx_dma_prep_slave_sg(
 		}
 	}
 
+	if (list_empty(&desc->segments))
+		goto error;
+
 	segment = list_first_entry(&desc->segments,
 				   struct xilinx_axidma_tx_segment, node);
 	desc->async_tx.phys = segment->phys;
@@ -2613,6 +2622,9 @@ xilinx_mcdma_prep_slave_sg(struct dma_chan *dchan, struct scatterlist *sgl,
 		}
 	}
 
+	if (list_empty(&desc->segments))
+		goto error;
+
 	segment = list_first_entry(&desc->segments,
 				   struct xilinx_aximcdma_tx_segment, node);
 	desc->async_tx.phys = segment->phys;
-- 
2.30.2

