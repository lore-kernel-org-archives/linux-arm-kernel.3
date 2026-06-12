Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C909CD98D6
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Jun 2026 14:23:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W+oMnuoNcP2dDCb/ggwjh0luXU4L3Te1sVGigfxt6Ig=; b=2ZA3CK9LYnUs4PMggaYdJDTrJQ
	Up0/oGAZkhLXxPKwX8YZ6RahtEhWoaiyUJq+eDbBsSQEg3o+zYPTEKSZ5iaxpTkgdmuIi8GTcQQbc
	HimDtid8JdBJ6KFeOEid7bMyP/aVavmGxWLoSw5KZEMVg/ZQb/Y5ibTHiBSgkraynzri91oEwa6UC
	SJAPiY2J+GDPcv3NEx1Y9UlpwkitW9C+TawqvKMS73lDOqdk0Tifa0nxOrB5Mccw4JnuwI3n+AE3Q
	CQIafjWntn915ObA0RqLYuz0BqZ8hUjodDcdmqTKrWRqRaTHh7BstFSCQY4bYnIKOVdR4Cjg+/HO+
	qCNLoZCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY2mj-0000000B3AL-1bTF;
	Fri, 12 Jun 2026 14:23:01 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY2mg-0000000B37e-1Yrv
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Jun 2026 14:22:59 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-490b4d3d3e6so7482905e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Jun 2026 07:22:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781274176; x=1781878976; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=W+oMnuoNcP2dDCb/ggwjh0luXU4L3Te1sVGigfxt6Ig=;
        b=hR9VSBZJg8drnWZqCI9GqdNpcpyYq7gyBoVjisclZY3kJF7Bio1zF5kD9EVwams26e
         wAXkI6tVJQMO7js/0dj2ivrx3IOiKpMOf1XNoP5KUfLdCGc1VyB6yOkR4MlIgiy/PJNs
         2pOkBj46JxYzKaoaNV5rwhRIw84esd6set8G6ASuwRJ7oDWvj2DUCzcUSVesnoxV6W9V
         hGmSJmObjTOdVUEdtp8lwz00SiTegaCwgmIBvcZ2iivNSfP4ZJYkqP1/OSQoDiG5DYTr
         jng61p22zB79uIAILnrIekj6ElRbVhYJtskh6FitXrSr/OGEkIg/aGgEa1gM/5oeaAaT
         M1/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781274176; x=1781878976;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=W+oMnuoNcP2dDCb/ggwjh0luXU4L3Te1sVGigfxt6Ig=;
        b=MzwrXN0RZIlqCXobksEN/L0QDVo57coms/nyAJRZk436v6s3CXGZfVCysoVUNtsGS2
         iSdlTva7QM4q4GY7wlHBmIA2yQrUab1CLIFlot3gYFV8TBHWNjHtxYrcM6kVEPUm9ura
         M0OJOOGYV0rrO6tTMM0FqdUFlgyPQeFA0Ol+Mac4AgBGQYze/TgKokpTThQnnsNCPM41
         iwIeKAar+7IO06BTaizImmIKtuA/H8ImIW4in8oWzd08C66kCRHmZLEB2nBxoqXBsH8M
         DOq5d421xIOVKej+up5NQhe51D0f4QlBpgWSiuOQCOG6SxIsuLTyCoVSwVNc9lHX+7Xb
         ElOg==
X-Gm-Message-State: AOJu0YxJmKcUD5Ae6tfezZAAB3sxsAY/QLFT64dwlvl5266mSa9fM9UZ
	cp+OKuf9AsMIU1ohm+rrtakc0UyDbFDCSKhAgImd6+FS8FImvJ/aRL42jfHHQpfCZcNH2bnRWJb
	gqf84iuFb8iOws8VAJcHIpg==
X-Received: from wmmr8.prod.google.com ([2002:a05:600c:4248:b0:490:bd6f:3b92])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3b15:b0:490:b189:212d with SMTP id 5b1f17b1804b1-490ec522d44mr42776115e9.33.1781274175762;
 Fri, 12 Jun 2026 07:22:55 -0700 (PDT)
Date: Fri, 12 Jun 2026 15:22:43 +0100
In-Reply-To: <20260612142245.1015744-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20260612142245.1015744-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.54.0.1136.gdb2ca164c4-goog
Message-ID: <20260612142245.1015744-3-vdonnefort@google.com>
Subject: [PATCH v1 2/4] KVM: arm64: Move kvm_define_hypevents.h to arch/arm64/kvm/
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, 
	will@kernel.org, rostedt@goodmis.org
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kernel-team@android.com, tabba@google.com, qerret@google.com, 
	Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260612_072258_414904_7159D667 
X-CRM114-Status: UNSURE (   8.57  )
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

kvm_define_hypevents.h is used to define the kernel-side structures for
hypervisor events. It doesn't need to be used anywhere else than in
hyp_trace.c.

Move it to arch/arm64/kvm/

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>

diff --git a/arch/arm64/include/asm/kvm_define_hypevents.h b/arch/arm64/kvm/define_hypevents.h
similarity index 100%
rename from arch/arm64/include/asm/kvm_define_hypevents.h
rename to arch/arm64/kvm/define_hypevents.h
diff --git a/arch/arm64/kvm/hyp_trace.c b/arch/arm64/kvm/hyp_trace.c
index c4b3ee552131..821bc93ecdd1 100644
--- a/arch/arm64/kvm/hyp_trace.c
+++ b/arch/arm64/kvm/hyp_trace.c
@@ -391,7 +391,7 @@ static struct trace_remote_callbacks trace_remote_callbacks = {
 
 static const char *__hyp_enter_exit_reason_str(u8 reason);
 
-#include <asm/kvm_define_hypevents.h>
+#include "define_hypevents.h"
 
 static const char *__hyp_enter_exit_reason_str(u8 reason)
 {
-- 
2.54.0.1136.gdb2ca164c4-goog


