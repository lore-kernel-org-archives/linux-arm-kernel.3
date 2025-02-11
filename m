Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D38AC02198
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Feb 2025 00:16:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yzGbC0ypbw1NU4jMljSKqdqWfQ9LORCBGxC9rZKevfg=; b=KB396tG0m7dX+EIYpFUOcQu1Jp
	y5JOFTv4eQpt1+njFGOgvKI48PiLH6jVy9CrdEeqGnPDoGPfoNPqwrC3guP93e2SfroecM3O6nRQ8
	e9zOtSoi2zNXY95UosEjwTbXakw6SuRQdRMbfX6aw39BaMla30WUp4JZDUvWw+oDXYOoWwtVMbvwT
	/TSajpGRHbOuaOmwwTkJ44IgmWJzKRD2iAEE4iQDvM9y4w0B7/MOq23pJ9PsuOttuP3OHrO++bdnN
	i0g110GthPGK4I614V59Ac3AJkotZb6wdhVBxUXL81miBE8K/1sOrYis3tZdBSGtdn3rUkxNo+rXK
	VOI+tCLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thdwe-00000001xCj-3ivy;
	Tue, 11 Feb 2025 00:16:08 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thdrt-00000001wRl-3LfK
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 11 Feb 2025 00:11:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=yzGbC0ypbw1NU4jMljSKqdqWfQ9LORCBGxC9rZKevfg=; b=AZ007Ces5YfXJcgJ3+UIVjqQv7
	+3oA1RqH4BoTPITYj8tGuIFrG2VLBTzS1K6yNRomydOtn8u+Sp5qn8RKlr0K690JDqs7EsmiWNG7B
	I4TCj5KqxDF8GXjQOII/0ylaXRdlCieMCRuVdDn9diuyrKs+CMCdm1emtFriIpD4+sRG7nXGhyHoD
	ordahfGWiLJ+jQ/LxGwOj0VMiJXN+rKVQDl6hZICRx9Uj8NgmFkmsfYCcWtD4evTeQAKhmcBXB5aX
	GsoAD7MkYN+tI9DyKdz05I5QzoceEOaRWo24b35wqD0Ko7QywsFT4Vgl9JJb2kgb4ktXwsUE6LnrI
	JhNL5Mcg==;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thdrq-00000000O4U-3H5T
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Feb 2025 00:11:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1739232669;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yzGbC0ypbw1NU4jMljSKqdqWfQ9LORCBGxC9rZKevfg=;
	b=NoFpwBqkcQbho4wzQ16TZjEYEPuKCOKhZvElLNxOi3ZhfVT75erVOPg87SUZXNwkQdHFbH
	6YuR4vvi0fh2O3hPe12JZj1JWYvNV16zA7vhV8iMfHWu76y+hZS50EEXhkuOyhjdxdfAUq
	LjzKgPsaG5tkIRNeFZSHk9Z+PDpshkk=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1739232669;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yzGbC0ypbw1NU4jMljSKqdqWfQ9LORCBGxC9rZKevfg=;
	b=NoFpwBqkcQbho4wzQ16TZjEYEPuKCOKhZvElLNxOi3ZhfVT75erVOPg87SUZXNwkQdHFbH
	6YuR4vvi0fh2O3hPe12JZj1JWYvNV16zA7vhV8iMfHWu76y+hZS50EEXhkuOyhjdxdfAUq
	LjzKgPsaG5tkIRNeFZSHk9Z+PDpshkk=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-556-rxU9z2ZwPoCLLQlMQjJc6g-1; Mon,
 10 Feb 2025 19:09:48 -0500
X-MC-Unique: rxU9z2ZwPoCLLQlMQjJc6g-1
X-Mimecast-MFC-AGG-ID: rxU9z2ZwPoCLLQlMQjJc6g
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id BECC31800983;
	Tue, 11 Feb 2025 00:09:44 +0000 (UTC)
Received: from starship.lan (unknown [10.22.65.174])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 006BA19560A3;
	Tue, 11 Feb 2025 00:09:38 +0000 (UTC)
From: Maxim Levitsky <mlevitsk@redhat.com>
To: kvm@vger.kernel.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	Jing Zhang <jingzhangos@google.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	linux-arm-kernel@lists.infradead.org,
	Marc Zyngier <maz@kernel.org>,
	linux-kernel@vger.kernel.org,
	Randy Dunlap <rdunlap@infradead.org>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	kvm-riscv@lists.infradead.org,
	Ingo Molnar <mingo@redhat.com>,
	linux-riscv@lists.infradead.org,
	Joey Gouly <joey.gouly@arm.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Maxim Levitsky <mlevitsk@redhat.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	kvmarm@lists.linux.dev,
	Alexander Potapenko <glider@google.com>,
	x86@kernel.org,
	Sean Christopherson <seanjc@google.com>,
	Anup Patel <anup@brainfault.org>,
	Kunkun Jiang <jiangkunkun@huawei.com>,
	Atish Patra <atishp@atishpatra.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>
Subject: [PATCH 3/3] RISC-V: KVM: switch to kvm_lock/unlock_all_vcpus
Date: Mon, 10 Feb 2025 19:09:17 -0500
Message-Id: <20250211000917.166856-4-mlevitsk@redhat.com>
In-Reply-To: <20250211000917.166856-1-mlevitsk@redhat.com>
References: <20250211000917.166856-1-mlevitsk@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_001111_062155_CD552EEE 
X-CRM114-Status: GOOD (  12.84  )
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

use kvm_lock/unlock_all_vcpus instead of riscv's own
implementation.

Note that this does introduce a slight functional change - now vCPUs are
unlocked in the same order they were locked and not in the opposite order.

Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Maxim Levitsky <mlevitsk@redhat.com>
---
 arch/riscv/kvm/aia_device.c | 36 +++---------------------------------
 1 file changed, 3 insertions(+), 33 deletions(-)

diff --git a/arch/riscv/kvm/aia_device.c b/arch/riscv/kvm/aia_device.c
index 39cd26af5a69..32354e47c7d8 100644
--- a/arch/riscv/kvm/aia_device.c
+++ b/arch/riscv/kvm/aia_device.c
@@ -12,36 +12,6 @@
 #include <linux/kvm_host.h>
 #include <linux/uaccess.h>
 
-static void unlock_vcpus(struct kvm *kvm, int vcpu_lock_idx)
-{
-	struct kvm_vcpu *tmp_vcpu;
-
-	for (; vcpu_lock_idx >= 0; vcpu_lock_idx--) {
-		tmp_vcpu = kvm_get_vcpu(kvm, vcpu_lock_idx);
-		mutex_unlock(&tmp_vcpu->mutex);
-	}
-}
-
-static void unlock_all_vcpus(struct kvm *kvm)
-{
-	unlock_vcpus(kvm, atomic_read(&kvm->online_vcpus) - 1);
-}
-
-static bool lock_all_vcpus(struct kvm *kvm)
-{
-	struct kvm_vcpu *tmp_vcpu;
-	unsigned long c;
-
-	kvm_for_each_vcpu(c, tmp_vcpu, kvm) {
-		if (!mutex_trylock(&tmp_vcpu->mutex)) {
-			unlock_vcpus(kvm, c - 1);
-			return false;
-		}
-	}
-
-	return true;
-}
-
 static int aia_create(struct kvm_device *dev, u32 type)
 {
 	int ret;
@@ -52,8 +22,8 @@ static int aia_create(struct kvm_device *dev, u32 type)
 	if (irqchip_in_kernel(kvm))
 		return -EEXIST;
 
-	ret = -EBUSY;
-	if (!lock_all_vcpus(kvm))
+	ret = kvm_lock_all_vcpus(kvm);
+	if (ret)
 		return ret;
 
 	kvm_for_each_vcpu(i, vcpu, kvm) {
@@ -65,7 +35,7 @@ static int aia_create(struct kvm_device *dev, u32 type)
 	kvm->arch.aia.in_kernel = true;
 
 out_unlock:
-	unlock_all_vcpus(kvm);
+	kvm_unlock_all_vcpus(kvm);
 	return ret;
 }
 
-- 
2.26.3


