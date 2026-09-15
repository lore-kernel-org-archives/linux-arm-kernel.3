Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCD11C88E75
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 08:45:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5bz0t/wzhOnFF7NxvIbxwEy/LZARgXTl37SWJAHJOB8=; b=ghnOe1qFEdy623kfKBa/WrcxEm
	grR6oIpjc6mtRM3iaFn6E8hMRjbWvSD7tLRrC6VAS1UODJnwK3iSv7q7jT4bZqu0mLwIx5ZzEiGbl
	2+5QIEx7MBQzvgTbSdBR/hNvKUiWTNTC/GQ//FAUz+WcetrG9miJ84xJ41iaCCH2lXTuVsajJyE0v
	1PLEE2+ppe4wGYnf/xTXDR8ctIzY05uagMg7nmiw/EUQr405Fc2A4J6fsZjb0GN9kMdIUdVSe173d
	aZ6HF5rbxSEtaKljCGoI7lRkpS/PWKiKLL6dFo/u7mgK1e9bCPZgMJF1Bo8d9vffnBR/yNtHcyigp
	sZEpLmXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Omg-00000005g12-2az8;
	Tue, 15 Sep 2026 08:44:58 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Omb-00000005fy9-1t5L
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 15 Sep 2026 08:44:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=5bz0t/wzhOnFF7NxvIbxwEy/LZARgXTl37SWJAHJOB8=; b=bvS5CPNuCGDBYKkG9U0EFJbyTk
	+N3iX2yKvOT6PSbgKUK/vA8uQATkUSpPZ1vm6f2qKQGXkYX+ONdOyxE69tyv6I18vrWc/RrYg0rTr
	uMramFgBLhunXVwKj4femsjNQQQC3IFyGZZvv2NEYCSwsw9vJ6P8vngnLs1NMcuUEmio0nKOORyxa
	h3N+ajHoKEtm8s+d14o7hDlsZSzuwBp0tXqx/bEu2bDQOCLc2+sG3+OSRGYuknm+Cs5fojzr3e8Cc
	r7R/EXplwoptfgU14UcK+9PmlxuuFl78k7v3MycFwozfyiJcFep6O3I9bzwhQxyTDR3rNbSQ2ygYz
	JyTwDiyw==;
Received: from out-85.mta0.migadu.com ([2001:41d0:1004:224b::55] helo=mta0.migadu.com)
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x6OmY-00000006Rze-2PRF
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Sep 2026 08:44:52 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=bSEkY03asFd7ncFCJXorUGr/EvrnfLd1LZhh/lJlyYA=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789461887; v=1; x=1790066687;
 b=EezWVo4ojNYwRbqRZ9QVKaV/VvM4F7cetwiZhl4pWHApYZeli8SwJcUsKC3MiXJBUdtF5mpN
 Co9Fl/tT/ezz6qBcsetMBkdW69exvfzc6db1H5Qh/nwWXLdbaMHXXr4/ENx6bC06ZYmlUI5GYYn
 hq/WdrpGC8/M8sRZqLEHXRpc=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 08fbd8a02e04e0fe;
	Tue, 15 Sep 2026 08:44:47 +0000
X-Mizu-Trace-ID: 08fbd8a02e04e0fe
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Sean Christopherson <seanjc@google.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	Will Deacon <will@kernel.org>,
	Fuad Tabba <tabba@google.com>,
	kvm@vger.kernel.org,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] KVM: arm64: Fix references to the non-existent VCPU_RUN ioctl
Date: Tue, 15 Sep 2026 09:44:40 +0100
Message-Id: <20260915084441.3846947-3-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260915084441.3846947-1-fuad.tabba@linux.dev>
References: <20260915084441.3846947-1-fuad.tabba@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_094450_891867_A22BAFA8 
X-CRM114-Status: GOOD (  16.31  )
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

There is no VCPU_RUN ioctl. The one that enters the guest is KVM_RUN,
so refer to it by that name.

Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 Documentation/virt/kvm/arm/pkvm.rst | 2 +-
 arch/arm64/kvm/arm.c                | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/virt/kvm/arm/pkvm.rst b/Documentation/virt/kvm/arm/pkvm.rst
index 514992a79a833..18d8afe36ebce 100644
--- a/Documentation/virt/kvm/arm/pkvm.rst
+++ b/Documentation/virt/kvm/arm/pkvm.rst
@@ -67,7 +67,7 @@ largely due to the lack of MMU notifiers:
   then it will either return ``-EFAULT`` or forcefully reclaim the
   memory pages. Reclaimed memory is zeroed by the hypervisor and a
   subsequent attempt to access it in the pVM will return ``-EFAULT``
-  from the ``VCPU_RUN`` ioctl().
+  from the ``KVM_RUN`` ioctl().
 
 CPU state isolation
 -------------------
diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
index 8b080804bc90b..a18ec13bd6677 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -1263,7 +1263,7 @@ static int noinstr kvm_arm_vcpu_enter_exit(struct kvm_vcpu *vcpu)
  * kvm_arch_vcpu_ioctl_run - the main VCPU run function to execute guest code
  * @vcpu:	The VCPU pointer
  *
- * This function is called through the VCPU_RUN ioctl called from user space. It
+ * This function is called through the KVM_RUN ioctl called from user space. It
  * will execute VM code in a loop until the time slice for the process is used
  * or some emulation is needed from user space in which case the function will
  * return with return value 0 and with the kvm_run structure filled in with the
-- 
2.39.5


