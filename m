Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 086A6CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Nov 2025 09:21:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=hgEcLDRr6Tuu7IvCUwV3SctU6MLFo2MRbp0TndvBGx0=; b=GB0KRYA2jNxe4BigBJ9xKfeshH
	lQkm9q4GrhXDklpqz1qPQEgC+OlhprhxQiOukBP5QOjo/drcujcftAbP3isJ6w3wjeUZx9N3I/aC5
	sKcwOr3u0dcse0OIMieJMSE81Wduwiik7NrrzV1yq1BUX8RLqi+0G8UMp01xIA9zFvE3hco80S82q
	zYPbNJOPVTY3OV5XdU2Aa0gtbtJd4IfxluGrMNpzgcLoOXDPpae3P2Pktky2a0ypzv/Exvujy0F07
	Y2h3DXhaaAFqd7RzyOYE9cTmnGhtSeUTIK/hK5ZQjqhk8r7WWnuhZQAbHDb5YKlATlzLKLSbgPlfO
	hHBRIKHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ727-00000008Ro4-3a0Q;
	Wed, 12 Nov 2025 09:20:55 +0000
Received: from mail-ed1-x549.google.com ([2a00:1450:4864:20::549])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ726-00000008RnQ-0eFQ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Nov 2025 09:20:55 +0000
Received: by mail-ed1-x549.google.com with SMTP id 4fb4d7f45d1cf-6430e4b5f04so606333a12.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Nov 2025 01:20:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1762939252; x=1763544052; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=hgEcLDRr6Tuu7IvCUwV3SctU6MLFo2MRbp0TndvBGx0=;
        b=NROYSTYm2V2xQC+hLwsvOcKge1McrEgsNFAi9j5HqD77QPBgxsW/ycGeh6eNhQQYmL
         TvOJkg6QUq1nN95S9OJV57oel07J6hp8uoJN3LAzb6KWzXw02nboGDwmblalo6W4wFrP
         1sDrDX+pVm1lMupxOSocBCrKjBMKXrkJFmO/WpVw4VfjEkN552uMBypY7GufHkj9RJpG
         F+SYVW3VIwc07gpGRrf/xIT+vh0Nzq3an0YQR/ts3IuBx+Wnz7oQpGQScnfLY2Oc0kV4
         rEm3T/gnvU47KdXUkqQquoAXOhVdKZrIxrKL4FF1niRLTiCIM25FyIzHOEHbFT78tP2m
         va2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762939252; x=1763544052;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hgEcLDRr6Tuu7IvCUwV3SctU6MLFo2MRbp0TndvBGx0=;
        b=ncYvt4XIhEecXwd7JkcCOBd6u/kSDEhkYFPqAlcqVDbiwY2truUoMB34eI+ozLtbVA
         orVUh+jo0MyNwzUfcgZ2s5+h2yVOjnE+l7swCMw7zCI7kocVnIQOYXvMPZSw6aWKq3iV
         HlNwKk5026TrKzpRd4QaMsdQlVi07g643SUkQG1HOdgdwLfkx/xBbtCPV7bVOwNvJ4Zo
         UJpAUpqv30sgLW18TEu3GcTX98KT9Eu4Ft9lM8Ne97mvPxPcSmCDMGwumuaygHMTlMdj
         RIu24kHbiKgccHettsKdiujwjypjXZ5uqhOicPIh9DVU41inEaBbUQDaRmVaXxPI9S7F
         LZJw==
X-Forwarded-Encrypted: i=1; AJvYcCXM44sntEqEUd2d719Ny8xDo3/Q9UjCRXN8faymp4uS0e6N/3aSV56N+68bFPH5+yVoV/gFX7V6/QnKMKIyVzk5@lists.infradead.org
X-Gm-Message-State: AOJu0Yw2vcnr+lIGXnTvHNpgPFQerD/w0mt4Tf9jYDa9RpcjC60+pDqE
	JoZYq+2I2z8/hPf3pBrXu4KhMGyhn+SBnEo7XY56/yO+vUTlhfziG1kd4DIKPMhi/n50awyVxW0
	8aw==
X-Google-Smtp-Source: AGHT+IHPPe+NMCZTO15BeXq0hd/6XgQYGiDPSJtHZiUQftHC3g+VM72JYLtBxstJSv5eAuQh+oTPoWs5iA==
X-Received: from edbes19.prod.google.com ([2002:a05:6402:3813:b0:641:3344:d26d])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6402:455c:b0:641:8f8d:e633
 with SMTP id 4fb4d7f45d1cf-6431a55e40bmr1677415a12.28.1762939251927; Wed, 12
 Nov 2025 01:20:51 -0800 (PST)
Date: Wed, 12 Nov 2025 09:20:43 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.51.2.1041.gc1ab5b90ca-goog
Message-ID: <20251112092051.1376245-1-tabba@google.com>
Subject: [PATCH v4 0/8] KVM: arm64: Fixes for guest CPU feature trapping and enabling
From: Fuad Tabba <tabba@google.com>
To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org, oliver.upton@linux.dev, will@kernel.org, 
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	catalin.marinas@arm.com, vladimir.murzin@arm.com, tabba@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_012054_221198_ABA3EF96 
X-CRM114-Status: GOOD (  10.14  )
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

Hi,

This series contains several fixes for guest feature trapping and
enabling, as well as a bit of tidying up.

Changes from v3 [1]:
- Fix MTE flag propagation (Ben)
- Include all ARM-specific VM IOCTLs that don't belong to a basic
  capability in the pKVM IOCTL check
- Based on Linux 6.18-rc5

Cheers,
/fuad

[1] https://lore.kernel.org/all/20251110134525.3768197-1-tabba@google.com/

Fuad Tabba (8):
  KVM: arm64: Fix Trace Buffer trapping for protected VMs
  KVM: arm64: Fix Trace Buffer trap polarity for protected VMs
  KVM: arm64: Fix MTE flag initialization for protected VMs
  KVM: arm64: Introduce helper to calculate fault IPA offset
  KVM: arm64: Include VM type when checking VM capabilities in pKVM
  KVM: arm64: Do not allow KVM_CAP_ARM_MTE for any guest in pKVM
  KVM: arm64: Check whether a VM IOCTL is allowed in pKVM
  KVM: arm64: Prevent host from managing timer offsets for protected VMs

 arch/arm64/include/asm/kvm_arm.h         |  2 ++
 arch/arm64/include/asm/kvm_pkvm.h        | 41 +++++++++++++++++++++---
 arch/arm64/kvm/arch_timer.c              | 18 ++++++++---
 arch/arm64/kvm/arm.c                     |  7 ++--
 arch/arm64/kvm/hyp/nvhe/pkvm.c           | 18 +++++------
 arch/arm64/kvm/hyp/vgic-v2-cpuif-proxy.c |  2 +-
 arch/arm64/kvm/inject_fault.c            |  2 +-
 arch/arm64/kvm/mmu.c                     |  4 +--
 8 files changed, 70 insertions(+), 24 deletions(-)


base-commit: e9a6fb0bcdd7609be6969112f3fbfcce3b1d4a7c
-- 
2.51.2.1041.gc1ab5b90ca-goog


