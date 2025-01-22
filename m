Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A104C02181
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jan 2025 20:02:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=jurTTxyZurW5GCpnwp6J13h1Jad371IuO/OxoFLazdE=; b=alKSmqP/FAtV0t
	Ue5p1a/kEvql6bvJCC5ny1XHSFR6EcjTAhePemhMiBW2YcFx08OSYZIUl1DtEdbSUdfqffh/8+YOA
	JBAlhvHmYKqXLsDYlcgHFfgOAYyuFqkG8TcIxFikiiZrUqhnSkcIRbpRl/FQ/QgQJYL7NCLusm4Vp
	K/I9YoSahmgyCBecwnaEu36pfkiQWYbXMa7awOU5SUM1BIn245LGgKqiDxnaeQmf1DVbhFi/8cTAW
	EBISlTCLVMokfiofBK0pl4BwcCc0CCM1HmWNvxnHv8R2arwjdjs10h+kMBJeVE5tSvWyn/RScwQME
	4A1mWsNTPnuLEpEsdEjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tagvy-0000000B7ph-1wVa;
	Wed, 22 Jan 2025 20:02:42 +0000
Received: from mail-qk1-x72c.google.com ([2607:f8b0:4864:20::72c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1taguT-0000000B7am-3TnQ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jan 2025 20:01:11 +0000
Received: by mail-qk1-x72c.google.com with SMTP id af79cd13be357-7b6ffda45f3so1394985a.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Jan 2025 12:01:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737576068; x=1738180868; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jurTTxyZurW5GCpnwp6J13h1Jad371IuO/OxoFLazdE=;
        b=mphJIpsBufk7Qi1WspIfaoQo1gPSk3EVPUPerVLkMUzcqBLDcK/JjKXETx7+FoC1WX
         z9XNBegg6NlhPLnom5dIbHDX1KDEKIte4wbZE4po5pQ8aqwRsAzk3YXR6MTp9v4GJlgW
         zqfPK391bGte10f+JuGnc+LbaQ0ONeZpOmVKkBFagVPALgjgJ9+inyCTpM/1UL0Z+QyY
         O0+BRWDVdSn6XllFMrsH6OcBKAE6vW/owMzv8rWaBgfcRSWTep7RQ/tcpZioQ7et3J15
         bLFBAzIu45T5Ghxxj4iGHOQ97RtXMnylJHm1blU0xBUhV+TnP6uwDyD1GfZyfcMdVzDi
         m3gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737576068; x=1738180868;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jurTTxyZurW5GCpnwp6J13h1Jad371IuO/OxoFLazdE=;
        b=MdrSDsZk0vxJjWc47zokaPAa2HQr09fQ9P3LDC4vdtUm123KadlYMRrm080g9y/+BY
         LNkib1sa0fN2rTQ1Ev7bbwf90hTPdlCLyrDo+6k5ZnpKAwbtm8PddSY8s7S59BxIs7Ne
         YWUm4A1bvP+ZRP1DkE7Y2Rp/NNqmSO45kPRq5yOPcV6fExoc6/Zw1ElFRq6MUY8cztQh
         SZq9pgiSGN33F+HXkVv72Qetsos0BQNJHul/7cpvbX0WhiKFlVVgHLpRN98/hisyTqcG
         phWFYCxG7pJ9XEBPf5irhjJJObbqynuASD48VfUxYWBnruEDxgwpmQCBsD90lrrZvwpY
         GhoQ==
X-Forwarded-Encrypted: i=1; AJvYcCXA3HkhpPAtfxnaGvEW4hT0hf/rnBiC6sIuQDOcaaVioxUwyXbb1tJ5PlRdhTfZd3tWuR6gtUfSCPZR4un7LJhc@lists.infradead.org
X-Gm-Message-State: AOJu0YxtNra0CE7vQ51eWIMBugvM8Tw+Wdzav5bowbg/Qe7+baw5ke73
	vTyApQIMrMW4GF2myGjPHwAZvIAHj1vkDvjiLRrJ5qpz+bJy40q7
X-Gm-Gg: ASbGnct7eunZLb5XgGqfZddHbiTHRNiWnqyGbuJ/ICAzv0KoA1o5b4fcqyvwA63Z6BV
	KmMCvW3xjhspObDZPaw1jbpwjUmBPwLRxAlpX1R1IJMXBNpUjN/QjoLtNNhrFPRZEp0r0VU96Gr
	3Elaj0ftXrd/cQEYj3KJ7DcoOrdpid6LnYhbsbtK+/7cafTKcydZTOuNCZiK3KovNLNIrfzQhWJ
	HIDlJrVSfySYzAIL8MnEQyQREFjK9Fgaqbtw4tqDwi0Tr7OwCPYSJoD9mkzpcGqGovzjYT2zmzW
	r8MmnJiAxcmbR8pEj6slrCU+L0sT
X-Google-Smtp-Source: AGHT+IHPM76iU6Z5PtzDIriPWj/nNzCyP2ix3l+fnM7JVaz7sX/vP0vOsO1NLQa7vmhO30zGz8RV4Q==
X-Received: by 2002:a05:620a:28ca:b0:7a9:a632:48ad with SMTP id af79cd13be357-7be6324e361mr1073763385a.11.1737576068474;
        Wed, 22 Jan 2025 12:01:08 -0800 (PST)
Received: from [192.168.1.99] (ool-4355b0da.dyn.optonline.net. [67.85.176.218])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7be6147e30asm694606385a.31.2025.01.22.12.01.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jan 2025 12:01:08 -0800 (PST)
From: Connor Abbott <cwabbott0@gmail.com>
Subject: [PATCH v3 0/3] iommu/arm-smmu, drm/msm: Fixes for stall-on-fault
Date: Wed, 22 Jan 2025 15:00:57 -0500
Message-Id: <20250122-msm-gpu-fault-fixes-next-v3-0-0afa00158521@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHlOkWcC/43NPQ6DMAwF4KtUmevKcfgpnXqPqgMBA5EIoAQQF
 eLuDUxMVcf3rPd5FZ6dYS8el1U4no03fReCul5E0eRdzWDKkAUhxShlCtZbqIcJqnxqR6jMwh4
 6XkbIElaY3ZEUSxHmg+PjGtavd8iN8WPvPsenWe7tH+gsAUEXmVaKdFyiftY2N+2t6K3Y0ZlOE
 OEPiAJUJiopIqQUIzpD27Z9AdUaNRoJAQAA
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1737576067; l=2962;
 i=cwabbott0@gmail.com; s=20240426; h=from:subject:message-id;
 bh=+WyN8FK5rY7qRc7VsIGAiJo2lnVpGPEuUicLFpDWETs=;
 b=a4zT3xeEwtyC9Lok7bYUo82pNV1IICFMNUHKvQZdQPpSD93+dLg1/j5KSWHZfEPg9D0yl3UG5
 I8IDAG+Ikk+BU8oBibWzReXFAvKresl7KM82p7INLVNp/P+OYQJ5ccX
X-Developer-Key: i=cwabbott0@gmail.com; a=ed25519;
 pk=dkpOeRSXLzVgqhy0Idr3nsBr4ranyERLMnoAgR4cHmY=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250122_120109_884571_C0CC7F73 
X-CRM114-Status: GOOD (  17.67  )
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

Patch 1 fixes the first problem and is independent of the rest of the
series. Patch 3 fixes the second problem and is dependent on patch 2, so
there will have to be some cross-tree coordination.

I've rebased this series on the latest linux-next to avoid rebase
troubles.

Signed-off-by: Connor Abbott <cwabbott0@gmail.com>
---
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
Connor Abbott (3):
      iommu/arm-smmu: Fix spurious interrupts with stall-on-fault
      iommu/arm-smmu-qcom: Make set_stall work when the device is on
      drm/msm: Temporarily disable stall-on-fault after a page fault

 drivers/gpu/drm/msm/adreno/a5xx_gpu.c      |  2 ++
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c      |  4 +++
 drivers/gpu/drm/msm/adreno/adreno_gpu.c    | 42 +++++++++++++++++++++++++++-
 drivers/gpu/drm/msm/adreno/adreno_gpu.h    | 24 ++++++++++++++++
 drivers/gpu/drm/msm/msm_iommu.c            |  9 ++++++
 drivers/gpu/drm/msm/msm_mmu.h              |  1 +
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 45 +++++++++++++++++++++++++++---
 drivers/iommu/arm/arm-smmu/arm-smmu.c      | 41 ++++++++++++++++++++++++++-
 drivers/iommu/arm/arm-smmu/arm-smmu.h      |  1 -
 9 files changed, 162 insertions(+), 7 deletions(-)
---
base-commit: 0907e7fb35756464aa34c35d6abb02998418164b
change-id: 20250117-msm-gpu-fault-fixes-next-96e3098023e1

Best regards,
-- 
Connor Abbott <cwabbott0@gmail.com>


