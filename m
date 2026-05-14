Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A49DCD4F25
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 May 2026 16:26:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ux+Fp2F2XUWVJAPCM114RJU332LaQ6InmYZIpXtQURc=; b=eZhv4K5wIZDJCsDr0tnxhASQny
	XXE5d6FDTH02/FnOae1mUI5+BZDvqrccms/OZEpEovDTNdO7vZZxqZhtyUciYQIg632XlxQTc2f9b
	ixohOfzisUIBgyYDKB/PJRpymLaI6wZzXPdMt4V5wJcegxj5BTQ/LLnXA8Cv0Z8jWsiqh0KvT2Eps
	2dzGO5UvfDHjFlLpwrHfbuPI6timFUplHyc8vartXyFDbnK0XZIRQHAmfC4Hc/nsxRCG3MRZ8V9Vy
	3eza8TlBlVAjPl14QTooXOMObBAJy3gGilfOiBVd610A31fKJgmuMdPoyTO4Tq5ZUexsRWdAl1d0w
	FsIHWi2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNYte-000000063KT-3dlb;
	Thu, 14 May 2026 16:26:50 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNYtc-000000063Jn-45Bs
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 May 2026 16:26:50 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-48fe3e73da6so2046865e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 14 May 2026 09:26:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778776006; x=1779380806; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ux+Fp2F2XUWVJAPCM114RJU332LaQ6InmYZIpXtQURc=;
        b=scRP8axjEQ4tQmDb8Yb5Nqc8OLBKqe/YBMSESSAaPA1p7s3WfyrL+LOAoPZS0lCzq8
         y4m6gZ3ymH8r7rqL0+zbEnK9axPs0dmsaF3FTDGqeRhgyRlf33D3SSVM2X4z9f5lu0PJ
         c+34P0NqFiYhss5R+VIBSJr1XQUgD6OUGIEgnQA3kl1zWeMBcgNmjyzURVxQ4ZaO+7PK
         9SEd0BSVAcjcr4tj9iu/LPNeTmDki2XvqGVQ5/N5ccsIhxdyoR1xlV9kO9pB4a0yVhu9
         9R84rCq0NtZeF/nTPySnaQRBtEmC8fNqC5cdu16o9JcBeSN7c/egjg9wevN2aO4V6ThR
         SlSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778776006; x=1779380806;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ux+Fp2F2XUWVJAPCM114RJU332LaQ6InmYZIpXtQURc=;
        b=WLF+/hHY3Kv3V3gzG3KjGtOr0d8LCpqKjZ/Usrx8Nz2khdGNuq5LNeScJH6+5BUFUZ
         IOqs0OUC+QXurfXJHVi8a6f83GhvrEdnLS7zEhKDAG7WPE0cyshxhflYYJJhSbRbwc+h
         zQGZ+nN0a/hxUXvHdDVPVCVyXHLKxwWuDe2hLG5NNZ3TOsJcgzwFOmOOdUT671ADirFm
         Ea/+z9TciILZsOCsCPvscTO7xiUIub5FXKGn5AmWW8d3F/Uk8vnOZ264n9IoWL16AuSO
         1afsWg8xlZnXkjLRBu7nAtTuEO6TYQCwWbuYg1raHKfbbfrKzqht0SwQdjgfj9qVO9RZ
         zckA==
X-Gm-Message-State: AOJu0YyMqZT0cxOrKE2mic/V3sEEf6vw8dWHRWHoGNP8FGVUrh/2vJJC
	GfgJ5Hh7GHd29AijAExxcnr8wr5ICGAFJrF13md12JX3k0NEyOONV2TwJeEt/I+u9xVnLeoEF/V
	xwgVsWB2LA87fngrkCnL2jQ==
X-Received: from wmim16.prod.google.com ([2002:a7b:cb90:0:b0:48a:5d27:4655])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:8b18:b0:48f:e230:1d14 with SMTP id 5b1f17b1804b1-48fe632a187mr1001865e9.33.1778776006117;
 Thu, 14 May 2026 09:26:46 -0700 (PDT)
Date: Thu, 14 May 2026 17:26:24 +0100
Mime-Version: 1.0
X-Mailer: git-send-email 2.54.0.563.g4f69b47b94-goog
Message-ID: <20260514162624.3477857-1-vdonnefort@google.com>
Subject: [PATCH] KVM: arm64: Fix nVHE/pKVM hyp tracing error on invalid desc
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, 
	will@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kernel-team@android.com, Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260514_092649_020101_9072DB2B 
X-CRM114-Status: GOOD (  11.31  )
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

pKVM must validate the host-provided tracing buffer descriptor.
However, if an error is found, the hypervisor would just return 0 to the
host. Fix the return value on validation failure.

While at it, rename the function to hyp_trace_desc_is_valid() and skip
validation for the nVHE mode as we trust host-provided data in that
case.

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>

diff --git a/arch/arm64/kvm/hyp/nvhe/trace.c b/arch/arm64/kvm/hyp/nvhe/trace.c
index a6ca27b18e15..e7e150ab265f 100644
--- a/arch/arm64/kvm/hyp/nvhe/trace.c
+++ b/arch/arm64/kvm/hyp/nvhe/trace.c
@@ -164,13 +164,16 @@ static int hyp_trace_buffer_load(struct hyp_trace_buffer *trace_buffer,
 	return ret;
 }
 
-static bool hyp_trace_desc_validate(struct hyp_trace_desc *desc, size_t desc_size)
+static bool hyp_trace_desc_is_valid(struct hyp_trace_desc *desc, size_t desc_size)
 {
 	struct ring_buffer_desc *rb_desc;
 	unsigned int cpu;
 	size_t nr_bpages;
 	void *desc_end;
 
+	if (!is_protected_kvm_enabled())
+		return true;
+
 	/*
 	 * Both desc_size and bpages_backing_size are untrusted host-provided
 	 * values. We rely on __pkvm_host_donate_hyp() to enforce their validity.
@@ -212,8 +215,10 @@ int __tracing_load(unsigned long desc_hva, size_t desc_size)
 	if (ret)
 		return ret;
 
-	if (!hyp_trace_desc_validate(desc, desc_size))
+	if (!hyp_trace_desc_is_valid(desc, desc_size)) {
+		ret = -EINVAL;
 		goto err_release_desc;
+	}
 
 	hyp_spin_lock(&trace_buffer.lock);
 

base-commit: 5d6919055dec134de3c40167a490f33c74c12581
-- 
2.54.0.563.g4f69b47b94-goog


