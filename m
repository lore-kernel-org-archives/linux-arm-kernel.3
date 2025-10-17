Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73BCECCD184
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Oct 2025 07:57:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=YeonnmR22YpdBnRA2e84Q5k99IvmMWnT+8o9upY5Y8U=; b=SxxzkMjHgShYafd+Rx9O65RmXQ
	teEVHpb6TQI9xgv1qCDeDzfdK1wg/nZ+k+ds3JEBp1hMryOupG8I8y8nL6EJ1N0eur+Az8THnkSbs
	rZiDu9QlgDpw5EurKi+fX6extcl+QJTXTrJDQTd9c/+RGJ/I8kulUu9AdKyyWo2p5wQUiSqtLB03b
	lHrhwn3wPsVihWejNl7FMxJsLC0PmFNiP/7Dj/NcVBvikfuaLm7dofTkbmBT2GD716L/LKqs2pGIZ
	wkfO9TR95xqhr+3r8SLKDg9i/zhrBp8pcQMTyyUOi+NNuTaRUQ6io1ZZNkCXVmSxqMSzw4YQL7Rhr
	KNVzGOpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9fL2-000000071Lw-31vy;
	Fri, 17 Oct 2025 07:57:24 +0000
Received: from mail-ed1-x549.google.com ([2a00:1450:4864:20::549])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9fL0-000000071Ki-0raM
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Oct 2025 07:57:23 +0000
Received: by mail-ed1-x549.google.com with SMTP id 4fb4d7f45d1cf-63c348b15f9so137889a12.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Oct 2025 00:57:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1760687840; x=1761292640; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=YeonnmR22YpdBnRA2e84Q5k99IvmMWnT+8o9upY5Y8U=;
        b=HlH7Aszpao/z1VJ+HbWTOzD2p605Gr6rhIs0V98B8VcTfUYtTjJlA4dL9auE8kegZJ
         22U27Xi6u+k0lie77OlkgbSlfr0qpj8FIvGxH521guGuAIHhg3sUI+BHmFgVw2ueysvn
         vtCl6xXcJkNNP+n/Gr1nlQz5yVz4qpl4PNu5nAh7nMKkMb9G89JdoZl2FVdTJfxyxQQP
         dU+z9CCYSm15qdM9kO0UIjrHx61v2zhh2lwbneE/2LxXZKW0ArC6D2NHsFssGC1ahzlt
         7/E3dT9kin1JQL9OYrIgiGdhevLxfIoc07vpfP0zXi4gQKtxsGtnDWbwI2QrzETLmlZa
         V1DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760687840; x=1761292640;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YeonnmR22YpdBnRA2e84Q5k99IvmMWnT+8o9upY5Y8U=;
        b=O0rnuSuLqTgIE1L5cywLRsRo+gH+ANcyKLq/9B6mnFvaqUHiHScqbZlgr9AIfIc3Dm
         2HZj+VstaI6EbKvYQu6D9xKB34UBxshfga+Xu1P6obIJ83p69TDJNpaGcG79unRd/oxX
         rt44Ce29+KdbNWw8nw5YuDwRzf34vD68nIJdfwpvy7XvUgJztNo74SznrCHVjAhboXdz
         H9RCVKfqi7U8VHMk0JnDnchRFm+A6BrTIlOcAbxUbeBSmVWVAnApFZGzD7EsmjbnsQPu
         ZHPrZgyKBw1PcLuHTbzBpUIJ6k2Xi3TQGPfwSH5iuA6myBS9HkWkTFasmz0SOyxqGAoH
         uAfA==
X-Forwarded-Encrypted: i=1; AJvYcCVyoJ0T02I6pIOmhT0hP8o5f8imHLtg7klKvHRCFmUUH6/ZQkdlK+41sG/BWOAUo5fuF/3TjRta1ZPww/opbXs9@lists.infradead.org
X-Gm-Message-State: AOJu0YxHo0ax3fvtGtJwfgxyCdtB3N7AUpUUbDoVky9/41k8NWZaJgNo
	nK7Lel/scvbbBDjfS5jJ6unpyKNmSpTxxi2WsrzPKYAAJdmbAupqoHf8B9ks0CgriGd1AJ8Ruj+
	+4Gk1++ptkPs8oerMTlmHt40n8rzTjw==
X-Google-Smtp-Source: AGHT+IFurVwu13hTVgjqFkuyg+jJU8SJ/2HWVhpsWHXh/EE63aqE9d17vw6ppnqZ4TszNyVb3fhURmcJUleEuWeLYDE=
X-Received: from edya15.prod.google.com ([2002:aa7:cf0f:0:b0:639:f07d:725a])
 (user=sebastianene job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:20c2:20b0:63b:f93a:57b with SMTP id 4fb4d7f45d1cf-63c1f6b50c1mr2138541a12.20.1760687839997;
 Fri, 17 Oct 2025 00:57:19 -0700 (PDT)
Date: Fri, 17 Oct 2025 07:57:10 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.51.0.858.gf9c4a03a3a-goog
Message-ID: <20251017075710.2605118-1-sebastianene@google.com>
Subject: [PATCH] KVM: arm64: Check the untrusted offset in FF-A memory share
From: Sebastian Ene <sebastianene@google.com>
To: maz@kernel.org, oliver.upton@linux.dev, will@kernel.org, 
	catalin.marinas@arm.com, suzuki.poulose@arm.com, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	joey.gouly@arm.com
Cc: ayrton@google.com, yuzenghui@huawei.com, qperret@google.com, 
	vdonnefort@google.com, kernel-team@android.com, 
	Sebastian Ene <sebastianene@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251017_005722_264290_448D2D91 
X-CRM114-Status: GOOD (  11.89  )
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

Verify the offset to prevent OOB access in the hypervisor
FF-A buffer in case an untrusted large enough value
[U32_MAX - sizeof(struct ffa_composite_mem_region) + 1, U32_MAX]
is set from the host kernel.

Signed-off-by: Sebastian Ene <sebastianene@google.com>
---
 arch/arm64/kvm/hyp/nvhe/ffa.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/kvm/hyp/nvhe/ffa.c b/arch/arm64/kvm/hyp/nvhe/ffa.c
index 4e16f9b96f63..58b7d0c477d7 100644
--- a/arch/arm64/kvm/hyp/nvhe/ffa.c
+++ b/arch/arm64/kvm/hyp/nvhe/ffa.c
@@ -479,7 +479,7 @@ static void __do_ffa_mem_xfer(const u64 func_id,
 	struct ffa_mem_region_attributes *ep_mem_access;
 	struct ffa_composite_mem_region *reg;
 	struct ffa_mem_region *buf;
-	u32 offset, nr_ranges;
+	u32 offset, nr_ranges, checked_offset;
 	int ret = 0;
 
 	if (addr_mbz || npages_mbz || fraglen > len ||
@@ -516,7 +516,12 @@ static void __do_ffa_mem_xfer(const u64 func_id,
 		goto out_unlock;
 	}
 
-	if (fraglen < offset + sizeof(struct ffa_composite_mem_region)) {
+	if (check_add_overflow(offset, sizeof(struct ffa_composite_mem_region), &checked_offset)) {
+		ret = FFA_RET_INVALID_PARAMETERS;
+		goto out_unlock;
+	}
+
+	if (fraglen < checked_offset) {
 		ret = FFA_RET_INVALID_PARAMETERS;
 		goto out_unlock;
 	}
-- 
2.51.0.858.gf9c4a03a3a-goog


