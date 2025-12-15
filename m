Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D398D5B858
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Dec 2025 16:52:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ozb3WNjr0r/hE1f6GMZd7Idc+wYYTjRgIGjeMMU1tjI=; b=tVX0VT8daYVFr/7tGwrtId84RP
	39rsXZdn/AmjfKrbDq69iMljw2MwIIaMWz2rsgdC+aQwfSMI20nC6G1OTX3E5dK4PtNcAfiji3noc
	SqK/87xLy+3XMkmdHbO5IQM8Buv/3d8Bx+eTHTSmQzEOe05tmcbnufdaP30vbycyMUpNkpO9Fsz++
	YmNQsxW+wOipKIF3TrvGh+6wX7Tz/T77K9agSk+20zkIdOypO/WeE7bgwjhSFmnzYnK6g0Fm8Gu6u
	rrkJSpIuKPwKhzHeAvUjmLOof18K0Axc90znNEzHr939UJnzZcuRWohOHAZQ/dctNVdfGFNzrvRla
	s2xPyKiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVBnp-000000041fv-3ko1;
	Mon, 15 Dec 2025 16:52:05 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVBnl-000000041Z5-0fU1
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Dec 2025 16:52:02 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-4788112ec09so26841335e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Dec 2025 08:52:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1765817519; x=1766422319; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ozb3WNjr0r/hE1f6GMZd7Idc+wYYTjRgIGjeMMU1tjI=;
        b=Hlf71QKZaTQkUfCaEOM41D9Vr+z6UcWanK6pZsz27cyxHI2ac8sPgaidJe1QRxhowo
         VU9cM3FfjdvqeV1s4pG3h8OVCYxTSAIUanplT9tYyVa0Jn8oOKBuosxvdInAah8sIWUA
         OHFamFOAeFfSvME5HEFZiwwqyIBBW+cc3Rnj9man99CeYZEs0EyqjKIikGTMVZC4W4vr
         isFmKL46uLRiQ5wR9xVazZ/k6WmcmUH/NkpLx6xcZqmuzigUbkd2FFMB3pxISBR41b0i
         Gve6d0FpszOqIiGVXQzHvlUQobh5vcn9297NBef/LbfpH8SByds3hfO8xUeaXffm36tb
         gRCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765817519; x=1766422319;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ozb3WNjr0r/hE1f6GMZd7Idc+wYYTjRgIGjeMMU1tjI=;
        b=ejPKIWE2npNpp827G1EZ8VYm20+q6McWxMe+iM03E9Dnyst/a00i94AcH1ezkkbmbd
         a8nYlvWPg39rD3rtPe0IlmWth7rAf0Ys88H+THMxD0SEp3iqqt5xrdzt10hQFFte3lPi
         CXKLfJmn3AqpOCNcWpRAOBg9QF1C3zyallNpXITjlz+r73xjr9vGkXvAY16qEalDzlv+
         OPbhxD57JrfllKHx29WYDbhLKgleRBui8FaqWjPgFOLcqYgYaHhuSACSLQqYxlzxFh0F
         9pd5L6QqusM9XIELh7uETcWdS/GlulEvMd7j+G/OGXMAQ4IV5MizOceJpFQOePTaIXBg
         ETNw==
X-Forwarded-Encrypted: i=1; AJvYcCUOKp2luLYW1tE8DAvpJnYQHeJEVrhGQvJxpjb5zBcxmHQ2hxdKeBt3y+1yqxtM9SUfk2ntVJc76GDHz0iavaMZ@lists.infradead.org
X-Gm-Message-State: AOJu0YwoXbsZLzQ5NUoPuqshbEwjD4sKIhIKoLveDhduyAqTqSGgf/NU
	7jxwiljssgoPQBAl40GRIUQDBPHg4cxhw4kxfZXJPMfj1ZOj6TMhhkqoIxJYmWEcsZA/UwEPmBK
	fMg==
X-Google-Smtp-Source: AGHT+IEXfGMQYTlXaZjDRjEyi8ps8t9i1lBXKwi2r5crX0EL+3ytnijgNklZSLLzPd74DIRXBqTJZjRKHA==
X-Received: from wmbil2.prod.google.com ([2002:a05:600c:a582:b0:47a:7fdc:6925])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:35c9:b0:479:3046:6bb3
 with SMTP id 5b1f17b1804b1-47a8f906f07mr127619025e9.23.1765817519032; Mon, 15
 Dec 2025 08:51:59 -0800 (PST)
Date: Mon, 15 Dec 2025 16:51:53 +0000
In-Reply-To: <20251215165155.3451819-1-tabba@google.com>
Mime-Version: 1.0
References: <20251215165155.3451819-1-tabba@google.com>
X-Mailer: git-send-email 2.52.0.239.gd5f0c6e74e-goog
Message-ID: <20251215165155.3451819-4-tabba@google.com>
Subject: [PATCH v2 3/5] KVM: riscv: selftests: Fix incorrect rounding in page_align()
From: Fuad Tabba <tabba@google.com>
To: kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, will@kernel.org, 
	pbonzini@redhat.com, shuah@kernel.org, anup@brainfault.org, tabba@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251215_085201_223663_D438D76B 
X-CRM114-Status: GOOD (  12.51  )
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


