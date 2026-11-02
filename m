Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40C4C606A338
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 20:47:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=RkgSFi4c;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=HRCpIraO
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=I6BQoFnF9ikMH0E7xIp1BG2aoqpM1gNnG8JpjKNdNFY=; b=RkgSFi4cv09F3IcqO3ZEAq7jii
	5rHZ9FWKfEPDJqRJ8shbrB+16FVnXXOceVh9yIsF5tV+chHdhvVdwTQNFQYbQtZoSdGg2vsNI44t0
	WjTnbfWlXO284gIDN17Q9J5WnE4Tp7hEfowZxpmm1o0KG7Xck0ofp0P16Fsy8wk6AVfI6zPyehNxZ
	Kci/WpRisKSK6+i2TyWgX4n0QE9H2Lnyoj+i33O42t1W0onMWXZZaxBcuNTBU8S8hIsPQkKYmcKpu
	pPJAyjOlRx6n4zzCmxbhlHGBDrNFwySUkQ0R4OgsNjxZTuqWoDKYA8vvJBkBA5W9c/AuW0dXZKXJs
	nX5Ad4cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNywJ-00000000OAU-1c6k;
	Mon, 02 Nov 2026 20:47:35 +0000
Received: from mail-wm1-x348.google.com ([2a00:1450:4864:20::348])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNywB-00000000NuQ-1bwe
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 20:47:32 +0000
Received: by mail-wm1-x348.google.com with SMTP id 5b1f17b1804b1-4a359b714f8so32137165e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Nov 2026 12:47:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793652443; x=1794257243; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=I6BQoFnF9ikMH0E7xIp1BG2aoqpM1gNnG8JpjKNdNFY=;
        b=HRCpIraOKyf2MebxhsDGa72meuXCjxpV9XR0HDp9rDCdYCtzrYKeDU2Fl12/BkhyCH
         PXi1w72RI+cqHw5llkYM7meL5yAQ82YnR0iMZnfiMEoCpgomoxFH51cTOdWkltziuYzH
         3UUd6/CsCOsPOsOEA+hu4Us8D3yUUjfE3/qjd2baALkQzrTU+8hHygiTqpStmKhdrsjl
         RkndXU+cPL2xEHaCXyrvXr8wcdI2zDFSFonGLRQ9gxldowIVC0KeHYY2kOqdwfWLSXXR
         Ub3/4xoPj4xOihVZh7Q4i18n/IFC3HlLp7cpeHl+tnGV5c1rJhBq492h6kZbrPIBEBKi
         gm8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793652443; x=1794257243;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=I6BQoFnF9ikMH0E7xIp1BG2aoqpM1gNnG8JpjKNdNFY=;
        b=McqNhe8Q/qfjOxqjx8+sI2BAh2Ic9hHvGD1mqsCjDyXQbnCHyfXoE0Vnw1BhEMZ3qQ
         UjJOhVQn/zWDzPca/xccvRjEiSUDkzMylVzBvTOsOK8CwKWXsGKOEqn5QNIDw88l6wHw
         TtDlv/Ev5TjbmIjQacHsxcXDARf/R9iOBgNdzPxX3Z7mp6tW+MnNHR+U9nNsLgcGdes6
         53lWlUdrvLUcOfI1ut3lrmBkRLGZej4PUdq4M2ZEqQos1e5bmvyf++sEKH2VjVo9t3aF
         dpEYbLNusIzkxWOlemB2XBasqtX1cyGNtLkYr6vF0SGJ7oNflLVa5IZsGczVN3wicKIL
         uuCA==
X-Forwarded-Encrypted: i=1; AKwUvBxv74cc3p8+xpyBMw/yjNXN5T2tzjOvKaFjeUMaXyfWV0yZxSj0iHgC3H/VjsOJYzv34+EDjyxKsANU8ZkCY1IU@lists.infradead.org
X-Gm-Message-State: AFq9FYKTCtFsCOW8Fg6TkFnIjO3d3KdF0qLCZpJ4Bx4pHyqsaRiVWzlT
	n+WnIQ6y/1fcGECHB+EYYcS3fQllYcSCch/VMYQPiBMDFfe6g3J0zqGjf3fvL5AnnWymRhGJwNH
	KVwaKvHWJsNsdP0lXlCO4zw==
X-Received: from wrbfl11.prod.google.com ([2002:a05:6000:29cb:b0:48e:20b:f597])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:6215:b0:4aa:1527:659 with SMTP id 5b1f17b1804b1-4ac17a366c0mr266862815e9.17.1793652443131;
 Mon, 02 Nov 2026 12:47:23 -0800 (PST)
Date: Mon,  2 Nov 2026 20:46:25 +0000
In-Reply-To: <20261102204628.401871-1-vdonnefort@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261102204628.401871-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.56.0.385.gac671c819a-goog
Message-ID: <20261102204628.401871-21-vdonnefort@google.com>
Subject: [PATCH v3 20/23] KVM: arm64: Extend pKVM page ownership selftests to
 cover guest block split
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org, 
	kernel-team@android.com, fuad.tabba@linux.dev, 
	Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_124730_756712_E283A13A 
X-CRM114-Status: GOOD (  11.29  )
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
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-26.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIMWL_WL_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT,
	USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Extend the pKVM page ownership selftests to test the split of a guest
stage-2 block and the per-page reclaim of that same block.

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
---
 arch/arm64/kvm/hyp/nvhe/mem_protect.c | 41 +++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/arch/arm64/kvm/hyp/nvhe/mem_protect.c b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
index 7ecf4c98d7b5..82fcec43f16a 100644
--- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
+++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
@@ -2128,6 +2128,47 @@ int __pkvm_ownership_selftest(u64 pfn, u64 nr_pages, u64 pgtable_pfn,
 	assert_transition_res(-EPERM,	__pkvm_host_donate_guest, pfn, gfn, nr_pages, vcpu);
 	assert_transition_res(-EPERM,	__pkvm_host_share_guest, pfn, gfn, nr_pages, vcpu, prot);
 
+	if (size == PMD_SIZE) {
+		/* [gfn, gfn + nr_pages) was poisoned. Skip it */
+		gfn += nr_pages;
+
+		selftest_state.host = PKVM_NOPAGE;
+		selftest_state.guest[1] = PKVM_PAGE_OWNED;
+		assert_transition_res(0,	__pkvm_host_donate_guest, pfn, gfn, nr_pages, vcpu);
+		assert_transition_res(-E2BIG,	__pkvm_host_reclaim_guest, gfn, 1, vm);
+		assert_transition_res(-E2BIG,	__pkvm_guest_share_host, vcpu, gfn, 1);
+		assert_transition_res(0,	__pkvm_host_split_guest, gfn, nr_pages, vcpu);
+
+		assert_transition_res(-E2BIG,	__pkvm_host_split_guest, gfn, nr_pages, vcpu);
+		assert_transition_res(-E2BIG,	__pkvm_host_reclaim_guest, gfn, nr_pages, vm);
+		assert_transition_res(-E2BIG,	__pkvm_guest_share_host, vcpu, gfn, nr_pages);
+
+		for (int i = 0; i < nr_pages; i++) {
+			WARN_ON(__pkvm_guest_share_host(vcpu, gfn + i, 1));
+			WARN_ON(__pkvm_guest_unshare_host(vcpu, gfn + i, 1));
+		}
+		assert_page_state();
+
+		for (int i = 0; i < nr_pages; i++)
+			WARN_ON(__pkvm_host_reclaim_guest(gfn + i, 1, vm));
+
+		selftest_state.host = PKVM_PAGE_OWNED;
+		selftest_state.guest[1] = PKVM_NOPAGE;
+		assert_page_state();
+
+		selftest_state.host = PKVM_NOPAGE;
+		selftest_state.guest[1] = PKVM_PAGE_OWNED;
+		assert_transition_res(0,	__pkvm_host_donate_guest, pfn, gfn, nr_pages, vcpu);
+		assert_transition_res(0,	__pkvm_host_split_guest, gfn, nr_pages, vcpu);
+
+		for (int i = 0; i < nr_pages; i++)
+			WARN_ON(__pkvm_host_force_reclaim_page_guest(phys + i * PAGE_SIZE));
+
+		selftest_state.host = PKVM_PAGE_OWNED;
+		selftest_state.guest[1] = PKVM_POISON;
+		assert_page_state();
+	}
+
 	selftest_state.host = PKVM_NOPAGE;
 	selftest_state.hyp = PKVM_PAGE_OWNED;
 	assert_transition_res(0,	__pkvm_host_donate_hyp, pfn, nr_pages);
-- 
2.56.0.385.gac671c819a-goog


