Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB5F1606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Oct 2026 06:58:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=iyw/jyJM;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=VqcCB4Fy
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=1DJT0TfcFF6fHDkLmQ9YCOKDQzpNymd53lcGEn9Xipk=; b=iyw/jyJMuOFvHaOG7RYgtlXLMf
	VJlcW1gAVvVfgOzPmJhjnS3DcKeCbqerz9L2kEsJWYQq58OAU59/pkAw96rO1NBe7+/62+KWLkZ4v
	wGm1Jf9z0pR9ooFQJN2Clixx8qxKyApsP1qRkmctODpOkejVnJbYQG6Xb0QZw3XGQeqEmXZRl175C
	lG+0BvTvd/kD9sgwxfUsc/QQrELyORqFar8u0j6jZ1upNSiE+IMx7NfWBETtIWCa2McQO8RPWd7sq
	K9DraXRWcuN24AdbmrpWS3B4Cp0EYudxeDhPqjLgJl/kt7vKAve/2rIsrnBeo0OtonExY1CyfKA25
	F1swowvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK9Ef-0000000FfGd-36hf;
	Fri, 23 Oct 2026 06:58:41 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK9Ec-0000000FfG5-2FLA
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Oct 2026 06:58:39 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-8a070b3f44aso225474b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Oct 2026 23:58:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792738717; x=1793343517; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1DJT0TfcFF6fHDkLmQ9YCOKDQzpNymd53lcGEn9Xipk=;
        b=VqcCB4FyOjP1VrTp3MyhbexIZdRZEYvTA5Lo+0zcjybIpci1+GJqoCrlTLH6Dsna8G
         j8mOQLSZDCcuIqRrQSVD8RCZBSXtoNm4vsfltc5qgSTnsSRPcJC4jvvlVVRFoTLvi7Rl
         rt6g2v0FIcgY4OUwDxtI9/mBe0v+zKvhT0/MtlfG9/1aYVeZc4TDEhyzDyQqilg0/fmP
         gA/TwnKMqDbn3GW73ZiBHDr1KPsgLBJHTujDyfGJIFbXNwRzmWygkapdvA2YgSZVIXA0
         D/YXCTAaknNoPZWojS4M32sEUxAvqc1PLfSmbt7Enau+C7rySIK/N3J4Q+pY0/1DFB2+
         UfxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792738717; x=1793343517;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1DJT0TfcFF6fHDkLmQ9YCOKDQzpNymd53lcGEn9Xipk=;
        b=PjKeK0nWVv94OFtsHqd4VTxDRowIa0lsbMgeUgMVj+XUOI0ikrKQXldc4MALk0gMFJ
         TX9W3XNLtVSeAXcDGgtbvKLiJgJWshPuGwIjck7mJAzhHsO0AiDvW//k5T9jPE6OdLWK
         g2bREH9wztfJSsOVoVEmm65HrqeFTL/A0yuF2wHv69KjZRw4yRMcwkMQ9AiRglzERwTR
         1NDmHvXtHVXE0j6m15CeTdI2q4qPdMhVW827kM5c2KDCY7dTLvaiTjrrZJSm+GrPsz1H
         P1RlTeUfT7BCLucCl7NzidY0Yor5rxMW6Kv5YPGfVf/AIP7ae/mq+1LzfE4U7UX30nsZ
         FiWg==
X-Forwarded-Encrypted: i=1; AKwUvBxo16sxJEnXL6L7QsDolGji7Sd2kIE2rkWEw7z3zS2AxCN8/SfQy2MB18FBAgH4zUtDfejwgdPQWFmHlLNXjPE3@lists.infradead.org
X-Gm-Message-State: AFq9FYLZlIbeaSYOhLjOOfB6OY1F3LA1vnupFBFtGekpSm2A10bgjp4O
	qHe/BtoUkv6HBC0bV/+x08u4i84isjWp0rceUZtcxv884rej36nQG2Nj
X-Gm-Gg: AYBFou0R/sVJOmnfnaluSGe4efaBimK3hha1gY6VgpTYzf1zL6lJrOJjel5oSTzsRXP
	32ObN0WoHEC/HpJ3ypYe0NTf69pqn6tj8bTpUjUYen43C/URTGTi5GCcSDKohuwo6iw0jz6rBYM
	L3yhnADpgHeceeGr4zzlr/iuyN1xCyTwu4DmkxyZtOH2lyDCVbLk2RTM06C8udFMJiZ+QluUyqc
	R9FtkUieu6OhaMmBjVJ2HDzbX5NSaoeEjZpysWCE17LXuvVo0kd5HykDkTnj8Ord9kri0AWlu59
	Ws/SnxFGuQBXQLRG48qVlygF4MFDYC1DqwsGBLHqgvlV3sqKqBnGrKWMdEsLWeMjcPiM2sPpvSi
	T1vtwvyx0I2sDWgFMiH0slGy/kh5AE8/wCukvFzZ4ycLHDRz1InyHxjH82cxdpXomCoafzredbD
	hrZzvOt3WXvuLq4nwoFfMIoezHIp5Nrh64Vu8/d0eMrOSXc1N1Bndc1T/7+8k1MmEnLGJfj75JI
	8WMqVv2UAkt2wWERXwjUkvbdZgllUgg7+D+LdFAxeLCuLqKdLHZx8jyENMCgNU28vTwIr6fYQs=
X-Received: by 2002:a05:6a21:3d8c:b0:3e2:38b8:ef40 with SMTP id adf61e73a8af0-3e3766f0158mr839251637.62.1792738716652;
        Thu, 22 Oct 2026 23:58:36 -0700 (PDT)
Received: from spiderman.taila3fd8c.ts.net ([202.112.47.77])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a2c89d6386sm381522b3a.10.2026.10.22.23.58.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 23:58:36 -0700 (PDT)
From: Li Ximo <lixicaicai@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Michal Simek <michal.simek@amd.com>
Cc: Frank Li <Frank.Li@kernel.org>,
	dmaengine@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Wang Haoran <haoranwangsec@gmail.com>,
	Li Ximo <lixicaicai@gmail.com>
Subject: [PATCH] dmaengine: xilinx: Fix wild pointer dereference on empty segment list
Date: Fri, 23 Oct 2026 14:58:06 +0800
Message-Id: <20261023065806.3175584-1-lixicaicai@gmail.com>
X-Mailer: git-send-email 2.25.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_235838_616464_A63FE6C6 
X-CRM114-Status: GOOD (  15.87  )
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
pointer that points into the enclosing xilinx_dma_tx_descriptor rather
than to a valid segment. Dereferencing it reads or writes unrelated
descriptor memory. This was found by code audit.

In xilinx_dma_prep_peripheral_dma_vec(), xilinx_dma_prep_slave_sg()
and xilinx_mcdma_prep_slave_sg(), the loop that populates
desc->segments never executes when the transfer length is zero
(nb == 0, sg_len == 0, or all vecs[i].len / sg_dma_len() entries are
zero). The dmaengine inline wrappers do not reject such zero-length
transfers, so they reach the driver unchanged. The unconditional
list_first_entry() then yields a wild pointer: the following
head->phys / segment->phys reads are out-of-bounds reads within the
descriptor slab, and on the DMA_MEM_TO_DEV path the hw.control
read-modify-write corrupts the descriptor. In
xilinx_dma_prep_peripheral_dma_vec() the empty case additionally
dereferences the never-initialized 'segment' pointer. Similarly, in
xilinx_dma_get_metadata_ptr(), a descriptor with an empty segment
list produces a wild 'seg' whose hw.app pointer is handed back to the
DMA client.

Guard each list_first_entry() call: in the three prep functions, bail
out through the existing error path (freeing the descriptor and
returning NULL, consistent with the current failure handling) when
desc->segments is still empty after the build loop; in
xilinx_dma_get_metadata_ptr(), use list_first_entry_or_null() and
return NULL when there is no segment.

Reported-by: Wang Haoran <haoranwangsec@gmail.com>
Reported-by: Li Ximo <lixicaicai@gmail.com>
Signed-off-by: Wang Haoran <haoranwangsec@gmail.com>
---
 drivers/dma/xilinx/xilinx_dma.c | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/drivers/dma/xilinx/xilinx_dma.c b/drivers/dma/xilinx/xilinx_dma.c
index cffe7c6fa..07f52f841 100644
--- a/drivers/dma/xilinx/xilinx_dma.c
+++ b/drivers/dma/xilinx/xilinx_dma.c
@@ -650,8 +650,11 @@ static void *xilinx_dma_get_metadata_ptr(struct dma_async_tx_descriptor *tx,
 	struct xilinx_axidma_tx_segment *seg;
 
 	*max_len = *payload_len = sizeof(u32) * XILINX_DMA_NUM_APP_WORDS;
-	seg = list_first_entry(&desc->segments,
-			       struct xilinx_axidma_tx_segment, node);
+	seg = list_first_entry_or_null(&desc->segments,
+				       struct xilinx_axidma_tx_segment, node);
+	if (!seg)
+		return NULL;
+
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


