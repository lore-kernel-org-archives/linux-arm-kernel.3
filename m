Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFA57606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Oct 2026 07:32:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=SC9aqYf2;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=YPeOMxsW
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=bhnlngDTdPCRzQ3WfPeVfNn/5dfQaEbDCnTEYto+WIk=; b=SC9aqYf2bXtAP3/LO1hKg1fERI
	KWWE1V3yLX11ar2LfZ//+tJa9LbUDgz9QbIBavBX8HP9miK1yEiNnS4oH81FF9O7o/6y750FjCx4t
	W1qJCdnfJ+ZFY0xCNwezlumxs6h29mGeNNG9WSWsIemNUeW385vO99hVeW/SpmQwRhCRaFMs+zwmj
	qDJnSkhbNhckkOxrttcWeJ6dCQ8ixJFB6fopm2j6KrPFyrPXoV5Jj/MNmaaP6HL5FXRCnsDp9dsIH
	h4zJEgjr4Jnejqx75xEZYcctI2P8HGnGI9beU3y/SwdktTaUBOChT1fR3mlQ+/Pq7eO5AAeR+55FH
	W678P6eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK9lD-0000000FksB-3INK;
	Fri, 23 Oct 2026 07:32:19 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK9lB-0000000Fkri-2IL5
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Oct 2026 07:32:18 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-2e946155442so4284325ad.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 23 Oct 2026 00:32:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792740736; x=1793345536; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=bhnlngDTdPCRzQ3WfPeVfNn/5dfQaEbDCnTEYto+WIk=;
        b=YPeOMxsWx7XpT4a2Ztz9O7e8/vQH7FwvEkoDmlpyZAUfnnV+UCf3EH++LiqCsin5Rl
         izKcC9uGhSib7i0As4yDidTkYKgTc6RFmtIbrCNaxv8DP1FkXeyHZzapF0Y+78SJgDKg
         UAibp/Yv/5IQ1Ph1j/iJepmL6lCDN4n9i4+RQ+tmUydrl4DD5m2D9EaP1w1oNGvtvDrP
         YJZoaOFgw3cjRl9VpSIq3dKrKkE5Qct6xXdrv3sEt7rFnu2PbUMm1WGEyCznXNbcTKVS
         LGZ9QJNEESsCJEdNmzHB6GQbrHlT6RT4Ms8ohIPqMlNM3qqh8vJT3zDozemNU9dL93Ah
         V5QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792740736; x=1793345536;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bhnlngDTdPCRzQ3WfPeVfNn/5dfQaEbDCnTEYto+WIk=;
        b=IMMWF3GaTSOmGAeTRbRDIc4pbTAfD9FVQtN3a3aHKfQYljsVPgJr5tbhv2VG+BP3nr
         nTC22IujnALuPG9BD0zgzDMKTF6j0w/71h6CI+ADdA5cdZwkjTMFoBXF9gkdBW51QtqR
         WNJXSV6EUfMVfmEk72+rOUv3t+hd8uRT9VN2319saAT6OdV7uhT9y9UZjKd76d3O+icY
         HZ9Hq93DbmeKx8gFjB5CwcrcOgFJMdlA8Kc71sarL0SES/+cizS/RQqcBhM3h9b+/DSn
         uBfzt5KRDqom5/z3wNY0iJqLpx2PH5iehqtmh6lNvxo8Ydi9Y2Bfn+Otr+yXnjza3G7V
         3GeQ==
X-Forwarded-Encrypted: i=1; AKwUvByUL9akVOpI8cRdQzrha9A2Ejx4m614DqPTmdRPVmo1tt6sMSgCEzHihnua+NX9Y3+MINwpP72HfZ0/kFO1oLOI@lists.infradead.org
X-Gm-Message-State: AFq9FYJ1GOXfysOqRNmcqPDZppON3idX4OjahiqZ3kemDmaJ4/6fiuO6
	Uxgwja3myGAqnaboU6ThEShDJdviCwRlEqUhsYcTadpPtvzfoVjqtexR
X-Gm-Gg: AYBFou3W5d/1D+Bp4N6y6VMzTrpHF2WdePfKfV3lwbjRQMCUJHjhjQPl3deugJEXLcw
	gUzkg0D8bcbU+4ERhKkaEmb5Gx8UrR285ndFRjQQKh4LL/oAzz2avihT4omng4bn4vYLoiGIHDe
	gt3toQOnZ2ufE0JOHNKNZFWdxVdghdFmD9DVljQiA7dEAE6puJMccdkleccjE8m5TLCwsk2O2bu
	k2tP5d0H4Xl3wSJPy8G7pclhp9jXvRCGqMVattnIyFb00P0DqBJi9DnwZ5XOxlOiPjwCL1SpLzA
	drp4bTGmNtqklK/gxGRP2Sn0rJFkQakBH9tOOKefUsKrXxetRGRBatGG1EEXC+OsXKxsH7NgZ/2
	83xGTVWotG3nCvrenviAVfDUtP8kSi+OCTHOVSs4Qsiw2CVldeOr0f3WGaqLjlyvK52tjlW6t1i
	CYeHuy/F3YvT7QDyxZMChDDYT6dTaGUi2gVlnJz1meZcZyF0xYMuGmwuVWTc16/la8UE31pKUnV
	vEMAVG3UCTaUmFwcPSQeFZKA5lEHPKyQzVSs3ztNEa4I8nlEBarz1XdScU3pWSHEJ3G9h3aJFU=
X-Received: by 2002:a17:902:e547:b0:2e4:b112:14d with SMTP id d9443c01a7336-2ea7d132e9fmr13812005ad.54.1792740736475;
        Fri, 23 Oct 2026 00:32:16 -0700 (PDT)
Received: from spiderman.taila3fd8c.ts.net ([202.112.47.77])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea7b3a8cfesm6769735ad.40.2026.10.23.00.32.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 00:32:16 -0700 (PDT)
From: Li Ximo <lixicaicai@gmail.com>
To: Sinan Kaya <okaya@kernel.org>,
	Vinod Koul <vkoul@kernel.org>
Cc: Frank Li <Frank.Li@kernel.org>,
	dmaengine@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Wang Haoran <haoranwangsec@gmail.com>,
	Li Ximo <lixicaicai@gmail.com>
Subject: [PATCH] dmaengine: qcom: hidma: fix wild pointer stored in mchan->running when active list is empty
Date: Fri, 23 Oct 2026 15:31:54 +0800
Message-Id: <20261023073154.744365-1-lixicaicai@gmail.com>
X-Mailer: git-send-email 2.25.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261023_003217_593397_1C51430B 
X-CRM114-Status: GOOD (  14.01  )
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

While auditing list_first_entry() users we found two call sites in the
HIDMA driver that invoke it on mchan->active without verifying the list
is non-empty. list_first_entry() never returns NULL: on an empty list
head->next == head, so container_of() produces a bogus non-NULL pointer
into the enclosing hidma_chan structure instead. That wild pointer is
stored into mchan->running, and is later dereferenced in
hidma_tx_status() where "if (mchan->running) runcookie =
mchan->running->desc.cookie" passes precisely because the pointer is
not NULL, yielding an out-of-bounds read / memory corruption.

The list can be empty at both sites on entirely normal paths. In
hidma_callback(), the completed descriptor is first moved from active
to completed; when it was the last active descriptor, the subsequent
list_first_entry() runs on the now-empty list. In
hidma_issue_pending(), a client calling dma_async_issue_pending()
without any queued descriptor leaves both queued and active empty, and
the "if (!mchan->running)" branch then fetches the "first" entry of an
empty active list.

Fix both sites by switching to list_first_entry_or_null(), which
returns NULL for an empty list. This makes the existing NULL check on
mchan->running in hidma_tx_status() effective, so the paused-channel
cookie query takes the -EINVAL path instead of dereferencing a wild
pointer. Both call sites already run under mchan->lock, so no
additional locking is needed.

Reported-by: Wang Haoran <haoranwangsec@gmail.com>
Reported-by: Li Ximo <lixicaicai@gmail.com>
Signed-off-by: Wang Haoran <haoranwangsec@gmail.com>
---
 drivers/dma/qcom/hidma.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/dma/qcom/hidma.c b/drivers/dma/qcom/hidma.c
index c939635be..925c912e0 100644
--- a/drivers/dma/qcom/hidma.c
+++ b/drivers/dma/qcom/hidma.c
@@ -176,8 +176,9 @@ static void hidma_callback(void *data)
 		queued = true;
 
 		/* calculate the next running descriptor */
-		mchan->running = list_first_entry(&mchan->active,
-						  struct hidma_desc, node);
+		mchan->running = list_first_entry_or_null(&mchan->active,
+							  struct hidma_desc,
+							  node);
 	}
 	spin_unlock_irqrestore(&mchan->lock, irqflags);
 
@@ -238,9 +239,10 @@ static void hidma_issue_pending(struct dma_chan *dmach)
 	}
 
 	if (!mchan->running) {
-		struct hidma_desc *desc = list_first_entry(&mchan->active,
-							   struct hidma_desc,
-							   node);
+		struct hidma_desc *desc;
+
+		desc = list_first_entry_or_null(&mchan->active,
+						struct hidma_desc, node);
 		mchan->running = desc;
 	}
 	spin_unlock_irqrestore(&mchan->lock, flags);
-- 
2.30.2


