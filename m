Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39060CAC58E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Sep 2025 13:49:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=vEbc34OfcWsmZ87K3FZrtli36glSfRnoXSobn53PJa0=; b=zxcGBN888dF0iaSsMiwwFGJHcx
	xqEMwAdHpJeOHSTHrL0KGu4DuzdzF0VsakgNZkIpQcNHwMvxs59UmXRHUTgjXLrrweomkQ1N0nM86
	D0TUU9ZBy9ayk7uKxctPLgw0cmUCMICKYL1mDcEndbwz2rZptu8tPxKbaRNjLhnGI3Po6vAWLC+Ro
	Sn/k56xXoBQyO7yQuvNBKfy2pL1ZtL3XWQGYywXLcnyY/d29gOxyEothiwa2oBanOF/oH1gXWEWKE
	VGFd+KscaZistxiLHRTVT2zz/VVNMi8/dWm/wj8yvpcwJNQoLDB64J3IbCbcvnljKeSOWwBxuya4n
	Xr05uTEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwhgE-00000003LLV-2pt6;
	Thu, 11 Sep 2025 13:49:42 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwhgB-00000003LK0-1ZAj
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Sep 2025 13:49:40 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-3e2055ce973so428554f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Sep 2025 06:49:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757598577; x=1758203377; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vEbc34OfcWsmZ87K3FZrtli36glSfRnoXSobn53PJa0=;
        b=JeqmMtpGqNkq6oH5COHZh1L4R8Yo9CEHB/VquE1o63fGDlPH0wrDeiX0A0gzT0MS1q
         GPm1QGAdam+nM3HpVTZbqGGi+8K2hR3cVrtK+4Ah2PO0EyhlIIZbRDXYYEegL3ZDnyYx
         A6KDuF2d2YA7Kk0yUBZA/RT97jcmXVHYtn7fs3aw8pXVZnFCMF0ak5FegohmZ/isawIZ
         UfAfN3KgMOenhQdnJrzLK46hahtDEdIoHP8p2Ec/HA68vGcJ6gzEC9DApyQv3P3d1s9L
         K9hGAmj22It78EdcVuAYfwVDph+kPgLsmyzhdgVKVLynwZV6t5gU4K9oUO/bCu0aCByU
         bg3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757598577; x=1758203377;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vEbc34OfcWsmZ87K3FZrtli36glSfRnoXSobn53PJa0=;
        b=PALPVmukKfc52s/6q6Xt31YfRlu3ThbseZE3rNWxFU7OxDnZP6usTYGMyMdE9yzXUH
         JI4m6Mlq2woNDDIIeSTqhm6dq81IS+g86Feic9hDLJy1rUm34H/n9T+Amt21MC/3AkB1
         XNh3TsaIBQkw6d0s1WmyLqP+ydDStYU/p8RJVFZh1IHEM1pZn/S4SNLOdkWUqMsnRPIU
         OpRgyLP1Meh50Npjuj/lKDfvIHO6aaO70zLtpc7DHkUAhwwuGhuYd5lR7y19K9ktMG+y
         QM0TsSW6hjhHYrtRgCJSzCYR70fRA5VtgWX1RUO4oMsPE0dennxwbBtDoLE5Tb4QwJJT
         Sb5A==
X-Forwarded-Encrypted: i=1; AJvYcCW3MwSB2m14Tm0BCJL7CRuCOCMidopE6ij97z2SHO2GTcDuzwiHw0Jt9v4gN2mMCVKqgJGrfjG/7eo7RNRRwNOZ@lists.infradead.org
X-Gm-Message-State: AOJu0YywTQTS9fFPS1LxGL9huzLRPH98r51EVqELoR8XiDDxj8s1WPSX
	VfEmG+6OY2MFXGAl81ow4NNB661kMwAcDpGQ3GkPznN4TFEWXdHnWJQy
X-Gm-Gg: ASbGncv9/FSf1XgIyw8pcDXbny8bNN5i5xIKkZeHI8gu+FwKptNRCT44+BRBd4CTcXp
	m2IT5lyxLx75O7meiDyERVfPh0N0+NFYD476DhjUgcTfzPTVIW0w5lwVw0SWot48MBTuaLfnrIO
	1U/fj9MAByS7i0BXvV31Mh/m2t/TXhWq246aW8uGwjoPVQqK754/g8UjrrEcLfmiwwHUZKYrHvC
	R1yZjNGb9AH+Kmoipj9wFLPV5iQ0ZjPQe2QXnl6rll+BWoXR4KAWQy1MG7icywXdgUApeA9O64/
	9er00RqpGZsMcze0IEUD+f5vLCjDOMuFspLNHT0F8tctnUBCukgc7xCSKaFEPqJ6YziKnsQWBjA
	87MCyt1syUY3RTmjsV0FXhaGGnbFdr+Q/jeK4gkxrZE3KO8S5/FT0VTjsKfhufQ4HJFr5KqzIa5
	+rOkH8FGY=
X-Google-Smtp-Source: AGHT+IFuIFRdqHBZCko8vFOdNi4YwrG+SNtH2f5JJFAo5fww3TZYrgIbpWxJK/MEue66sSX1sYEkLQ==
X-Received: by 2002:a05:6000:1ac6:b0:3df:f065:ca13 with SMTP id ffacd0b85a97d-3e64392b761mr17129810f8f.33.1757598577050;
        Thu, 11 Sep 2025 06:49:37 -0700 (PDT)
Received: from f4d4888f22f2.ant.amazon.com.com ([15.248.2.27])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e760778915sm2608361f8f.12.2025.09.11.06.49.35
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 11 Sep 2025 06:49:36 -0700 (PDT)
From: Jack Thomson <jackabt.amazon@gmail.com>
To: maz@kernel.org,
	oliver.upton@linux.dev,
	pbonzini@redhat.com
Cc: joey.gouly@arm.com,
	suzuki.poulose@arm.com,
	yuzenghui@huawei.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	shuah@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	isaku.yamahata@intel.com,
	roypat@amazon.co.uk,
	kalyazin@amazon.co.uk,
	jackabt@amazon.com
Subject: [PATCH 0/6] KVM ARM64 pre_fault_memory
Date: Thu, 11 Sep 2025 14:46:42 +0100
Message-Id: <20250911134648.58945-1-jackabt.amazon@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250911_064939_446288_2C337F09 
X-CRM114-Status: GOOD (  12.62  )
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

From: Jack Thomson <jackabt@amazon.com>

Overview:

This patch series adds ARM64 support for the KVM_PRE_FAULT_MEMORY
feature, which was previously only available on x86 [1]. This allows
a reduction in the number of stage-2 faults during execution. This is
beneficial in post-copy migration scenarios, particularly in memory
intensive applications, where high latencies are experienced due to
the stage-2 faults when pre-populating memory via UFFD / memcpy.

Patch Overview:

 - The first patch is a preparatory refactor.

 - The second patch is adding a page walk flag for pre-faulting.

 - The third patch adds support for the KVM_PRE_FAULT_MEMORY ioctl
   on arm64.

 - The fourth patch fixes an issue with unaligned mmap allocations
   in the selftests.

 - The fifth patch updates the pre_fault_memory_test to support
   arm64.

 - The last patch extends the pre_fault_memory_test to cover
   different vm memory backings.

[1]: https://lore.kernel.org/kvm/20240710174031.312055-1-pbonzini@redhat.com

Jack Thomson (6):
  KVM: arm64: Add __gmem_abort and __user_mem_abort
  KVM: arm64: Add KVM_PGTABLE_WALK_PRE_FAULT walk flag
  KVM: arm64: Add pre_fault_memory implementation
  KVM: selftests: Fix unaligned mmap allocations
  KVM: selftests: Enable pre_fault_memory_test for arm64
  KVM: selftests: Add option for different backing in pre-fault tests

 arch/arm64/include/asm/kvm_pgtable.h          |   3 +
 arch/arm64/kvm/Kconfig                        |   1 +
 arch/arm64/kvm/arm.c                          |   1 +
 arch/arm64/kvm/hyp/pgtable.c                  |   6 +-
 arch/arm64/kvm/mmu.c                          |  97 +++++++++++++--
 tools/testing/selftests/kvm/Makefile.kvm      |   1 +
 tools/testing/selftests/kvm/lib/kvm_util.c    |  12 +-
 .../selftests/kvm/pre_fault_memory_test.c     | 110 +++++++++++++-----
 8 files changed, 186 insertions(+), 45 deletions(-)


base-commit: 42188667be387867d2bf763d028654cbad046f7b
-- 
2.43.0


