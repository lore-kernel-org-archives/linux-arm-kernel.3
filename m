Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5E9DD5B844
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Dec 2025 15:45:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ozb3WNjr0r/hE1f6GMZd7Idc+wYYTjRgIGjeMMU1tjI=; b=37rPiUyrcuZz3WuKoak/0zydan
	2uduQDwTz49hqDOkTEyA9B7VXqCJoA04ZuDacr+v/pR4WGyoPO0Iv+W5B6XkdP6RyJEI0bHvd7XvF
	eCC85tvo1Fr0cSyrWRqtMU/KCZoIdUU/z+bdXiWVeUmO5eDqtTotyrSuoZV+ey0rMLVRB3P0vlal4
	wjf790LjuSfAz/bgBb7rlDyTZgtcF9+Jvt/TBTpbkPlstnrAox4TVf8Etautgnh3DIJ+6OCK56kTt
	gv4dXzLLrB36FiPX3vSHYbcoJ6L9J9dNNCC8TaF4Wu/CuSw0rqjdH1waSXHda5RRPXWRY5QtV4dcm
	fuAtzcFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVAlb-00000003uy3-32hr;
	Mon, 15 Dec 2025 15:45:43 +0000
Received: from mail-wr1-x44a.google.com ([2a00:1450:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVAlX-00000003utM-1Qih
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Dec 2025 15:45:40 +0000
Received: by mail-wr1-x44a.google.com with SMTP id ffacd0b85a97d-430fcfe4494so773105f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Dec 2025 07:45:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1765813537; x=1766418337; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ozb3WNjr0r/hE1f6GMZd7Idc+wYYTjRgIGjeMMU1tjI=;
        b=ccJS7vyBXnKwZouneRgLpe3rJ+VogpnXMngLEOOtiLFdFBmOm+/RByg59faKip8xKS
         hDNd/50zo2IvR/jAeAhX0P+1uhUEwFPbZ/3l06x9NiMrFTMeXbNcocdVLK8471DMcfJD
         1V8JLWstlsF+fhsEubL572dC+beacB1yDOD6KFtOkrpMMLD9jpR2Lmj8kk+zSyNBdaJ2
         8+tnCQDqrvTAFajRxLT3MDyndm0CPf1SBLhwxLk6oFmYbxznFHAegza2vluQYqqCxQW4
         R6mpJCpO8T9DmRsmK1x0zWqloeKO7f44m+dbFXgOBvhyfX/31Skm6jC3f5tJPg8TaSQ4
         uxgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765813537; x=1766418337;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ozb3WNjr0r/hE1f6GMZd7Idc+wYYTjRgIGjeMMU1tjI=;
        b=rxMah1Nop584sHNb9iPyevRhXl/sMtzJSg4nDhTIs4yyJZNY4agPh/Ul1cgjzhhoUF
         wG5ABK/pT7md3/QxINF6wGMzdn40mb2vzV1HBdUTdu+lEdaj6Rbf7Fqa5NcOWzKm3D3M
         ucfs2qTW2gfVODVrZPTPlsrcaDlqezj3TCQhQKC4U0Hh+aKzwG7qMDHeP1FBqYTkvmsn
         NgFIM8Ws0s6Gt1H/QGUSyphYEz8Ez6eRVY0RQToGLBrDa7mmPNoeDBztophLhL4aGV17
         vs8Z+IGtVg/bpwLg38NLx9DXBZV31LVMghEG154pQoecNV9T56nAOlS+r6bKVVcX7BWE
         /wmQ==
X-Forwarded-Encrypted: i=1; AJvYcCWasyhryD+1YeiKsoXNyq/tF4d/8UwexnNqiHiq4IOkgwvIN3pMj54dJ6jh1v5WCQAyLdL+YPz1WwR/XNCeHv9G@lists.infradead.org
X-Gm-Message-State: AOJu0Yx/67UmP/+GwJ3/OaY+FWGyLw2aSUFXSkey/a/G6NPSqhaY75+Y
	Ukufu53vbVZ2HgT2XOZznKGnRXUgk2hxX7+tkB5D4BZ35p1vdfCxye6Jo0UzYgsTYb0ROtflaSB
	RnA==
X-Google-Smtp-Source: AGHT+IE6Tdrp5jnRT9m1s/zDc7qPBnYbwM66Z5F5n+loOLAGYL1YDabSeRQ9nQ3/0AafLWGebzpXgcDS+Q==
X-Received: from wrbbn21.prod.google.com ([2002:a05:6000:615:b0:42f:bb9e:9aff])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6000:604:b0:42b:3155:21da
 with SMTP id ffacd0b85a97d-42fb44a3a65mr11776269f8f.2.1765813537156; Mon, 15
 Dec 2025 07:45:37 -0800 (PST)
Date: Mon, 15 Dec 2025 15:45:31 +0000
In-Reply-To: <20251215154533.3154405-1-tabba@google.com>
Mime-Version: 1.0
References: <20251215154533.3154405-1-tabba@google.com>
X-Mailer: git-send-email 2.52.0.239.gd5f0c6e74e-goog
Message-ID: <20251215154533.3154405-4-tabba@google.com>
Subject: [PATCH v1 3/5] KVM: riscv: selftests: Fix incorrect rounding in page_align()
From: Fuad Tabba <tabba@google.com>
To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, will@kernel.org, 
	pbonzini@redhat.com, shuah@kernel.org, anup@brainfault.org, tabba@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251215_074539_398102_4B93B124 
X-CRM114-Status: GOOD (  12.57  )
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

The implementation of `page_align()` in `processor.c` calculates
alignment incorrectly for values that are already aligned. Specifically,
`(v + vm->page_size) & ~(vm->page_size - 1)` aligns to the *next* page
boundary even if `v` is already page-aligned, potentially wasting a page
of memory.

Fix the calculation to use standard alignment logic: `(v + vm->page_size
- 1) & ~(vm->page_size - 1)`.

Fixes: 3e06cdf10520 ("KVM: selftests: Add initial support for RISC-V 64-bit")
Signed-off-by: Fuad Tabba <tabba@google.com>
---
 tools/testing/selftests/kvm/lib/riscv/processor.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/kvm/lib/riscv/processor.c b/tools/testing/selftests/kvm/lib/riscv/processor.c
index 2eac7d4b59e9..d5e8747b5e69 100644
--- a/tools/testing/selftests/kvm/lib/riscv/processor.c
+++ b/tools/testing/selftests/kvm/lib/riscv/processor.c
@@ -28,7 +28,7 @@ bool __vcpu_has_ext(struct kvm_vcpu *vcpu, uint64_t ext)
 
 static uint64_t page_align(struct kvm_vm *vm, uint64_t v)
 {
-	return (v + vm->page_size) & ~(vm->page_size - 1);
+	return (v + vm->page_size - 1) & ~(vm->page_size - 1);
 }
 
 static uint64_t pte_addr(struct kvm_vm *vm, uint64_t entry)
-- 
2.52.0.239.gd5f0c6e74e-goog


