Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37660D5D690
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Nov 2024 21:43:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=U/2V0k0nsK2UijeufbuSOipQUsU110T9hQl5WTfC5qM=; b=udxw0Uu6iWf+CTNhFYahHkdVhp
	PEPYKCgXldtDA9jbv0OWwPAF/SvA9H98Odk/xu4bdRZ4Qc1aB4nGGM9chmK/w+pwTgSkYKduhd+K/
	0+qZHzWaEM5yOzctq8VfHaQynPzsm4K0NEHsBU1GwpKXnVTxNq3ENNX4tm1LzeH9qq8CU40jPF2mv
	qdoxWTwcoDqzPOo8hXgjB1qqUyIUsGU/VgvAHREpBkYGvvKyruSwtqkzmVgQDyY47eiyWy2M4l801
	Ks7qjFVeCabVxP9rhZiZB/TZijjOqyH6z49ORTzXEjtkqJ3uEV3mnKoOJNS6AeBRuHnIgQgYE4481
	BjPYT2zQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9AHt-00000008SGt-49Oo;
	Thu, 07 Nov 2024 21:43:33 +0000
Received: from mail-yw1-x1149.google.com ([2607:f8b0:4864:20::1149])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9AG5-00000008RhL-1qTy
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 Nov 2024 21:41:42 +0000
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-6e355f1ff4bso32009067b3.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 07 Nov 2024 13:41:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1731015700; x=1731620500; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=U/2V0k0nsK2UijeufbuSOipQUsU110T9hQl5WTfC5qM=;
        b=ub4oYbUQpVi9HP6Hpk/I1hj9WiUQRjS2XaocNElm7fSqJ8WtXRMrN1KHXNZfj0qT1A
         0godhZ3l+wjoFuYY3QuDN2S8U7+cDjvEiLAJCMnZyr4Yn+m4lenWpnRhFu2SKizqRoV2
         c8PvEAQuqvteMsBFqouVwSegjSeSY51Tb0jhHXI6UtqGtzqwS2lbQgwIO/aIOEruuQjq
         DCeSh2a+RoVz14R294MydJbrdvHdIMScB1o1s4uQXztSB0ZtaiBGCYeJL6F+B+SFD/Gb
         aG2RSgLQ1hapc+EfNj7PNiYW8srvwUotj4k43l1VrjDMCY0jX4AiTfbGRirLDwpTk3Bp
         k6xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731015700; x=1731620500;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=U/2V0k0nsK2UijeufbuSOipQUsU110T9hQl5WTfC5qM=;
        b=q3HQ+5RBTftUu2IEItA0jZPagvaPMcFt/nvTRsDXVnKw3NpD/IwKZVrLZkcfpfQon0
         o4HYlsQyOauFcmIZS9f9YBAPNt6SaJXZ7AxkfOD/dBpBqhTf8a13N8UHqVpeXKag9Wbf
         +B/OEXfsEnRJy5MjmpNDPf7X5EHsNNhmP3DcQ6Bjj/fGoX2M9N2Oe4zY9qGgnBfo9Ane
         SNCXl1jsC4c+J8+Cc+YqrIMooqaIyg/i274a4HWJ+c3ihJUxCI8N+9JvYTDl/FzM0MAG
         0AfVHrf77VfrhdYxqTm4LMCoTPf/I1cs6hPJLFJoK50ZZaYGsexgloMlw4pSCoAws4GV
         J/2w==
X-Forwarded-Encrypted: i=1; AJvYcCVDD+9IJ+d0IYrzw/027oXepRDIoI6T6SCz0sMmaVwJfXdbhsiIss6XOPux4umNyhI4h/vjjNxhQ4/sR8rXBW1B@lists.infradead.org
X-Gm-Message-State: AOJu0YyzXLwkr4mTqd0DFfyJoO6T/rogJFYAPAozutGxHSLV3QnFztGS
	YMCs/WGDO4uB/MlAL9iHVeBNqEFJ3GiGyesLs6T1xKyxOZ8JpU/po1oXuZSGk0lDrTTX7KBwBuE
	oApSRX2W14HhCwM0w9v3IEw==
X-Google-Smtp-Source: AGHT+IHQa4/WDLxhwkTlxQKoJnSpSbWPLr4U+354oC+COKsIp0AWg/aYpXuPUvHJ5Ube9TvWVckE07rwKroGFx7ioQ==
X-Received: from jgzg.c.googlers.com ([fda3:e722:ac3:cc00:36:e7b8:ac13:c96f])
 (user=jingzhangos job=sendgmr) by 2002:a25:aaea:0:b0:e2b:d28f:bf28 with SMTP
 id 3f1490d57ef6-e337f844036mr1537276.2.1731015699859; Thu, 07 Nov 2024
 13:41:39 -0800 (PST)
Date: Thu,  7 Nov 2024 13:41:32 -0800
Mime-Version: 1.0
X-Mailer: git-send-email 2.47.0.277.g8800431eea-goog
Message-ID: <20241107214137.428439-1-jingzhangos@google.com>
Subject: [PATCH v4 0/5] Some fixes about vgic-its
From: Jing Zhang <jingzhangos@google.com>
To: KVM <kvm@vger.kernel.org>, KVMARM <kvmarm@lists.linux.dev>, 
	ARMLinux <linux-arm-kernel@lists.infradead.org>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oupton@google.com>, Joey Gouly <joey.gouly@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Kunkun Jiang <jiangkunkun@huawei.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Andre Przywara <andre.przywara@arm.com>, 
	Colton Lewis <coltonlewis@google.com>, Raghavendra Rao Ananta <rananta@google.com>, 
	Shusen Li <lishusen2@huawei.com>, Eric Auger <eauger@redhat.com>, 
	Jing Zhang <jingzhangos@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241107_134141_504637_A66BCE56 
X-CRM114-Status: GOOD (  12.45  )
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

This patch series addresses a critical issue in the VGIC ITS tables'
save/restore mechanism, accompanied by a comprehensive selftest for bug
reproduction and verification.

The fix is originally from Kunkun Jiang at [1]. 

The identified bug manifests as a failure in VM suspend/resume operations.
The root cause lies in the repeated suspend attempts often required for
successful VM suspension, coupled with concurrent device interrupt registration
and freeing. This concurrency leads to inconsistencies in ITS mappings before
the save operation, potentially leaving orphaned Device Translation Entries
(DTEs) and Interrupt Translation Entries (ITEs) in the respective tables.

During the subsequent restore operation, encountering these orphaned entries
can result in two error scenarios:
* EINVAL Error: If an orphaned entry lacks a corresponding collection ID, the
  restore operation fails with an EINVAL error.
* Mapping Corruption: If an orphaned entry possesses a valid collection ID, the
  restore operation may succeed but with incorrect or lost mappings,
  compromising system integrity.

The provided selftest facilitates the reproduction of both error scenarios:
* EINVAL Reproduction: Execute ./vgic_its_tables without any options.
* Mapping Corruption Reproduction: Execute ./vgic_its_tables -s
  The -s option enforces identical collection IDs for all mappings.
* A workaround within the selftest involves clearing the tables before the save
  operation using the command ./vgic_its_tables -c. With this, we can run the
  the selftest successfully on host w/o the fix.

---

* v3 -> v4:
  - Added two helper functions for table entry read/write in guest memory.
  - Move selftest as the first patch to easily run on a host without the fix.

* v2 -> v3:
  - Rebased to v6.12-rc6
  - Fixed some typos
  - Added a selftest for bug reproduction and verification

* v1 -> v2:
  - Replaced BUG_ON() with KVM_BUG_ON()

[1] https://lore.kernel.org/linux-arm-kernel/20240704142319.728-1-jiangkunkun@huawei.com

---

Jing Zhang (2):
  KVM: selftests: aarch64: Add VGIC selftest for save/restore ITS table
    mappings
  KVM: arm64: vgic-its: Add read/write helpers on ITS table entries.

Kunkun Jiang (3):
  KVM: arm64: vgic-its: Add a data length check in vgic_its_save_*
  KVM: arm64: vgic-its: Clear DTE when MAPD unmaps a device
  KVM: arm64: vgic-its: Clear ITE when DISCARD frees an ITE

 arch/arm64/kvm/vgic/vgic-its.c                |  31 +-
 arch/arm64/kvm/vgic/vgic.h                    |  23 +
 tools/testing/selftests/kvm/Makefile          |   1 +
 .../selftests/kvm/aarch64/vgic_its_tables.c   | 565 ++++++++++++++++++
 .../kvm/include/aarch64/gic_v3_its.h          |   3 +-
 .../testing/selftests/kvm/include/kvm_util.h  |   4 +-
 .../selftests/kvm/lib/aarch64/gic_v3_its.c    |  24 +-
 7 files changed, 631 insertions(+), 20 deletions(-)
 create mode 100644 tools/testing/selftests/kvm/aarch64/vgic_its_tables.c


base-commit: 59b723cd2adbac2a34fc8e12c74ae26ae45bf230
-- 
2.47.0.277.g8800431eea-goog


