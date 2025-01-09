Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 367F8E77199
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jan 2025 20:54:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=inJmWA70Ac+hZHw9fDPSAlORU93rduBYUNSCVpvyraE=; b=28of0m6DJmTt3gD72T0F1X5uN6
	WNBArSpJ7osyjk6wv4Ocel5PFKcg7/dft6NeDthwcr1TSREPoK3EvudNpZx32ZZ0jaELuruaytlpx
	w/tEPkaAQT1LKQymHMIHizp4syb/LT4HfdSEFu0do9tHUWUN+pcBo2KTT7YrVmxzs0dlzUIuQ5OWC
	r6OGbcQPpm6B9Y+QemxVZYpNzIHWV4qKlxBq7I6ZlpINZ+lsf67aNwvtjaSVeWynjFq3kTTClhUK2
	dGmAbZ9aX386ML9YHgYtbzTJjW8A2SqzBshnsG36IoNXMF+DgLem9LOtptSk+EuQ1+NyJ/jJLlXxQ
	XoDtbOOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVzYA-0000000DI9M-0Fo9;
	Thu, 09 Jan 2025 20:54:42 +0000
Received: from mail-vs1-xe49.google.com ([2607:f8b0:4864:20::e49])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVzTa-0000000DGVC-48xS
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jan 2025 20:50:00 +0000
Received: by mail-vs1-xe49.google.com with SMTP id ada2fe7eead31-4b126bb6f2dso201438137.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Jan 2025 12:49:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736455797; x=1737060597; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=inJmWA70Ac+hZHw9fDPSAlORU93rduBYUNSCVpvyraE=;
        b=hurw4OSp2Hvu6F/SfVbpzw/dLbGxwnFDo5gaiIfj1gYpS3+bPOdJP8FspVmesTMsuB
         xZHCoBDuSZs8QikiuDhrISnU+tI38qyxYk2UaHTZ2z1HLUELff9KRSzhHtUNVmt4r25K
         VV/ZnjaUBuJrEMMipfzvFE4YckR0pHK6047x7YijmcJvPZ4CRDlRBds1PjqBNP1fO5y5
         4ddm2lHjDqo4iD9davXq9PpGMedyK6pUEmRJCtpSpR3BCvaQ1Za57jLBW93rtCbKvc4p
         irgdHZlS3bwGjxjTD6K5sAOxdS6Jt22/W0dKR91ARXSwjl2fDGuwWlO3BWz48Eh6rOgg
         3ivQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736455797; x=1737060597;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=inJmWA70Ac+hZHw9fDPSAlORU93rduBYUNSCVpvyraE=;
        b=uUMifp53UK6RSvcq30QrG0CXCp0AKP8CnUvJltCTQEJYKPnDLrWQc1vdrEf6FsYLVZ
         zTUyI5pEMiK1iYqmmn0hJ6Wg1LfMDW1jfSddQQLyxslbSG01SCVCJxUQAUscsFpGS7/O
         KEqbjHRH4b2kwqDIZ92e3K7HWPSJmbnMOVT9dVXs9Nc4ZsupZIKOHOancJfmtgGMuqDL
         7umaRKgaojsQWHq5Tyup6NDzgmXEDpZg4PcFhoc1QazPhzuz4Tb38ZG7a5rhioSgiVcv
         di/jXHUQ+D1z/+G9ApiUklOCIIWdhp3UXngbnVh3sC5tTpxQuviLk31nuN2tkG93ek0t
         DqZg==
X-Forwarded-Encrypted: i=1; AJvYcCVHSniLo2ypLU8mDz9Habxr7V3sSqhTxqqO8tv09lmoixM5h0nKCKgB5cmjMWckIyndPTDzFLRwi9MYYFCM2uoH@lists.infradead.org
X-Gm-Message-State: AOJu0YwVhGCRtSNyRPN4tY3WtlbzmoaZM4DqQXJdj7lgLQO0jUr0YMth
	tYcpdJIVMp5+cSF+4DQCAzzL1iSFF5fvQEkSlas6hmcSYbdz/MpiQiFFF59IS1cT7Q2xYhjNoH3
	1jaUtK/pLZyKZDD/zsg==
X-Google-Smtp-Source: AGHT+IGmWC0I9uhGcwdr2Gd8ZWKOxj9FqNl2pt1I3pHNzlZaCTTUBXu0xZZz+qkK1VqDCdKw56Aw4mYDSrKY0XUr
X-Received: from vsbka9.prod.google.com ([2002:a05:6102:8009:b0:4b4:eb7c:c900])
 (user=jthoughton job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6102:38cd:b0:4b2:adca:c13a with SMTP id ada2fe7eead31-4b3d0f05fbamr8311073137.12.1736455797065;
 Thu, 09 Jan 2025 12:49:57 -0800 (PST)
Date: Thu,  9 Jan 2025 20:49:18 +0000
In-Reply-To: <20250109204929.1106563-1-jthoughton@google.com>
Mime-Version: 1.0
References: <20250109204929.1106563-1-jthoughton@google.com>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Message-ID: <20250109204929.1106563-3-jthoughton@google.com>
Subject: [PATCH v2 02/13] KVM: Add KVM_MEMORY_EXIT_FLAG_USERFAULT
From: James Houghton <jthoughton@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Sean Christopherson <seanjc@google.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Yan Zhao <yan.y.zhao@intel.com>, 
	James Houghton <jthoughton@google.com>, Nikita Kalyazin <kalyazin@amazon.com>, 
	Anish Moorthy <amoorthy@google.com>, Peter Gonda <pgonda@google.com>, Peter Xu <peterx@redhat.com>, 
	David Matlack <dmatlack@google.com>, wei.w.wang@intel.com, kvm@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250109_124959_034683_F71C3E29 
X-CRM114-Status: GOOD (  10.01  )
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

This flag is used for vCPU memory faults caused by KVM Userfault; i.e.,
the bit in `userfault_bitmap` corresponding to the faulting gfn was set.

Signed-off-by: James Houghton <jthoughton@google.com>
---
 include/uapi/linux/kvm.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/uapi/linux/kvm.h b/include/uapi/linux/kvm.h
index 7ade5169d373..c302edf1c984 100644
--- a/include/uapi/linux/kvm.h
+++ b/include/uapi/linux/kvm.h
@@ -444,6 +444,7 @@ struct kvm_run {
 		/* KVM_EXIT_MEMORY_FAULT */
 		struct {
 #define KVM_MEMORY_EXIT_FLAG_PRIVATE	(1ULL << 3)
+#define KVM_MEMORY_EXIT_FLAG_USERFAULT	(1ULL << 4)
 			__u64 flags;
 			__u64 gpa;
 			__u64 size;
-- 
2.47.1.613.gc27f4b7a9f-goog


