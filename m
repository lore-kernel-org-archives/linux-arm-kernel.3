Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47497E7716D
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Dec 2024 19:20:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QAQf3CS/PWwFToEYvErsd8wUXXWpCS3gaH7WeW/jjGQ=; b=wSR0XIzhJyf7m+fKavmWHfDTqF
	eaC046pyVmL/9CYRRAskFeqGKi21OhdmSaBdY8lkB/+4m8toUD74XJZIIgRAmHWoD0MVlS5qOzcEO
	iOw7CtrhXCosjztKSWJxAe9Df/UZe70xENhxvF+aq6DXw9ev4N8juBCtcosVv72rfncnJYSxFEL8D
	D+TDNlCa5z7FfwaQcNaa6mgMYvgfqrbRTWAyUTxIgQXbyayzEcpLGKa/jClWWfQ7NGDiSbR5QZ2Zi
	SBE7eqDuZZ5bTKl/AgUv6h67Dr+Xza4jRpr3edUmOKU8OYd/fwKN3t4ukZZEYDm0fF938xIm4gk+I
	kqifQejQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIuvD-0000000DfER-1BnN;
	Wed, 04 Dec 2024 19:20:27 +0000
Received: from mail-ot1-x349.google.com ([2607:f8b0:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIupJ-0000000DdhF-0LUs
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Dec 2024 19:14:22 +0000
Received: by mail-ot1-x349.google.com with SMTP id 46e09a7af769-71d3fac4b52so116065a34.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Dec 2024 11:14:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733339659; x=1733944459; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=QAQf3CS/PWwFToEYvErsd8wUXXWpCS3gaH7WeW/jjGQ=;
        b=HSP2kdKp60D1fMG4FOSJORq2vvFgugFDTd/w9vw0lLfePhcE7v4pQbhmKDeKVufjlX
         faBkBGlLJrc1IgK+AgrGKiGT9+JIvA9Fg+icn65Annn+4BH8uWJO2244wP1x8MNyRLgy
         waz2otHusN8mLJDouEIt2+hfkTVofIL69gLjRTa2rtwvReqLQMKvRvChsJKV45G5f6TD
         NMQclTZECtnEnSsFMCLhPt4KH9U3IyubNDi9szWVFFzfoydzZrAx1OpEncFpA+A/qxc1
         ZRjKsuvHkGs99mmLZnSUbY/GAS9yTPi3XO/w1TJMJctyQbr4rmJw/zo11C14v57U5Aov
         2+7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733339659; x=1733944459;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QAQf3CS/PWwFToEYvErsd8wUXXWpCS3gaH7WeW/jjGQ=;
        b=XQHc5Q1QrZK5T71n3lm40g2qm27Ei/rQbhXTTeGwFXNOwGYc/2PxqotjH1FBu9ybph
         tCNTXKIV7EcQkvvkknJmp8m1RQcWi8TaLwaJoJj+0uc8VMIBvFNu6KU6y8IfAe7P4Eiw
         xiGY0RU5MH/PRe6Vbsphu0u9WT/b0FSAyko3SLFyonUS7MmERvt/ddApbu1PfyPu8Cqy
         kDsGDlpw/7NhdoQv5uf0VyvbDsYdJAJFdxTqDK+EO0wz/k/3txmooAjb0f74I+aja+QS
         EX7NM1d9fVYICSuWBpdm2LAlrbm9zhkCmnUtlucdqb6k9EOrSSXssZsV6JxI0g1fq1au
         nECA==
X-Forwarded-Encrypted: i=1; AJvYcCX/u7W1w6TCSKENBkDvuNBDGnm4y068AIjHb7xljh59vZ3bQfJXctwxv/LsAhVheh2jBSPLNsMt5BcpZZY+YYO/@lists.infradead.org
X-Gm-Message-State: AOJu0YyRFpr/8KtDubJGaOxBJaj+ILcF0mE2a1EpQZHByNLV2RRgpCgC
	k75npT2eMgr8qPN6S4lKhXXDDn/u1IuLkaM6mMijwbfSJd4mV/i3aYD4KFuPrONazap4+JP8TqN
	yyHiI4Abe+WRtF1dwFQ==
X-Google-Smtp-Source: AGHT+IF4lgVNFWtAABhlVyCvDTypvCqwQE4E76pJaa2ei5llPSfzgOLBadwb4XjVCcPSe7j0KBf+vwviXHvnVJ9Y
X-Received: from vsvj2.prod.google.com ([2002:a05:6102:3e02:b0:4af:5a5c:cdaa])
 (user=jthoughton job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6830:348b:b0:71d:4c3b:f464 with SMTP id 46e09a7af769-71dad63c3e4mr7692549a34.13.1733339659221;
 Wed, 04 Dec 2024 11:14:19 -0800 (PST)
Date: Wed,  4 Dec 2024 19:13:39 +0000
In-Reply-To: <20241204191349.1730936-1-jthoughton@google.com>
Mime-Version: 1.0
References: <20241204191349.1730936-1-jthoughton@google.com>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
Message-ID: <20241204191349.1730936-5-jthoughton@google.com>
Subject: [PATCH v1 04/13] KVM: Advertise KVM_CAP_USERFAULT in KVM_CHECK_EXTENSION
From: James Houghton <jthoughton@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Sean Christopherson <seanjc@google.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Yan Zhao <yan.y.zhao@intel.com>, 
	James Houghton <jthoughton@google.com>, Nikita Kalyazin <kalyazin@amazon.com>, 
	Anish Moorthy <amoorthy@google.com>, Peter Gonda <pgonda@google.com>, Peter Xu <peterx@redhat.com>, 
	David Matlack <dmatlack@google.com>, Wang@google.com, Wei W <wei.w.wang@intel.com>, 
	kvm@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241204_111421_122429_14859705 
X-CRM114-Status: GOOD (  11.29  )
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

Advertise support for KVM_CAP_USERFAULT when kvm_has_userfault() returns
true. Currently this is merely IS_ENABLED(CONFIG_HAVE_KVM_USERFAULT), so
it is somewhat redundant.

Signed-off-by: James Houghton <jthoughton@google.com>
---
 include/uapi/linux/kvm.h | 1 +
 virt/kvm/kvm_main.c      | 4 ++++
 2 files changed, 5 insertions(+)

diff --git a/include/uapi/linux/kvm.h b/include/uapi/linux/kvm.h
index 641a2e580441..d9a135c895d7 100644
--- a/include/uapi/linux/kvm.h
+++ b/include/uapi/linux/kvm.h
@@ -936,6 +936,7 @@ struct kvm_enable_cap {
 #define KVM_CAP_PRE_FAULT_MEMORY 236
 #define KVM_CAP_X86_APIC_BUS_CYCLES_NS 237
 #define KVM_CAP_X86_GUEST_MODE 238
+#define KVM_CAP_USERFAULT 239
 
 struct kvm_irq_routing_irqchip {
 	__u32 irqchip;
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index fa851704db94..b552cdef2850 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -4804,6 +4804,10 @@ static int kvm_vm_ioctl_check_extension_generic(struct kvm *kvm, long arg)
 #ifdef CONFIG_KVM_PRIVATE_MEM
 	case KVM_CAP_GUEST_MEMFD:
 		return !kvm || kvm_arch_has_private_mem(kvm);
+#endif
+#ifdef CONFIG_HAVE_KVM_USERFAULT
+	case KVM_CAP_USERFAULT:
+		return kvm_has_userfault(kvm);
 #endif
 	default:
 		break;
-- 
2.47.0.338.g60cca15819-goog


