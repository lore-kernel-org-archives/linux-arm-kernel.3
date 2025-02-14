Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F13B5C02198
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Feb 2025 15:04:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=MuT0SdK7xXa7okOPanhG6y+T08LdgnDw3LDNbKyKy/0=; b=tySeOsvGBvIFVxqBL4+tLwFzDt
	O2nIlSGbq3DE8Ooy6vAydUgzYV+lt3ftxu5500v5gTtL1pv/fl7AhRBAnTxVJiSlvTRz4MH75KLN6
	9vxh3RRCGHLbYN+oWzoajWLLnKSfdicL8Dvn28Vq6POTUJoeM37EzaMUF/XZtx7seX+Ghlzuc9xmV
	yPPTYNZnjfkmLvpuWx+H79kdvlzVRC51leUeB64PGwpjHvyZxxcmDCoUv/3rt6xjKW5CVF2k4S7Nb
	b8ELidL/oa3ITYkIKHcRUnAAfq8aczyOdNDxuNFWS/2g0DR3C6BgCd/Ohj15NQJVD4er4Esw6SFwE
	FgY2sDpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tixF2-0000000FExN-3MGQ;
	Fri, 14 Feb 2025 15:04:32 +0000
Received: from mail-lf1-x149.google.com ([2a00:1450:4864:20::149])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tixDa-0000000FEo6-20dJ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Feb 2025 15:03:03 +0000
Received: by mail-lf1-x149.google.com with SMTP id 2adb3069b0e04-545172f6803so1286332e87.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Feb 2025 07:03:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1739545380; x=1740150180; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=MuT0SdK7xXa7okOPanhG6y+T08LdgnDw3LDNbKyKy/0=;
        b=sVeIfVgMhmwjsDT9JApRfx9gc4f15MVq/AdoaahaF0DNbtS3VMtU6Kn9bLhoDQ+F4Z
         RoySytZoE3vLxaH2b5s/1Dm37j7Dyc15isMkwqWV7YLTjNI5RWf4pdd+sgL3fGJbjlWT
         kj1WDT35cZCp/TqMnA/23VsjODvE9umgJ+POXQtrJ5cvQWW11Ai+PKGZUz6zxaSbW8yN
         zpS25F/Wa4vgblr89iWXYM8yvL62b6g2OT80JiLCpsPcE5AIfb/H0sTPlabBnlQD8Wig
         eY6ollFF7jbk0njcXZ/ldAR36EB0DPjjrNjiz3cAuvbeCHxcXbdDzvw3CttYFI4n4QGE
         hByg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739545380; x=1740150180;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MuT0SdK7xXa7okOPanhG6y+T08LdgnDw3LDNbKyKy/0=;
        b=XS4srqhJtN4jrivkY+rmC/h3jxzFSeWrd8Q8dS+wglH/gTGAVwYZbY4dIO/T/3dQbc
         OfPjtgeR1g8zQk6okUrEvMcPYwNbakrbZjbe6eDYakCmf9AB9VQ7d91AvdaVUba47W2B
         73EPoioAQIsJAkfOr2GBqXta/2beNUzNXZJVkLT0WNlKkZlgeElDhM3x5BtxINfMwYEr
         kaUd+08ETvg+H8k4JlqLXwwcRR9e7Pkbl5qMScC6J7xaj0QsmetMqhAz+UYokqQT+OtU
         W9fQWyOT0EaoIrjPl4uQwadKRGMryUG3atgJu6h1R8cWc+29D/r7n0rg2wH3bU6AE6Ty
         5CYA==
X-Forwarded-Encrypted: i=1; AJvYcCX/VsrZlimsQkUm15mUzuOprAHtWAEI64EsLuXNItxEq4FNtzOZ8XzmodecN6yozawfkKAi/knO5sl+uIs1xU8/@lists.infradead.org
X-Gm-Message-State: AOJu0Yxc8CxPjkbnoF7v4ZqPZxTPB3KGtqHsbhZdLBib5HNs3kxUXRTT
	0Djt5JMKgWlpWnCamEnxPlHTLep0ed8iSV6/ZJ+MVkNBgqVafnQoSEHSvoGE51Vtlz0Gty/8NQ=
	=
X-Google-Smtp-Source: AGHT+IFw/r/gkZ/iRvXxaWP0G3NSL8AKpEXKuIDGJ2LZhDVuSFi7uIxQ5P1CupiTBcuVqdIzWFwpe/DwoA==
X-Received: from wmbbi19.prod.google.com ([2002:a05:600c:3d93:b0:439:5529:c5a])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6512:1048:b0:545:1193:1256
 with SMTP id 2adb3069b0e04-5451dd84c89mr2102659e87.1.1739545380225; Fri, 14
 Feb 2025 07:03:00 -0800 (PST)
Date: Fri, 14 Feb 2025 15:02:55 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.48.1.601.g30ceb7b040-goog
Message-ID: <20250214150258.464798-1-tabba@google.com>
Subject: [PATCH v1 0/3] KVM: arm64: Fix initializing HCRX_EL2 and other traps
 in pKVM
From: Fuad Tabba <tabba@google.com>
To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org, oliver.upton@linux.dev, mark.rutland@arm.com, 
	will@kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, broonie@kernel.org, 
	qperret@google.com, vdonnefort@google.com, tabba@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250214_070302_515415_4CC8EA50 
X-CRM114-Status: GOOD (  12.63  )
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

Since the introduction of initializing and setting HCRX_EL2 traps
in KVM, we haven't updated the pKVM code upstream do the same for
the hyp view.

Additionally, the current behavior of pKVM is to initialize the
hyp view of the vm and of _all_ its vcpus when the _first_ vcpu
is run. However, with the introduction of kvm_calculate_traps()
[*], some of the host trap values are not calculated until the
corresponding vcpu is run for the first time. This causes pKVM to
get the wrong view of some of the system registers, e.g.,
HCRX_EL2, for vcpus other than the first run vcpu, since it uses
the host's version as a starting point --- particularly for
non-protected vms. Because of these issues, it's might not be
possible to run a non-protected VM when certain features (e.g.,
MOPS) are supported by the system.

This series initializes HCRX_EL2 for VMs in protected mode. It
also initializes the hyp view of each vcpu after its
corresponding host vcpu has been fully initialized, i.e., run for
the first time.

This series is based on Linux 6.14-rc2.

Cheers,
/fuad

[*] Commit f1ff3fc5209a ("KVM: arm64: unify code to prepare traps")

Fuad Tabba (3):
  KVM: arm64: Initialize HCRX_EL2 traps in pKVM
  KVM: arm64: Factor out pkvm hyp vcpu creation to separate function
  KVM: arm64: Create each pKVM hyp vcpu after its corresponding host
    vcpu

 arch/arm64/include/asm/kvm_host.h      |   2 +
 arch/arm64/include/asm/kvm_pkvm.h      |   1 +
 arch/arm64/kvm/arm.c                   |   4 +
 arch/arm64/kvm/hyp/include/nvhe/pkvm.h |   6 --
 arch/arm64/kvm/hyp/nvhe/pkvm.c         | 100 +++++++++++++++++++------
 arch/arm64/kvm/pkvm.c                  |  70 +++++++++--------
 6 files changed, 118 insertions(+), 65 deletions(-)


base-commit: a64dcfb451e254085a7daee5fe51bf22959d52d3
-- 
2.48.1.601.g30ceb7b040-goog


