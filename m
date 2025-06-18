Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 740D0C7115B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Jun 2025 04:45:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7EMNAB7VqggYskY7+oMW704PIZytljaHYvhJuoy4xGs=; b=xWqfjz0NkyXXDgyq7U9o0FOSMh
	dfmS/cwk9NudU4XnOVv8Tl5DZ9zhfIfv9miT8C6FyxnWJ99QXtczUaCKT2gdbRCNoeE6omsmKIYvi
	RgvlAtMtR8OyURi90s+p//mL0P5y/wciDih36gVpilrnmg7oBXe8sbDwN0ufyZK/yLcKQQD5f+i9L
	/Y7lu+4LWluIzK2sFqB0LC1hMZasrY7xGZGQhTMmntTnbg/rqCDg8za13v9cn5ivgMs++tDQ1Nmn0
	S3isP43eArKMN/HHW9664lRESDYf8ahZDMbY6M7Wox0QximGEzOtQ5oyKMSgCrflzQRbVQ0ixHi9y
	EFyJlCsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRkfO-000000092Ky-0TAN;
	Wed, 18 Jun 2025 04:44:54 +0000
Received: from mail-pl1-x64a.google.com ([2607:f8b0:4864:20::64a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRkLo-00000008zro-0z4x
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Jun 2025 04:24:41 +0000
Received: by mail-pl1-x64a.google.com with SMTP id d9443c01a7336-231d13ac4d4so95124925ad.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Jun 2025 21:24:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750220679; x=1750825479; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=7EMNAB7VqggYskY7+oMW704PIZytljaHYvhJuoy4xGs=;
        b=xnwcQ369jPdc7+Vn21kS2fSyzB1CNsF42utAaBFj3i7YKJuB/Z9Iz3Gef266lhoKEQ
         g5FbDehNypDASnExHbrvUHpAX7+rgF0qkTluwofA4fM3JgjmO1gqMXl9Ri33Of1NK99t
         aczFkj223sN5GzA1ez9wyghhjuW7YvNeJEFk5O63puoKVEShvbwv/h2HQpwUOF3dz4Pc
         VHA0Pof9oJ0QD0dosbNHNIBAx5axgzlLZPLqbQoTLc6246KAERQX9ggK5mFLTDYVbK1p
         XWmPo7cPbH2tCTLaHAc5UWzSIJVjNeXy9i0ay3lGoRuXNo97l/N2VMrcIT4Riore1CQN
         AzCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750220679; x=1750825479;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7EMNAB7VqggYskY7+oMW704PIZytljaHYvhJuoy4xGs=;
        b=eCtoeVyCgw+BbvCZxEoLMEBJjznIBwbvmjFUEQn9eTkcCLu/LjZkV4DogisnufLzk+
         Q+H7zXemrcqXxTYdlTUiF2xQ24LhMwcS1oQl1UcqVfp+IhyTQiTI19f4E4KtLsO+CU18
         5T2wAW4PwdmNLbGDW3mDKvUE7jxBkXWfJbgRkPsaK89wLSq7OFFxXaLOVb1lYYs8/zFF
         pwwLEDkJTI3JXjJy9dRDkMckHSOveCmX/cJYCLS09jeNloPzWHR5t5krBE5elshKEW9g
         eU269eaOljqlWzQgmVt/DepXB3euVExFH2GP6e35qC26et8CavL8Ccco3xjycKzZh2bh
         xMow==
X-Forwarded-Encrypted: i=1; AJvYcCWbuEF1bb7gbzwuBQ6dgc11qTwpoY5SvmBJ5rIskiLD9oKn/7fq3+35QSzrMpaedbACUDYVv06z2Qnx++VwekuQ@lists.infradead.org
X-Gm-Message-State: AOJu0YxSra2317Kadi7QNiczJKK3NkytWrzxwy+q1PAXiOysQPdoHyyP
	ITpJ0d6mM/1sQjq1aVDIKj0OutixPRXNSo4jpwLAIu7l0h4xBHc6lH9d0OuS5PnR13npCi/u/7G
	nGeDnljGzFfmnL0arAxLnwA==
X-Google-Smtp-Source: AGHT+IHf6vnwz6tnrJF7nGJhTQOliXFukjknoI4nKYkvX84klDeaakiCUnur6sPI4XGwPrQLqZt03lOgVrYxLq6x
X-Received: from plbks6.prod.google.com ([2002:a17:903:846:b0:231:c831:9520])
 (user=jthoughton job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:902:d2c9:b0:224:23be:c569 with SMTP id d9443c01a7336-2366b32a5a5mr279237755ad.22.1750220679165;
 Tue, 17 Jun 2025 21:24:39 -0700 (PDT)
Date: Wed, 18 Jun 2025 04:24:17 +0000
In-Reply-To: <20250618042424.330664-1-jthoughton@google.com>
Mime-Version: 1.0
References: <20250618042424.330664-1-jthoughton@google.com>
X-Mailer: git-send-email 2.50.0.rc2.696.g1fc2a0284f-goog
Message-ID: <20250618042424.330664-9-jthoughton@google.com>
Subject: [PATCH v3 08/15] KVM: selftests: Fix vm_mem_region_set_flags docstring
From: James Houghton <jthoughton@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Sean Christopherson <seanjc@google.com>, 
	Oliver Upton <oliver.upton@linux.dev>
Cc: Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>, Yan Zhao <yan.y.zhao@intel.com>, 
	James Houghton <jthoughton@google.com>, Nikita Kalyazin <kalyazin@amazon.com>, 
	Anish Moorthy <amoorthy@google.com>, Peter Gonda <pgonda@google.com>, Peter Xu <peterx@redhat.com>, 
	David Matlack <dmatlack@google.com>, wei.w.wang@intel.com, kvm@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250617_212440_280641_45E3C8E6 
X-CRM114-Status: GOOD (  10.48  )
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

`flags` is what region->region.flags gets set to.

Signed-off-by: James Houghton <jthoughton@google.com>
---
 tools/testing/selftests/kvm/lib/kvm_util.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/kvm/lib/kvm_util.c b/tools/testing/selftests/kvm/lib/kvm_util.c
index a055343a7bf75..ca1aa1699f8aa 100644
--- a/tools/testing/selftests/kvm/lib/kvm_util.c
+++ b/tools/testing/selftests/kvm/lib/kvm_util.c
@@ -1200,7 +1200,7 @@ memslot2region(struct kvm_vm *vm, uint32_t memslot)
  *
  * Input Args:
  *   vm - Virtual Machine
- *   flags - Starting guest physical address
+ *   flags - Flags for the memslot
  *
  * Output Args: None
  *
-- 
2.50.0.rc2.692.g299adb8693-goog


