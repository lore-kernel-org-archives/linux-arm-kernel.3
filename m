Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91D52C71157
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Jun 2025 04:57:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=urfbfbke44pGtnk/FCqGVDeVvBhaC6syv0bCNmnixkg=; b=ItAh8TmJfmgGjm7eB0LltT+vFF
	oJ3KEIIg5jw00v0QKQqUcWNeQJQRp4LFO/25hQQvUA05VWBWq+86fzs/lUZX3HMixrQOlFWUUJVGH
	YYjtd20t39p8vEENKRTVKFAjAS9ID0eeBi1ZAYo1dVnRNWg5XCRaOX3A1GIjbNnvQ+BcqhPQB/KnB
	hGdkoaBCvL7F6cokF+tux3MeP0qVvos13elMUCGkboBi9VEiUDumcz1iLq2SuOk10zVIaJeIwzioZ
	0JcK8mRfqMHXrKmuwAU4smSWQlgtUX7ucT4Y2A9Tq97rHP1NUA+0nesCKwoSbjIfEweknbPrj3xXM
	/yAAfgPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRkr0-000000093TF-0FSY;
	Wed, 18 Jun 2025 04:56:54 +0000
Received: from mail-pf1-x44a.google.com ([2607:f8b0:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRkLx-00000008zwt-1M07
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Jun 2025 04:24:50 +0000
Received: by mail-pf1-x44a.google.com with SMTP id d2e1a72fcca58-747dd44048cso5315731b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Jun 2025 21:24:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750220688; x=1750825488; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=urfbfbke44pGtnk/FCqGVDeVvBhaC6syv0bCNmnixkg=;
        b=u/VWv/cRmpMCIiZ4It+rOizv1vfH9zUzNKdAXurzrV1LMLNjuejEdmtKE2jCnR35DD
         SiJSCw5a4kVjClMiy7Xd7tiGm5tXpSHuK/mcm0llABIQIHrmsuMRsWzZp4UggUbS+BqE
         18f0xDxQrUUizcxv5bRBjqkoPy8ECjgd1DyhwxmFeZtKbWODERJmAkPeTQ+MHc3S8MGb
         P3hppacki8Vj/rTQ9BAGqe7CY5qoJO4nyVbYV0YxFZEIPrHGP9/JeI/DFzAPft3Seiq1
         7QkYk8EPT3IJ2VNkRSbvYti3ucivbzjVl1nVk2UE/B84pTHogVVeeaJxGZiuibjCnx5H
         HekA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750220688; x=1750825488;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=urfbfbke44pGtnk/FCqGVDeVvBhaC6syv0bCNmnixkg=;
        b=ApD4zWg+rlymriACBtbsCVI+5cMGg5CzwSO1Rf9ZEcaggzfNwfSHEZYCwbhGSJBXAM
         gqsqKNdIkOhu6Vw8gODmlTA/HQ5KPhj54iQaObxqVKIedRAajKvAloOM5abqjWyfN7Bf
         bDuphVf5ryVF9Vr7iSfny1PBPyMOHqS6RVtz03czFley0zZ163QOtZ8QyJwqAOJDzora
         GB9QvNKDX5UkWuY69FFgOVoplXnc7B+3tK6aa/TSUiCAjTpyOQcwLWcQJR/FICrQTLZg
         zRiJshTQiExCcgu4xgrOZxtGDvALIcp77Javb9s/Pt2UNxCIBLH/mBgxtTvibHhjthso
         Sl1Q==
X-Forwarded-Encrypted: i=1; AJvYcCUffhopjJzdiukTEZyBklEnFYAPmJGPM70x4KYhP6EDB09hHPZ12Kqusyq0/6+6T81uEdTqOpnHPfC2n38EYkli@lists.infradead.org
X-Gm-Message-State: AOJu0YwY8/BUfKKxGz2mIF+FSKSq0KLR+6QB8a0BekS8Skqc+j6HsC7c
	4lCGYo/q8oPtAaX2Ew7W0gVtms++9eBgLPpHjdzMbkjRyUZtD+FdsxQX7mnAn7aNLVIfcSqzQY5
	yuT/hPWT0wBkCDZOMWS2/mQ==
X-Google-Smtp-Source: AGHT+IFPdIrbDlRQ72BheICD/uy5q1y4Z/C5VNYBV8bJ51Pda+epcBJA7XWiJKZlOD5QXWSznMTbbr9aSRYhmJ8a
X-Received: from pfbde14.prod.google.com ([2002:a05:6a00:468e:b0:748:dd5c:e882])
 (user=jthoughton job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:21c1:b0:748:323f:ba21 with SMTP id d2e1a72fcca58-7489cf5c8c2mr21855970b3a.1.1750220688256;
 Tue, 17 Jun 2025 21:24:48 -0700 (PDT)
Date: Wed, 18 Jun 2025 04:24:23 +0000
In-Reply-To: <20250618042424.330664-1-jthoughton@google.com>
Mime-Version: 1.0
References: <20250618042424.330664-1-jthoughton@google.com>
X-Mailer: git-send-email 2.50.0.rc2.696.g1fc2a0284f-goog
Message-ID: <20250618042424.330664-15-jthoughton@google.com>
Subject: [PATCH v3 14/15] KVM: Documentation: Fix section number for KVM_CAP_ARM_WRITABLE_IMP_ID_REGS
From: James Houghton <jthoughton@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Sean Christopherson <seanjc@google.com>, 
	Oliver Upton <oliver.upton@linux.dev>
Cc: Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>, Yan Zhao <yan.y.zhao@intel.com>, 
	James Houghton <jthoughton@google.com>, Nikita Kalyazin <kalyazin@amazon.com>, 
	Anish Moorthy <amoorthy@google.com>, Peter Gonda <pgonda@google.com>, Peter Xu <peterx@redhat.com>, 
	David Matlack <dmatlack@google.com>, wei.w.wang@intel.com, kvm@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	"Xin Li (Intel)" <xin@zytor.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250617_212449_360083_CA99A1DB 
X-CRM114-Status: GOOD (  10.07  )
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

From: "Xin Li (Intel)" <xin@zytor.com>

The previous section is 7.41, thus this should be 7.42.

Signed-off-by: Xin Li (Intel) <xin@zytor.com>
Signed-off-by: James Houghton <jthoughton@google.com>
---
 Documentation/virt/kvm/api.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
index 1bd2d42e6424c..ff0aa9eb91efe 100644
--- a/Documentation/virt/kvm/api.rst
+++ b/Documentation/virt/kvm/api.rst
@@ -8528,7 +8528,7 @@ ENOSYS for the others.
 When enabled, KVM will exit to userspace with KVM_EXIT_SYSTEM_EVENT of
 type KVM_SYSTEM_EVENT_SUSPEND to process the guest suspend request.
 
-7.37 KVM_CAP_ARM_WRITABLE_IMP_ID_REGS
+7.42 KVM_CAP_ARM_WRITABLE_IMP_ID_REGS
 -------------------------------------
 
 :Architectures: arm64
-- 
2.50.0.rc2.692.g299adb8693-goog


