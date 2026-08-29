Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DD88C61DBE
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 29 Aug 2026 05:50:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JBWN6j8OnBuuPy0FKZmRrD0AlW+PPdIjJrnUe6crviU=; b=YEHuZgTaOGOpdxDmhAsXSJ9Zeb
	psIkHSQg52QI1nRJ/K6SgtQrVS4usIj8PMojHjvb5yySYzOEuBvcp8fzo9QC5AFewLPmGtuXJBEqn
	eCPktktUqmMMf9Tw+mhPX8DbjACd3160k26SiBuIiRE1WvdoIr4WN6mTRnz9ZK5g5Aj525GF2eKFK
	j5YM2z8kl+be7kCiCdvP3dA2rUNun3rdYdACwZ/OjtJjQqXMZgRJL2DDC8vdi5as0OwN28L4u5Sem
	zpAUC/UeO0MHfkdYI5SjMpZMSphsQtE1JLAddDLfY6JCkZ7iD2A7l1GSJ8B28iROj5DTU8qapKnSJ
	Cek7aM+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0BxX-00000006ktU-2fEv;
	Sat, 29 Aug 2026 05:50:31 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0BxQ-00000006krj-1lst
	for linux-arm-kernel@lists.infradead.org;
	Sat, 29 Aug 2026 05:50:25 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-49b0dd3c9a0so12094835e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 28 Aug 2026 22:50:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787982623; x=1788587423; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JBWN6j8OnBuuPy0FKZmRrD0AlW+PPdIjJrnUe6crviU=;
        b=dJd7HnU1DNoOw1aWeuYYC8X++penkfp6d7zZ2GV9AmHmQ6AdyN7ySyD7tg8rBr6G7q
         pTVbrnSxXLvjJeVJjLg1bCUD0TROKxBbKjITLhMIMcL3hB2bNZ3myB3/y+SbtTIhDNBj
         3O3mYFfhP5YUtQZvhfCTlnD8dHo2mOCEOM17aJQjFhNTI5XsdAdee+vvuIMOtqZ9lAxG
         rtABtDICNwFrA2fd+i75ojKXXO2FPiGiZxFdqEWAvG/ErbrfdRSX7+CcbpCCX9CTt8MC
         0OO8Ebgy60SXHMhtg9Bk9Q233WP+wcfzuTk5c03ItW0cr0/+s4bXxrVmgLjNHy146Wn8
         9ppg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787982623; x=1788587423;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JBWN6j8OnBuuPy0FKZmRrD0AlW+PPdIjJrnUe6crviU=;
        b=Os/Cl64RbJM5jxsrOYEO+Cc2NlsWUEV054oe2MxC9ONg+sWIkEF7pRPN/JDkiAoboJ
         EJYUFARndqzBluBZGWQN96bJtKKv/uwVG7q55F1SpBVFhJq0Lm7b75GleZ1OnP410lVR
         16O6wKIJjazWSRF/4XE+rd1stO96WXegpufV3oySWTrl/+8F2n4QvymZlgjzKvfEclmg
         Ac3fXo9ZWbCjOlmomeAMZo9PTzpoU5aGjtGLfQI5LeOpXtIGhPCVG9I7rsrbFGPFKqkK
         MSxqonkiRio5ybUFKc2/N97s0ps6+UpkwjtGWNf/PbdRl/BrEtMbp4uooCuKAVsQKAg4
         ixmg==
X-Forwarded-Encrypted: i=1; AHgh+RpOd0FCvIIEQ7Drv/LN8CpMun3iF/Fk+Rz03RizUoqlDYW1AadHgNzq2hfqe9UXtJXVdP7cm+V4i5dgd4cBbUdR@lists.infradead.org
X-Gm-Message-State: AFuF++lBepMZ+2bYAWDNnylD8Ch71amtqE0VkXdqahrFyy9JGljlGtDp
	mpJw1ExzgiHyixIqdfrcO4AIiYdLHgmw0rCr+oHBzkJFXwSYoth3X7q4
X-Gm-Gg: AR+sD124omz5o625Y6xvmsvnadfi3CISEeKMAUyb48kLMQgYGauUnpJiuR98j6CJVrw
	afkaeZpcxpoQRvA5RyEPg2VwZmUkaCmulg7IEALfNzZpYOSHHm1xdI/jMm+Uw14Op6WT/Ef2Ysu
	swDzCBkAWGWmoMnKN/RZGRqlwohJbHriOGh5YIRaMb5qdsfkveDPafCL3KXynoqsgXd73cmwv+3
	ibhZ0zZmYYd8Fg7Bgy62lKpmLacMhdqiYYYVKWJ0UC9hI8k4f5l1rqlAAjn9ypYG6Cy/cwUldoO
	xV91AJ6jB76Owzlg4ErUBgfqyEBrDYEIDfcVNoLoQdH8D+jIrM72+AR0ZWhpgX6WjhqAeZe+6xX
	znitBfLI2UhQDcaGXJEasL24HsRNG8PFO+YrUOfWikCxSig6HQRnUA14mUQmGoSyFoi2+7+xY2X
	byfgeNqktKngyjYjCOOPjXSr2hwqDaIb5MYnPmKVw5ApLCBOIX7zUnVJYvMA9TDeTWfjxmlrYnP
	aqGEWT5s7fctgmbuAVSyCl5b47lCQC1GWTNQwDyK3cf0+H0tB6aTJYps2xEeRaI5DAZwsoxa3eM
	+pAQmhCu3NVS0k3rZieH
X-Received: by 2002:a05:600c:a47:b0:499:be9e:49c8 with SMTP id 5b1f17b1804b1-49b91c50957mr150918935e9.13.1787982622515;
        Fri, 28 Aug 2026 22:50:22 -0700 (PDT)
Received: from localhost.localdomain (dynamic-077-007-015-136.77.7.pool.telefonica.de. [77.7.15.136])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cca3e642dsm35357485e9.2.2026.08.28.22.50.21
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 28 Aug 2026 22:50:22 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	kvmarm@lists.linux.dev
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Fuad Tabba <fuad.tabba@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Sean Christopherson <seanjc@google.com>,
	Shuah Khan <shuah@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH 1/2] KVM: arm64: Return -EINVAL for an empty SMCCC filter range at base 0
Date: Sat, 29 Aug 2026 07:48:55 +0200
Message-Id: <20260829054856.70549-2-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260829054856.70549-1-kmehltretter@gmail.com>
References: <20260829054856.70549-1-kmehltretter@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260828_225024_476187_E673C1BF 
X-CRM114-Status: GOOD (  12.52  )
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

kvm_smccc_set_filter() only rejects a range if its inclusive end,
base + nr_functions - 1, is below base. That catches an empty range
(nr_functions == 0) at every nonzero base, but at base 0 the end wraps
to U32_MAX and KVM tries to insert [0, U32_MAX], which overlaps the
reserved Arm Architecture Calls ranges. KVM_ARM_VM_SMCCC_FILTER then
returns -EEXIST instead of the -EINVAL that the smccc_filter selftest
expects for an empty range.

Reject a zero function count explicitly.

Tested with a userspace reproducer on an arm64 VHE host under QEMU TCG:
EEXIST before, EINVAL after.

Fixes: 821d935c87bc ("KVM: arm64: Introduce support for userspace SMCCC filtering")
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 arch/arm64/kvm/hypercalls.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/hypercalls.c b/arch/arm64/kvm/hypercalls.c
index b11b8821c9fb..dfa25bb6f25d 100644
--- a/arch/arm64/kvm/hypercalls.c
+++ b/arch/arm64/kvm/hypercalls.c
@@ -185,7 +185,8 @@ static int kvm_smccc_set_filter(struct kvm *kvm, struct kvm_smccc_filter __user
 	start = filter.base;
 	end = start + filter.nr_functions - 1;
 
-	if (end < start || filter.action >= NR_SMCCC_FILTER_ACTIONS)
+	if (!filter.nr_functions || end < start ||
+	    filter.action >= NR_SMCCC_FILTER_ACTIONS)
 		return -EINVAL;
 
 	mutex_lock(&kvm->arch.config_lock);
-- 
2.39.5 (Apple Git-154)


