Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36ECB606A336
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Oct 2026 18:53:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qxZAMI9+;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=dHe6KdOF
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=QVekpUKTXiEmsiDdQNIROVgTEcZ8BtEbL8Ca4eQT7gM=; b=qxZAMI9+Ik9Ot/
	WzpD0pXgXi17UZzOkwXbToCQGbpMmDvKOM9W6WDvWtpRfmRUoJnDVGm0Hi5xy6LNvzQ9rMpA5sBAq
	S4dr8DZV64wwBTerx51ClHw4UvTE2kONy4XP9ioFolZQ/PdI6DMycJWgJ2WyGxA/Yt+Jeph6jvQS4
	DMriI9a+AkWUrB5x2R8kjurkye2bWezmPHnKynxdlYr7n9Y1BERpaa/0McZO0TKjIUy1vTHxd6RFu
	Z+xdnjvLYUVIF5lKJ7xJVgLwF2n6tOLdZcH4T77LWn5QvMCpmJBPa5hJV1oxwwMlH/KOQo2tqWLz7
	/RkmWKubqxiKfHpTA0ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJxuQ-0000000EkhE-2II0;
	Thu, 22 Oct 2026 18:53:02 +0000
Received: from mail-vk1-xa33.google.com ([2607:f8b0:4864:20::a33])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJxuL-0000000EkfM-48AT
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Oct 2026 18:52:59 +0000
Received: by mail-vk1-xa33.google.com with SMTP id 71dfb90a1353d-5eafa528803so70949e0c.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Oct 2026 11:52:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792695176; x=1793299976; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QVekpUKTXiEmsiDdQNIROVgTEcZ8BtEbL8Ca4eQT7gM=;
        b=dHe6KdOFtGHT89s3YAr6zhSRmfmFIg7u7vGt5vebUEhDaX08A0ceYWl2IumNZ1Q89y
         33DBmQohK9Vkwtgh/935gVg8f7JGfymUpCbD9k+POG6lezNfAa2Y1/0AVqGlAcMn79b3
         eVtimo4yo9bEJqqxoB52qmXyJK0dd8/RfE6xI5F+PdHyxVYi0o9IqNHBkQz9FC+C6TnS
         Re4V5mRHZgwVD6LDVaWuP1d6Nf5AtU69T1Q66id9z06xivChchXPmR/9XJ6G+EWaIHUP
         z7AM4ifLLS4KPuXnZzrrSQeWyWUKHbJj0nG16672o4vGDBgbyfrfPscAuy3CFZIcRpbF
         UBFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792695176; x=1793299976;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QVekpUKTXiEmsiDdQNIROVgTEcZ8BtEbL8Ca4eQT7gM=;
        b=G1GF0tmirFO53yFmx/KAAKbPm/jETBN59M45Xdz4qiOQi42Lvin0HrmwLyS6xktEN2
         nSr1NEEx2dadzDE/cKWmGJdE1yfT46Kr2+cFtpgUy7IpS4bUhMsyhxLgLIdet3nsvxqP
         1FApm6hstzyHtNNqE/nSilLck3DEZyx2rFIa3ABjUmBanSC+fZUtZOwoK/K0AmnT9b7R
         1xrru++V8DwUTdo4a9EYs+9/KY7IayGUwB0tQts/oT72omj2TVnu18F1bdZj+slMBGaR
         f/XqqObUNOuXR0F1bpsrrU45ojDcaegyk8ZJZad4FjZkrqs1cJa5/vT9BOzDVL3Tpk0z
         J8sA==
X-Forwarded-Encrypted: i=1; AKwUvBwnUM19t/Q46TbcG6fNlfFX0ZEBGDY/Lh3opmf0hxLsMoG9FfvxdcWf3n/ZtbIN5L2Awf0BYGm7ocZS2M1UKo8W@lists.infradead.org
X-Gm-Message-State: AFq9FYI7WLeshz0VFAkgwOxHN1PIeR5OdZBigqaTTcwWeMPcL6Gn6VQn
	md5VePsNh9PT+eq5DY98XETGcpJ7ekj/HMypslbxYgxMPKfYWFYRd4Lf+T6SEH35
X-Gm-Gg: AYBFou3XWW3Deh1U2XHVGclrEmSv+MrmYq4hPFYuvzG/AmeBuYFb+QF0bd5ucW8rwUm
	BYP4DifdJKG+9qzIUDDQHAsAvs9e6KQQO/oLdHW6mwDg1uI0yjxH13OP09H0f8qjw/fIBBxieX6
	KPHDopp7rgbBrf39IZNiScLh35tk1eYRqEoN+m1IOdobgzE77m4sSL0VJNvAB9SBPqHRnMpfL2C
	HYrkQPmSsRJSUk0OBgifztknIUNiDUrRjmrpg22iA8b+g3IK4/mwaeg2NXh3GM9JEvM7zt2mKjG
	RpIdTqDyD8Jq3xQ93Anf2wXFJGKiidSx0N8Yt2k75tLnr1vwjvju37x2zES6fa7cAdAY95gCFhV
	1NyHQZqEqH5UMEfCJ4HeXGmQttZwsdJmrC3Eu++FalPqTtDiR1XcpnAvyOYgT+e/rfvEQ5ZDfFn
	iG3fhNJTrZj+lDvYWQSaSjhlsB/OGFMYw5ISzS1RakVAOg7vr1+6EzSz8SsN6GfvTghgBapwSZY
	F7ewUupcItau9JUn8H7NOj1DWkOGR8ks5s/9l/kHUh60f6hjnzfQo/HGlnlRpB2cd/RAAXWVyvD
	fHm5eQYGswPhESawzWD4
X-Received: by 2002:a05:6122:8b8e:b0:5e9:7c82:99ee with SMTP id 71dfb90a1353d-5eaebe1e9d9mr2318462e0c.9.1792695176307;
        Thu, 22 Oct 2026 11:52:56 -0700 (PDT)
Received: from Biostar-A520MT ([187.94.15.233])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ec124a7da8sm508980e0c.5.2026.10.22.11.52.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 11:52:55 -0700 (PDT)
From: Breno Rodrigues Alves <breno3011alves@gmail.com>
To: linux@armlinux.org.uk
Cc: James.Bottomley@HansenPartnership.com,
	mkp@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Breno Rodrigues Alves <breno3011alves@gmail.com>
Subject: [PATCH v2] scsi: arm: Convert acornscsi-io.S to C
Date: Thu, 22 Oct 2026 15:52:24 -0300
Message-ID: <20261022185224.60700-2-breno3011alves@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261022185224.60700-1-breno3011alves@gmail.com>
References: <20261022183658.58090-1-breno3011alves@gmail.com>
 <20261022185224.60700-1-breno3011alves@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_115258_099830_3BE7F9BC 
X-CRM114-Status: GOOD (  26.95  )
X-Spam-Score: 1.2 (+)
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

The Acorn SCSI expansion card presents each 16-bit SCSI data halfword
on the low half of a 32-bit card access.  The hand-written assembly
in acornscsi-io.S implements the two directions of the data path:

  - __acornscsi_in()  : packs pairs of 16-bit card reads into 32-bit
                        memory words
  - __acornscsi_out() : expands 16-bit memory halfwords into 32-bit
                        card writes (duplicating the halfword in both
                        halves for the bulk of the transfer)

Both routines are simple pointer walks that a modern compiler handles
just as well as hand-written assembly, so replace the .S file with an
equivalent C implementation.

The C version takes its arguments as (void __iomem *, char *, int),
matching the prototype actually used by acornscsi.c.  The assembly
version had no C prototype, so the original comment declaring the
first argument as unsigned int was never enforced; using the caller's
type removes that latent inconsistency and lets the MMIO accessors
do the right thing on any architecture.

Note on odd transfer lengths: the original assembly dropped the final
odd byte when the tail reached the two-byte handler, leaving the byte
unwritten (out) or unread (in).  The C version advances the MMIO
pointer by a full 32-bit card word in the trailing loop, so the
remaining odd byte is transferred through the low half of the next
card word, which is where the hardware actually samples it.  Callers
in acornscsi.c pass even lengths in practice, so this is a latent-bug
fix, not a behaviour change that affects existing systems.

No Makefile change is required: acornscsi_mod-objs already lists
acornscsi-io.o, and the build system will pick up the new .c file in
preference to the removed .S file.

Signed-off-by: Breno Rodrigues Alves <breno3011alves@gmail.com>
---
 drivers/scsi/arm/acornscsi-io.S | 135 -------------------------
 drivers/scsi/arm/acornscsi-io.c | 168 ++++++++++++++++++++++++++++++++
 drivers/scsi/arm/acornscsi-io.h |  14 +++
 drivers/scsi/arm/acornscsi.c    |   4 +-
 4 files changed, 184 insertions(+), 137 deletions(-)
 delete mode 100644 drivers/scsi/arm/acornscsi-io.S
 create mode 100644 drivers/scsi/arm/acornscsi-io.c
 create mode 100644 drivers/scsi/arm/acornscsi-io.h

diff --git a/drivers/scsi/arm/acornscsi-io.S b/drivers/scsi/arm/acornscsi-io.S
deleted file mode 100644
index fdd7237bb..000000000
--- a/drivers/scsi/arm/acornscsi-io.S
+++ /dev/null
@@ -1,135 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-/*
- *  linux/drivers/acorn/scsi/acornscsi-io.S: Acorn SCSI card IO
- */
-#include <linux/linkage.h>
-
-#include <asm/assembler.h>
-#include <mach/hardware.h>
-
-#if defined(__APCS_32__)
-#define LOADREGS(t,r,l...)	ldm##t	r, l
-#elif defined(__APCS_26__)
-#define LOADREGS(t,r,l...)	ldm##t	r, l##^
-#endif
-
-@ Purpose: transfer a block of data from the acorn scsi card to memory
-@ Proto  : void acornscsi_in(unsigned int addr_start, char *buffer, int length)
-@ Returns: nothing
-
-		.align
-ENTRY(__acornscsi_in)
-		stmfd	sp!, {r4 - r7, lr}
-		bic	r0, r0, #3
-		mov	lr, #0xff
-		orr	lr, lr, #0xff00
-acornscsi_in16lp:
-		subs	r2, r2, #16
-		bmi	acornscsi_in8
-		ldmia	r0!, {r3, r4, r5, r6}
-		and	r3, r3, lr
-		orr	r3, r3, r4, lsl #16
-		and 	r4, r5, lr
-		orr	r4, r4, r6, lsl #16
-		ldmia	r0!, {r5, r6, r7, ip}
-		and	r5, r5, lr
-		orr	r5, r5, r6, lsl #16
-		and	r6, r7, lr
-		orr	r6, r6, ip, lsl #16
-		stmia	r1!, {r3 - r6}
-		bne	acornscsi_in16lp
-		LOADREGS(fd, sp!, {r4 - r7, pc})
-
-acornscsi_in8:	adds	r2, r2, #8
-		bmi	acornscsi_in4
-		ldmia	r0!, {r3, r4, r5, r6}
-		and	r3, r3, lr
-		orr	r3, r3, r4, lsl #16
-		and	r4, r5, lr
-		orr	r4, r4, r6, lsl #16
-		stmia	r1!, {r3 - r4}
-		LOADREGS(eqfd, sp!, {r4 - r7, pc})
-		sub	r2, r2, #8
-
-acornscsi_in4:	adds	r2, r2, #4
-		bmi	acornscsi_in2
-		ldmia	r0!, {r3, r4}
-		and	r3, r3, lr
-		orr	r3, r3, r4, lsl #16
-		str	r3, [r1], #4
-		LOADREGS(eqfd, sp!, {r4 - r7, pc})
-		sub	r2, r2, #4
-
-acornscsi_in2:	adds	r2, r2, #2
-		ldr	r3, [r0], #4
-		and	r3, r3, lr
-		strb	r3, [r1], #1
-		mov	r3, r3, lsr #8
-		strplb	r3, [r1], #1
-		LOADREGS(fd, sp!, {r4 - r7, pc})
-
-@ Purpose: transfer a block of data from memory to the acorn scsi card
-@ Proto  : void acornscsi_in(unsigned int addr_start, char *buffer, int length)
-@ Returns: nothing
-
-ENTRY(__acornscsi_out)
-		stmfd	sp!, {r4 - r6, lr}
-		bic	r0, r0, #3
-acornscsi_out16lp:
-		subs	r2, r2, #16
-		bmi	acornscsi_out8
-		ldmia	r1!, {r4, r6, ip, lr}
-		mov	r3, r4, lsl #16
-		orr	r3, r3, r3, lsr #16
-		mov	r4, r4, lsr #16
-		orr	r4, r4, r4, lsl #16
-		mov	r5, r6, lsl #16
-		orr	r5, r5, r5, lsr #16
-		mov	r6, r6, lsr #16
-		orr	r6, r6, r6, lsl #16
-		stmia	r0!, {r3, r4, r5, r6}
-		mov	r3, ip, lsl #16
-		orr	r3, r3, r3, lsr #16
-		mov	r4, ip, lsr #16
-		orr	r4, r4, r4, lsl #16
-		mov	ip, lr, lsl #16
-		orr	ip, ip, ip, lsr #16
-		mov	lr, lr, lsr #16
-		orr	lr, lr, lr, lsl #16
-		stmia	r0!, {r3, r4, ip, lr}
-		bne	acornscsi_out16lp
-		LOADREGS(fd, sp!, {r4 - r6, pc})
-
-acornscsi_out8:	adds	r2, r2, #8
-		bmi	acornscsi_out4
-		ldmia	r1!, {r4, r6}
-		mov	r3, r4, lsl #16
-		orr	r3, r3, r3, lsr #16
-		mov	r4, r4, lsr #16
-		orr	r4, r4, r4, lsl #16
-		mov	r5, r6, lsl #16
-		orr	r5, r5, r5, lsr #16
-		mov	r6, r6, lsr #16
-		orr	r6, r6, r6, lsl #16
-		stmia	r0!, {r3, r4, r5, r6}
-		LOADREGS(eqfd, sp!, {r4 - r6, pc})
-
-		sub	r2, r2, #8
-acornscsi_out4:	adds	r2, r2, #4
-		bmi	acornscsi_out2
-		ldr	r4, [r1], #4
-		mov	r3, r4, lsl #16
-		orr	r3, r3, r3, lsr #16
-		mov	r4, r4, lsr #16
-		orr	r4, r4, r4, lsl #16
-		stmia	r0!, {r3, r4}
-		LOADREGS(eqfd, sp!, {r4 - r6, pc})
-
-		sub	r2, r2, #4
-acornscsi_out2:	adds	r2, r2, #2
-		ldr	r3, [r1], #2
-		strb	r3, [r0], #1
-		mov	r3, r3, lsr #8
-		strplb	r3, [r0], #1
-		LOADREGS(fd, sp!, {r4 - r6, pc})
-
diff --git a/drivers/scsi/arm/acornscsi-io.c b/drivers/scsi/arm/acornscsi-io.c
new file mode 100644
index 000000000..d882441ea
--- /dev/null
+++ b/drivers/scsi/arm/acornscsi-io.c
@@ -0,0 +1,168 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ *  Acorn SCSI card I/O
+ *
+ *  The Acorn SCSI expansion card exposes each 16-bit SCSI data
+ *  halfword on the low half of a 32-bit card access:
+ *
+ *   - on reads, one 16-bit value is returned per 32-bit card load;
+ *     consecutive card reads are packed into 32-bit memory words
+ *
+ *   - on writes, a 16-bit memory halfword is expanded into a 32-bit
+ *     card word.  The original assembly duplicates the halfword into
+ *     both halves of the card word for the bulk of the transfer and
+ *     writes only the low 16 bits of the trailing partial word,
+ *     since the hardware samples only the low half.
+ */
+
+#include <linux/align.h>
+#include <linux/io.h>
+#include <linux/types.h>
+#include "acornscsi-io.h"
+
+/*
+ * Transfer a block of data from the Acorn SCSI card into memory.
+ *
+ * The card address is rounded down to a 32-bit boundary.  Each
+ * 32-bit read from the card yields one valid 16-bit halfword in
+ * the low half; pairs of card reads are packed into single 32-bit
+ * memory words.
+ */
+void __acornscsi_in(void __iomem *addr, char *buffer, int length)
+{
+	const u32 __iomem *card = PTR_ALIGN_DOWN((const u32 __iomem *)addr, 4);
+	u8 *buf = (u8 *)buffer;
+
+	while (length >= 16) {
+		u32 w0 = readl(card + 0), w1 = readl(card + 1);
+		u32 w2 = readl(card + 2), w3 = readl(card + 3);
+		u32 w4 = readl(card + 4), w5 = readl(card + 5);
+		u32 w6 = readl(card + 6), w7 = readl(card + 7);
+
+		card += 8;
+
+		((u32 *)buf)[0] = (w0 & 0xffff) | (w1 << 16);
+		((u32 *)buf)[1] = (w2 & 0xffff) | (w3 << 16);
+		((u32 *)buf)[2] = (w4 & 0xffff) | (w5 << 16);
+		((u32 *)buf)[3] = (w6 & 0xffff) | (w7 << 16);
+
+		buf += 16;
+		length -= 16;
+	}
+
+	while (length >= 8) {
+		u32 w0 = readl(card + 0), w1 = readl(card + 1);
+		u32 w2 = readl(card + 2), w3 = readl(card + 3);
+
+		card += 4;
+
+		((u32 *)buf)[0] = (w0 & 0xffff) | (w1 << 16);
+		((u32 *)buf)[1] = (w2 & 0xffff) | (w3 << 16);
+
+		buf += 8;
+		length -= 8;
+	}
+
+	while (length >= 4) {
+		u32 w0 = readl(card + 0), w1 = readl(card + 1);
+
+		card += 2;
+
+		((u32 *)buf)[0] = (w0 & 0xffff) | (w1 << 16);
+
+		buf += 4;
+		length -= 4;
+	}
+
+	while (length >= 2) {
+		u32 w0 = readl(card);
+
+		card++;
+
+		buf[0] = w0 & 0xff;
+		buf[1] = (w0 >> 8) & 0xff;
+
+		buf += 2;
+		length -= 2;
+	}
+
+	if (length >= 1) {
+		u32 w0 = readl(card);
+
+		buf[0] = w0 & 0xff;
+	}
+}
+
+/*
+ * Transfer a block of data from memory to the Acorn SCSI card.
+ *
+ * Each 16-bit value read from memory is expanded into a 32-bit card
+ * word, with the halfword duplicated in both halves (matching the
+ * original assembly).  For the trailing partial halfword the card
+ * only samples the low 16 bits, so two byte stores are sufficient.
+ */
+void __acornscsi_out(void __iomem *addr, char *buffer, int length)
+{
+	u32 __iomem *card = PTR_ALIGN_DOWN((u32 __iomem *)addr, 4);
+	const u8 *buf = (const u8 *)buffer;
+
+	while (length >= 16) {
+		u32 v0 = ((const u32 *)buf)[0];
+		u32 v1 = ((const u32 *)buf)[1];
+		u32 v2 = ((const u32 *)buf)[2];
+		u32 v3 = ((const u32 *)buf)[3];
+
+		writel((v0 & 0xffff) | ((v0 & 0xffff) << 16), card + 0);
+		writel((v0 >> 16)   | ((v0 >> 16)   << 16), card + 1);
+		writel((v1 & 0xffff) | ((v1 & 0xffff) << 16), card + 2);
+		writel((v1 >> 16)   | ((v1 >> 16)   << 16), card + 3);
+		writel((v2 & 0xffff) | ((v2 & 0xffff) << 16), card + 4);
+		writel((v2 >> 16)   | ((v2 >> 16)   << 16), card + 5);
+		writel((v3 & 0xffff) | ((v3 & 0xffff) << 16), card + 6);
+		writel((v3 >> 16)   | ((v3 >> 16)   << 16), card + 7);
+
+		card += 8;
+		buf  += 16;
+		length -= 16;
+	}
+
+	while (length >= 8) {
+		u32 v0 = ((const u32 *)buf)[0];
+		u32 v1 = ((const u32 *)buf)[1];
+
+		writel((v0 & 0xffff) | ((v0 & 0xffff) << 16), card + 0);
+		writel((v0 >> 16)   | ((v0 >> 16)   << 16), card + 1);
+		writel((v1 & 0xffff) | ((v1 & 0xffff) << 16), card + 2);
+		writel((v1 >> 16)   | ((v1 >> 16)   << 16), card + 3);
+
+		card += 4;
+		buf  += 8;
+		length -= 8;
+	}
+
+	while (length >= 4) {
+		u32 v0 = ((const u32 *)buf)[0];
+
+		writel((v0 & 0xffff) | ((v0 & 0xffff) << 16), card + 0);
+		writel((v0 >> 16)   | ((v0 >> 16)   << 16), card + 1);
+
+		card += 2;
+		buf  += 4;
+		length -= 4;
+	}
+
+	while (length >= 2) {
+		u16 v = *(const u16 *)buf;
+		void __iomem *cp = (void __iomem *)card;
+
+		writeb(v & 0xff, cp);
+		writeb(v >> 8, cp + 1);
+
+		card++;
+		buf += 2;
+		length -= 2;
+	}
+
+	if (length >= 1)
+		writeb(*buf, (void __iomem *)card);
+}
diff --git a/drivers/scsi/arm/acornscsi-io.h b/drivers/scsi/arm/acornscsi-io.h
new file mode 100644
index 000000000..64acfb8bb
--- /dev/null
+++ b/drivers/scsi/arm/acornscsi-io.h
@@ -0,0 +1,14 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ *  Acorn SCSI card I/O
+ */
+
+#ifndef _ACORNSCSI_IO_H
+#define _ACORNSCSI_IO_H
+
+#include <linux/io.h>
+
+void __acornscsi_in(void __iomem *addr, char *buffer, int length);
+void __acornscsi_out(void __iomem *addr, char *buffer, int length);
+
+#endif /* _ACORNSCSI_IO_H */
diff --git a/drivers/scsi/arm/acornscsi.c b/drivers/scsi/arm/acornscsi.c
index 79d7d7336..263a1bf24 100644
--- a/drivers/scsi/arm/acornscsi.c
+++ b/drivers/scsi/arm/acornscsi.c
@@ -140,6 +140,8 @@
 
 #include <scsi/scsicam.h>
 
+#include "acornscsi-io.h"
+
 #define VER_MAJOR 2
 #define VER_MINOR 0
 #define VER_PATCH 6
@@ -886,7 +888,6 @@ static
 void acornscsi_data_read(AS_Host *host, char *ptr,
 				 unsigned int start_addr, unsigned int length)
 {
-    extern void __acornscsi_in(void __iomem *, char *buf, int len);
     unsigned int page, offset, len = length;
 
     page = (start_addr >> 12);
@@ -931,7 +932,6 @@ static
 void acornscsi_data_write(AS_Host *host, char *ptr,
 				 unsigned int start_addr, unsigned int length)
 {
-    extern void __acornscsi_out(void __iomem *, char *buf, int len);
     unsigned int page, offset, len = length;
 
     page = (start_addr >> 12);
-- 
2.56.0


