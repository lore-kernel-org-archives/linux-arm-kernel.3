Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16339CAC592
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Sep 2025 15:55:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=FOKSGqynaN2anerij2SkIETe5RaqqxOUKLRkUOiDZeU=; b=OZ6PS8uCCASEP11uyM6jsUgb0y
	VbyIqcZU0iKVaRtQUR7Dj9dra+Ks+c0ruMbRJWbK7DxG9PnbsmNyL/UBEwUA5ewbLrIUm74O35Q8y
	RXkPqN95TB1OSGEkSnOgPtOAMbtQOZrgtzCUIZ9ETGTLF32aH6L3c80YR0nPxcWKRT83Ei3gXPPrW
	jR0S2h8Mrt5hFDIFzI/pfhfDuavxCf7Fiw4vhIajdxyyDPCK8AkxJi0/eFkXUJGCAGh31MPTpU77O
	l3l5OpNqE8doqtOrrze1TY6CTEDc/QyNAgx1S9tWjlvkoLHXYwu+CM3a6fpqc2FkkPf9pTepaRpO6
	5XuRvn/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzdSW-00000003QF5-3NnI;
	Fri, 19 Sep 2025 15:55:40 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzdSU-00000003QEc-2zql
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Sep 2025 15:55:39 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-45dd5c1b67dso12079625e9.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Sep 2025 08:55:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1758297336; x=1758902136; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=FOKSGqynaN2anerij2SkIETe5RaqqxOUKLRkUOiDZeU=;
        b=YFKXtIDoolPB1R+pB5bBi+W7kcluAY0Un0rTB/oK/04o1Tuh+sRtQt0w37OSxKFjzC
         rpH1kGm5UYH8SRvshNgl1L8NouuhseQ+/wD4pEJ2Fr7mnUbX8qSL60/9bm4BmJ22aI5K
         yAJAwO6pKf+g4DvbUpIvvz+oVacts6pP9KJV9zZKU73qhucRw38h/DkHymatbF6sOwzF
         wavdQ2epwm+6NAs0skNnXB513GpT8K3QhlSYCqlBITI//jn0HDvVmxp94adWLJCzSm4/
         U6sSujTkONaxhvyNOqhfEJbucVP/gCjE636x1KJ0f8oWw8GGfwuaUEvqE+7KfCWlDQfz
         Oshg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758297336; x=1758902136;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FOKSGqynaN2anerij2SkIETe5RaqqxOUKLRkUOiDZeU=;
        b=kH6TWjl1NTJtGc7NQoIuIfLc3ggGH8RhwRoq5smrtuhibIHZ3YRFo4cZEcnYLP3acZ
         waUQlSR58+O6PfTJE5oX25/yn2c4nYck6TZVocVVEEIvls0zXOyp3gFv/nZOzR5WtfXw
         agMwP1gIjyt2bTs807LXxQTSUoEMKRppQLFax8BYnlv/oJJjqeeqX8KUsfFeZWiRoNRb
         QPLUBnR7TfKR7uzpfd9m7ZXH4/uGpMTO7bz1+61FzBPTj5OtyQ8P3sxaLRXv0R+CS5cB
         InMHeUpq+JWetxzPB7Aapk47CFYNHqNVhrSZXpknikcxC7CJx/vvRo/kRrLnB0aIak9B
         bPkQ==
X-Forwarded-Encrypted: i=1; AJvYcCWTrP1e8TAA/xfdOtaO7mB0+0rR96Hfpl3oa/7OZDVoBrImt5RsEVL2DnQor7q+1i/WMOOcoQa1ViPXGNPUB49A@lists.infradead.org
X-Gm-Message-State: AOJu0YziFMI2R32QUpy7lpSX8Zt4iJTnwSl/oABORzn1EgH13L3fDBEY
	ikOqMVhpB0K3OeSQVAPjfw7h9hVvqqejXNesnKC8h6K98KdmMgGxcjPDGlo6OKSqKJg2rEN3wrr
	UgMPPl/GKCFJcg8ZWyI0cAQ==
X-Google-Smtp-Source: AGHT+IEUFCbcLzkaHmj5mVgMPnutmJZ9S4AToUJFiYuLUhCLRphe53uMI81/4ePc9pYVhpGPJ8joXqow1Xo/ILf8
X-Received: from wmbei25.prod.google.com ([2002:a05:600c:3f19:b0:45b:6337:ab6b])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4748:b0:456:1b6f:c888 with SMTP id 5b1f17b1804b1-467f2242a87mr36001815e9.23.1758297336691;
 Fri, 19 Sep 2025 08:55:36 -0700 (PDT)
Date: Fri, 19 Sep 2025 16:50:56 +0100
Mime-Version: 1.0
X-Mailer: git-send-email 2.51.0.470.ga7dc726c21-goog
Message-ID: <20250919155056.2648137-1-vdonnefort@google.com>
Subject: [PATCH v2] KVM: arm64: Check range args for pKVM mem transitions
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, 
	will@kernel.org
Cc: qperret@google.com, sebastianene@google.com, keirf@google.com, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, kernel-team@android.com, 
	Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250919_085538_793013_F9FB4363 
X-CRM114-Status: UNSURE (   9.67  )
X-CRM114-Notice: Please train this message.
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

There's currently no verification for host issued ranges in most of the
pKVM memory transitions. The subsequent end boundary might therefore be
subject to overflow and could evade the later checks.

Close this loophole with an additional check_range_args() check on a per
public function basis.

host_unshare_guest transition is already protected via
__check_host_shared_guest(), while assert_host_shared_guest() callers
are already ignoring host checks.

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>

---

 v1 -> v2:
   - Also check for (nr_pages * PAGE_SIZE) overflow. (Quentin)
   - Rename to check_range_args().

diff --git a/arch/arm64/kvm/hyp/nvhe/mem_protect.c b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
index 8957734d6183..65fcd2148f59 100644
--- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
+++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
@@ -712,6 +712,14 @@ static int __guest_check_page_state_range(struct pkvm_hyp_vm *vm, u64 addr,
 	return check_page_state_range(&vm->pgt, addr, size, &d);
 }
 
+static bool check_range_args(u64 start, u64 nr_pages, u64 *size)
+{
+	if (check_mul_overflow(nr_pages, PAGE_SIZE, size))
+		return false;
+
+	return start < (start + *size);
+}
+
 int __pkvm_host_share_hyp(u64 pfn)
 {
 	u64 phys = hyp_pfn_to_phys(pfn);
@@ -772,10 +780,13 @@ int __pkvm_host_unshare_hyp(u64 pfn)
 int __pkvm_host_donate_hyp(u64 pfn, u64 nr_pages)
 {
 	u64 phys = hyp_pfn_to_phys(pfn);
-	u64 size = PAGE_SIZE * nr_pages;
 	void *virt = __hyp_va(phys);
+	u64 size;
 	int ret;
 
+	if (!check_range_args(phys, nr_pages, &size))
+		return -EINVAL;
+
 	host_lock_component();
 	hyp_lock_component();
 
@@ -800,10 +811,13 @@ int __pkvm_host_donate_hyp(u64 pfn, u64 nr_pages)
 int __pkvm_hyp_donate_host(u64 pfn, u64 nr_pages)
 {
 	u64 phys = hyp_pfn_to_phys(pfn);
-	u64 size = PAGE_SIZE * nr_pages;
 	u64 virt = (u64)__hyp_va(phys);
+	u64 size;
 	int ret;
 
+	if (!check_range_args(phys, nr_pages, &size))
+		return -EINVAL;
+
 	host_lock_component();
 	hyp_lock_component();
 
@@ -884,9 +898,12 @@ void hyp_unpin_shared_mem(void *from, void *to)
 int __pkvm_host_share_ffa(u64 pfn, u64 nr_pages)
 {
 	u64 phys = hyp_pfn_to_phys(pfn);
-	u64 size = PAGE_SIZE * nr_pages;
+	u64 size;
 	int ret;
 
+	if (!check_range_args(phys, nr_pages, &size))
+		return -EINVAL;
+
 	host_lock_component();
 	ret = __host_check_page_state_range(phys, size, PKVM_PAGE_OWNED);
 	if (!ret)
@@ -899,9 +916,12 @@ int __pkvm_host_share_ffa(u64 pfn, u64 nr_pages)
 int __pkvm_host_unshare_ffa(u64 pfn, u64 nr_pages)
 {
 	u64 phys = hyp_pfn_to_phys(pfn);
-	u64 size = PAGE_SIZE * nr_pages;
+	u64 size;
 	int ret;
 
+	if (!check_range_args(phys, nr_pages, &size))
+		return -EINVAL;
+
 	host_lock_component();
 	ret = __host_check_page_state_range(phys, size, PKVM_PAGE_SHARED_OWNED);
 	if (!ret)
@@ -945,6 +965,9 @@ int __pkvm_host_share_guest(u64 pfn, u64 gfn, u64 nr_pages, struct pkvm_hyp_vcpu
 	if (prot & ~KVM_PGTABLE_PROT_RWX)
 		return -EINVAL;
 
+	if (!check_range_args(phys, nr_pages, &size))
+		return -EINVAL;
+
 	ret = __guest_check_transition_size(phys, ipa, nr_pages, &size);
 	if (ret)
 		return ret;

base-commit: 8b789f2b7602a818e7c7488c74414fae21392b63
-- 
2.51.0.470.ga7dc726c21-goog


