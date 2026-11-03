Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68400606A331
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 08:31:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=THONh25O;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=it00kODx
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=e87ydEE6XHjmSDGTTmlzgwW5+1XXoq/8729zNtVQ+L0=; b=THONh25OUrBHzuzp7GtuabvC8l
	wg5cgwave7f9dF1Hz4trkbXufK1eoFM/2806W5vfrO4RoMCxMuGd6JUiaGAfi+SKt3621agIcE6Xt
	hHQbkaFnx2+Ipfjax5W21Sx4uCrEhVqlFKWcXFSQs7gjuAbjo0zzp0L7G0LJq1DK+RPF9DlRIRcca
	yVey2JwZMHLjCTDmysLih9IQLwHO5ttVZg9O30u2MAomTuYMzlBOu6RFvXQZ8msBEpv5NTgJI4vAM
	Ov98Yc5yLoEbgWbC+ZrTziLRz/h93KrIicZDAz2VEVtJYpptx8KD3aotdx4AZM3nujcDK9246p//a
	5FqVSGYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO9vs-00000001YVz-1KUh;
	Tue, 03 Nov 2026 08:31:52 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO9vn-00000001YUq-3Xso
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 08:31:50 +0000
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-3ae2b7e1e17so2516452a91.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Nov 2026 00:31:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793694707; x=1794299507; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=e87ydEE6XHjmSDGTTmlzgwW5+1XXoq/8729zNtVQ+L0=;
        b=it00kODx/IefOQ/qAHHUzVlHbSQUYQZ6nyq4vhKev/ydjxnxaF/C6/PfiEl+BWUfip
         GksBpQggP0+Xrk4bxDwTdvOODdcB5s/i0lswdc3ue7efBxKeBp/jBIausX+OYXfymEKv
         j+qyuwf3eb79pNoJ0wyNR6LxNawNRyz56E20rVvzz8j8TiW/JyD07n0Mwnyq0o7zMgOP
         ThdgCDhg7Sy5w1HpoUT13ECjQ9E6cuPzYnvvKDL9iyRWQmJvImNYdUE+MNJKIRiuSm06
         3x+5lfuSPddiXAyaO5XSL3BGn+sPOIfQ5L3qrT2kARbgLwmTWbaK+WpKVASV4nkTZCkj
         sUUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793694707; x=1794299507;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=e87ydEE6XHjmSDGTTmlzgwW5+1XXoq/8729zNtVQ+L0=;
        b=lwaMVvvJ7e1QUuyEjbVunzf6Lsk5Dkn8QFuInVCY4S04UhR5ZKsTHnGWoMbtWi7gW3
         ZT193k6lLWS3wmbm4BTaCKJgRVGBm8LQlqIy2Dudbv77ndJPtN+jmAcdGOMjM8ZKf2J7
         Y5GAYe4BstOPukDTg8FJ1MLbcWm2tk6G0dVXcrSJPbClJZHNcW0QEfmziKzRwv8h0s3K
         C7mVa2BPeSecHtgCu3W0ZcW0Ltifx2HJrBBbiEXU4IW/cKX6FjT44tdyZtbFp5Ky7wvw
         UgJ4Po72nt5Xqs74XMxZHqjUn1wfcIsLhgF81VWGPaYQr1nUCXOasTPqfh5BcZA6tRDC
         seXQ==
X-Forwarded-Encrypted: i=1; AKwUvBxsSZOmWrAi8yJ9QKotXLATKq2jJEHkyoGufd5LnOd7dr/oX+LgzPuD2Snuhx+JxaX03VzenCMbO0AxiRl2jYdC@lists.infradead.org
X-Gm-Message-State: APuU4Z+Ez3WkcD6ulrVfLmtC+s2gkidIghT96xMLGg5q6xCCjmgEbQUa
	I155/dp8yusyCkrj5sL9Jg2u2/TAjJsKoFzp2fv0QTDHPiG4BXewaDYq
X-Gm-Gg: AYBFou2YniEQ7Dc97WQYAx68yY1YnOfQpqcQ3Fa/i6AIMUndGteurmbrxZUyFnqxxHV
	KfAnLjwrKg6zXn9gt8iHCAIzkx+DghUvWuKKL29tY9exx/MvBXzOOp5mT5Ky3RfI7wYUBslTbf3
	1aSCcck212eQ1epbbguC4JjQVGd1a1Pv89jKkq9XKskUPm5gBzoaTC/i/vHh38p+PfbHb/VtCtz
	gE3gmA3gaemOvam6+F+CFo6zUtgb0Tv6iBuqsxHdcxrS+nG19NXAnclacEEe4EBP8KuYeSHSmBi
	ismEGucCRCPcBS1iA6Y3zij9izaCsbUhRkdL22F5dhe5t2825/FFmYX9AanqUr2NioMgVVmRQE8
	xkfSs4LHIpID892/I0tbimjK2wmWFJ2Anw9x/i2SbMl+ehnElXl02oQyDDmuxxzVABgETL08Jti
	OdmlJyGAkksY/wN1YZdh2mbUWo3SMQ0yL8sZgoQUhcxAFMrXP/FvfEekImNdgzZFH7hpbJnuhrh
	PMXjECqd4FYabHHVQ0bYEO0buh/3/Y1Fwshb92j+wcJq2Um8N+dpkSiZMHjkWzBmN0kJtQHYLru
	brccUPqV1wwrFiMfPXi6ZoNhbC424a6oXro69enPDuJYZWFc
X-Received: by 2002:a17:90b:3b44:b0:3ac:74b3:a8f3 with SMTP id 98e67ed59e1d1-3ae8983b590mr10535007a91.44.1793694706586;
        Tue, 03 Nov 2026 00:31:46 -0800 (PST)
Received: from spiderman.taila3fd8c.ts.net ([202.112.47.77])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c5adc33sm3256364a91.1.2026.11.03.00.31.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 00:31:45 -0800 (PST)
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
Subject: [PATCH v2] dmaengine: xilinx: dpdma: fix crash on zero-length cyclic transfer
Date: Tue,  3 Nov 2026 16:31:32 +0800
Message-Id: <20261103083132.1122990-1-lixicaicai@gmail.com>
X-Mailer: git-send-email 2.25.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_003147_884393_0EF3A3EB 
X-CRM114-Status: GOOD (  11.55  )
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

When buf_len is zero, the descriptor build loop never runs, leaving the
descriptor list empty. The following list_first_entry() on the empty list
returns a bad pointer and causes a kernel oops.

Return NULL if the descriptor list is empty after the loop.

This issue was found by static analysis.

Reported-by: Wang Haoran <haoranwangsec@gmail.com>
Reported-by: Li Ximo <lixicaicai@gmail.com>
Signed-off-by: Wang Haoran <haoranwangsec@gmail.com>
---
v1: https://lore.kernel.org/r/20261023065900.3455414-1-lixicaicai@gmail.com
v2: rewrite the commit message in simpler words as suggested by Frank
Li; no code change.

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

