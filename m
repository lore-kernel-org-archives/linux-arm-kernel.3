Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D74DC606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Oct 2026 07:39:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=IJBZ6lry;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qOn0qjsn
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=oTDHP5iTI4lQOhbLd0Zj1JOArDqyXgTJiorChKNggjQ=; b=IJBZ6lry7pTaxwzdBZoGM0UAi1
	S4NGiSlzZUq1NM3pKMgpJY4WEWduY6L4qMHUTOkkqJxuyoW2PjfeBS/mwgNgHxsMRZDGt3gOJfFic
	p+bev44lcSXLixkEbfm6OnV/GoFbadMQ2jubZpGPUn2JppEbK8GmClbe8VKJlTQzXmUQ6uQbvmMDl
	swmtAfuWmnU3A8KyEllnAy/h4LZNYAu3vPeDxizXlmI5AmMReThhzIwTADz/iuj3vwGsWLl0VlsOt
	tO/Y3S+7ff9j/wCEOz4XDLydhWP0WQ5RcJ0sHTGMZFjnoOICcgaC1mAzSuetMO6tOYEa+qFdFUY/t
	3eIigr3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMhCu-0000000B0v6-26jF;
	Fri, 30 Oct 2026 07:39:24 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMhCr-0000000B0uk-3ANZ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Oct 2026 07:39:23 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-c418e215671so41544566b.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 30 Oct 2026 00:39:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793345959; x=1793950759; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oTDHP5iTI4lQOhbLd0Zj1JOArDqyXgTJiorChKNggjQ=;
        b=qOn0qjsn1aEhoiAHl1waPCh3Mq6YM6l6z9Px8F3cCGPjwpntvyZYKsEoSb7ndL7V5M
         8vvLmDT6s3Djc4Nj0aonxK+lsgowzR3n6ZPAM8VkyIxaJtylJMLbbIaVqgBoOqzFUHMG
         yjFKTNZcAD3ZtfJ8E3VoUAI0gMguIrdXwrG71Jf5+YOMBbF+OZWtT7frLhMVbuch0bxt
         JyuaBgwucwfRKBa1P4aVEAeC8z41rV75nWo7Kz2Zy/X/zMDY/0vR+K5GooZ8541M2OZg
         e2x7tvaeU62R7bC5kTp4pTlKdKex2ZEO4eMHs1GUmqKs9W4RNMJU3aKOWHfIvlZs1lui
         ienA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793345959; x=1793950759;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=oTDHP5iTI4lQOhbLd0Zj1JOArDqyXgTJiorChKNggjQ=;
        b=Kwgcz+f0FsVs3wc4WKElKtnRRfbmUq3PRpCz4rk2t64mmu3oEoNNc0dJSitCXUfbJY
         AZOZZupCtyizwMRbkyejqd6bRW226912kXnIjwFKu/t6qCz8IosBmY61t2ZVGjGB/3Zc
         Jt4ZdPO5OESJ5uo7lA2DRa6tnJQIk5Q/FXbDDJarBd7aYnVVq9mN+KY7n808KIU3w9Jk
         qbHwiMEFqL0tF9uAGVwGCJQ1GyYY46yj4y0Q59OGQ6ruEDjNB2X5X0IAE9DowUlguzyz
         SiJuhYjYDW8S3VdvX65I/U9tPUcAwf2BR9OPKbGbqE+h664WgVDFLUEwgSJ5C2mJ9Xxe
         Xapw==
X-Forwarded-Encrypted: i=1; AKwUvBwn3C+pLbX+1FpfuFySEZqzKBG7cB9W8dwtjaGnBKucB1XFaofDsLLhEeV5O+imzUV6gZGP0kGHeWY+Pqps4B+N@lists.infradead.org
X-Gm-Message-State: AFq9FYJnM8DjgT5nIKyqKk7Dr0A2+a8aulYf+Tw76Zb3UIus4NUQaKC1
	0iHPOxRroytyAxjpuDhAL52S6aBICMKfVXyCxMbUWnCdxOEgMHIfbb8b
X-Gm-Gg: AYBFou30S+LcBTEeCgJSZnsLfGDkFB1v8PBaMi8LwEn1ErcCU/wr4cZ/+TWaaATIm3z
	fn/jpUMNcTO6cJu5daVQ78TC7EHlAsKaTX10hivnxv1Q+sa6+T5lAdGjXQYl1f/4OVvfZu9uX/T
	X7U32myjo5LjzjmtYk4MTIjWAD2QgblJ8BPI43FRZOOCpns3g9ZFxnvu+R8mm7H2FLG0+AKzHH9
	ZxmFBmUXVvHypA/IbbjyM1oLzRGuBb9Hp+vKfonrNFyFWdFzWdJEZxOKcBsw/+D+1WmIg7GFUP6
	wgtia0l60Ap/u0lgyo3S+VNj1KvJj2JhGqaILwndxuFlG7BU/dL6F/J3/I6nC8/XDry2K+mdfzT
	wT4mf2ZRfeTxAUvDRuj1mlcPPrb3LfB4c5sBmgrAgKr/PLPnytQfPojY9IhfFSU+dwgql5BbBSg
	s6spZYptPKBI6D8Bk1f0WTv1XDUF9Xkcz6EyBOqO77KhOK/VQ53Gt6rWaRDNIObcJTwJ6qygDB0
	vpD4ia9M4aE1mgmse/5ScxnWLJUnt+V6876GECw0CTQkMeKYo3Ww+ujLRDweDoL5vkMhznASuYj
	kz41UZu4GTzHLCk5G1tERzZco9x8wTUSU6r+uvILhyxPVgbwS57YWUvX3ZbGn90xSCxsmd4RV6i
	vkcicGvHX5psRUjbANP4ENWLLby2fqik0qN1RqcTR/BFtiw==
X-Received: by 2002:a17:907:3d8f:b0:c3e:d18c:1d7d with SMTP id a640c23a62f3a-c4ca7a88815mr126486566b.22.1793345958962;
        Fri, 30 Oct 2026 00:39:18 -0700 (PDT)
Received: from nixos-macbook.taile68cd7.ts.net (20-144-89-188.ftth.glasoperator.nl. [188.89.144.20])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cabe0f389sm34050966b.32.2026.10.30.00.39.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 00:39:18 -0700 (PDT)
From: Jacob Procee <sn125164@gmail.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: Frank Li <Frank.Li@kernel.org>,
	Sasha Finkelstein <k@chaosmail.tech>,
	Sven Peter <sven@kernel.org>,
	Janne Grunau <j@jannau.net>,
	Neal Gompa <neal@gompa.dev>,
	=?UTF-8?q?Martin=20Povi=C5=A1er?= <povik+lin@cutebit.org>,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jacob Procee <sn125164@gmail.com>,
	Frank Li <Frank.Li@nxp.com>
Subject: [PATCH v2] dmaengine: apple-admac: Fix position one period ahead at period boundary
Date: Fri, 30 Oct 2026 08:39:09 +0100
Message-ID: <20261030073909.21966-1-sn125164@gmail.com>
X-Mailer: git-send-email 2.56.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_003921_838800_0DE1D0AB 
X-CRM114-Status: GOOD (  27.52  )
X-Spam-Score: -1.9 (-)
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

Speaker playback on a MacBook Pro 14" (M1 Pro, J314s) underruns at
irregular intervals, audible as a tick: 8 times in 3.7 hours of
playback. Where an underrun was caught (4 of 8), the ALSA hw_ptr had
jumped by one buffer size while about 70 ms of audio was still queued,
and a kernel trace showed the DMA position stepping back by exactly one
period at each of the 6 underruns it covered.

admac_cyclic_read_residue() derives the position from the report ring
(periods finished but not yet reclaimed) and REG_RESIDUE (bytes left in
the current descriptor). When a descriptor finishes, the residue first
drops to zero, then the report is posted and the next descriptor is
loaded. Usually the last two happen together, but occasionally the
report comes first. A read in that window counts the finished period
twice:

 - residue2 == 0 with the report already in ring2: the period is
   counted in nreports and again as the fully consumed current
   descriptor;
 - residue1 == 0 with the report already in ring1, and the next
   descriptor loaded by the time residue2 is read: the
   residue2 > residue1 branch adds one to a ring1 that already holds
   the report.

Either way the position is one period ahead. The next read is behind
it, snd_pcm_update_hw_ptr0() takes the backwards step for a wrap of the
whole buffer, and the stream underruns.

While the channel runs, a zero residue only occurs between descriptors,
so read the registers again while either residue is zero. The retries
are bounded, as the residue also stays zero on a stopped channel or one
that ran out of descriptors; after the last retry the position is
computed as before.

With a debug build counting retries, one hour of playback needed a
retry for 2210 of 3.39 million reads, at most three retries (3.5 us),
also across pause and stream restart. Both states above showed up in
the logged register values. There were no underruns in three hours of
playback with the fix.

Fixes: b127315d9a78 ("dmaengine: apple-admac: Add Apple ADMAC driver")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Acked-by: Martin Povišer <povik+lin@cutebit.org>
Signed-off-by: Jacob Procee <sn125164@gmail.com>
---
Thanks Frank, Sasha and Martin for the reviews.

Changes in v2:
- Drop the code comment, the explanation is in the commit message
  (Sasha Finkelstein).
- Add Frank's Reviewed-by and Martin's Acked-by.
- v1: https://lore.kernel.org/r/20261029105908.22809-1-sn125164@gmail.com

How this was found and tested:
- The underruns were traced with bpftrace on snd_dmaengine_pcm_pointer():
  a position read 19-37 us before the period interrupt was exactly one
  period ahead of the interrupt's own read. The register states were then
  confirmed with a debug build of this driver that logged the raw report
  ring and residue values on every retry.
- There is no hardware documentation for the ordering; all of this is
  measured. In the 1906 logged retries the next read always showed both
  the report and the new descriptor, or neither, never the new descriptor
  with the old report count.
- The reverse order (next descriptor loaded before the report is posted)
  would put the position one period behind and is not handled here. The
  bpftrace probe checked every position read for a backward step, so it
  would have caught that too: none occurred in the three hours with the
  fix, roughly 10 million reads.
- RESIDUE_RETRIES is empirical as well: of the logged retries, 1189 needed
  one, 621 two and 96 three, none more; the longest complete retry
  sequence took 3.5 us. A round takes about 1 us, so the limit keeps the
  additional polling time, with interrupts off, to roughly 10 us in the
  observed environment. If the limit is reached, the position is computed
  using the existing calculation, so the original error can still occur
  in that case.
- Tested on a MacBook Pro 14" (M1 Pro, J314s) as an out-of-tree module on
  the Asahi 7.2.12 kernel, whose apple-admac.c matches this tree apart from
  the unrelated admac_hw rework. The three hours above used a limit of 100
  retries; the code as posted here (limit 10) ran for another 30 minutes.
  On this tree the driver builds cleanly with W=1 and C=1 (arm64
  defconfig), but I have not run it here, nor on other Apple SoCs.

AI assistance: the tracing, analysis, the code change and a first draft of
this changelog were done with an LLM (Claude) in a session with me. I have
reviewed and tested the result and can answer for it.

 drivers/dma/apple-admac.c | 19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)

diff --git a/drivers/dma/apple-admac.c b/drivers/dma/apple-admac.c
index 9a1c79c12..a505975a5 100644
--- a/drivers/dma/apple-admac.c
+++ b/drivers/dma/apple-admac.c
@@ -28,6 +28,12 @@
  */
 #define SRAM_BLOCK	2048
 
+/*
+ * How often to re-read the residue while a descriptor boundary is in
+ * progress, see admac_cyclic_read_residue().
+ */
+#define RESIDUE_RETRIES	10
+
 #define RING_WRITE_SLOT		GENMASK(1, 0)
 #define RING_READ_SLOT		GENMASK(5, 4)
 #define RING_FULL		BIT(9)
@@ -358,11 +364,14 @@ static u32 admac_cyclic_read_residue(struct admac_data *ad, int channo,
 	u32 residue1, residue2;
 	int nreports;
 	size_t pos;
-
-	ring1 =    readl_relaxed(ad->base + REG_REPORT_RING(channo));
-	residue1 = readl_relaxed(ad->base + REG_RESIDUE(channo));
-	ring2 =    readl_relaxed(ad->base + REG_REPORT_RING(channo));
-	residue2 = readl_relaxed(ad->base + REG_RESIDUE(channo));
+	int tries = 0;
+
+	do {
+		ring1 =    readl_relaxed(ad->base + REG_REPORT_RING(channo));
+		residue1 = readl_relaxed(ad->base + REG_RESIDUE(channo));
+		ring2 =    readl_relaxed(ad->base + REG_REPORT_RING(channo));
+		residue2 = readl_relaxed(ad->base + REG_RESIDUE(channo));
+	} while ((!residue1 || !residue2) && ++tries < RESIDUE_RETRIES);
 
 	if (residue2 > residue1) {
 		/*

base-commit: aff5e6a77fc69a7c490246465940d18422d7c631
-- 
2.56.0


