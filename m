Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E86ABC44500
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Jan 2026 11:22:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=QGIMyup1UugtxhG5c48JAapo6xJWqwlZ2t4XWmKNlso=; b=wZXm0jK+2v6GIb+eFFoeWwfI/W
	blXPDfsqzHFto4A4Fr83RgOFUjZ6StOddok3pII3O4+G92l9qJ8xMn7dN4uWTPFdoyw0+1tmCNh/b
	SJQyX5ivtkBHjWofceQzWWSQn0FzWUAsfg/UaH0IHdNQbwzi13bbqO9glOs19k4dM2nAPnpR4iJ1a
	YeDiyEJtcK+lUzXHjBDTA0ZEvTMHfZPvRJ6pxrJkAu2GPgA3HmDRr3hhSr2AladN0d2D2VJzxZ00n
	Iu7dikDDaZZlORFd/krOljAdPpLM6W+uvw+Jx0bOsPPHSwT3Lg3bXtVz77j32hAeYpZVl8RSmnyaP
	z52yeaiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vislb-00000006wzw-2dXa;
	Thu, 22 Jan 2026 11:22:23 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vislZ-00000006wz0-2Bqa
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Jan 2026 11:22:22 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-47edc79ff28so5585275e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Jan 2026 03:22:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769080939; x=1769685739; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=QGIMyup1UugtxhG5c48JAapo6xJWqwlZ2t4XWmKNlso=;
        b=GugxF65dw/yCSQ+pgp64S/b7LgS0nayXrSeyYJRLaeHJ9yBDj/zN+p8ukP9+ETkE7C
         E8XFgfr4lyINouFekJlZcJMkiRCtjml5G6hzfITPARBwcAUVwynO5ufbfAF3QBO4uZ4r
         BTYMA5TeLl6k1r0XxvS3TMc9mI+B2QGqv2IZntGS1WobmNPlV2SsPGZy9B2RLy3IHRxG
         S7mET4J2W9LJKVEMzgMgvuMi61V114KyHSyvWJbG22RmYL09h3FSBmCLa+cUhGIZDCP+
         8fkdWYx51gxqsPq32PYu4Tpat/ziF085Ve8n+KeXxyn+gwlP+TH8wL9M05OVraKhB4EO
         SYfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769080939; x=1769685739;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QGIMyup1UugtxhG5c48JAapo6xJWqwlZ2t4XWmKNlso=;
        b=IplyR+GssMf2vrLs56EQwsate8Ec3j6ciZFPUH7zT/juIDkFdcVOBG8V1eYmrdPhFW
         Jre8PoRUixZIShV8nZITV+X/tRmO9JlBrKhihLEUt6sHdj+sxJR/5Z17zf3weZozBl+h
         /SHp/2mXB6i7mG/GehzxK2bUOPH7eoACvTNwfb08oKiKJRuKmhG/nQZOZgZ3Tm7+f4S7
         TVhanA7ifkDZmL8yUl9igGx9/Fickji5RlYgi+DnB/H9aTv4x5iGdKQ1sscugFG4m3QK
         3MjMKEf3ZZTXa1GxhjzEKVC0AdBcBOjXgGOezacZ30OCnDYxu6CESMqVUwsu1ZnuB8Kb
         dD7g==
X-Forwarded-Encrypted: i=1; AJvYcCUgvrbQFamzGS5FuU/+/iuxQQj2kXzfdz4XkSqNfaXjJo4QGZe7Gmgf609+6LGXTNAuJGaDNxpZD3A16+j3olJx@lists.infradead.org
X-Gm-Message-State: AOJu0YwpF3amLEG1WBPInOiY5kWsDKHJDjyHWhtWomTQ/edMbBNWl70j
	KFanIpzO5hrkDArpDtuh98PrvLlQuq33Z2XBbDciM82cDzhGSZRMajmlq3BmThdN3XidHrK8lIJ
	SIg==
X-Received: from wmbka17.prod.google.com ([2002:a05:600c:5851:b0:477:9945:466d])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:4e93:b0:477:7f4a:44b4
 with SMTP id 5b1f17b1804b1-4801e30a606mr299888715e9.1.1769080938838; Thu, 22
 Jan 2026 03:22:18 -0800 (PST)
Date: Thu, 22 Jan 2026 11:22:14 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.52.0.457.g6b5491de43-goog
Message-ID: <20260122112218.531948-1-tabba@google.com>
Subject: [PATCH v3 0/4] KVM: arm64: Enforce MTE disablement at EL2
From: Fuad Tabba <tabba@google.com>
To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, 
	will@kernel.org, tabba@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_032221_605038_C575C681 
X-CRM114-Status: GOOD (  13.00  )
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

Changes since v2 [1]:
- Trap accesses to GMID_EL1 by setting `HCR_EL2.TID5` when MTE is
  disabled (Marc)
- Dropped patch refactoring `enter_exception64()` in favor of open-coded
  logic in `inject_undef64()` in patch 3/4 (Marc)
- Based on Linux 6.19-rc6

pKVM never exposes MTE to protected guests (pVM), but we must also
ensure that a malicious host cannot use MTE to attack the hypervisor or
a protected VM.

If MTE is supported by the hardware (and is enabled at EL3), it remains
available to lower exception levels by default. Disabling it in the host
kernel (e.g., via 'arm64.nomte') only stops the kernel from advertising
the feature; it does not physically disable MTE in the hardware.

The ability to disable MTE in the host kernel is used by some systems,
such as Android, so that the physical memory otherwise used as tag
storage can be used for other things (i.e. treated just like the rest of
memory). In this scenario, a malicious host could still access tags in
pages donated to a guest using MTE instructions (e.g., STG and LDG),
bypassing the kernel's configuration.

To prevent this, explicitly disable MTE at EL2 (by clearing
`HCR_EL2.ATA` and setting `HCR_EL2.TID5`) when the host has MTE
disabled. This causes MTE instructions to trap to the hypervisor.

Cheers,
/fuad

[1] https://lore.kernel.org/all/20251211113828.370370-1-tabba@google.com/

Fuad Tabba (4):
  KVM: arm64: Remove dead code resetting HCR_EL2 for pKVM
  KVM: arm64: Trap MTE access and discovery when MTE is disabled
  KVM: arm64: Inject UNDEF when accessing MTE sysregs with MTE disabled
  KVM: arm64: Use kvm_has_mte() in pKVM trap initialization

 arch/arm64/include/asm/kvm_arm.h   |  2 +-
 arch/arm64/kernel/head.S           |  2 +-
 arch/arm64/kvm/arm.c               |  6 +++
 arch/arm64/kvm/hyp/nvhe/hyp-init.S |  5 ---
 arch/arm64/kvm/hyp/nvhe/hyp-main.c | 67 ++++++++++++++++++++++++++++++
 arch/arm64/kvm/hyp/nvhe/pkvm.c     |  2 +-
 6 files changed, 76 insertions(+), 8 deletions(-)


base-commit: 24d479d26b25bce5faea3ddd9fa8f3a6c3129ea7
-- 
2.52.0.457.g6b5491de43-goog


