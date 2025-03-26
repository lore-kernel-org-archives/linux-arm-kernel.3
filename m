Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DB96C36008
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Mar 2025 11:03:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=m8s0QIY71zWKro6xSXQRXZSeXe5WAyMtXk+LtoR8l9A=; b=q8ccxULURQbnDfn2heP7sCyWG8
	f51Aw0Cck1CDbzSmFNV3ZZB1ofN8SdNmhogFPuBKumtXAQun27gXwmvRa9T0OKZflMwSk9AuEP0qb
	MyHVCw1F0xjHH/aAIqn1TAc1elo114PsueBVqTA8xv5VmdaLxZHoWXeZv24L27g5uAxEimsd3u/TA
	zklA0/uLlnvl9n9KQiFMGIBI4eThglEFKgmUvCRFuj4CWAFujcJdgTPHFy2rmEROpsH2G1A8lP3fl
	5fBb9y50loI4CO1N+fhuQF50XUGyHWiSzxVFw0kyqRIlK0pYFurs38cOdys3prYnzbCESwBPWYSY7
	H3b5WWxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txOXd-00000008IgL-3iQK;
	Wed, 26 Mar 2025 11:03:25 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txOVt-00000008IPx-3krk
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Mar 2025 11:01:39 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-43ce245c5acso81572255e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Mar 2025 04:01:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1742986896; x=1743591696; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=m8s0QIY71zWKro6xSXQRXZSeXe5WAyMtXk+LtoR8l9A=;
        b=HGCm5ATviek/pRfTD1/E5flHkFsKkFakjQg2lNLu2v1jkqEMBklZIGDhS+gnzCY/e5
         9Q1h0q9F60OWvrl+0yWq6iu1ofwT8nVV/SJyYqf4FnqflH0adBqAFakX1wuK5jjOiNft
         qwXX2Ow0vyOz1W8BwIzCjf4ApVeUX91JZJoyLrUniI7l8ufjGWkwto9S/KM+Nlc2sHJG
         CdbgbCaqQbACQUWlg67l2kIQTighhdyEnAIO0DusRT9T6ehHzLGp0g/CH6WhuZkM31kG
         PZWxXA9WT1NLHhVGAm+HoOqfzxnkMLPMXDKubpxr+p9k0mn+muTBUz+rNP27Fz9NHyQU
         PPkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742986896; x=1743591696;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=m8s0QIY71zWKro6xSXQRXZSeXe5WAyMtXk+LtoR8l9A=;
        b=cXuGHWxbODHOj//4q1K4Cj9RnPvf1AIAqKTQBrwHfjDFd3goOOWiKd7KxjfX6yMLz9
         ZfLOP6tefvyrQgHna+aK0UujoVN/bwdYNLXFgrtjxIorxvmonxAuBHJtYgH+ff6gxmwz
         TMf1KYHq3TopdZdZiX0KYQ7iOMRpNbY52DpIIlway8GCIVhNRTC8c+1wuTXB7Mv4eR/v
         tE/aj3rbM5lEyi0/cx70xRw2OEp351iQDTtof8Fkenmo+NgG022P3Y/+dmlE8lnf5Hry
         n6ro6QWNYr9xlEbPrjBOEt0pkhZ63kGMFUUbnwRGLytkZHNFsGhg2ur6Q1qdW44267AJ
         nBnA==
X-Gm-Message-State: AOJu0YzUkdccaEhxGnHqyCRx0dj8qZGuiNTRaW7Tavf/jrInYUEduNiH
	AOchW12Kyn7ZDeJGCjVRfcVF9TxXWB7cnNT/t0t2KVdOpDbGF9zTNjnpMoNjcH6815EyW3bCeIc
	lDZ2uTClrv3SQtLwaoSwcCxzLn0L8Gtivu3aRhJjfytHXcEpaE+FlH8Lj/MVhSjqf5asJMTiYP/
	N/TakGKSQ6n/lGXy0d8gS9ryzRRWdV2kEQMqB+tkjgvRh/kA==
X-Google-Smtp-Source: AGHT+IGBA2oNDwoX3vAaJuxLHM6l0qsvxKSEmFmpM5Wmf4mD/taDlkLFT9vj4nHDL4Q52ah1LmKUKhke0w==
X-Received: from wrqb8.prod.google.com ([2002:a5d:40c8:0:b0:391:3d79:3021])
 (user=keirf job=prod-delivery.src-stubby-dispatcher) by 2002:a5d:5885:0:b0:390:f4f9:8396
 with SMTP id ffacd0b85a97d-3997f912d09mr21778026f8f.28.1742986895818; Wed, 26
 Mar 2025 04:01:35 -0700 (PDT)
Date: Wed, 26 Mar 2025 11:00:58 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.49.0.395.g12beb8f557-goog
Message-ID: <20250326110059.3773318-1-keirf@google.com>
Subject: [PATCH] arm64: mops: Do not dereference src reg for a set operation
From: Keir Fraser <keirf@google.com>
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Keir Fraser <keirf@google.com>, Kristina Martsenko <kristina.martsenko@arm.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Mark Rutland <mark.rutland@arm.com>, 
	Will Deacon <will@kernel.org>, stable@vger.kernel.org, Marc Zyngier <maz@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250326_040137_933433_FD09494B 
X-CRM114-Status: GOOD (  14.70  )
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

The source register is not used for SET* and reading it can result in
a UBSAN out-of-bounds array access error, specifically when the MOPS
exception is taken from a SET* sequence with XZR (reg 31) as the
source. Architecturally this is the only case where a src/dst/size
field in the ESR can be reported as 31.

Prior to 2de451a329cf662b the code in do_el0_mops() was benign as the
use of pt_regs_read_reg() prevented the out-of-bounds access.

Fixes: 2de451a329cf662b ("KVM: arm64: Add handler for MOPS exceptions")
Cc: Kristina Martsenko <kristina.martsenko@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: stable@vger.kernel.org
Reviewed-by: Marc Zyngier <maz@kernel.org>
Signed-off-by: Keir Fraser <keirf@google.com>
---
 arch/arm64/include/asm/traps.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/include/asm/traps.h b/arch/arm64/include/asm/traps.h
index d780d1bd2eac..82cf1f879c61 100644
--- a/arch/arm64/include/asm/traps.h
+++ b/arch/arm64/include/asm/traps.h
@@ -109,10 +109,9 @@ static inline void arm64_mops_reset_regs(struct user_pt_regs *regs, unsigned lon
 	int dstreg = ESR_ELx_MOPS_ISS_DESTREG(esr);
 	int srcreg = ESR_ELx_MOPS_ISS_SRCREG(esr);
 	int sizereg = ESR_ELx_MOPS_ISS_SIZEREG(esr);
-	unsigned long dst, src, size;
+	unsigned long dst, size;
 
 	dst = regs->regs[dstreg];
-	src = regs->regs[srcreg];
 	size = regs->regs[sizereg];
 
 	/*
@@ -129,6 +128,7 @@ static inline void arm64_mops_reset_regs(struct user_pt_regs *regs, unsigned lon
 		}
 	} else {
 		/* CPY* instruction */
+		unsigned long src = regs->regs[srcreg];
 		if (!(option_a ^ wrong_option)) {
 			/* Format is from Option B */
 			if (regs->pstate & PSR_N_BIT) {
-- 
2.49.0.395.g12beb8f557-goog


