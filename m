Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE230C36010
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Apr 2025 08:29:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=fD9COX0Pw17byuPpjCb5FZ4ylgjxa+BidJzcsVb88Zc=; b=q9aeXZ1g/orv4/033ZPIvTbXrG
	Z9P9O/gVYptgfImR6aM27LswVZ37RWHRlduBT5ldYRoBuT1n8GMdkPlMKoup8YFyxKwRNA7NGqZui
	PIlScX4Us1Ac8rn68IpS3xihCp6SkRDmeqCLlcnXRHvpBEdgLCZNBWdtN8MvirycPTe00diNMkc+5
	h2rrGvtrcbhqnwTcmR6y8Y6GtmIp8DHn6MVwnqSSUpwVK+Kfch4AgAogQOyA7ZbBHjW7esbHUrogF
	z8DCcx3gMqMjj8HJXa+V4Q4bmaP42MPUrwFpIQ468n+zJX5sQ5tUfFbn/dyXA6DrhI2F85cUfY9eS
	HUM22ZYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1hrQ-0000000H0JU-0bXs;
	Mon, 07 Apr 2025 08:29:40 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1hpN-0000000GzwQ-1eOb
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Apr 2025 08:27:34 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-43cf446681cso29481935e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 07 Apr 2025 01:27:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744014451; x=1744619251; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=fD9COX0Pw17byuPpjCb5FZ4ylgjxa+BidJzcsVb88Zc=;
        b=wv1kA31OrnBE9G4ukJEoU9amEL9m061LM7hGUGPnYfb3gyrZilvuVCYULHCrCQ5wdN
         Jm9nz9YK5NQyvF7hYE8Hai4GZgEYyj495AgKUjphhGmpZczZtYZ2MvNtGjdvmtUCpBPz
         z5o0PvG+AuwCpRPylvMZzrK1EUv7RyU/TAzBZqagin1J5r1CAFCPpGt7EFtWoSjGu4jY
         7T2qrDjKiFiXHVIA+KkoN4G5AF2W4lJlFovxD4m+IXF3/uwH9YSlIkObOhbOD50yT68P
         M00QkEK23jZBG2K5d3g42bvcOll9dwCslO9Xf3rvJ3DyTtr5m7W9rd6ViJee56y1Qd6B
         Ic5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744014451; x=1744619251;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fD9COX0Pw17byuPpjCb5FZ4ylgjxa+BidJzcsVb88Zc=;
        b=JdQQ+ZCnIlR9LSrG5G0biSuAMUqMPRHQvamjnrvlW9Ct8+qti9RubxsviXjHkrHy5D
         Dz/3YQhQsokye4zQh92wq88qf/NYu6AL7bPMFlZjqhFhHUUAG3BCMlftOMlMmvghL8wG
         KPVywO4vKioXg8SD6bi+oHVaMLxe7yaO0MOsRQrlh206EOp6IHzs0o+QYKa9ZrLFxQW/
         QlEl/ZRTZMCVPfj+6+Rrdc2wl+Q6XXNuJzDpcVqVqUNgffgcIC5VN+OFHmWN7OsV713p
         ffHRSFzYwgjm/8p2YbbKRQm0AQzKOLtd+nu+y0g6MVwSzzmyiG4rgAMIHEXLcnaw3rJT
         gkvA==
X-Forwarded-Encrypted: i=1; AJvYcCW0M5whnxcl1YMfAyQtAFccaabizj7SezkxA1mZp1YgnIWRMsuAbgCSfogUSdSZtUsxFdZfmCNdZvTMEPdYX7Iv@lists.infradead.org
X-Gm-Message-State: AOJu0YxdM4dyt4qkp3j7Acw9ZL8yYiULxF+md+gImvz5PBMue0pfA+ZZ
	0ZMtVUnQbouj/arOhnEYlFWArlCIj8MIHjTYMb3KqbydQw8enS9z701KYNnuwPucShiIsXkuIMV
	2bZ/y0ybhetmGL3Qxdw==
X-Google-Smtp-Source: AGHT+IGUzsg+5YsqZ1PEyJ2fXUi6r6QPStOWt82YjAv0VQSmQXRC8ZoIubECZXRmtlKWgqNSo2X0aPxjJEzjFARt
X-Received: from wmcn5.prod.google.com ([2002:a05:600c:c0c5:b0:43c:ec4d:6037])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:46cb:b0:434:fa55:eb56 with SMTP id 5b1f17b1804b1-43ed0b5e180mr92911905e9.7.1744014451027;
 Mon, 07 Apr 2025 01:27:31 -0700 (PDT)
Date: Mon,  7 Apr 2025 09:26:57 +0100
Mime-Version: 1.0
X-Mailer: git-send-email 2.49.0.504.g3bcea36a83-goog
Message-ID: <20250407082706.1239603-1-vdonnefort@google.com>
Subject: [PATCH v3 0/9] Stage-2 huge mappings for pKVM np-guests
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, 
	will@kernel.org
Cc: qperret@google.com, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org, kernel-team@android.com, 
	Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_012733_451056_E8EF707A 
X-CRM114-Status: GOOD (  12.05  )
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

This series adds support for stage-2 huge mappings (PMD_SIZE) to pKVM
np-guests, that is installing PMD-level mappings in the stage-2,
whenever the stage-1 is backed by either Hugetlbfs or THPs.

The last patch of that series is an optimization for CMOs using a shared
PMD_SIZE fixmap.

Changes since v2 https://lore.kernel.org/all/20250306110038.3733649-1-vdonnefort@google.com/

  - Fix PUD_SIZE -> PMD_SIZE enforcement (Quentin)
  - Rework pkvm_host_share_guest() to remove one hyp_page walk (Quentin)
  - Remove one pgtable walk into __check_host_shared_guest() (Quentin)
  - Return EBUSY on host_share_guest_count overflow

Changes since v1 https://lore.kernel.org/all/20250228102530.1229089-1-vdonnefort@google.com/

  - WARN_ON() on !PAGE_ALIGNED size for guest CMOs (Quentin)
  - check_range_allowed_memory() before accessing the Vmemmap (Quentin)

Quentin Perret (2):
  KVM: arm64: Convert pkvm_mappings to interval tree
  KVM: arm64: Add a range to pkvm_mappings

Vincent Donnefort (7):
  KVM: arm64: Handle huge mappings for np-guest CMOs
  KVM: arm64: Add a range to __pkvm_host_share_guest()
  KVM: arm64: Add a range to __pkvm_host_unshare_guest()
  KVM: arm64: Add a range to __pkvm_host_wrprotect_guest()
  KVM: arm64: Add a range to __pkvm_host_test_clear_young_guest()
  KVM: arm64: Stage-2 huge mappings for np-guests
  KVM: arm64: np-guest CMOs with PMD_SIZE fixmap

 arch/arm64/include/asm/kvm_pgtable.h          |   7 +-
 arch/arm64/include/asm/kvm_pkvm.h             |   2 +
 arch/arm64/kvm/hyp/include/nvhe/mem_protect.h |   8 +-
 arch/arm64/kvm/hyp/include/nvhe/mm.h          |   4 +-
 arch/arm64/kvm/hyp/nvhe/hyp-main.c            |  16 +-
 arch/arm64/kvm/hyp/nvhe/mem_protect.c         | 224 +++++++++++++-----
 arch/arm64/kvm/hyp/nvhe/mm.c                  |  86 ++++++-
 arch/arm64/kvm/hyp/nvhe/setup.c               |   2 +-
 arch/arm64/kvm/hyp/pgtable.c                  |   6 -
 arch/arm64/kvm/mmu.c                          |   5 +-
 arch/arm64/kvm/pkvm.c                         | 129 +++++-----
 11 files changed, 330 insertions(+), 159 deletions(-)


base-commit: e48e99b6edf41c69c5528aa7ffb2daf3c59ee105
-- 
2.49.0.504.g3bcea36a83-goog


