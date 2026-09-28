Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C045CA5FA7
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 15:26:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ojb0oRymOB9ULQHXr4qtCOo67HfJPgRRGmG995PAgyE=; b=rglueglF0Iwyku49scJ4YV7PuB
	upCi6ZSHZ3HbHLWpay2qd8n0ym4iohUI2fqI47zvdPMLG8APQs3atmLCigB9sxAVSbNOfb34pV3/L
	Wy8xnj8+wsm0MmdFMLVnofkoLADKQoQfHE95E1JL6SIBIk9SYWw+oU9xTL2tVVnM2E9VdtPx5UEL/
	VkfD0oEQ7DcFOBZ7uYcrugdFRkO2CdrDs0J/a90xDniQvy2qrYd0BCsvBH9x/At71Fw3A+Dgg/wkQ
	qrWFMQFjtBH9ZwyKq9K3gU3HbW4JpQ+rrJ9jmuonrTAKYUie8Byw/4GFaSKmDBjXpSp2hatbsI2G0
	E4pWH5Sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBDF1-00000000teg-3aHs;
	Mon, 28 Sep 2026 15:26:07 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBDEy-00000000tc4-36v9
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 28 Sep 2026 15:26:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=ojb0oRymOB9ULQHXr4qtCOo67HfJPgRRGmG995PAgyE=; b=hEMFV/CLnuiA2zjLrpjMtNEe9U
	GzB6bqqt5RpXBeldfcJnToHSk9+fruxIsGYXRaLNKWuixaLjp5xjtGi6fMZjvlNSZIKud0U7qjMAi
	r3GY1EmmSLLdqRkFsz+W6Rr99kAHkf4jQKXRkUNTXkWd/24bc33rGhxn5HDPc0e6nfxTUidZe4MaF
	jMo9IAtONRnw+uRVkgpB5W5SDL99p9EapXClge5F07oOigAwoIkiqZ0VKpjNXEjyk/cIeE7Qdes4S
	l/P2RfeO5eXVoxTBRHHY29l0WOgPSTvLi2P7v0X/oOB36bTMqJMoULRiR8FQCU86dh3TWtRaYii7z
	uHzQ2Mtg==;
Received: from out-108.mta1.migadu.com ([2001:41d0:203:375::6c] helo=mta1.migadu.com)
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xBDEv-00000001cmW-3nbp
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Sep 2026 15:26:03 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=3L7Qz5BjFOrFp7kkec0T9qY4CbqaUJC/XAFU7nYMJMk=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790609160; v=1; x=1791213960;
 b=s/JAsyXegFh7oadOn0Dhh06laKgTKL51JDWnE1scDDiKoLWgehBO69DYSdKicF6cDu8BVj+3
 z+U2QRy+EX8e7RzHf8lx2QOnRbMUDfvBuk7eeA6AmMTlQGL1RKXYyHbgxVDi+sH4eoERcLDzcCG
 8nUIy6KG5BQvxQKeJ2TWRiSM=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 18ace68e8bd67107;
	Mon, 28 Sep 2026 15:25:59 +0000
X-Mizu-Trace-ID: 18ace68e8bd67107
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Jing Zhang <jingzhangos@google.com>,
	Karl Mehltretter <kmehltretter@gmail.com>,
	Fuad Tabba <tabba@google.com>,
	kvm@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 09/10] KVM: arm64: selftests: Free the VMs in smccc_filter and psci_test
Date: Mon, 28 Sep 2026 16:25:06 +0100
Message-Id: <20260928152507.2116110-10-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260928152507.2116110-1-fuad.tabba@linux.dev>
References: <20260928152507.2116110-1-fuad.tabba@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_162601_977110_855EC1B3 
X-CRM114-Status: GOOD (  12.94  )
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

test_pad_must_be_zero() and host_test_system_off2() create a VM and
never free it, unlike every other test in their files. Free them.

Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 tools/testing/selftests/kvm/arm64/psci_test.c    | 5 ++++-
 tools/testing/selftests/kvm/arm64/smccc_filter.c | 2 ++
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/kvm/arm64/psci_test.c b/tools/testing/selftests/kvm/arm64/psci_test.c
index e775faf208680..7feb7394fe110 100644
--- a/tools/testing/selftests/kvm/arm64/psci_test.c
+++ b/tools/testing/selftests/kvm/arm64/psci_test.c
@@ -239,9 +239,10 @@ static void host_test_system_off2(void)
 	u64 psci_version = 0;
 	int nr_shutdowns = 0;
 	struct kvm_run *run;
+	struct kvm_vm *vm;
 	struct ucall uc;
 
-	setup_vm(guest_test_system_off2, &source, &target);
+	vm = setup_vm(guest_test_system_off2, &source, &target);
 
 	psci_version = vcpu_get_reg(target, KVM_REG_ARM_PSCI_VERSION);
 
@@ -276,6 +277,8 @@ static void host_test_system_off2(void)
 
 	TEST_ASSERT(get_ucall(source, &uc) == UCALL_DONE, "Guest did not exit cleanly");
 	TEST_ASSERT(nr_shutdowns == 2, "Two shutdown events were expected, but saw %d", nr_shutdowns);
+
+	kvm_vm_free(vm);
 }
 
 int main(void)
diff --git a/tools/testing/selftests/kvm/arm64/smccc_filter.c b/tools/testing/selftests/kvm/arm64/smccc_filter.c
index 21e41880261b4..d5e4ba074a5c6 100644
--- a/tools/testing/selftests/kvm/arm64/smccc_filter.c
+++ b/tools/testing/selftests/kvm/arm64/smccc_filter.c
@@ -105,6 +105,8 @@ static void test_pad_must_be_zero(void)
 				  KVM_ARM_VM_SMCCC_FILTER, &filter);
 	TEST_ASSERT(r < 0 && errno == EINVAL,
 		    "Setting filter with nonzero padding should return EINVAL");
+
+	kvm_vm_free(vm);
 }
 
 /* Ensure that userspace cannot filter the Arm Architecture SMCCC range */
-- 
2.39.5


