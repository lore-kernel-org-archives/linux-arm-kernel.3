Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 952BA606A334
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 20:48:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=taZo6STd;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=oPLy2c4s;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=QHPjG+Se
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=vvL2Ie8/QPWYQD4V2guIi0wkBoonvwzrKKwfja3Hjq8=; b=taZo6STd6LNvuVBNIrrwVVp7Rn
	X6Ai7RbIXxedFnWi+eoLMZuNS+IMawSAFQhTf6DRrlJxt/QXwqAgCgrAkfFTZcK19fZ5SzfDNKYUa
	pj62pShS2CFyCAN/h7EppEeRY3YPCIHp3HfHux2/rV8GKti6dXB6ZLwe6cK710gmvHO3LYcZXgPdG
	hci0v6cThTjWKYppoC9Ud4Cdd1wrYWScpZIc0Jpv1+V2J1TqFy7q6RG8xmHMNsTX9AD7whQvU3f6y
	eAaJoEkY6LJFe8ZpleMNrM+B6CVpo+GvkdCtOuzhfGcXFzPqfS9vkRJZtnN20+WcxbERgiUgItwPd
	yCVBzQWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNywy-00000000P2A-1seO;
	Mon, 02 Nov 2026 20:48:16 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNywx-00000000P16-0ZOR
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 02 Nov 2026 20:48:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=vvL2Ie8/QPWYQD4V2guIi0wkBoonvwzrKKwfja3Hjq8=; b=oPLy2c4sh25ftX6FiaodcIQcMK
	FKC7F6u/UzzdS+kfv74PXvxK1YksePsuWT+/+9iHT82ZQIRe9fD1Y5UPIC2orq1591brW+u0QNl+6
	uyyG9/LYADITgqgUJDPxPHN9H/a9rl4M4JXnT44UmkPQ+DBzfxlO0fheUBFEJBV7cUNmYFzQ0t0/V
	YxLkhR6PWiDBBPNoaHblTXUv0yeCYiDpXEPd5m8leMwe7p/RDztag6RaaeRcJ/YbHQFMylsKPS1HQ
	E1IXLENDTlywRqqUiiSB/Oo0gE3EVVRNMcVEk6WlMPdUjFSmj34X3WSssIkz9+vV5R7sSv5iwgKjI
	YJo60MUw==;
Received: from mail-wm1-x348.google.com ([2a00:1450:4864:20::348])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNywS-000000035V0-0pzE
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 20:48:13 +0000
Received: by mail-wm1-x348.google.com with SMTP id 5b1f17b1804b1-4a70b42bab0so337425e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Nov 2026 12:47:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793652445; x=1794257245; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vvL2Ie8/QPWYQD4V2guIi0wkBoonvwzrKKwfja3Hjq8=;
        b=QHPjG+SenzPK9Fg6nAoT6KTHZRkDvfa0c9HzNGk61pjdqtLoMGQxGtO75MRFoLdR57
         m+aOCDtXB33PXXUj16IeZ1sJevXIqnHBykYmRn5+RMjdyCuMmc1EwZQFwHjGnGAOJSVK
         ogLh6AO2VrQG++YpR6ebQzEkRAoEGYISZsk1s8vBEFaYEONIBDoJVQQD2ikETVwMIo8Q
         FN70NV9QhvRFfrMpDFBHJVKp58MmddAbyXX5tcBJrVXLwB0zQsrZ0JfEjM8tz3f+3ooV
         /DcpolkPcit1BAy6bjReBZ4VtvSh4V2orgFg8lQJu8bS2GvLwyeqjrRh746cRX53hlKq
         ybKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793652445; x=1794257245;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vvL2Ie8/QPWYQD4V2guIi0wkBoonvwzrKKwfja3Hjq8=;
        b=kbSuKauLqluETvAX8kG4ffUHiFwlBWlCIwE/IVg/lr/b2BMiQSN85n0iYX346CS9Ex
         7ddtU7rC/1ttmY7TBC2OMm2YievJnBKFDAxlW7SEfAYWGdmEWSkxl3EaJpWl6aqkVhfy
         8lQgOcV+RRquGgsWVfn5i/6JUBwFU2isMU1YfweIy2GfqjngrYTtqaHDNHaOGtgTi3CY
         jzrYIH2/pTeGTrbN0tQ5LF+KRq7+NhL9TLvBUCTLxfvwRZntTOLAP0iSo6W06Bs8mr7A
         H6nn2/O+YpGFIVorwnZNVdcFAL7Bke5XyNWB27BzYMAQ1h7RYvmV7NTDt0ByQKw2QATm
         Crxw==
X-Forwarded-Encrypted: i=1; AKwUvBxNNx69UNQMVnuoRhFLHMbk1VkAmozvYmGINQnmh+Ct67kSKGLiMoS1s7qadrXCcUjLFYbhZ8ToUpe0e7ZiTyFA@lists.infradead.org
X-Gm-Message-State: AFq9FYICYxeDYwiclvgvSQyHTPueCzSNMN9q69OkpzRmHHgYjEddCrYE
	H84KnyR3f+Ipif40myyR5Lu3qt7W0YYsC2UkkMfe9P2ZLbQqUzAjaLuLb29GXU1mSPNEvLSa+Zx
	oyEr/skmmiGppOysUywtqQA==
X-Received: from wrpb10.prod.google.com ([2002:adf:f24a:0:b0:48c:41d4:a0ef])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:6285:b0:4a1:c6f5:2450 with SMTP id 5b1f17b1804b1-4ac180f07d1mr278924195e9.17.1793652445029;
 Mon, 02 Nov 2026 12:47:25 -0800 (PST)
Date: Mon,  2 Nov 2026 20:46:27 +0000
In-Reply-To: <20261102204628.401871-1-vdonnefort@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261102204628.401871-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.56.0.385.gac671c819a-goog
Message-ID: <20261102204628.401871-23-vdonnefort@google.com>
Subject: [PATCH v3 22/23] KVM: arm64: Raise PKVM_HYP_REQ_SPLIT on guest to
 host sharing
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org, 
	kernel-team@android.com, fuad.tabba@linux.dev, 
	Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_204751_294993_B702C47B 
X-CRM114-Status: GOOD (  17.38  )
X-Spam-Score: -7.6 (-------)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-26.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIMWL_WL_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT,
	USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Pages shared by the guest with the host are annotated into the guest
stage-2. If the shared page is backed by a huge mapping, we need to
split it first.

Raise a PKVM_HYP_REQ_SPLIT for the host on the guest HVC MEM_SHARE, if a
block exists (-E2BIG) and replay the HVC (by rewinding the ELR).

At the moment, the guest HVC MEM_SHARE is single-page only. This means
unsharing is ensured to find a PTE-level mapping. However, as this will
most likely be extended later, raise the same PKVM_HYP_REQ_SPLIT on the
guest HVC MEM_UNSHARE.

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
---
 arch/arm64/kvm/hyp/nvhe/pkvm.c | 43 ++++++++++++++++++++++++++++++----
 1 file changed, 38 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/kvm/hyp/nvhe/pkvm.c b/arch/arm64/kvm/hyp/nvhe/pkvm.c
index d92f4da1c180..6c126fcc3831 100644
--- a/arch/arm64/kvm/hyp/nvhe/pkvm.c
+++ b/arch/arm64/kvm/hyp/nvhe/pkvm.c
@@ -1169,16 +1169,34 @@ static u64 __pkvm_memshare_page_req(struct kvm_vcpu *vcpu, u64 ipa)
 	return ARM_EXCEPTION_TRAP;
 }
 
+static u64 pkvm_request_split(struct pkvm_hyp_vcpu *hyp_vcpu, u64 gfn, u64 nr_pages)
+{
+	struct pkvm_hyp_req *req = &hyp_vcpu->host_vcpu->arch.pkvm_hyp_req;
+	u64 elr;
+
+	req->type = PKVM_HYP_REQ_SPLIT;
+	req->split.gfn = gfn;
+	req->split.nr_pages = nr_pages;
+
+	/* Rewind the ELR so we return to the HVC once the block is split */
+	elr = read_sysreg(elr_el2);
+	elr -= 4;
+	write_sysreg(elr, elr_el2);
+
+	return ARM_EXCEPTION_PKVM_HYP_REQ;
+}
+
 static bool pkvm_memshare_call(u64 *ret, struct kvm_vcpu *vcpu, u64 *exit_code)
 {
 	struct pkvm_hyp_vcpu *hyp_vcpu;
 	u64 ipa = smccc_get_arg1(vcpu);
+	u64 gfn = hyp_phys_to_pfn(ipa);
 
 	if (!PAGE_ALIGNED(ipa))
 		goto out_guest;
 
 	hyp_vcpu = container_of(vcpu, struct pkvm_hyp_vcpu, vcpu);
-	switch (__pkvm_guest_share_host(hyp_vcpu, hyp_phys_to_pfn(ipa), 1)) {
+	switch (__pkvm_guest_share_host(hyp_vcpu, gfn, 1)) {
 	case 0:
 		ret[0] = SMCCC_RET_SUCCESS;
 		goto out_guest;
@@ -1189,6 +1207,9 @@ static bool pkvm_memshare_call(u64 *ret, struct kvm_vcpu *vcpu, u64 *exit_code)
 		 */
 		*exit_code = __pkvm_memshare_page_req(vcpu, ipa);
 		goto out_host;
+	case -E2BIG:
+		*exit_code = pkvm_request_split(hyp_vcpu, gfn, 1);
+		goto out_host;
 	}
 
 out_guest:
@@ -1197,17 +1218,29 @@ static bool pkvm_memshare_call(u64 *ret, struct kvm_vcpu *vcpu, u64 *exit_code)
 	return false;
 }
 
-static void pkvm_memunshare_call(u64 *ret, struct kvm_vcpu *vcpu)
+static bool pkvm_memunshare_call(u64 *ret, struct kvm_vcpu *vcpu, u64 *exit_code)
 {
 	struct pkvm_hyp_vcpu *hyp_vcpu;
 	u64 ipa = smccc_get_arg1(vcpu);
+	u64 gfn = hyp_phys_to_pfn(ipa);
 
 	if (!PAGE_ALIGNED(ipa))
-		return;
+		goto out_guest;
 
 	hyp_vcpu = container_of(vcpu, struct pkvm_hyp_vcpu, vcpu);
-	if (!__pkvm_guest_unshare_host(hyp_vcpu, hyp_phys_to_pfn(ipa), 1))
+	switch (__pkvm_guest_unshare_host(hyp_vcpu, gfn, 1)) {
+	case 0:
 		ret[0] = SMCCC_RET_SUCCESS;
+		goto out_guest;
+	case -E2BIG:
+		*exit_code = pkvm_request_split(hyp_vcpu, gfn, 1);
+		goto out_host;
+	}
+
+out_guest:
+	return true;
+out_host:
+	return false;
 }
 
 /*
@@ -1547,7 +1580,7 @@ bool kvm_handle_pvm_hvc64(struct kvm_vcpu *vcpu, u64 *exit_code)
 			break;
 		}
 
-		pkvm_memunshare_call(val, vcpu);
+		handled = pkvm_memunshare_call(val, vcpu, exit_code);
 		break;
 	default:
 		return pkvm_handle_psci(hyp_vcpu);
-- 
2.56.0.385.gac671c819a-goog


