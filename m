Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C279606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Oct 2026 10:59:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=A0SE6gSv;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RA1hWY75
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=21Pr25KW8iRWF16tMS8FhZNBj9jILGnkXcKJJd4L4vg=; b=A0SE6gSvPlx+IPl3Miwh/iFb4F
	6L0vu7xuM3/DU0Hb1naV6b+AmyUy+odpaagHlo5Hh2S5ZXTffKhZzJGc6/Zo2wWa157wan2y3xoDi
	MgrhdPoq75a5V3sPJMXVG926OS2kVnpTXNkfHtR6ei3RFfzXFmdf/Is9covPWOHTcMPC7yzomTIKI
	WHHrHudffc9cfDumz0ACmc8ggW9M7KqL9hZv6MhHv6EYeNbS5PnIBkR3iOfR5prfQJFnKUV6fgl04
	Xr3sIvUD00TTR9vnELUoyc3FbGzbNAuvfqDm1VlPJ4zlidBSAdLEI0s4iK57tulcYjffaewcNgK4q
	po8m3rMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMNrE-000000091zj-31Zv;
	Thu, 29 Oct 2026 10:59:44 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMNrC-000000091z9-1Kzd
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Oct 2026 10:59:43 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-c49c32650adso223867366b.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 29 Oct 2026 03:59:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793271580; x=1793876380; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=21Pr25KW8iRWF16tMS8FhZNBj9jILGnkXcKJJd4L4vg=;
        b=RA1hWY75uwTCXOnTb/m5459HGbGOE4N5sgZUdTwu7iUCbjEOWa70hsn930cjQzE8z2
         g5UtWYeJO5jojTTB71FVenq41tRsELad1toA1Hxmp0inovN7M1lD0KwhARF5fOZlQuI4
         nZksWWxCd1sD12QFn7/GucVydhN8o1OWx+In7OzYUQnvUfUMVmeButUr1L/HL17FMaTF
         JfywDrOOyLsw5d3W/H80yRoEMBPoOUfjLGj2j/Pmyfp8jO694QLNpsPVN+BZsXpPYILm
         zxykKVr/nLGW8DKY6XsoI1oyWdPLfgyg3BLo6P2brK1rhNgnOyVCJBs933J80jA4/dcZ
         F68Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793271580; x=1793876380;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=21Pr25KW8iRWF16tMS8FhZNBj9jILGnkXcKJJd4L4vg=;
        b=yePbng15V7W0WQ0ZaJqpyfjrHZx9dFBuqHswnupPP8y+sl27O639c3NLyn+tg1JNAL
         2SO5NjGUDEcbbMsaMGGCISCnizKvg//8CTtydXXez/dRE4z9BsFSlYH+INvkd0dycoqH
         AuPHZ1RTvJyaRhQ5ISW8Q2QUr0QIzVock0GDSRbmj6KuBMKWODVObiNOsSgP1OsMVaJq
         ggtwv74pHlhDgg0UROVkPDkbfF3m2Pg4bTdTmVcRZz7mVMnCa+OZ1XjMfcoQKCUwXgRE
         IRdtIgRxjwqr7iyBAUK1LHErU6CMgHGmhTitLs6HGNMCDyf/3jSsHaBgTqevtldqEdjM
         oQ1g==
X-Forwarded-Encrypted: i=1; AKwUvBzJFiDEUIX2BijxLlmMA8ACXDPUc1eadtjkNrtxkNTIl8OkEVwbQiWQVNMzlihitGXtLWSakA0+WAwx2iJhWlmC@lists.infradead.org
X-Gm-Message-State: AFq9FYLhGZZTqrnb8keVoCrs8csh0W+b8yJi5Lzb/7xvHrJ0BY+mjlVi
	yhHwNJFXvxamynzut34apQ8pJ/VDzeKeVfsHQWlmFyQvx23queHqzWay
X-Gm-Gg: AYBFou1EGSP31vKifQkd7TdW/DhhiCr/udQ7VTarQD/WYCtHGK+yLY8wjI0tYvTl5My
	rj34D/EvHDpNRwCBgtI6s+RVLlG0SBfv1aP7DnbgVH3CGsX/knmuF+WJ7GkWVeF3h2bDyWVEIZH
	eM/XS12G10hbx4aP2DtcyudlH4jkJ+/GUZ4l+p7FtRmtWw7IezJO6awupyFNaZU5sHjeV967Qf5
	blEtMLYtAXQLERcpxp2GyQzTCjeXDKOe7JSPGK3wj31At40IaVxSXR9NCYKMxK67Ei0AgxjUDRi
	YgV32zRjuFHpCqA6ag4d/gupcBFhtKzpZtr854RPOIj7zd7hJuFTG5zrbdILmRaKSPwqWpDKDFu
	t9frQYzenIQvr75uKec03kXKB4N234nuHF7yCAbwp1/TWCvAS+7j8DzWu2elioTTwLwh/aCdnMj
	5qEbc9gu0MZk3CyuL+cLAfw4SS7tfKvXigiN3EYoRMMw/Fz5FPxfyzLshBVEAWt9dUdAlYXcRu7
	xWgdDT0591JAt48tPMOqHmu5PLHOqoF4PBA/CWQ9LZWjZAJSA0T6MypxcR6X1fuXxwIGskBILUN
	hokhb7BnrwC9MQXenpHRFUjfJCti/cRS2eUlRy8aDetduMc9x91Rp3eQ4KqqqKGToOOytI9xnQ7
	hY/UQ5whGf42iZNHuOO06ns9rkiyx96H6S/cJiMRkz2j5rw==
X-Received: by 2002:a17:907:3f88:b0:c40:9e84:942a with SMTP id a640c23a62f3a-c49be05b0e9mr431771066b.48.1793271579384;
        Thu, 29 Oct 2026 03:59:39 -0700 (PDT)
Received: from nixos-macbook.taile68cd7.ts.net (20-144-89-188.ftth.glasoperator.nl. [188.89.144.20])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd7b5d54sm704604266b.86.2026.10.29.03.59.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 03:59:38 -0700 (PDT)
From: Jacob Procee <sn125164@gmail.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: Frank Li <Frank.Li@kernel.org>,
	Sven Peter <sven@kernel.org>,
	Janne Grunau <j@jannau.net>,
	Neal Gompa <neal@gompa.dev>,
	=?UTF-8?q?Martin=20Povi=C5=A1er?= <povik+lin@cutebit.org>,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jacob Procee <sn125164@gmail.com>
Subject: [PATCH] dmaengine: apple-admac: Fix position one period ahead at period boundary
Date: Thu, 29 Oct 2026 11:59:08 +0100
Message-ID: <20261029105908.22809-1-sn125164@gmail.com>
X-Mailer: git-send-email 2.56.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_035942_413680_F4D12EA3 
X-CRM114-Status: GOOD (  28.19  )
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
Signed-off-by: Jacob Procee <sn125164@gmail.com>
---
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

 drivers/dma/apple-admac.c | 27 +++++++++++++++++++++++----
 1 file changed, 23 insertions(+), 4 deletions(-)

diff --git a/drivers/dma/apple-admac.c b/drivers/dma/apple-admac.c
index 9a1c79c12..9b284c658 100644
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
@@ -358,11 +364,24 @@ static u32 admac_cyclic_read_residue(struct admac_data *ad, int channo,
 	u32 residue1, residue2;
 	int nreports;
 	size_t pos;
+	int tries = 0;
 
-	ring1 =    readl_relaxed(ad->base + REG_REPORT_RING(channo));
-	residue1 = readl_relaxed(ad->base + REG_RESIDUE(channo));
-	ring2 =    readl_relaxed(ad->base + REG_REPORT_RING(channo));
-	residue2 = readl_relaxed(ad->base + REG_RESIDUE(channo));
+	/*
+	 * The residue drops to zero when a descriptor finishes, before the
+	 * next one is loaded. If the finished descriptor's report is already
+	 * in the ring at that point, the position below comes out one period
+	 * ahead: with residue2 == 0 directly, with residue1 == 0 through the
+	 * residue2 > residue1 branch. The next read is then behind it, which
+	 * ALSA takes for a wrap of the whole buffer. Re-read until the next
+	 * descriptor is loaded; the limit covers a stopped or starved channel,
+	 * whose residue stays zero.
+	 */
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


