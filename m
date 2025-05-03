Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18131C369D9
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  3 May 2025 11:28:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jEy2dzK1CfY22N91JTriuMXrrKPXV1plVaNkK6ipqjE=; b=bshWfPoEZSgE/6o0/UFq+mEm2Q
	W0gVzvsVeE0R09pzXx2h1VuO9rSGJDOmVvKHV6g4N4Bb/LG6Gg1YsoRCugK/Y+AhgW31P7c/6kmju
	T6mbmI00V/kipuQ5nMk2dO7+AXnY62TNSaKsOGv9fZVWM44TJSwnkqDYB6KqOxNiNCglA+8gYZ5cQ
	7TnmuEbPL+NOGj4/2goTOBHOla+Ss6C122ZRix8kpvHnqV6tfXLHb5JZH/WDrQKdb7kyIogeWSDyO
	L2fzptr6vdhiDjaQskdZGnZBDrG9RVThOEk/kezbA0f4wvFoYxAiApIOQNw55w1pmFHRyAJi4ZzEN
	gA3wTImA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBB2z-00000003oRP-37dG;
	Sat, 03 May 2025 11:28:45 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBAxI-00000003nza-1h64
	for linux-arm-kernel@lists.infradead.org;
	Sat, 03 May 2025 11:22:53 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-43d5ca7c86aso16444795e9.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 03 May 2025 04:22:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746271370; x=1746876170; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=jEy2dzK1CfY22N91JTriuMXrrKPXV1plVaNkK6ipqjE=;
        b=f1dreX22PBAlathrJ+17+15BHfi2A/wtJI/R0ZBeXx0lcnpOqkgxdgMrj0/XE5pWNI
         FzEr2fvoLqWQGQzArnTUzjKlQ3nEmwajvk/3n0PrwayK4urVy9bAopyZz1d4XZ/1KSP3
         hjPTB5ouwtekRsSTsAmu9kBlCOXm5kECAygXBqOWiU5+Oh1ktHU2C4Q56ODtI+ezMFkn
         GcBvEsevvxgwwjAfAIalMpuJ/yvS/JoDnwmepz+WbrEWQJWd96AYt7g60y7hiYn47TQo
         WA8kc1aukyo3py0o9ABOyLZ/g7mkDW69DcoVWlRrgPil5s8Dr//twPUi0HYLZOPskAds
         NQqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746271370; x=1746876170;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jEy2dzK1CfY22N91JTriuMXrrKPXV1plVaNkK6ipqjE=;
        b=oFjTqL1EKGrcA6/52KLZs1xmKfH4mX4ALoE3GdPwqj8/j0l/33uQMKYsy6kVOna5PE
         w5CG5rJz7/lFW69kjdGgwC69Xf52I/zqmKB9Z55djU10YpC616BgZGVEpw0h+eN1TjDm
         Y3y45csMoyIoldqPzNYKmHnkZtHmyr7F9S8jQxLIwjKa8XYqXwz4Vmr/uu40KPYgjSrQ
         SllSAZ14JWQAwJHacRCYwBUGa41FSKPiyZfN3zVquoJl5JXFZH731E0Gh5MU0X4SINjf
         hx3BJzXa9YpQaPHrOet2OEfO0j9ygQ7L847y7JOcVebrlCXyhlMJ0Oyxv7L9xZn0xsIP
         n3GQ==
X-Gm-Message-State: AOJu0YxYcuvqLoc7E6emqZHklxLoEij6wSkYp3JVO7JWnxL/lyY1EoAO
	uWccvOe4bY5miUfqi7SVQrnlF9PGuoGVtTO/3wf/PfJW9gHNHLE88pl6Puq2ES+QhJNMnltZ1n2
	p7fllenX2P/QqhwYAx9rYuxiY4/CG8NU6PqDN9VHlhEN6Jw/rCaMm/lmWbnVjgFoVfXyam2FJwF
	mDVbkfv99m4p5ZEbHDFz5Q735R30JZONDolWCYUDlQ
X-Google-Smtp-Source: AGHT+IHtyEmjTf996TScnc9rNYSDGzCIfB73VkA62s/k7MjtMyfOp3/sC6ByzFU+INk5DTveL/kLKzLT
X-Received: from wmbes9.prod.google.com ([2002:a05:600c:8109:b0:43b:d523:6ad8])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:350e:b0:43c:e478:889
 with SMTP id 5b1f17b1804b1-441bbe2c815mr56213835e9.0.1746271370173; Sat, 03
 May 2025 04:22:50 -0700 (PDT)
Date: Sat,  3 May 2025 13:21:39 +0200
In-Reply-To: <20250503112137.1962910-5-ardb+git@google.com>
Mime-Version: 1.0
References: <20250503112137.1962910-5-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=2602; i=ardb@kernel.org;
 h=from:subject; bh=3mTSEZ1dW7QwAe+xdFMTtJ+M2UkpWDSJCGZmF4mmZBs=;
 b=owGbwMvMwCFmkMcZplerG8N4Wi2JIUP0jzOzUaNl8abjX4L2Jb549miO1dubsc+UH3xe6nt/2
 opXAg93dZSyMIhxMMiKKbIIzP77bufpiVK1zrNkYeawMoEMYeDiFICJ+GxiZDglEp+gk8UW5GyU
 5tT9iP3d5zCe3nftkXYLliedOqr7wI7hf166mF62jWq3vfpcDdGrflp8v88XhBzdo7Ms543XIuZ 77AA=
X-Mailer: git-send-email 2.49.0.906.g1f30a19c02-goog
Message-ID: <20250503112137.1962910-6-ardb+git@google.com>
Subject: [PATCH 1/3] arm64/boot: Move init_pgdir[] into __pi_ namespace
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, will@kernel.org, catalin.marinas@arm.com, 
	mark.rutland@arm.com, Ard Biesheuvel <ardb@kernel.org>, Yeoreum Yun <yeoreum.yun@arm.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250503_042252_443256_5AF46368 
X-CRM114-Status: GOOD (  13.69  )
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

From: Ard Biesheuvel <ardb@kernel.org>

init_pgdir[] is only referenced from the startup code, but lives after
BSS in the linker map. Before tightening the rules about accessing BSS
from startup code, move init_pgdir[] into the __pi_ namespace, so it
does not need to be exported explicitly.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/arm64/include/asm/pgtable.h | 2 --
 arch/arm64/kernel/image-vars.h   | 2 --
 arch/arm64/kernel/pi/pi.h        | 1 +
 arch/arm64/kernel/vmlinux.lds.S  | 4 ++--
 4 files changed, 3 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
index d3b538be1500..6a040f0bbfe1 100644
--- a/arch/arm64/include/asm/pgtable.h
+++ b/arch/arm64/include/asm/pgtable.h
@@ -754,8 +754,6 @@ static inline bool pud_table(pud_t pud) { return true; }
 				 PUD_TYPE_TABLE)
 #endif
 
-extern pgd_t init_pg_dir[];
-extern pgd_t init_pg_end[];
 extern pgd_t swapper_pg_dir[];
 extern pgd_t idmap_pg_dir[];
 extern pgd_t tramp_pg_dir[];
diff --git a/arch/arm64/kernel/image-vars.h b/arch/arm64/kernel/image-vars.h
index 5e3c4b58f279..a0977f7cd3ec 100644
--- a/arch/arm64/kernel/image-vars.h
+++ b/arch/arm64/kernel/image-vars.h
@@ -56,8 +56,6 @@ PROVIDE(__pi_memstart_offset_seed	= memstart_offset_seed);
 
 PROVIDE(__pi_init_idmap_pg_dir		= init_idmap_pg_dir);
 PROVIDE(__pi_init_idmap_pg_end		= init_idmap_pg_end);
-PROVIDE(__pi_init_pg_dir		= init_pg_dir);
-PROVIDE(__pi_init_pg_end		= init_pg_end);
 PROVIDE(__pi_swapper_pg_dir		= swapper_pg_dir);
 
 PROVIDE(__pi__text			= _text);
diff --git a/arch/arm64/kernel/pi/pi.h b/arch/arm64/kernel/pi/pi.h
index c91e5e965cd3..38a908d048e8 100644
--- a/arch/arm64/kernel/pi/pi.h
+++ b/arch/arm64/kernel/pi/pi.h
@@ -22,6 +22,7 @@ static inline void *prel64_to_pointer(const prel64_t *offset)
 extern bool dynamic_scs_is_enabled;
 
 extern pgd_t init_idmap_pg_dir[], init_idmap_pg_end[];
+extern pgd_t init_pg_dir[];
 
 void init_feature_override(u64 boot_status, const void *fdt, int chosen);
 u64 kaslr_early_init(void *fdt, int chosen);
diff --git a/arch/arm64/kernel/vmlinux.lds.S b/arch/arm64/kernel/vmlinux.lds.S
index e73326bd3ff7..73fa57f341b0 100644
--- a/arch/arm64/kernel/vmlinux.lds.S
+++ b/arch/arm64/kernel/vmlinux.lds.S
@@ -321,9 +321,9 @@ SECTIONS
 	BSS_SECTION(SBSS_ALIGN, 0, 0)
 
 	. = ALIGN(PAGE_SIZE);
-	init_pg_dir = .;
+	__pi_init_pg_dir = .;
 	. += INIT_DIR_SIZE;
-	init_pg_end = .;
+	__pi_init_pg_end = .;
 	/* end of zero-init region */
 
 	. += SZ_4K;		/* stack for the early C runtime */
-- 
2.49.0.906.g1f30a19c02-goog


