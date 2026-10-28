Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81185606A325
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Oct 2026 19:03:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qBKubTCh;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=d2L7Tk1p
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=RloCiG6ktfajfft7oZXWWlUR2yO2W/arq16CEWx06hk=; b=qBKubTChCBksqwT0EeTDWvZtRN
	MN5mpD6+/ebKbLQAgfVFhkmJ9YndiZNfzQsFVLQleNb6bMtOSxNz6KzBWwCzjtp5cCuBxdtaJSYF3
	1Rkhg8j4uMJ2OhdN5YBugg52uq5Znocvt3lcbZwzNYKvhtwqSG0MVs9vKIWuMDc60xYqY+BD78CnZ
	try3iPr6EUw5dUbBEcT5T9yoKjKRlWddfotNe2GCS0Ie6XFL+4UCobKJejeGzvgcv9fIBNFu9dQCR
	SZXYYbcO1pJo/+u/DjPWZUY7Ny/OIbj2VtoRw/MrtTEVHQTYYKHpCsqCUpAZh8Z42TUSNuO6zfdqk
	1f62jk2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM8vp-00000007nxg-131Y;
	Wed, 28 Oct 2026 19:03:29 +0000
Received: from mail-pl1-x646.google.com ([2607:f8b0:4864:20::646])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM8vV-00000007nTp-0rlY
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Oct 2026 19:03:10 +0000
Received: by mail-pl1-x646.google.com with SMTP id d9443c01a7336-2e95f8543c9so10026005ad.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 28 Oct 2026 12:03:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793214187; x=1793818987; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=RloCiG6ktfajfft7oZXWWlUR2yO2W/arq16CEWx06hk=;
        b=d2L7Tk1pgFzXYESpA4PmRzfAcOjDg7egmaTYdMTZxZiVSVDiQp3gibDoxlcDeUjCwe
         E2s22EyOO2MR9iVDO5jZ+ZOE9A+TIeG4H/k9tv5ctTKmqcjzRFPPDOptd2EuHdw3D+Ec
         6ghI0DxiffUSYE7ui5XQPgJFbIIdPWLjwScX4kdgNSLKjcNAA+to3HjG8Z/uwItavBQX
         KfA80qMLxswy7/HWYjLiA3imzYiEiM51i1PtBmokWC/IMI43TC5ujoK5dE8J14PUU3o6
         yA6LJnzeYZCmaLKEibnJGoMtqKIZ7kIDgqZzGBaStEtOujZMiQGE9/waCza650l9VcKU
         u1Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793214187; x=1793818987;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RloCiG6ktfajfft7oZXWWlUR2yO2W/arq16CEWx06hk=;
        b=CkD73jM7Ww2cGtJ1u47+1cgeqhIC6N52TkfyMmwoIiDthadaid+uAkMBDLMXLcpM4A
         rwyUFcsMBHzXuqlCAyYLHHEF6nMbdUfHRpOTOXlvbmZ8PIJn8XG3kdS3Y4JsYIcFOMS7
         RHqRRsSR2auQWl2OrtfI02YaBn+Mqd23qiVHa4GMs2BKAyOdbw/fnUZZr9/LPl+56acn
         n3wmsmIUaQwbI531vd1wFQG4EIm0CV8Q1WUS/3Ged8FCytp9tlDwFb4BRukA4xUySba6
         IJ1Wb718bZnokquvR5v/QuVUjXTi3TS+RZQT2nMbqCt6K8fZ5cDi3PZ+JbUCnlywzA1v
         UYIQ==
X-Forwarded-Encrypted: i=1; AKwUvBy602L8nAQmopxC7NL6VHZN+JOYCNfeqa04QuCLVsvmh1J148dg4hTdvBeF8emN6Uhf08FWuSOWiVYVtxBWhqNP@lists.infradead.org
X-Gm-Message-State: AFq9FYKuJHAzpeOQetF/mU6EjNuRHCH/VgZtdZKmtnn65aQprDxiybPp
	HwccIM91LqSWdAFrJeq/snlh6Mhq1zfbW3G+3KKkssHGtpMbgd1T4Usn9w75zwhmSBts+Wccey5
	zTXLGZw==
X-Received: from plma18.prod.google.com ([2002:a17:902:7d92:b0:2e9:73da:58d6])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:d504:b0:2e8:3d48:4d92
 with SMTP id d9443c01a7336-2eb003bf1dfmr27738995ad.33.1793214186739; Wed, 28
 Oct 2026 12:03:06 -0700 (PDT)
Date: Wed, 28 Oct 2026 12:02:56 -0700
In-Reply-To: <20261028190259.1819571-1-seanjc@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261028190259.1819571-1-seanjc@google.com>
X-Mailer: git-send-email 2.56.0.313.g2479322e68-goog
Message-ID: <20261028190259.1819571-5-seanjc@google.com>
Subject: [PATCH 4/7] KVM: MIPS: Rework kvm_arch_vcpu_should_kick() to use
 standard implementation
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: Fuad Tabba <fuad.tabba@linux.dev>, Joey Gouly <joey.gouly@arm.com>, 
	Steffen Eiden <seiden@linux.ibm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Nicholas Piggin <npiggin@gmail.com>, 
	Atish Patra <atish.patra@linux.dev>, Alexandre Ghiti <alex@ghiti.fr>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Stefan Teodorescu <fane@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261028_120309_290037_415CCB2B 
X-CRM114-Status: GOOD (  13.46  )
X-Spam-Score: -9.5 (---------)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Reply-To: Sean Christopherson <seanjc@google.com>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-26.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIMWL_WL_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT,
	USER_IN_DEF_DKIM_WL autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Rework MIPS' kvm_arch_vcpu_should_kick() to use the "standard" arch
implementation so that the arch hook can be dropped (MIPS is the only
arch other than PPC that implements a non-standard hook, and PPC uses the
recently added @force param when invoking __kvm_vcpu_kick() instead of
relying on kvm_arch_vcpu_should_kick()).

Convert MIPS to the standard implementation even though the code should be
unreachable (neither kvm_vcpu_kick() nor kvm_make_request_and_kick() are
used by MIPS or common KVM), so that there is a bisection point if the
code is somehow reachable.

No functional change intended (because the code is currently unreachable).

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/mips/kvm/mips.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/kvm/mips.c b/arch/mips/kvm/mips.c
index a53abbba43ea..c37e212bc0a3 100644
--- a/arch/mips/kvm/mips.c
+++ b/arch/mips/kvm/mips.c
@@ -122,7 +122,7 @@ bool kvm_arch_vcpu_in_kernel(struct kvm_vcpu *vcpu)
 
 int kvm_arch_vcpu_should_kick(struct kvm_vcpu *vcpu)
 {
-	return 1;
+	return kvm_vcpu_exiting_guest_mode(vcpu) == IN_GUEST_MODE;
 }
 
 int kvm_arch_enable_virtualization_cpu(void)
-- 
2.56.0.313.g2479322e68-goog


