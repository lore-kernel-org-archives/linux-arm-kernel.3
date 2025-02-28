Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C98BEC19776
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Feb 2025 12:21:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=TNd3VmeY+7xSqSUKAYqv/5mTt/52Q+ubddKUOdAsyfE=; b=4xSnLrnQvypyiYEKK2wRkN+qJb
	rBNCFUOWFLwxPzYT/w5jLLLGzF8rdZE4mEVubHAXcwd1FCq+/AkA7q2LhPjMzv4t4GOJr1PRChKTh
	JafCFk/f/TnjKOdLm9BZYpVROFY1ptY3domVxAos/UmLyMHPYyCz/Nqef2CUFSYxEnGmZf9cTpsRc
	GBaWok889uE0yOi57btjG3VcUUj5sjosNi8Y7zhDTnTqty+Xr9gs1WADEL4cArxi2yGHT4YgChIN6
	UYzbhnWry9Lq+R7i9SOmvPvgu8ge8QSrWXiYHGO7OMlpdAc0YvSnLavivn+DLVXGrxgvEByK8pQKG
	wKby9SOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnzMO-0000000At0D-3al5;
	Fri, 28 Feb 2025 12:20:56 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnzFi-0000000ArP9-1ZMJ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Feb 2025 12:14:03 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-4394040fea1so10785325e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 28 Feb 2025 04:14:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1740744840; x=1741349640; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=TNd3VmeY+7xSqSUKAYqv/5mTt/52Q+ubddKUOdAsyfE=;
        b=25jrEJjFL0WOzwiq/vtnLV6nnQfh7pLaEyvci7g0XLLfmKXZkgdKZkM5/i2dJrFiVR
         kyUbDh6YXysvvB4TvAOoUPNTZpS28c8fncACt9jR1MfiA4TsCUy2JRhHjyOgftwbJ5Nx
         M5cOSmiyXCFPdfYYS50mlUYMPGzrBAyLZL/pbYXgbvdHYAG83LG1i+viMj7hM2n4Zn49
         sXL1PEtjXzanhTvXn7vbkOkA295jxlm15WC8dM1kMM5HPv829kOfeCLHdWTxkxpo8jBv
         YwQIqQScSXpw8z3fU6YYRVw6WkROhBdsC5Qovn46kmh3rKsm0t2mGs9HMzKHSgQV6TJW
         7KSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740744840; x=1741349640;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TNd3VmeY+7xSqSUKAYqv/5mTt/52Q+ubddKUOdAsyfE=;
        b=XpQ3e4UUxpglYo0S3ceMr9uqQKEURFxsy9bNts+HsjM5F5neygA1+8OR7zpqc72LgB
         DSZKk/0De0NlkGPIRcdC3ZRbQoBzQZW8tRq1GJ3+IsYVcoa17HHiqCT5ZKC5+nGYNibT
         etJheBIW8o7GcCpwQsP3QbQWIsnngFk3qob9Gf6LSf6qGt/Zi5sPJ4sGY7pfmXh4t3xR
         2EbvSyPmztJWISMkYFmLz2nevWW5dIieS/1IX9VSmRZ172NsB7kfrHuJWKjGpgSAf5Iq
         x9RuZfAuzfYaRhOKfjqL3GDk/ZdQ2GUP5raO7kde2UhmY2vZ4YXzI24W+ERgP8BTB4Pu
         JnoQ==
X-Forwarded-Encrypted: i=1; AJvYcCVFjPBBnVEtvS5wlKhL1ZpGDi9Avjz6ABI18gzNHn06LO6TTs68wxHkTWeexN3OtHsUbAj7lbnt0QbfAavJrxPo@lists.infradead.org
X-Gm-Message-State: AOJu0Ywa/RRcTQAyKxP3FT2HMCMO6rDlhdGIJZPL5zkWlTYmcoalPbef
	Ztv5l/lJde8pv3bRLd8xE3viI2YkJhY1EIIhsQ8JLULsC6ipbwwg+oBxOrEViuWRUH/cqiFt6Nb
	CabUn0Yhy0CGuT3QUrQ==
X-Google-Smtp-Source: AGHT+IG4L89EaIN2eXPjkLGcoxrC+ORfJM4P6Y4KMuCicg/cPi8Y4oD53yPu3O03f+S5mbgyiQt9/c+vvm0KdwsX
X-Received: from wmbep25.prod.google.com ([2002:a05:600c:8419:b0:439:54cd:da63])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:1e12:b0:439:9536:fa6b with SMTP id 5b1f17b1804b1-43b04dc34d4mr64976615e9.13.1740744840263;
 Fri, 28 Feb 2025 04:14:00 -0800 (PST)
Date: Fri, 28 Feb 2025 12:13:55 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.48.1.711.g2feabab25a-goog
Message-ID: <20250228121355.1377891-1-vdonnefort@google.com>
Subject: [PATCH] KVM: arm64: Count pKVM stage-2 usage in secondary pagetable stats
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, 
	will@kernel.org
Cc: qperret@google.com, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org, kernel-team@android.com, 
	Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250228_041402_413053_4F5E4B70 
X-CRM114-Status: UNSURE (   8.63  )
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

Count the pages used by pKVM for the guest stage-2 in memory stats under
secondary pagetable stats, similarly to what the VHE mode does.

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>

diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index 1f55b0c7b11d..c2e022c41313 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -1088,12 +1088,18 @@ void kvm_free_stage2_pgd(struct kvm_s2_mmu *mmu)
 
 static void hyp_mc_free_fn(void *addr, void *unused)
 {
+	kvm_account_pgtable_pages(addr, -1);
 	free_page((unsigned long)addr);
 }
 
 static void *hyp_mc_alloc_fn(void *unused)
 {
-	return (void *)__get_free_page(GFP_KERNEL_ACCOUNT);
+	void *addr = (void *)__get_free_page(GFP_KERNEL_ACCOUNT);
+
+	if (addr)
+		kvm_account_pgtable_pages(addr, 1);
+
+	return addr;
 }
 
 void free_hyp_memcache(struct kvm_hyp_memcache *mc)

base-commit: d082ecbc71e9e0bf49883ee4afd435a77a5101b6
-- 
2.48.1.711.g2feabab25a-goog


