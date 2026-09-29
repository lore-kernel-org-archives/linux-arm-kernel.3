Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6015DCA5FA1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 10:38:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4x36drenHC31a65AUAmISM+E18V5XgYGEXDL6/a05K8=; b=eWMivsDn8Ha6NYvRImFqFErTxt
	Dy/oC+1hLOqUBt91TgY9w89hGC4+2xlrp1rAlm5MCtNqoMZBv5Cq8lU7nkI4R7h1EDU/tgcNfIQco
	EWVheCFWwkcAAA7JgbtMpTDFsgitxp2rzyEuYfjoSPuomE+6RH6C0J5inRjA3ymxMYauSiLg+odwu
	7p1E9LumNrzFe7lSH09vHKFq7G5QsMN7Prb5g8D3XlXaqm+gxIWbNKahdIhRwJ5E93QmIdsBi0KDU
	hvc8KS7RFp11X+R9l8XiLZmF54jpoWki/KlzRhpMHNnesVCAgXyKgN58ZEvVWotlmUanzVSnM1XSF
	Jwu0/4wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBVDj-00000003Gwh-0vZG;
	Tue, 29 Sep 2026 10:37:59 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBVD5-00000003GfR-3Qq2
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 29 Sep 2026 10:37:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=4x36drenHC31a65AUAmISM+E18V5XgYGEXDL6/a05K8=; b=dzHs8QDhhMtQ5YC7JIDU8YDPbL
	qR8WrGjkMXTf/zkTiGDyluhQqwbXvMCNvi0tC0eOs/PYcwZ4/BPs+1DZXVDy2kfrxWoTVftc0x3Ll
	0fyPS1nc/l9CkczUY4v8oreBk+Jo7uJZOucJmMWcdvK952xGSH7OhsSceEqwcn/z1NTkD9OwFy0cu
	pZQg0vVEXvKz5KyVjCerNHla9GsMjWcf/pE5mTGLmps5R1UU6GvKS0oc/Tfa6yQ/dK/9ad9iljLSm
	9yODkasR2IRELWX7qrQfUD281eOFoZ/DmLyExlEqH8xrltjaxhDC0jKz1hXn3U5o0HRf3ndzaqeH0
	SDEpEBjg==;
Received: from canpmsgout08.his.huawei.com ([113.46.200.223])
	by casper.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBVD2-0000000CL93-2thf
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Sep 2026 10:37:18 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=4x36drenHC31a65AUAmISM+E18V5XgYGEXDL6/a05K8=;
	b=HXEyhcQipW8cTovkTLfbN3Ra9WRx0WOhjMNGAo+9/HNiZzbp0qFABbhzNayLfuwRX/maeiISE
	hKwzDJSGVwGZdO8X8NrCCYqD7pZqTX2aOsl7blLNDtukSOaeGInylpquqBM4pTqoDgXBPeVLecl
	u01kqFu3Yu1zWnO6EEvtOkU=
Received: from mail.maildlp.com (unknown [172.19.163.163])
	by canpmsgout08.his.huawei.com (SkyGuard) with ESMTPS id 4hvDnh6V19zmVCD;
	Tue, 29 Sep 2026 18:24:56 +0800 (CST)
Received: from kwepemr100010.china.huawei.com (unknown [7.202.195.125])
	by mail.maildlp.com (Postfix) with ESMTPS id 34E964048B;
	Tue, 29 Sep 2026 18:37:05 +0800 (CST)
Received: from huawei.com (10.50.163.32) by kwepemr100010.china.huawei.com
 (7.202.195.125) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 29 Sep
 2026 18:37:04 +0800
From: Tian Zheng <zhengtian10@huawei.com>
To: <maz@kernel.org>, <oupton@kernel.org>, <catalin.marinas@arm.com>,
	<will@kernel.org>, <corbet@lwn.net>, <pbonzini@redhat.com>,
	<zhengtian10@huawei.com>, <leo.bras@arm.com>
CC: <yuzenghui@huawei.com>, <wangzhou1@hisilicon.com>,
	<yangjinqian1@huawei.com>, <caijian11@h-partners.com>,
	<liuyonglong@huawei.com>, <tangchengchang@huawei.com>,
	<yezhenyu2@huawei.com>, <yubihong@huawei.com>, <linuxarm@huawei.com>,
	<joey.gouly@arm.com>, <kvmarm@lists.linux.dev>, <kvm@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<seiden@linux.ibm.com>, <suzuki.poulose@arm.com>, <fuad.tabba@linux.dev>,
	<mark.rutland@arm.com>, <seanjc@google.com>, <rdunlap@infradead.org>,
	<linux-doc@vger.kernel.org>, <linux-kselftest@vger.kernel.org>,
	<skhan@linuxfoundation.org>
Subject: [PATCH v5 11/15] KVM: arm64: Reserve dirty ring space for the HDBSS buffer
Date: Tue, 29 Sep 2026 18:36:51 +0800
Message-ID: <20260929103655.85107-12-zhengtian10@huawei.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20260929103655.85107-1-zhengtian10@huawei.com>
References: <20260929103655.85107-1-zhengtian10@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.50.163.32]
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 kwepemr100010.china.huawei.com (7.202.195.125)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_113717_003803_B47D15B3 
X-CRM114-Status: GOOD (  10.20  )
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

The dirty ring reserves room for CPU-side dirty buffers via
kvm_cpu_dirty_log_size(). Report the HDBSS buffer entry count
through it, so a full buffer flush always fits in the ring.

Pin the HDBSS buffer size to PAGE_SIZE when dirty-ring is enabled,
via kvm_arch_dirty_ring_size_updated(): a larger buffer only
shrinks the soft_limit and forces more frequent userspace drains.

Signed-off-by: Tian Zheng <zhengtian10@huawei.com>
---
 arch/arm64/kvm/arm.c | 8 ++++++++
 arch/arm64/kvm/mmu.c | 8 ++++++++
 2 files changed, 16 insertions(+)

diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
index 9d7bdece149a..5a7046acb62e 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -215,6 +215,14 @@ static int kvm_arm_default_max_vcpus(void)
 	return vgic_present ? kvm_vgic_get_max_vcpus() : KVM_MAX_VCPUS;
 }

+void kvm_arch_dirty_ring_size_updated(struct kvm *kvm)
+{
+	if (!system_supports_hdbss())
+		return;
+
+	kvm->arch.hdbss_buffer_size = KVM_ARM_HDBSS_DEFAULT_SIZE;
+}
+
 /**
  * kvm_arch_init_vm - initializes a VM data structure
  * @kvm:	pointer to the KVM struct
diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index 7bf82d65041c..c1e09ba98d48 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -2841,3 +2841,11 @@ void kvm_toggle_cache(struct kvm_vcpu *vcpu, bool was_enabled)

 	trace_kvm_toggle_cache(*vcpu_pc(vcpu), was_enabled, now_enabled);
 }
+
+int kvm_cpu_dirty_log_size(struct kvm *kvm)
+{
+	if (!system_supports_hdbss())
+		return 0;
+
+	return kvm_hdbss_buffer_size(kvm) / sizeof(u64);
+}
--
2.43.0


