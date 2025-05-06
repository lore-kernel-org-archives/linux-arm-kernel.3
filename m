Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4557BC3ABAC
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 11:23:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=tZnTKNq8EyXu3RPx00ra9THtbxrVu93k8UBSMKqYZT8=; b=myjyb+A/nxFhUjFVs+d1VpLCwZ
	9j90NG4I0RM7FT2yU+e+SLAbc94OVldme1lBjmMIZ4JVYPWupAX7lhEj1JS8dpE6iwlZpRdHQ0oln
	prl/nTZ6pxCRKpfGJXEUul1o4QsFS9LaJzdLXQez5uFKDR9yWJT75tF/o7mq5QPal+uMP9ABQefjY
	Y18Q1AKalpLSz94Bp0EtFSFhOvdjzDm033D6l0KqGyM3PWPb+NZpZ9YTtKH0hSsKFLLctCIqisPCq
	vRdr5s9cyAL+vQGcXxCxdBYJIWCYn4buhz+GlwgRdRgQVk4ZYGd/CkYuschgVzPkC7qPyUAb+UTfl
	0s/xawUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCGOS-0000000BifO-3Jgd;
	Tue, 06 May 2025 11:23:24 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCEyy-0000000BSvq-1eGB
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 May 2025 09:53:01 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-39ab85402c9so133586f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 May 2025 02:52:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1746525178; x=1747129978; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tZnTKNq8EyXu3RPx00ra9THtbxrVu93k8UBSMKqYZT8=;
        b=jR3Jjc+sLXlPSP+9FyiQelbuBpuqskdGrgepeuk0GT0ZOvmKz/klAv8mRxPmY3bbrn
         49bglZAHXcNAqy28Cm9ZcnAo2FFhwlpGl0LAjr15k5Oofvd2+imQy+EgB3NAenzTJZ40
         fIvIJaKLUtqp9V8Zk9PLEESuBxu6jsgCHpp6U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746525178; x=1747129978;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tZnTKNq8EyXu3RPx00ra9THtbxrVu93k8UBSMKqYZT8=;
        b=FAmd9WsMoGpDZKiH2spusxEy6eIwzuQF7TSBzdRApDz2EP17r2jsVcLZvP0AVEJPx7
         cjCzAEKErVNFQl0nVxAncUSep1gEn1mcrXwHfyvNnxgXQTD7+cW6B3ZRyJjcdLs9YZP3
         s0DrpYVTF4cLCfjj/uW3IQKMHPs3UNGQ5ARUAIZ2G5HmiqJUUiNq3EJ/LDXKLlCN5Xpl
         jbVM+o88XQ+3i0MEGLDSHbbOjsDjp3GX7ymqNZUYqutOXt3QM82kwUPQuiA6DyGoP7E5
         6huQHXpGJyj3WvQBdHWpdtXrvgQNhAj2i8EDp4FkPpNdnd5tHr4nI77yiC2jvApwsjcd
         luuA==
X-Gm-Message-State: AOJu0YzQUhAUYrycWG9DCCugAoKtYF2h19eHORe4Oo9Thf29Hdg83DdQ
	cpEEq8CoPbFLIedsru1+MobDvITKri7bKhST+uB9qH4nA4rGAqRoPtTMVY/5dnedhrNPOPxQcpg
	=
X-Gm-Gg: ASbGncti4OQ5i33uq+P+BPbmzHf3VrkGKcQqZJkPPioLaVDQbO1iZkx3Zi7EI0ZWt9V
	5rZWULt29r+UG6Re1r20/V4v1I14cGsorKquDDQlItENHwLDI2H6yqAvORf447CHK2CfL+E5hAa
	XaclZKFR4+hYENE5hx1yrLktEZnA9b6GPOgkS5e02gQl6AcqsNhWPphHF50+s37iwf9QSnHmLw3
	66Nup8rVCyVJ6EibJGXwha+WT6N/b1thgUZM4cYHsPD8k0n5KHS5w/myrrjBNUj0g1ATSxK5aaL
	kC25fIV3po4rEcGH1yoYzgV0nq93Rn7u/CKKCOHEZsW9q0Eq9t4TADtM
X-Google-Smtp-Source: AGHT+IGAeOYlQsHeYetefU7QLQr05zvGoAryBVbR5H/R7ZH9OmOhzOm9zAiwuZL9RcZI1H/m5f/Vyg==
X-Received: by 2002:a05:6000:188d:b0:39c:1ef4:b0d1 with SMTP id ffacd0b85a97d-3a099aefc65mr4520575f8f.10.1746525178108;
        Tue, 06 May 2025 02:52:58 -0700 (PDT)
Received: from revest.zrh.corp.google.com ([2a00:79e0:9d:6:7196:3093:b0e3:1016])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a099ae7a46sm12879860f8f.44.2025.05.06.02.52.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 02:52:57 -0700 (PDT)
From: Florent Revest <revest@chromium.org>
To: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Cc: catalin.marinas@arm.com,
	will@kernel.org,
	tglx@linutronix.de,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	x86@kernel.org,
	hpa@zytor.com,
	akpm@linux-foundation.org,
	broonie@kernel.org,
	thiago.bauermann@linaro.org,
	jackmanb@google.com,
	Florent Revest <revest@chromium.org>
Subject: [PATCH 0/4] mm: Avoid sharing high VMA flag bits
Date: Tue,  6 May 2025 11:52:20 +0200
Message-ID: <20250506095224.176085-1-revest@chromium.org>
X-Mailer: git-send-email 2.49.0.967.g6a0df3ecc3-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_025300_455947_A05611CD 
X-CRM114-Status: GOOD (  16.65  )
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

While staring at include/linux/mm.h, I was wondering why VM_UFFD_MINOR and
VM_SHADOW_STACK share the same bit on arm64. I think I gained enough confidence
now to call it a bug.

The first patch of this series is a straightforward attempt at fixing this
specific bug by changing the bit used by VM_UFFD_MINOR. I cc-ed stable on that
one and I expect it to not be all too controversial.

The rest of the series however is a more zealous refactoring and likely to be
more contentious... :) Since this bug looks like a near miss which could have
been quite severe in terms of security, I think it's worth trying to simplify
the high VMA flag bits code. I tried to consolidate around the current usage of
VM_HIGH_ARCH_* macros but I'm not sure if this is the preferred approach here. I
really don't feel strongly about those refactorings so this is more of a
platform for discussion for people with more mm background, I'll be more than
happy to respin a v2!

This series applies on v6.15-rc5.

Florent Revest (4):
  mm: fix VM_UFFD_MINOR == VM_SHADOW_STACK on USERFAULTFD=y &&
    ARM64_GCS=y
  mm: remove CONFIG_ARCH_USES_HIGH_VMA_FLAGS
  mm: use VM_HIGH_ARCH_* macros consistently
  mm: consolidate VM_HIGH_ARCH_* macros into parametric macros

 arch/arm64/Kconfig   |  3 ---
 arch/powerpc/Kconfig |  1 -
 arch/x86/Kconfig     |  2 --
 include/linux/mm.h   | 49 +++++++++++++++-----------------------------
 mm/Kconfig           |  2 --
 5 files changed, 17 insertions(+), 40 deletions(-)

-- 
2.49.0.967.g6a0df3ecc3-goog


