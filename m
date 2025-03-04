Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C042DC282D2
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 18:24:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=4N8VHwibUhruAck2dmF0TGYAITA4/2gddqUqD7otHMo=; b=d6Gu5s0Det/p5j
	eke5jZn8ADAr/t8C90pB1tFmDA8KcnlYPOJLiVGEzGNboVewpJNuk+4rDUCSGhstaLtUHkmmQVR/A
	/+CBxblfxzvjMMPyWonaSSmkdsMRoXkCgguueZg4yenG/rgmsMaM7KkxjtWkU8yteHQkCRZT73g9N
	1GJSWOTYA1IbW0IfdwpDAGXC3HUvF1Nq9kJdRLCXJG/Y/siBrWrj/MwDtMEdyis/lR1fEa1hMcZzT
	v84zraTuueaUAihRABqR1Q8tNTgOKGmT4ZNBg4G0NCnI568FHjcV1QQB775actaApVxdD/LkGlhM5
	Wwx+6kWgwkRnse+wXTAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpWvs-00000005paE-3Kkg;
	Tue, 04 Mar 2025 18:23:56 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpVaQ-00000005WFN-1NyX
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 04 Mar 2025 16:57:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Cc:To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:From:Sender:Reply-To:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=4N8VHwibUhruAck2dmF0TGYAITA4/2gddqUqD7otHMo=; b=a0xh6XXJ0ZVLDabAvsi926Svvc
	J2Zx0tgYgmvAyIgg2kblkaKDVoXofMnBSgLC2Bz8hUQlZn4XWGg/W+HzoSaZOlGqYlC8vCoZhmy16
	GL0D6TwF3lk5idm9cPl8qpO+1Yzqfln/4yVCmxiwc4nrw8kCCgbEIIXDgFBrI8eFieayg39+Wdc7I
	fSLliJlFkM5XPuH60ZxHyd7G1tqcnKXMd8x9zexQ6OSo62fXF6Jv5+14tQD5L8xgiOFg0zz+rwVyw
	PWfemvfadxkNpxbv/l4ezVODHGJtRQKdqReaJSgl4VsWVD0TLKhjeAO6v0hOnaEN7sTi7wlViMee/
	+t1xmRBw==;
Received: from mail-qv1-xf35.google.com ([2607:f8b0:4864:20::f35])
	by casper.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpVaJ-00000002AbH-0oI7
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Mar 2025 16:57:40 +0000
Received: by mail-qv1-xf35.google.com with SMTP id 6a1803df08f44-6e890e0ebeaso9173216d6.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Mar 2025 08:57:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741107440; x=1741712240; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4N8VHwibUhruAck2dmF0TGYAITA4/2gddqUqD7otHMo=;
        b=OFlwhXwIPursbGoFAwDQGZARoNiJr9++2wS2ZezykfqaZXP3qcnKMt880GqEJtTzaS
         PzWjTmKgzatQP11AnCDEwI9v1RcgipcxkFe0oU2HX/VhBuvzYiy2mERZtzPX3NgLDFEb
         aZWJYg5QnRbaCzGBXrRMZBApMzCttUulkhz2dbDQcZ42xIvBAPZB0FcJzwoXESv8HdPp
         Nk6GWaR7XcYtkjONf5+i6bhVkc954mzZTog6okKFrcFCZbTlPamDL+IjxGXZVB3lrwQj
         Ga0ZWEVT8T9Dh6IRAVUHUGhSDElKwgYuZzsKYBvdjlinakFoKvz5vV2vE+SnQp7dU6Lu
         Yabg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741107440; x=1741712240;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4N8VHwibUhruAck2dmF0TGYAITA4/2gddqUqD7otHMo=;
        b=qMBfNDu3au0TM0OJQ1/MowTNl1ioSoQyGw6r8ElhDzbA1wIRgMUqvpzIck+d52efVP
         0bIef3RJeiKpxMAb+3PRlvWFdLDn+iNl+9AXx188ax1NBVv+Ap01AwfvF21+QGZwvF+B
         BYLVxz3d5GZQhn3thd0t9q4qBfhHWp2i9ZWzV0z9yKYX4EFwvebX1L3Hxza9ValaSexN
         PasI04E2EWVn81pTlccN08pn2mUIPyfG3kleUKAXu0ITxClptW5Trhl7jQz2IAj/EJhh
         63hGVitgFMc6ozB8mp8xpxysAd/qKKoLWY+P2bgMKCfFoPHV/TXBdGSw3nlrcZALYQzT
         imjA==
X-Forwarded-Encrypted: i=1; AJvYcCVqa7LR1GbKoZJunYu5C1inyT7uogRmlCFj8hRngLj95IWWjQW8AqSLdwrIHWqOgMfG9G8nyz8ZtoBBRfAMLOac@lists.infradead.org
X-Gm-Message-State: AOJu0YwBNR0ajO+EiiADMRC9ZBjoOBx/oOdU99HBc5Z1weBHx010+PeA
	DYm39p0B95y1OlpJ+q6l3GDtyus8LY3iMHtbORmCfO29OmLAEXfh
X-Gm-Gg: ASbGnct0Gl9spQUhR5Mo8y8ylDSJAYfZzGfoAVeFATg+sB83IsGrZcolvTLmVo2TjuI
	b2CiEnj6y8cutljpXKzzOwbElidSD26pnYkDsjRLdHEWt3160TABi7KRf0uAlopXVuw5mPagDZm
	yHeI9rRcvGU3N3BzgcYRUhQROQFvoLJv6jR0MLSFaVLg3+nDcMns8zYyp8GALOC7Ra6yoXtsL34
	I81DWWwwk2lnOURuk9OiRZi9OqDoIK3F/lbznMkXTRo9eLb1tnZkV4XSPevqGndZbg2GLMfmPnc
	9ypRFInAp0WqJe7DIiSWzna2I9zXRnx8eYPuWKZlC55JqBnpVdBAlf3J9Cjf6q0tihjvO+Byehv
	wTKQ=
X-Google-Smtp-Source: AGHT+IEjBShiUHTmpe9BMjUgMebZZwGJVd8KDtAxwtvq24tPACT0iVbZHCMtbB96Yct3APfYOpiThw==
X-Received: by 2002:ad4:5ca3:0:b0:6e8:8f31:3120 with SMTP id 6a1803df08f44-6e8a0d8b6cbmr87598206d6.8.1741107440528;
        Tue, 04 Mar 2025 08:57:20 -0800 (PST)
Received: from [192.168.1.99] (ool-4355b0da.dyn.optonline.net. [67.85.176.218])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6e8976ec3b6sm68915966d6.125.2025.03.04.08.57.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 08:57:19 -0800 (PST)
From: Connor Abbott <cwabbott0@gmail.com>
Subject: [PATCH v4 0/5] iommu/arm-smmu, drm/msm: Fixes for stall-on-fault
Date: Tue, 04 Mar 2025 11:56:46 -0500
Message-Id: <20250304-msm-gpu-fault-fixes-next-v4-0-be14be37f4c3@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAM4wx2cC/43NSw6DMAwE0KugrOvKcfh21XtUXQQwEImfCCAqx
 N0bWKEuUJcz1jyvwvJg2IqHt4qBZ2NN17rg3zyRVbotGUzusiCkAKWMoLENlP0EhZ7qEQqzsIW
 WlxGSkBUmMZJiKdy8H/i4uvXr7XJl7NgNn+PTLPf2D3SWgJBmSaoUpUGO6bNstKnvWdeIHZ3pB
 BFeQOSgPFRh5iNF6NMvpM4QXUDKQagLjSiDOCB5hrZt+wLr0SnRUgEAAA==
X-Change-ID: 20250117-msm-gpu-fault-fixes-next-96e3098023e1
To: Rob Clark <robdclark@gmail.com>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>, 
 Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>
Cc: iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, freedreno@lists.freedesktop.org, 
 Connor Abbott <cwabbott0@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1741107439; l=3515;
 i=cwabbott0@gmail.com; s=20240426; h=from:subject:message-id;
 bh=msh5539EjP+JTGfOm7TmnwDK21yliTFnve+XoihROqc=;
 b=Yavv0d1CLCCiAkzMuG0FSXiwmFR5GAOb6ZI7nc0yBLbQYtJjjJMoJ6ZB5l36VedPILL/LfxB/
 3FVj0xLJBQtCu9H3ML69818ww2mDXCQabfOEhSJAL5M0FYjXXvbU03/
X-Developer-Key: i=cwabbott0@gmail.com; a=ed25519;
 pk=dkpOeRSXLzVgqhy0Idr3nsBr4ranyERLMnoAgR4cHmY=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_165735_982837_66D23810 
X-CRM114-Status: GOOD (  14.89  )
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

drm/msm uses the stall-on-fault model to record the GPU state on the
first GPU page fault to help debugging. On systems where the GPU is
paired with a MMU-500, there were two problems:

1. The MMU-500 doesn't de-assert its interrupt line until the fault is
   resumed, which led to a storm of interrupts until the fault handler
   was called. If we got unlucky and the fault handler was on the same
   CPU as the interrupt, there was a deadlock.
2. The GPU is capable of generating page faults much faster than we can
   resume them. GMU (GPU Management Unit) shares the same context bank
   as the GPU, so if there was a sudden spurt of page faults it would be
   effectively starved and would trigger a watchdog reset, made even
   worse because the GPU cannot be reset while there's a pending
   transaction leaving the GPU permanently wedged.

Patches 1-3 fixes the first problem and is independent of the rest of the
series. Patch 5 fixes the second problem and is dependent on patch 4, so
there will have to be some cross-tree coordination.

I've rebased this series on the latest linux-next to avoid rebase
troubles.

Signed-off-by: Connor Abbott <cwabbott0@gmail.com>
---
Changes in v4:
- Add patches 1-2, which fix reading registers in drm/msm when
  acknowledging the fault early. This was Robin's preferred solution
  compared to making drm/msm's fault handler tell arm-smmu to resume the
  fault.
- Link to v3: https://lore.kernel.org/r/20250122-msm-gpu-fault-fixes-next-v3-0-0afa00158521@gmail.com

Changes in v3:
- Acknowledge the fault before resuming the transaction in patch 1.
- Add suggested extra context to commit messages.
- Link to v2: https://lore.kernel.org/r/20250120-msm-gpu-fault-fixes-next-v2-0-d636c4027042@gmail.com

Changes in v2:
- Remove unnecessary _irqsave when locking in IRQ handler (Robin)
- Reuse existing spinlock for CFIE manipulation (Robin)
- Lock CFCFG manipulation against concurrent CFIE manipulation
- Don't use timer to re-enable stall-on-fault. (Rob)
- Use more descriptive name for the function that re-enables
  stall-on-fault if the cooldown period has ended. (Rob)
- Link to v1: https://lore.kernel.org/r/20250117-msm-gpu-fault-fixes-next-v1-0-bc9b332b5d0b@gmail.com

---
Connor Abbott (5):
      iommu/arm-smmu: Save additional information on context fault
      iommu/arm-smmu-qcom: Don't read fault registers directly
      iommu/arm-smmu: Fix spurious interrupts with stall-on-fault
      iommu/arm-smmu-qcom: Make set_stall work when the device is on
      drm/msm: Temporarily disable stall-on-fault after a page fault

 drivers/gpu/drm/msm/adreno/a5xx_gpu.c            |  2 +
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c            |  4 ++
 drivers/gpu/drm/msm/adreno/adreno_gpu.c          | 42 ++++++++++++-
 drivers/gpu/drm/msm/adreno/adreno_gpu.h          | 24 ++++++++
 drivers/gpu/drm/msm/msm_iommu.c                  |  9 +++
 drivers/gpu/drm/msm/msm_mmu.h                    |  1 +
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom-debug.c |  4 +-
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c       | 64 ++++++++++++++-----
 drivers/iommu/arm/arm-smmu/arm-smmu.c            | 78 ++++++++++++++++++------
 drivers/iommu/arm/arm-smmu/arm-smmu.h            | 19 +++---
 10 files changed, 204 insertions(+), 43 deletions(-)
---
base-commit: 866e43b945bf98f8e807dfa45eca92f931f3a032
change-id: 20250117-msm-gpu-fault-fixes-next-96e3098023e1

Best regards,
-- 
Connor Abbott <cwabbott0@gmail.com>


