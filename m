Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41088606A32C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 14:14:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=DnYy6Jb3;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=YKHUwyNA;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=CxyBiLlf
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=ET496Gzwj43x8I7ewRvTn0IIrLk3rzMMwwxV+tD8iR0=; b=DnYy6Jb3NDaGo6
	QUyyvkuT8TamPJeeGH7jm97c0VmBe2kqd3Hrj6O6tZhDOxc3knVfCUrMkIbNoulr+8PQ7wFaPxf2f
	WarHz6Udfk0wi5RlwCCTp9OYv/CCz/inJ12ltmJ5/1vjCL6n92DCxZ79GN1IMnko1mHPQUFH2wOcJ
	dFaPcDVEYFrMMM3et8ANQj4DQXmmXfoEGpleeu0/g84O0LDvD69PZ1kULxmzDPa8pXjVg/PLtYSD5
	nPDrGH0eYGuVcH11bC8r7gQuLsrm1jsgREXQHY6wzL2XVUuLi4s+Juy97FKOTt6sgSwq909fXf9My
	K3O/IVwdikjqEdP8IWZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNsnZ-0000000Gk10-0J7M;
	Mon, 02 Nov 2026 14:14:09 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNsnX-0000000Gjxu-00fW
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 02 Nov 2026 14:14:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=ET496Gzwj43x8I7ewRvTn0IIrLk3rzMMwwxV+tD8iR0=; b=YKHUwyNAzeVlBjAMOUtmw3XJCw
	Il82My1Lw6V4uDEVooxXyW48QhU1lxj1dG9KzK5g+s/ZlI5ji7bIME+1xZlMhil9oww5jXaul1427
	yEIVw6BKAoO7q7b83fB0tI2HCzhrZiutEkQ72QucFu0CBVk5Vfy5wpcWw3/OqScsQrIiAPOFnN3Ik
	AL+s0FMxVLgv1hVPG4ysD5xwN4C/s5eTdi4jVPaCBYYW6Oy83P5emtSueKK0dsIr3PqKI/IlDmT1N
	TPOszCfSIEeOHk4Q0UW05I1rlGOs5KGZZQOTO4oQ7cUrw4o9QXLgPYBYXGW8w46qWq2+pbsiee/fR
	fJ500i7Q==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNsnK-00000002cC7-1ls9
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 14:14:04 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9B8342A6B;
	Mon,  2 Nov 2026 06:13:46 -0800 (PST)
Received: from e122027.arm.com (unknown [10.57.58.9])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 773743F59E;
	Mon,  2 Nov 2026 06:13:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793628829; bh=5GOUK/m9ms1YU9j5P67FGLqCUA3VCOThOsPuqKea4gU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CxyBiLlfzyRJ7kfsy06U1+1A4KmThWoeNEv+JKzVoTAUt3oZmI+hyYtrXiC+MWG3f
	 cC1pdZtB4exgq02AEiFOGkhMez/dHZkXiGS7ViY5eH9ZUX3mNngjYYPOdUga3Dz1+k
	 IdTZBYljvvAR4f1vg5agoAw254aZxWAM7INir6XA=
From: Steven Price <steven.price@arm.com>
To: kvm@vger.kernel.org,
	kvmarm@lists.linux.dev
Cc: Steven Price <steven.price@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Marc Zyngier <maz@kernel.org>,
	Will Deacon <will@kernel.org>,
	James Morse <james.morse@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Joey Gouly <joey.gouly@arm.com>,
	Alexandru Elisei <alexandru.elisei@arm.com>,
	Christoffer Dall <christoffer.dall@arm.com>,
	Fuad Tabba <tabba@google.com>,
	linux-coco@lists.linux.dev,
	Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>,
	Gavin Shan <gshan@redhat.com>,
	Shanker Donthineni <sdonthineni@nvidia.com>,
	Alper Gun <alpergun@google.com>,
	"Aneesh Kumar K . V" <aneesh.kumar@kernel.org>,
	Emi Kisanuki <fj0570is@fujitsu.com>,
	Vishal Annapurve <vannapurve@google.com>,
	WeiLin.Chang@arm.com,
	Lorenzo Pieralisi <lpieralisi@kernel.org>
Subject: [PATCH 04/11] KVM: arm64: CCA: Check for LPA2 support and SHA-256
Date: Mon,  2 Nov 2026 14:12:55 +0000
Message-ID: <20261102141304.126883-5-steven.price@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261102141304.126883-1-steven.price@arm.com>
References: <20261102141304.126883-1-steven.price@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_141403_369592_515BEA19 
X-CRM114-Status: GOOD (  13.87  )
X-Spam-Score: -2.5 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

If KVM has enabled LPA2 support then check that the RMM also supports
it. If there is a mismatch then disable support for realm guests as the
VMM may attempt to create a guest which is incompatible with the RMM.

Also check for SHA-256 support in the RMM as to begin with we only
support SHA-256 based measurements. This can be relaxed in the future.

Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>
Signed-off-by: Steven Price <steven.price@arm.com>
---
 arch/arm64/kvm/rmi.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/arch/arm64/kvm/rmi.c b/arch/arm64/kvm/rmi.c
index 9d118768550d..5b07beff8bc9 100644
--- a/arch/arm64/kvm/rmi.c
+++ b/arch/arm64/kvm/rmi.c
@@ -6,8 +6,30 @@
 #include <linux/arm-rmi-cmds.h>
 #include <linux/kvm_host.h>
 
+#include <asm/kvm_pgtable.h>
 #include <asm/virt.h>
 
+static bool rmi_has_feature(int reg, unsigned long feature)
+{
+	return !!u64_get_bits(rmi_feat_reg(reg), feature);
+}
+
+static int rmm_check_features(void)
+{
+	if (kvm_lpa2_is_enabled() &&
+	    !rmi_has_feature(0, RMI_FEATURE_REGISTER_0_LPA2)) {
+		kvm_err("RMM doesn't support LPA2\n");
+		return -ENXIO;
+	}
+
+	if (!rmi_has_feature(1, RMI_FEATURE_REGISTER_1_HASH_SHA_256)) {
+		kvm_err("RMM doesn't support SHA-256 measurements\n");
+		return -ENXIO;
+	}
+
+	return 0;
+}
+
 void kvm_init_rmi(void)
 {
 	if (kvm_get_mode() != KVM_MODE_RMM)
@@ -16,5 +38,8 @@ void kvm_init_rmi(void)
 	if (!is_rmi_available())
 		return;
 
+	if (rmm_check_features())
+		return;
+
 	/* Future patch will enable static branch kvm_rmi_is_available */
 }
-- 
2.43.0


