Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C06DC369BA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Apr 2025 16:10:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4H1rdwsdSrifJxMs5eiLI+4nIAiDgFXwyzylypkYumU=; b=I2u8vKMyJyyBwEOUFKkrlMhrIB
	CMcGcUUC+DuUF7qcobkgidej7Q7zwhJctM8WxSarrmiAKK2uzpuIQOX5PQ3mqFMVLXWrp/xhY2vtB
	+RaZXAaZYhYFN9MlwN4s7KsKs8XgOQJ85U+krC0mLBaXJYQgautpUkj5B2dyT7W4ct6alN7HXsDiN
	7C1918LzlyyTHyAAyFY2sJ78P2NKxVzINv+oaeVLrMZPW9pm+ruEMNeASCCqpYklmxWSBjHRU8TTs
	sC/SqLSzr7hHe0uMbjOZ3PcQ51ovgcQ0tvvV16pKggOq99+GIXG29gsiwhwA851wMiAiAqN2fToAk
	LsCY5zvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u55LT-0000000ACHH-2GnF;
	Wed, 16 Apr 2025 16:10:39 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u54fC-0000000A4SX-3SKP
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 16 Apr 2025 15:26:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:Mime-Version:Date:Sender:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=4H1rdwsdSrifJxMs5eiLI+4nIAiDgFXwyzylypkYumU=; b=OtF+e1jw4KavCh2tMU71Q1kgLU
	RzVwyivymjpCNKxg7d650ufhh0qopKmAUBmLxIh8uEG7hUqFC9jHIlb5Qvh/9Zk76J3JuCkl2CbwO
	d2STwjs+gw5/ccCkZCQab1xK+WbJquf2QgrBtCth80ghLkkbXDGqpzNDItNbaH22oOtRFjVmnx9Q5
	Bc2i6TscBruqo2sUxizHF+aYCg0sYaVWHyT/FHbWmBL6HvblEmU1taDgiAzbnjP/J5mc+LqnHipLZ
	FEJJYWreKJuZqhLk5wcp9L69QsXSbBC1BAFJtunTrM80WElkBnpl58wkEckAF+3CLOjFzPKbq6Ik3
	+mmMJwvQ==;
Received: from mail-ed1-x54a.google.com ([2a00:1450:4864:20::54a])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u54f8-0000000A7ed-3A6F
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Apr 2025 15:26:56 +0000
Received: by mail-ed1-x54a.google.com with SMTP id 4fb4d7f45d1cf-5e83e38d21aso7171697a12.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Apr 2025 08:26:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744817211; x=1745422011; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=4H1rdwsdSrifJxMs5eiLI+4nIAiDgFXwyzylypkYumU=;
        b=3mZyGwZADDTpejC9gTlq3NsVA0q6juwgc6e2xUd1pVGq9AQ5taFFOplTvDtxQElUNJ
         8H79kj2A/FUBb+s2EQ/r8UADkTDlKio1ArsywfOYabUHBAtjhdUzNrAfDYMuRWUuTdbq
         0uIiUEC5TYU1w4PT/ivl5Vudw63EsskdNucInb/lzD7DiCXyPGhFZ8xXtDcoxfXFMnJz
         +yDl74JbTtzMxA7hR62B3SfHWovVxDVlYSp8k1ajlO4j1EPlN8JaeGVhtzXHlsT5a/Iw
         4czAu/XMah+3lu/NRRiZjS8AJF4B+kra4F4LNrHkKBtHTK3xx1AhQdLe1zEbWm7/y9+U
         9rww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744817211; x=1745422011;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4H1rdwsdSrifJxMs5eiLI+4nIAiDgFXwyzylypkYumU=;
        b=nvON/lAklxB6L+iQato38EG8TJ8V6nl8iXEFLwzZfrOXIc/7OhmIbO9iWwGejX5kjV
         SsIe7Bv3KCwLlGmEUAipExhCWO5u34sgdhXuSj8R8V5wriOArYx4mLB35xVhQ6egXC12
         ak6yveEvHmkYtxvBKKuAdxzdO7cym9nfXNBIA4nb/0DeKQ/shdE2wu5timzXgCKgoPmz
         kTk/BCYeC/r2e7MmTL2bTTL8EEvYtohYoW+6JOjG/FiTwgXrk5W87qzAxiD46hCkCs4n
         SLbPYfbWvZR+GqhHAW9ELtaq+ni7+vr/LCMNIFWFiSfH2s0N7vFD2n8vzWvaPA5H6ZDv
         9gyg==
X-Forwarded-Encrypted: i=1; AJvYcCVYf99vDENx0yRCiE8rKR9wux6l4O30eKrEdi6elJutkQE0Mv/htwteUSdxR1ymPc+9rrbSFXyt7Wj9LSnnFO55@lists.infradead.org
X-Gm-Message-State: AOJu0YyAYlOeev7LqBKrceVn7vgewfgxDuIr9JfKnaCpVz3+Kv41V3py
	/ogRMEI/68hqrl8l047DEDC7KzN7ty54gAgbxl+0cPYfU7uHwHBuxG9qeK1HGnabrXhTo47UFdl
	WraVJLg==
X-Google-Smtp-Source: AGHT+IHuqk+2+OpJM1qcSmjpRDqa8HEvy7iDhIfBrhRdZNtdJ2xDUzaYWX9wIlKoApyZVheRJqd8RH//SOf0
X-Received: from edbcf8.prod.google.com ([2002:a05:6402:b88:b0:5ec:bf29:2e78])
 (user=qperret job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6402:849:b0:5f3:4194:187
 with SMTP id 4fb4d7f45d1cf-5f4b75a6b98mr1899450a12.18.1744817210816; Wed, 16
 Apr 2025 08:26:50 -0700 (PDT)
Date: Wed, 16 Apr 2025 15:26:40 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.49.0.604.gff1f9ca942-goog
Message-ID: <20250416152648.2982950-1-qperret@google.com>
Subject: [PATCH v2 0/7] Move pKVM ownership state to hyp_vmemmap
From: Quentin Perret <qperret@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>
Cc: Vincent Donnefort <vdonnefort@google.com>, Fuad Tabba <tabba@google.com>, 
	Quentin Perret <qperret@google.com>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250416_162654_968761_DAA29040 
X-CRM114-Status: UNSURE (   9.87  )
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

Hi all,

This series moves the hypervisor's ownership state to the hyp_vmemmap,
as discussed in [1]. The two main benefits are:

 1. much cheaper hyp state lookups, since we can avoid the hyp stage-1
    page-table walk;

 2. de-correlates the hyp state from the presence of a mapping in the
    linear map range of the hypervisor; which enables a bunch of
    clean-ups in the existing code and will simplify the introduction of
    other features in the future (hyp tracing, ...)

Patch 01 is a self-sufficient cleanup that I found thanks to patch 06.
Patch 02 is another self-sufficient cleanup that came out from the
discussion with Marc at [2]. Patches 03-05 implement the aforementioned
migration of the hyp state to the vmemmap. Patches 06 and 07 are further
improvements enabled by that migration.

Changes since v1:
 - fixed page-tracking comments in nvhe/memory.h
 - rebased on 6.15-rc2
 - applied Marc's Reviewed-by

Thanks,
Quentin

[1] https://lore.kernel.org/kvmarm/Z79ZJVOHtNu6YsVt@google.com/
[2] https://lore.kernel.org/kvmarm/867c4pnspi.wl-maz@kernel.org/

Fuad Tabba (1):
  KVM: arm64: Track SVE state in the hypervisor vcpu structure

Quentin Perret (6):
  KVM: arm64: Fix pKVM page-tracking comments
  KVM: arm64: Use 0b11 for encoding PKVM_NOPAGE
  KVM: arm64: Introduce {get,set}_host_state() helpers
  KVM: arm64: Move hyp state to hyp_vmemmap
  KVM: arm64: Defer EL2 stage-1 mapping on share
  KVM: arm64: Unconditionally cross check hyp state

 arch/arm64/include/asm/kvm_host.h        |  12 +--
 arch/arm64/kvm/hyp/include/nvhe/memory.h |  58 ++++++++++---
 arch/arm64/kvm/hyp/nvhe/hyp-main.c       |   4 -
 arch/arm64/kvm/hyp/nvhe/mem_protect.c    | 106 ++++++++++++-----------
 arch/arm64/kvm/hyp/nvhe/pkvm.c           |  47 +++++++++-
 arch/arm64/kvm/hyp/nvhe/setup.c          |  10 ++-
 6 files changed, 158 insertions(+), 79 deletions(-)

-- 
2.49.0.604.gff1f9ca942-goog


