Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73687CCD1BF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Oct 2025 22:59:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:From:Subject
	:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LsN+TIOejwkRxcFvSTLIziuR7qVC+NSwlbaa713vCGw=; b=c9dpY32oJe+VrsIRAA5AJzCoga
	NYx8hSessKKpKyVDL2qKI4+vfZIRaYuPpbMrPPQCeLgbYm92I4TNanWiPkLW/8JdYiMLHM4tmQ9tj
	6Tia+ZXuJORpks55OI2Wiy8qoVC4KzdP6z4ii0zsS8xvotBENj28uICzCmGH14q+vkcA9TXL1//KH
	gOyu4vCcONMPtCtmioTmfSifOjbj6R853sc1lvmuuB2Dd5PC1HInBluTygD7BwhzbLPUZTWndVOzX
	3f9qQfe0wRWcvUZSnzPjOc4lL6KpSdm8sPhvXq15DF14UUdtNp+HY0gXeuf/tg/MbSd6xZUwLIIOO
	vwBxd7nA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDsec-0000000Gm2h-1fvJ;
	Tue, 28 Oct 2025 22:59:02 +0000
Received: from mail-pl1-x649.google.com ([2607:f8b0:4864:20::649])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDseW-0000000Gm0a-3Gqu
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Oct 2025 22:58:57 +0000
Received: by mail-pl1-x649.google.com with SMTP id d9443c01a7336-27ee41e062cso73407815ad.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Oct 2025 15:58:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761692335; x=1762297135; darn=lists.infradead.org;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LsN+TIOejwkRxcFvSTLIziuR7qVC+NSwlbaa713vCGw=;
        b=SM4Nn/R5Vru8vAo9jBzaQLDDqat6CEf/Ur7oTT068/3C412SCOX0U0zEW+HfrsSv1R
         rzPD9LJnVoSJ3kjtrmadlklkj0iWXJLSViocFNoUplfzjZLvBYJ3pgQGoFhqszYa3Fur
         kjgIB77r9i+2VA8x5IMd+65l+EvXqt8tQYrwRydXZUu/ke9oPfSPNgPmg2VL3RWr6R+P
         CeBqWEq4YPB9cdrS4KKOLz/oddbDo5Aohqz7PGvVOAiqXVg1TPhW3zdyIp9FW5cIHY/n
         ijhbxst3DMWQYSuOlOE9UnZNiIYlnVAzpwxQha6m4bX2LbuX1AeHQIoAzWmp0s8bSrjP
         uc2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761692335; x=1762297135;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LsN+TIOejwkRxcFvSTLIziuR7qVC+NSwlbaa713vCGw=;
        b=MOspQm9CgjFm0okK2sSLwuJbmxsTx3IFJWWuEAp7ngjmtSzbT6dVTVAry3v8ETme4D
         BkWLR7tf+TYWJ+gxnv0vTX7A/pXF23VJTlBF5qiuYn5+BOtnWs4XUEcrthumdJX0Ovfb
         YdlxEklPkhelFDk2TkqYbrB1KohrsBnBCoz1bYJXHJLxeQkAggchjUx9hKmuApQKDreM
         IAXGICTUbj/bMlu03NL0mbPxQHWKoqWhupNeSd1QSi/1jZzOIxESL2R7JRXFLa+7nwdh
         YDPX0ux0JGhdlqv4VUuZWmvE/eeBum4yTSc/HwiPQAsSZ2y7gEcxWM62ofM5wPKIDJfF
         pVJQ==
X-Forwarded-Encrypted: i=1; AJvYcCWNCCH/7M8bETHyeXJ5jfHrjyq6T+FdxGHM7Pfr0qcy4LWqCMe7RsFgIrUX6c/H0qcdeguMqtTngTKvDWNKlN/C@lists.infradead.org
X-Gm-Message-State: AOJu0YxZuf2r7DOwCghp43d3rkJhbJECf2HhLKGDOUGbOqNGJaSVjayd
	d3gyEKUuGes8/8KtZPuIyXzvSyykF7hMdPMYV323iC0dV9PQVDeHPnWwIwlu0+2lKsgYK2+vjWL
	dMXoKUCOZwU1O4A==
X-Google-Smtp-Source: AGHT+IEMVSuG9lR7nieExZvnnc5AQBFrpxM2bdWmWvBi3SSEzKa00dcCH/wBtXjIXiNue0RQB/h1x65fEm/mgQ==
X-Received: from pjvv11.prod.google.com ([2002:a17:90b:588b:b0:33e:3612:2208])
 (user=jmattson job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:903:2a86:b0:290:dd1f:3d60 with SMTP id d9443c01a7336-294def5a88amr8429735ad.51.1761692335281;
 Tue, 28 Oct 2025 15:58:55 -0700 (PDT)
Date: Tue, 28 Oct 2025 15:30:40 -0700
In-Reply-To: <20251028225827.2269128-1-jmattson@google.com>
Mime-Version: 1.0
References: <20251028225827.2269128-1-jmattson@google.com>
X-Mailer: git-send-email 2.51.1.851.g4ebd6896fd-goog
Message-ID: <20251028225827.2269128-3-jmattson@google.com>
Subject: [PATCH v2 2/4] KVM: selftests: Use a loop to walk guest page tables
From: Jim Mattson <jmattson@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>, 
	Sean Christopherson <seanjc@google.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Andrew Jones <ajones@ventanamicro.com>, Huacai Chen <chenhuacai@kernel.org>, 
	Bibo Mao <maobibo@loongson.cn>, Jim Mattson <jmattson@google.com>, 
	"Pratik R. Sampat" <prsampat@amd.com>, James Houghton <jthoughton@google.com>, linux-kernel@vger.kernel.org, 
	kvm@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251028_155856_825784_15BC55E9 
X-CRM114-Status: GOOD (  11.56  )
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

Walk the guest page tables via a loop when searching for a PTE,
instead of using unique variables for each level of the page tables.

This simplifies the code and makes it easier to support 5-level paging
in the future.

Signed-off-by: Jim Mattson <jmattson@google.com>
---
 .../testing/selftests/kvm/lib/x86/processor.c | 23 ++++++++-----------
 1 file changed, 10 insertions(+), 13 deletions(-)

diff --git a/tools/testing/selftests/kvm/lib/x86/processor.c b/tools/testing/selftests/kvm/lib/x86/processor.c
index 738f2a44083f..720c678187b5 100644
--- a/tools/testing/selftests/kvm/lib/x86/processor.c
+++ b/tools/testing/selftests/kvm/lib/x86/processor.c
@@ -307,7 +307,8 @@ static bool vm_is_target_pte(uint64_t *pte, int *level, int current_level)
 uint64_t *__vm_get_page_table_entry(struct kvm_vm *vm, uint64_t vaddr,
 				    int *level)
 {
-	uint64_t *pml4e, *pdpe, *pde;
+	uint64_t *pte = &vm->pgd;
+	int current_level;
 
 	TEST_ASSERT(!vm->arch.is_pt_protected,
 		    "Walking page tables of protected guests is impossible");
@@ -328,19 +329,15 @@ uint64_t *__vm_get_page_table_entry(struct kvm_vm *vm, uint64_t vaddr,
 	TEST_ASSERT(vaddr == (((int64_t)vaddr << 16) >> 16),
 		"Canonical check failed.  The virtual address is invalid.");
 
-	pml4e = virt_get_pte(vm, &vm->pgd, vaddr, PG_LEVEL_512G);
-	if (vm_is_target_pte(pml4e, level, PG_LEVEL_512G))
-		return pml4e;
-
-	pdpe = virt_get_pte(vm, pml4e, vaddr, PG_LEVEL_1G);
-	if (vm_is_target_pte(pdpe, level, PG_LEVEL_1G))
-		return pdpe;
-
-	pde = virt_get_pte(vm, pdpe, vaddr, PG_LEVEL_2M);
-	if (vm_is_target_pte(pde, level, PG_LEVEL_2M))
-		return pde;
+	for (current_level = vm->pgtable_levels;
+	     current_level > PG_LEVEL_4K;
+	     current_level--) {
+		pte = virt_get_pte(vm, pte, vaddr, current_level);
+		if (vm_is_target_pte(pte, level, current_level))
+			return pte;
+	}
 
-	return virt_get_pte(vm, pde, vaddr, PG_LEVEL_4K);
+	return virt_get_pte(vm, pte, vaddr, PG_LEVEL_4K);
 }
 
 uint64_t *vm_get_page_table_entry(struct kvm_vm *vm, uint64_t vaddr)
-- 
2.51.1.851.g4ebd6896fd-goog


