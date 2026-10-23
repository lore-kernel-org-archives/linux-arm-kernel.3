Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 902CD606A31D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Oct 2026 06:59:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=A4qLL+4C;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=VkTq0v5L
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=BEYeOIBfrzs0WQ5u631SCgZX05KneuJujFgcZvGxaek=; b=A4qLL+4CVlt2mpxhzs2MDMFJi+
	wG4zK767SjPMjzZqFddtGQE2rp4lapiTh2OWRgNpqZ4yS82JhmVT45tbgVLU7UQLgwzZHRIvKWLoP
	g6NBMR050bfsdbsWnUss22qTfvENYdj29Hjs1eFvUR1Q2k9EUSXHgJ1z14NRHKfy7pvqpRSUznEpO
	k2altWvrwyN58ad4gR4BM/f+MDYdxwG1vCtD5KVH42ZGy8fVoSFb/XJz4U98r8uWQM9NRQIlqqoQz
	alEidICozMy19oAN3emtk5jISZ6mJ1FugbtO7pn3+6CE7VFVebvesdJTb1qGmeX8BAI1wgaOc8iv5
	aaovD5cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK9FN-0000000FfO5-05L2;
	Fri, 23 Oct 2026 06:59:25 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK9FK-0000000FfNZ-0Q0K
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Oct 2026 06:59:23 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-2e831e86ebfso3168405ad.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Oct 2026 23:59:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792738761; x=1793343561; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BEYeOIBfrzs0WQ5u631SCgZX05KneuJujFgcZvGxaek=;
        b=VkTq0v5LxR3HlLfU6cKNYlDTFCP47UxRXhjMTEDk1NVcGjku4KOPNzSwXg/1HC9Vm8
         19VepL7QjIuLo+RMnXznk3BIOXrcfJNMhLvbnVpiibhhOZXrdxVlaZ0z+GL4RNxQaqAc
         KCR0p6h1ClTShZwpXZQDBOpd8wZUku5+M5tSD+7Y8kQx0skgGNNK2JJiGWa7pHH1jhwj
         X4E2SI+tcmPy6jwZ5e+oIbwUZnnwaQ/ucagXSEVjnhNpPxPba+05Ry9hNKq3zbUQRT+w
         jB/10j2PnaPhh1ZHr/c9K1ZpUViwSCm1y2O5sVuscd8Te4qjQfUgFw36fBBfkNNBjhtO
         82Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792738761; x=1793343561;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BEYeOIBfrzs0WQ5u631SCgZX05KneuJujFgcZvGxaek=;
        b=zgEQFAcDtWA8D32kJ/SXiT8uUtl/PhaA1vTxiwRgnpAUUIv2v5jiDFTP57V+QBs0DP
         ja/BCjEK0A6hyT9+4zCcZWEOD+KDGBGOoC/FYrY8WzwUBl6MLvGX7nukMl+xMpjZYmuk
         ce08IqSeddHjFSiHwgDebXg8zwCfL3RgUBdWK3keBvMdKAjikI4vrD2wl/1lWZIUTj+z
         HXRZcGvkafMNU7QyeR5KLjH0oWIzY9Mq2sGIhfVwRnxylbhzR0lt7sIGpQhd0pqWmwoN
         1l6ZeDnlMgFPV1PLuLiniNqNYihLABzttCgAMma05dYyRhaDDpq4k++fsUCD9p+G7fhL
         wvHw==
X-Forwarded-Encrypted: i=1; AKwUvBwoGe9vErJazVxr/4PZTjBNlpc+rVWmHe1OPGWXI4KgdPiQHRwcQKqi8HxUKjOesraasWsR9Ns+YFMcbH6dXPfw@lists.infradead.org
X-Gm-Message-State: AFq9FYKkUV5zqWNSjswRU4N486mE6Krqiad4/N4Cb2T56D5PI+Ax8g0+
	r2+UwzZlCz6wn9WGZkuIvy1TnBKLMEbTEnatXlcoqbj+zg9jT0Cu1wey
X-Gm-Gg: AYBFou3smUHO8lHqXkfYjYQC04WgSuSLtOEFhEUfD0XYaK2b3Vinrj036wNwzKuS7ow
	Wt1O0HprdUesmSiVmilKlia03Ng7l4c7sqOaAEQbDqpR34AxwNZSRsI3uNS/yvLZF+EyDjsL9D7
	rarWvmPHItb9bwvcAB08U2AWxmnyoVHZxjKqxDZyIdWLiAS5ASnuRHXGEDsNMbMP0bPCZiKTkkV
	moySehgX4yyR86x0NRiy54gonPmZBZkuOCUbc4OcQaWPg4o63SNCg5jYw08D9LeGDfRfFNQzNz7
	oQc6u07HkrOcQcRduZInc50mA2u8kK01b4qz09gs/haMA0GAuNr1gSfTiE9qbAqO/67YUQbpgZP
	WAnwDHmucL9/oC1qmvPS+2LAjLK17LxQXqow7/s3APmjr3HPqquMDC7o0EtLOlNJWh5p86c39vi
	YEXWAwpOAeoArITumdxRVl9lc+V5/Z5q9DNTRK+eHGznRHKPMsIknyj/jSD/KU3uvwLmmvCv4PM
	ExpfYwn8S8szI943G34h6iCHK88leV1HWGf4kT1u6VIwW5W21sSPqVfnuDr5kQ70IQcDLnszXY=
X-Received: by 2002:a17:902:f603:b0:2e6:2868:e576 with SMTP id d9443c01a7336-2ea7d100b32mr16154985ad.31.1792738761066;
        Thu, 22 Oct 2026 23:59:21 -0700 (PDT)
Received: from spiderman.taila3fd8c.ts.net ([202.112.47.77])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea7af6eb44sm6395195ad.11.2026.10.22.23.59.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 23:59:20 -0700 (PDT)
From: Li Ximo <lixicaicai@gmail.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Vinod Koul <vkoul@kernel.org>
Cc: Michal Simek <michal.simek@amd.com>,
	Frank Li <Frank.Li@kernel.org>,
	dmaengine@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Wang Haoran <haoranwangsec@gmail.com>,
	Li Ximo <lixicaicai@gmail.com>
Subject: [PATCH] dmaengine: xilinx: dpdma: Fix crash on zero-length cyclic transfer
Date: Fri, 23 Oct 2026 14:59:00 +0800
Message-Id: <20261023065900.3455414-1-lixicaicai@gmail.com>
X-Mailer: git-send-email 2.25.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_235922_144685_E9852995 
X-CRM114-Status: GOOD (  13.32  )
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

list_first_entry() does not return NULL when the list is empty; it
returns the result of container_of() on the list head, i.e. a wild
pointer rather than a valid entry. This was found by code audit.

In xilinx_dpdma_chan_prep_cyclic(), periods is computed as
buf_len / period_len. When buf_len is 0, the wrapper
xilinx_dpdma_prep_dma_cyclic() does not reject the request: it only
checks buf_len % period_len, and 0 % period_len == 0 passes. The
build loop then never executes, leaving tx_desc->descriptors empty
and 'last' still NULL. The unconditional list_first_entry() on the
empty list returns a wild pointer, and the immediately following
last->hw.next_desc write dereferences NULL, so a zero-length cyclic
request leads to a near-guaranteed kernel oops (plus an out-of-bounds
read of sw_desc->dma_addr through the wild pointer).

Bail out through the existing error path (freeing the tx descriptor
and returning NULL) when the descriptor list is still empty after the
build loop. A non-empty list also implies that the loop ran at least
once, so 'last' is guaranteed to be valid as well.

Reported-by: Wang Haoran <haoranwangsec@gmail.com>
Reported-by: Li Ximo <lixicaicai@gmail.com>
Signed-off-by: Wang Haoran <haoranwangsec@gmail.com>
---
 drivers/dma/xilinx/xilinx_dpdma.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/dma/xilinx/xilinx_dpdma.c b/drivers/dma/xilinx/xilinx_dpdma.c
index d9a3542c4..bdfa85b80 100644
--- a/drivers/dma/xilinx/xilinx_dpdma.c
+++ b/drivers/dma/xilinx/xilinx_dpdma.c
@@ -730,6 +730,9 @@ xilinx_dpdma_chan_prep_cyclic(struct xilinx_dpdma_chan *chan,
 		last = sw_desc;
 	}
 
+	if (list_empty(&tx_desc->descriptors))
+		goto error;
+
 	sw_desc = list_first_entry(&tx_desc->descriptors,
 				   struct xilinx_dpdma_sw_desc, node);
 	last->hw.next_desc = lower_32_bits(sw_desc->dma_addr);
-- 
2.30.2


