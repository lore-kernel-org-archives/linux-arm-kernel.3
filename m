Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88FABC5DF97
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Aug 2026 09:02:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=q1tZdo4e5URbud8PZx65gIP4aGbHrtpDN3AOBapMbqs=; b=ivCmrr4u9N6YuhClAkFFbmEKBa
	E2LWCgmo6LCsLFY+5oWJI60hzHJ2KbxiTDvT0Fzzctta4iaHHPaC8MfBN863H06vupuO4nBi+NmVc
	Dud0IuzTn3dj6GCHhukgJHDBBQ1mTQRbzUyINdeL4Q409O9B/a4iKT+BxQQQOqLxn3w2IRoXlXkER
	5a+yAqO8tXlLR8RXgUROz+S7jTSnkn+hBKJiNAySRLOtdTlTFjeBHRGrj7KWF4SgS3v5mAHD0P0SW
	wbcK5enm1l1vcYk0hNry3fTqRMQE4XkKHgN0j+OsETdQsg4gn0M9cOBcPuddpig459CHkYPUYMjjE
	7IgrZsIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wz9WI-000000028AP-3ALX;
	Wed, 26 Aug 2026 09:02:06 +0000
Received: from mail-pl1-x646.google.com ([2607:f8b0:4864:20::646])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wz9WG-0000000289b-1EII
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Aug 2026 09:02:05 +0000
Received: by mail-pl1-x646.google.com with SMTP id d9443c01a7336-2d6f75c1219so16959215ad.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Aug 2026 02:02:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787734922; x=1788339722; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=q1tZdo4e5URbud8PZx65gIP4aGbHrtpDN3AOBapMbqs=;
        b=VTc3IXrKzHxLoeG7AcFI1C8XPoNLMjqnGwmylGz6sZv56ZJQ9EIMVrGsvJvJAovxLj
         AVS0uDGVX39W/C23rjeQvXj71kUK8KEdaWJR3VeIuwqUoLom/BrnzE6TwkoKIehb5ODE
         27mAXDRBRRTJH7NBzU9bWDHxsn1kuLRQ/wAU5ngMQB27NRoCo7UWTGoqBER1hcjjGLY5
         rlXPTaZyxQ5Z86FFB97NkBzN/Hz4m93a0tV+48+61AvnJuXNhlpYlI+nibAbxd532M8i
         xMWz3h9RylT9lqafckYxVxMhXSak2xG255aeISCVHLfGkmhFZrIQUl9c4ScvFtKR4NL8
         9TOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787734922; x=1788339722;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=q1tZdo4e5URbud8PZx65gIP4aGbHrtpDN3AOBapMbqs=;
        b=FJFGa1pSc8F/CeBp3bTJHwoJ2+3kzQasrBYTAmr90EaIsivlx6pziXUrXqxPW9+a5c
         lD61QCawAx4uEhVf8XLz1EHQoywe17Cjna56N6HDfyS9gEkT7+rd2awIz+18mIQ2LQM6
         SXSbp+/WZEkq5P2KZJ5kAgLCQlP5cRy+271GO7txqj1hRgbe3HCOBQaayeLUnObXVK5R
         dZtJnXu0f7tvIECRKZvIygHM91NsMUT/xiOc6pWxbCh9Y4Gcc71iPyesLP3ubhilGpj/
         AXoOqMV4hUZY4ZndobJkWiVAyarCNOSodA1jYSRooI/1DktLCFNRazXyp/AesDeqgSn9
         fOAA==
X-Forwarded-Encrypted: i=1; AHgh+RoLZFt2S/+v85SBai8gr6KXtOYpCjJE8SgxqzosTkk6edMStNmBijLdqCIF083S8/AVFwRV9+fI18+58cG8KIk6@lists.infradead.org
X-Gm-Message-State: AFuF++lsvVprwVlKQa+/e05Rj+VnRTwDAz0oxQ20OrG2zkWXoWHj2UxY
	KdGEFbgEXHAxPUiktgjeZNxFJVlImpWooSCgL3tnCojoRAm63MUe7zjlc0yd0On4BvBT4z/ufvS
	Fnz/w4QgrSZh4TEYqNbPXtVV8TA==
X-Received: from plbko13.prod.google.com ([2002:a17:903:7cd:b0:2cc:bb5f:3fd7])
 (user=ackerleytng job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:903:284:b0:2d6:2901:6265 with SMTP id d9443c01a7336-2d707953a1emr98628575ad.2.1787734922088;
 Wed, 26 Aug 2026 02:02:02 -0700 (PDT)
Date: Wed, 26 Aug 2026 09:01:45 +0000
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAHmrjmoC/43NwQ6CMAyA4VchOzszyoTNk+9hPGysG0uEkYFEQ
 3h3ByeNxnj8m/brTAaMHgdyzGYScfKDD10KvstI3ajOIfUmNQEGJRO5oK7FlnaBRhxvsaO9Sit
 lziVUCqSVFUmXfUTr75t6vqRu/DCG+NieTPk6/e1NOWWUW2FkIdEaXZ9cCO6K+zq0ZAUn+AOBh BxACsvBcKn1B1K8IMC+I0VCCm2FFUxVmps3ZFmWJ7gutz9BAQAA
X-Change-Id: 20260818-gmem-no-return-page-614927a29f97
X-Developer-Key: i=ackerleytng@google.com; a=ed25519; pk=sAZDYXdm6Iz8FHitpHeFlCMXwabodTm7p8/3/8xUxuU=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787734920; l=1513;
 i=ackerleytng@google.com; s=20260225; h=from:subject:message-id;
 bh=OAlLWBhYYG/9ob/PX5hBH6y+Ywi1lILRcsrUDjKKezs=; b=daPi3Fjs1SSb8r0p9nYFDfhMv5JgbSUJww8xvwdjn/5ezcuq3olIFhfPZsB7H97tyDKbuwa/i
 HzQS2OkcWgBCL8fXp9OmJpR3tdyNqhLN3UNa4IWubqk/JfORozIirAG
X-Mailer: b4 0.16.0
Message-ID: <20260826-gmem-no-return-page-v4-0-3bb9c1ddb4e3@google.com>
Subject: [PATCH v4 0/5] Stop returning struct page from guest_memfd PFN lookup
From: Ackerley Tng <ackerleytng@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Ashish Kalra <ashish.kalra@amd.com>, 
	Michael Roth <michael.roth@amd.com>, Brijesh Singh <brijesh.singh@amd.com>, 
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
	Steffen Eiden <seiden@linux.ibm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, David Hildenbrand <david@kernel.org>, Yan Zhao <yan.y.zhao@intel.com>, 
	"Edgecombe, Rick P" <rick.p.edgecombe@intel.com>, Vishal Annapurve <vannapurve@google.com>, 
	Fuad Tabba <fuad.tabba@linux.dev>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	Ackerley Tng <ackerleytng@google.com>
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260826_020204_393049_6F3E38D6 
X-CRM114-Status: GOOD (  10.22  )
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

v4 splits out a new patch (3) that makes use of KVM MMU invalidation logic
introduced into the RMP fault handling in patch 2 to avoid warning on a
benign case.

Other changes in v4:

+ Took Sean's version of the changelog for patch 2
+ Picked up Fuad's Reviewed-by: and Tested-by:

v3: https://patch.msgid.link/20260820-gmem-no-return-page-v3-0-3bf8f80a7b4d@google.com
v2: https://patch.msgid.link/20260818-gmem-no-return-page-v2-0-5298f42d49bb@google.com
v1: https://patch.msgid.link/20260818-gmem-no-return-page-v1-0-4f8d939efdbc@google.com

Signed-off-by: Ackerley Tng <ackerleytng@google.com>
---
Ackerley Tng (3):
      KVM: SEV: Treat unassigned RMP entry as benign race on PSMASH failure
      KVM: SEV: Check for invalidation before warning on unassigned RMP entry
      KVM: SEV: Drop page refcount early in VMSA reload

Sean Christopherson (2):
      KVM: SEV: Drop page refcount early during RMP fault handling
      KVM: guest_memfd: Stop returning struct page from PFN lookup

 arch/arm64/kvm/mmu.c     |  4 +---
 arch/arm64/kvm/nested.c  |  4 ++--
 arch/x86/kvm/mmu/mmu.c   |  2 +-
 arch/x86/kvm/svm/sev.c   | 53 ++++++++++++++++++++++++++++--------------------
 include/linux/kvm_host.h |  6 ++----
 virt/kvm/guest_memfd.c   |  9 ++------
 6 files changed, 39 insertions(+), 39 deletions(-)
---
base-commit: 76671054f9a1ff6abb976583cd8da37650acdc97
change-id: 20260818-gmem-no-return-page-614927a29f97

Best regards,
--  
Ackerley Tng <ackerleytng@google.com>


