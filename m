Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72387CD5BAC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 May 2026 14:36:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=T/CKmmYoXfOPyCGY+f2aKlu9jEIQ4PB7UXOrFoPQagc=; b=XLUYvF5lpELh69KLg8UjfHQufz
	8yvKMXdrEbU8nxZqQiYMyyH7Yw4QhlPx6GP/qV9PoCbBhEng4znW2SpaP2s73lY/XtQ3p0wuZ3NRM
	algnExtEU0Jokcz1ulvVQREWNxlC7s/kERz5PeCkhkPy6MlyJKbicEobDYIAioi9cIA2xw7pRwAEa
	oKsOFspRvqacepu/DKqfPvl1lbxXmz32TBth40Xuc3fu9nY8DubXmll00+Czx1XlN58nPcU1sN1AD
	ydk4Y8h/ncIqmDDGygIJtitTESB12K6gIYZ/S5wia2lvklIObt0LbGGl4sd65jajT8fe+AYzdSK3x
	5PZr/sGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ4Vl-000000085g2-2C6p;
	Thu, 21 May 2026 14:36:33 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ4Vj-000000085e8-14H1
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 May 2026 14:36:32 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-48fdad6cce4so27619125e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 21 May 2026 07:36:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779374189; x=1779978989; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=T/CKmmYoXfOPyCGY+f2aKlu9jEIQ4PB7UXOrFoPQagc=;
        b=MQnECrrAuOSdhzv7Bj8+euyaLi7tLleXO7wTUpMKRlemzIKVrSgs/o3dzqehQaHWRH
         BcqTyCqASkb9lAQi9/G2z1HxRsNs7cv8uk7CbfcnK4FcNXumnAKiWkkTZTY0wxDkwRq5
         7CQ9ucJ7LwDr+YCWk19DoBKnNaFETp1TT011kwqgUhfivVPSt5wG6LIpUnsdjmE0H1o3
         6pJz2mU4qWh4TDKFeuHQlZBTM+QKnQOIV5NcOsI0DUttGM4Xc17wVo0Us4ODMyHr0LRw
         aU1/wTF2Iw/ir+H1wrXkdF2X4vUr90zy1wOeB6Jd7bFObgdZssi7PZKHhSbat0Ds1Lar
         GfoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779374189; x=1779978989;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=T/CKmmYoXfOPyCGY+f2aKlu9jEIQ4PB7UXOrFoPQagc=;
        b=jILAj/XDRufgt3SmW6RMoWLrXXfeHvUyLbj0NekMK5jC3Wl/C8oSL2k7AcAO0pefvs
         fp9N17iRr5jlOP7npTPDXqZZHLeAevKuK3KQR+HgemSS7OXRv7XwpZIO1s0UFSUOxBAW
         hq3q2ols1H5QyjeuK1rcsyhI8cVCcuhCyETgu3ndX/NsnFaVMADzUcxGaIjklkRAmitK
         +vs2oieJxWulpad1J0HcsLwv8pdj50rhQYSpmCyK9LCKmCM/EL7B9MeS7ZaVdIwzYsPj
         7KTEctBknsOJq59TilGZLeXafvioCYc6s7XA2n1zFp7XSeeDyEjdDs9ADOYE26xZj0CW
         goOQ==
X-Gm-Message-State: AOJu0YzaPlA6QD8EVWKI6pVDAqRFpLMwCMxglDLo1mnaaELHYGIN0l7V
	3/+MkstyUKf4mrPXPaVfpRQROy62evgW7Yn/Ibk8L7M0+gj96ofv8xuJRsJojfkASkLdRZtuFrW
	UoRzSgKlUI6+fIoiHNzF26A==
X-Received: from wrsh4.prod.google.com ([2002:adf:fd44:0:b0:449:b698:a193])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:c04f:b0:48e:8eb0:4957 with SMTP id 5b1f17b1804b1-49035f2527amr36717905e9.2.1779374188575;
 Thu, 21 May 2026 07:36:28 -0700 (PDT)
Date: Thu, 21 May 2026 15:36:23 +0100
Mime-Version: 1.0
X-Mailer: git-send-email 2.54.0.746.g67dd491aae-goog
Message-ID: <20260521143626.1005660-1-vdonnefort@google.com>
Subject: [RESEND v3 0/3] Fix __pkvm_init_vm error path
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, 
	will@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kernel-team@android.com, qperret@google.com, tabba@google.com, 
	Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260521_073631_292910_BCB86B9D 
X-CRM114-Status: UNSURE (   7.82  )
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

Sashiko reported a potential refcount leak in the unlikely case where
insert_vm_table_entry fails.

While at it, I have added a fail-safe to __pkvm_hyp_donate_host to ensure this
function doesn't allow leaking refcounted pages.

Changes since v3:
 
  * Enforce order-0 for external pages, making the vmemmap ->order field
    completely private to hyp_pool.

Changes since v2 (https://lore.kernel.org/all/20260521102149.804874-1-vdonnefort@google.com/):
  
  * Proactively init hyp_page order field in hyp_pool_init  

v1 (https://lore.kernel.org/all/20260521081250.655226-1-vdonnefort@google.com/)


Vincent Donnefort (3):
  KVM: arm64: Reset page order in pKVM hyp_pool
  KVM: arm64: Fix __pkvm_init_vm error path
  KVM: arm64: Add fail-safe for refcounted pages in
    __pkvm_hyp_donate_host

 arch/arm64/kvm/hyp/include/nvhe/mem_protect.h |  1 +
 arch/arm64/kvm/hyp/nvhe/mem_protect.c         | 35 +++++++++++++------
 arch/arm64/kvm/hyp/nvhe/page_alloc.c          | 21 ++++++++---
 arch/arm64/kvm/hyp/nvhe/pkvm.c                |  4 ++-
 4 files changed, 45 insertions(+), 16 deletions(-)


base-commit: 5200f5f493f79f14bbdc349e402a40dfb32f23c8
-- 
2.54.0.746.g67dd491aae-goog


